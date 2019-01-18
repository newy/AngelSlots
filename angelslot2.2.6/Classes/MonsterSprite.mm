#include "MonsterSprite.h"
#include "MonsterSystem.h"
#include "ResouceDefine.h"
#include "TSSpirte.h"
#include "playyinxiao.h"
#include "HelloWorldScene.h"
#include "MobClickCpp.h"//youmeng
USING_NS_CC;

int typecoins[5]={100,100,200,300,400};//diffrent conis product fishicoins

MonsterSprite::MonsterSprite(void){
    runArray=CCArray::create();//±º≈‹∂Øª≠–Ú¡–÷°
    runArray->retain();
    deathArray=CCArray::create();//À¿Õˆ∂Øª≠–Ú¡–÷°
    deathArray->retain();
    attackArray=CCArray::create();//π•ª˜∂Øª≠–Ú¡–÷°  
    attackArray->retain();

}
MonsterSprite* MonsterSprite::createWithMonsterRul(const char* filename,CCTexture2D* ccTexture2D,const char* pic,int runcount,int attackcount,int deathcout ){
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile(filename,ccTexture2D);
    CCSpriteFrame* temp=CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(CCString::createWithFormat("%s-10.png",pic)->getCString());//≤‚ ‘ «∑Ò”–Õº¥Ê‘⁄
    MonsterSprite* monst=MonsterSprite::createWithSpriteFrame(temp);
    if (monst&&monst->setUpdateView()&&ccTexture2D){
        // ≥ı ºªØ ±º≈‹∂Øª≠–Ú¡–÷°
        for(int i=0;i<runcount;i++){
        
            monst->runArray->addObject(CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(CCString::createWithFormat("%s-1%d.png",pic,i)->getCString()));
        }
        
        //// ≥ı ºªØ π•ª˜∂Øª≠ –Ú¡–÷°
        //for(int i=0;i<runcount;i++){
        //    monst->attackArray->addObject(CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(CCString::createWithFormat("%s-2%d.png",pic,i)->getCString()));
        //}

        //// ≥ı ºªØ À¿Õˆ∂Øª≠ –Ú¡–÷°
        //for(int i=0;i<runcount;i++){
        //    monst->deathArray->addObject(CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(CCString::createWithFormat("%s-3%d.png",pic,i)->getCString()));
        //}
        //// ≥ı ºªØ—™Ãı


        return monst;
    }else {
        return NULL;
    }
}
MonsterSprite* MonsterSprite::createWithSpriteFrame(CCSpriteFrame *pSpriteFrame){
    MonsterSprite* monSter=new MonsterSprite();
    if (pSpriteFrame&&monSter&&monSter->initWithSpriteFrame(pSpriteFrame))
    {
        monSter->autorelease();
        return monSter;
    }
    CC_SAFE_DELETE(monSter);
    return NULL;
}

bool MonsterSprite::setUpdateView(){
    bool isRet=false;
    do 
    {
        // ÃÌº”—™Ãıµƒ±≥æ∞Õº∆¨
        CCSprite* bloodbackimg=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("monster/monster_blood_frame.png"));//ø™ º“Ï≤Ωº”‘ÿπ˝¡À
        CC_BREAK_IF(!bloodbackimg);	
        bloodbackimg->setPosition(ccp(this->getContentSize().width/2,this->getContentSize().height+2));
        this->addChild(bloodbackimg,1);

        // ÃÌº”Ω¯∂»Ãı
        CCSprite* blood=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("monster/monster_blood.png"));
        CC_BREAK_IF(!blood);
        this->bloodBwlid=CCProgressTimer::create(blood);
        CC_BREAK_IF(!bloodBwlid);
        bloodBwlid->setType(kCCProgressTimerTypeBar);// …Ë÷√≥…∫·œÚµƒ
        //ø…“‘ø¥◊˜ «∞¥æÿ–Œœ‘ æ–ßπ˚µƒΩ¯∂»Ãı¿‡–Õ
        //  ”√¿¥…Ë∂®Ω¯∂»Ãı∫·œÚ«∞Ω¯µƒ∑ΩœÚ¥”◊ÛœÚ”“ªÚ «¥””“œÚ◊Û
        bloodBwlid->setMidpoint(ccp(0,0)); //(0,1)‘≠¿¥¥””“µΩ◊ÛµÙ—™
        //…Ë÷√º∆ ±∆˜µƒøÌ∏ﬂµƒ∑÷±±‰ªØµƒ±»¿˝£¨’‚¿Ô÷ª–Ë“™x÷·…œµƒ≥§∂»∑¢…˙±‰ªØ£¨∏ﬂ∂»≤ª±‰
        bloodBwlid->setBarChangeRate(ccp(1,0));

        bloodBwlid->setPosition(ccp(this->getContentSize().width/2,this->getContentSize().height+2));
        //bloodBwlid->setPercentage(100);
    //     int fishjingyan=userDefault->getIntegerForKey("usrfishjingyan");
//         int maxblood=(int)this->getBlood();
//         bloodBwlid->setPercentage((float)(fishjingyan*100/maxblood));
        //this->RaiseBlood((CCNode *)this,(void *)0);;
        this->addChild(bloodBwlid,2);
        isRet=true;
    } while (0);
    return isRet;

}


// ÷¥––±º≈‹∂Øª≠
void MonsterSprite::runAnimation(){

    this->setMonState(2);
    
    this->stopAllActions();
    if(this->runArray->count()>0){
        CCAnimation *animation=CCAnimation::createWithSpriteFrames(runArray,0.2f);//0.15f
        CCAnimate *animate=CCAnimate::create(animation);
        CCCallFuncN *onComplete =  CCCallFuncN::create(this, callfuncN_selector(MonsterSprite::runAnimationCallBack));  
        CCSequence* pse=(CCSequence*)CCSequence::create(animate,onComplete,NULL);
        // “ª÷±÷¥––±º≈‹∂Øª≠
        this->runAction(CCRepeatForever::create(pse));

        //this->schedule(schedule_selector(MonsterSprite::myload),0.15);
    }
}

void MonsterSprite::myload(float tie){
    if (this->getMonState()==2){
        this->moveRun();
    }
}

void MonsterSprite::runAnimationCallBack(CCNode* pSed){

}

// ÷¥––À¿Õˆ∂Øª≠
void MonsterSprite::deathAnimation(){
    this->setMonState(4);
    this->stopAllActions();
    if(this->deathArray->count()>0){
        CCAnimation *animation=CCAnimation::createWithSpriteFrames(deathArray,0.15f);
        CCAnimate *animate=CCAnimate::create(animation);
        CCCallFuncN *onComplete =  CCCallFuncN::create(this, callfuncN_selector(MonsterSprite::deathAnimationCallBack));  
        CCSequence* pse=(CCSequence*)CCSequence::create(animate,onComplete,NULL);
        this->runAction(pse);
    }
}


void MonsterSprite::deathAnimationCallBack(CCNode* pSed){
    if(this->monsterSystem){
        this->monsterSystem->recoverMonster(this);
    }
    bloodBwlid->setPercentage(100);
   // this->unscheduleAllSelectors();
}

// ÷¥––π•ª˜∂Øª≠
void MonsterSprite::attackAnimation(){
    this->setMonState(3);
    this->stopAllActions();
    if(this->attackArray->count()>0){
        CCAnimation *animation=CCAnimation::createWithSpriteFrames(attackArray,0.15f);
        CCAnimate *animate=CCAnimate::create(animation);
        CCCallFuncN *onComplete =  CCCallFuncN::create(this, callfuncN_selector(MonsterSprite::attackAnimationCallBack));  
        CCSequence* pse=(CCSequence*)CCSequence::create(animate,onComplete,NULL);
        this->runAction(CCRepeatForever::create(pse));
    }
}
// ’‚∏ˆ «Ω” ‹π•ª˜ ÷˜“™∏ƒ±‰ ∏√π÷ŒÔµƒ∆¯—™÷µ ∫Õ—™Ãıµƒœ‘ æ
// ∏ƒ≥…¡À‘ˆ≥§
//void MonsterSprite::RaiseBlood(float hurted){
void MonsterSprite::RaiseBlood(CCNode* sender, void* data)
{
int hurted=(long)data;
    //初始判断是否以前有道具未捡起来
    if(hurted==-1)
    {
        CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
        float px=visibleSize.width/2;
        CCMenuItemSprite* fishproduct;
        if(daoju_jinbi)
        {
            CCLOG("daoju_jinbi=%d",daoju_jinbi);
            for(int i=0;i<daoju_jinbi;i++)
            {
                //Playyinxiao::play_anjian();
                CCSprite *fishproduct_sprite=CCSprite::createWithSpriteFrameName("coins.png");
                fishproduct = CCMenuItemSprite::create(
                                                       fishproduct_sprite,
                                                       fishproduct_sprite,
                                                       
                                                       this,
                                                       menu_selector(MonsterSprite::gospriteremoveFromParent));
                this->getParent()->getChildByTag(menutag)->addChild(fishproduct);
                //fishcoins->setPosition(ccp(this->getTextureRect().getMidX(),this->getTextureRect().getMinY()));
                int result_wid = CCRANDOM_0_1()*81-50;//(0~10)-5   -5~5
                //if(result>iconscount||result<0)
                if (result_wid>=31||result_wid<-30)
                {
                    do
                    {
                        result_wid = CCRANDOM_0_1()*81-50;//+1
                    } while (result_wid>=31||result_wid<-30);
                    
                }
                float fishieat_x=px+(float)result_wid/50.0*px;
                fishproduct->setPosition(ccp(fishieat_x,this->getPosition().y));

                fishproduct->setTag(fishcoinstag);
                int toy=(int)(MonsterGoSize.getMinY()+fishproduct->getContentSize().height/4);
                CCActionInterval* fishconisdown1=CCMoveTo::create((fishproduct->getPositionY()-toy)*0.02,ccp(fishproduct->getPositionX(),toy));
                CCActionInterval* fishconisdown=CCSequence::create(fishconisdown1,CCCallFuncN::create(this,callfuncN_selector(MonsterSprite::spriteremoveFromParent)),NULL);
                
                CCOrbitCamera *camera1;
                CCOrbitCamera *camera2;
                
                
                int kaishisuiji=CCRANDOM_0_1()*90;
                
                camera1=CCOrbitCamera::create(0.6, 1, 0, kaishisuiji, 360, 90, 0);
                camera2=CCOrbitCamera::create(0.6, 1, 0, kaishisuiji*(-1), -360, -90, 0);
                /*
                int kaishisuiji=CCRANDOM_0_1()*90;
                if (suijinum==0) {
                     //camera1=CCOrbitCamera::create(0.3, 1, 0, 0, 180, -90, 0);
                    camera1=CCOrbitCamera::create(0.6, 1, 0, 0, 360, 90, 0);
                    camera2=CCOrbitCamera::create(0.6, 1, 0, 0, -360, -90, 0);

                }
                else
                {
                    //camera1=CCOrbitCamera::create(1, 1, 0, 0, 360, 0, 180);
                    //camera2=CCOrbitCamera::create(1, 1, 0, 360, 0, 0, 180);
                    
                    //camera1=CCOrbitCamera::create(0.6, 1, 0, 45, 360, 90, 0);
                    //camera2=CCOrbitCamera::create(0.6, 1, 0, -45, -360, -90, 0);
                    
                    camera1=CCOrbitCamera::create(0.6, 1, 0, kaishisuiji, 360, 90, 0);
                    camera2=CCOrbitCamera::create(0.6, 1, 0, kaishisuiji*(-1), -360, -90, 0);

                }*/
                
                //CCOrbitCamera *camera2=CCOrbitCamera::create(0.5, 1, 0, 180, 0, 0, 90);
                CCActionInterval *fanzhuan1=CCRepeatForever::create(CCSequence::create(camera1,camera2,NULL));
                
                //CCRotateTo::create()
                //CCActionInterval *fishconisaction=CCSpawn::create(fishconisdown,fanzhuan1,NULL);
                fishproduct->runAction(fishconisdown);
                fishproduct->runAction(fanzhuan1);

            }
        }
        if(daoju_jiansu)
        {
            CCLOG("daoju_jiansu=%d",daoju_jiansu);
            
            for(int i=0;i<daoju_jiansu;i++)
            {
                //Playyinxiao::play_anjian();
                CCSprite *fishproduct_sprite=CCSprite::createWithSpriteFrameName("daoju_jiansu.png");
                
                fishproduct = CCMenuItemSprite::create(
                                                       fishproduct_sprite,
                                                       fishproduct_sprite,
                                                       
                                                       this,
                                                       menu_selector(MonsterSprite::gospriteremoveFromParent));
                this->getParent()->getChildByTag(menutag)->addChild(fishproduct);
                //fishcoins->setPosition(ccp(this->getTextureRect().getMidX(),this->getTextureRect().getMinY()));
                int result_wid = CCRANDOM_0_1()*81-50;//(0~10)-5   -5~5
                //if(result>iconscount||result<0)
                if (result_wid>=31||result_wid<-30)
                {
                    do
                    {
                        result_wid = CCRANDOM_0_1()*81-50;//+1
                    } while (result_wid>=31||result_wid<-30);
                    
                }
                float fishieat_x=px+(float)result_wid/50.0*px;
                fishproduct->setPosition(ccp(fishieat_x,this->getPosition().y));

                fishproduct->setTag(fishdaojutag);
                int toy=(int)(MonsterGoSize.getMinY()+fishproduct->getContentSize().height/4);
                CCActionInterval* fishconisdown1=CCMoveTo::create((fishproduct->getPositionY()-toy)*0.02,ccp(fishproduct->getPositionX(),toy));
                CCActionInterval* fishconisdown=CCSequence::create(fishconisdown1,CCCallFuncN::create(this,callfuncN_selector(MonsterSprite::spriteremoveFromParent)),NULL);
                //int suijinum=CCRANDOM_0_1()*2;
                CCOrbitCamera *camera1;
                CCOrbitCamera *camera2;
                
                
                int kaishisuiji=CCRANDOM_0_1()*90;
                
                camera1=CCOrbitCamera::create(0.6, 1, 0, kaishisuiji, 360, 90, 0);
                camera2=CCOrbitCamera::create(0.6, 1, 0, kaishisuiji*(-1), -360, -90, 0);
                /*
                if (suijinum==0) {
                    //camera1=CCOrbitCamera::create(0.3, 1, 0, 0, 180, -90, 0);
                    camera1=CCOrbitCamera::create(0.6, 1, 0, 0, 360, 90, 0);
                    camera2=CCOrbitCamera::create(0.6, 1, 0, 0, -360, -90, 0);
                    
                }
                else
                {
                    //camera1=CCOrbitCamera::create(1, 1, 0, 0, 360, 0, 180);
                    //camera2=CCOrbitCamera::create(1, 1, 0, 360, 0, 0, 180);
                    
                    //camera1=CCOrbitCamera::create(0.6, 1, 0, 45, 360, 90, 0);
                    //camera2=CCOrbitCamera::create(0.6, 1, 0, -45, -360, -90, 0);
                    
                    camera1=CCOrbitCamera::create(0.6, 1, 0, kaishisuiji, 360, 90, 0);
                    camera2=CCOrbitCamera::create(0.6, 1, 0, kaishisuiji*(-1), -360, -90, 0);
                    
                }
                */
                //CCOrbitCamera *camera2=CCOrbitCamera::create(0.5, 1, 0, 180, 0, 0, 90);
                CCActionInterval *fanzhuan1=CCRepeatForever::create(CCSequence::create(camera1,camera2,NULL));
                
                //CCRotateTo::create()
                //CCActionInterval *fishconisaction=CCSpawn::create(fishconisdown,fanzhuan1,NULL);
                fishproduct->runAction(fishconisdown);
                fishproduct->runAction(fanzhuan1);
            }
        }
        int fishjingyan=userDefault->getIntegerForKey("usrfishjingyan");//改?动¡¥11 fish
        //fishjingyan+=hurted;
        int maxblood=(int)this->getBlood();
        
        //int maxblood=(int)this->blood;
        //       if (fishjingyan>=maxblood)
        //       {
        //       do
        //       {
        //           fishjingyan-=maxblood;
        //           this->bloodBwlid->setPercentage(100);//
        //           //生¦¨²蛋Ì¡ã
        //           //....
        //       } while (fishjingyan>=maxblood);
        //
        //       }
  
        
            //fishjingyan+=hurted;
            //this->bloodBwlid->setPercentage(0);
            CCProgressTo *to=CCProgressTo::create((float)(fishjingyan*100/maxblood)*0.001,(float)(fishjingyan*100/maxblood));
            this->bloodBwlid->runAction(to);
            //this->bloodBwlid->setPercentage((float)(((int)hurted%100)));//((float)(((int)hurted%1000))/10.0)
            
            userDefault->setIntegerForKey("usrfishjingyan",fishjingyan);//改?动¡¥11 fish
            userDefault->flush();
        
    }
    //加血
  else if (hurted>=0)
  {
      int fishjingyan=userDefault->getIntegerForKey("usrfishjingyan");//∏ƒ∂Ø11 fish
      //fishjingyan+=hurted;
      int maxblood=(int)this->getBlood();
     //int maxblood=(int)this->blood;
//       if (fishjingyan>=maxblood)
//       {
//       do 
//       {
//           fishjingyan-=maxblood;
//           this->bloodBwlid->setPercentage(100);//
//           //…˙µ∞
//           //....
//       } while (fishjingyan>=maxblood);
//            
//       } 
      if ((fishjingyan+hurted)>=maxblood)
      {
      CCProgressTo *to=CCProgressTo::create((maxblood-fishjingyan)*0.001,100);
      CCProgressTo *tostart=CCProgressTo::create(0.1,0);
      //this->bloodBwlid->setPercentage(100);
      
      //product coins here£°£°£°£°£°
      //TSSprite *fishcoins = TSSprite::createWithSpriteFrameName("laohu_9.png");
      
 
     
       CCActionInterval* actionMoveBy2_1=CCSequence::create(to,CCDelayTime::create(0.2),tostart,CCCallFuncN::create(this,callfuncN_selector(MonsterSprite::product)),CCCallFuncND::create(this,callfuncND_selector(MonsterSprite::RaiseBlood),(void *)(hurted-(maxblood-fishjingyan))),NULL);
      this->bloodBwlid->runAction(actionMoveBy2_1);
      //this->runAction(actionMoveBy2_1);
      //this->RaiseBlood(hurted-(maxblood-fishjingyan)-1);
      userDefault->setIntegerForKey("usrfishjingyan",0);//∏ƒ∂Ø11 fish
      userDefault->flush();      
      }
      else
      {
      fishjingyan+=hurted;
          //CCLOG("fishjingyan=%d",fishjingyan);
      //this->bloodBwlid->setPercentage(0);
      CCProgressTo *to=CCProgressTo::create(hurted*0.001,(float)(fishjingyan*100/maxblood));
      this->bloodBwlid->runAction(to);
    //this->bloodBwlid->setPercentage((float)(((int)hurted%100)));//((float)(((int)hurted%1000))/10.0)
    
    userDefault->setIntegerForKey("usrfishjingyan",fishjingyan);//∏ƒ∂Ø11 fish
    userDefault->flush();
      }
//     float temp=this->getBlood();
//     // ∞¥’’ “ªµ„∑¿”˘ ƒ‹µ÷µ≤10%µƒ…À∫¶ ¿¥º∆À„
//     //this->setBlood(temp-(hurted-hurted*this->getDefense()*0.01));
//     this->setBlood(temp+hurted);
//     //set fishjingyan
//     if(this->getBlood()<=0){
//           this->bloodBwlid->setPercentage(0);
//         //product coins
//         //this->deathAnimation();
//     }else {
//         this->bloodBwlid->setPercentage(this->getBlood());
//     }
  }
}
void MonsterSprite::product(CCNode *pSender)
{
    //Playyinxiao
    //∏≈¬ æˆ∂®…˙≥…ŒÔ∆∑ conis or daoju
      Playyinxiao::play_anjian();
    this->setBlood(fishmaxblood[jingyandengji]);
    int suijiNum_1_10=getrandomID(1,10);
    CCMenuItemSprite* fishproduct;
    //∏≈¬ 
    if (suijiNum_1_10==10 ||suijiNum_1_10==8||suijiNum_1_10==6)
    {   
        CCSprite *fishproduct_sprite=CCSprite::createWithSpriteFrameName("daoju_jiansu.png");
      
       fishproduct = CCMenuItemSprite::create(
            fishproduct_sprite,
            fishproduct_sprite,

            this,
            menu_selector(MonsterSprite::gospriteremoveFromParent));
        this->getParent()->getChildByTag(menutag)->addChild(fishproduct);
        //fishcoins->setPosition(ccp(this->getTextureRect().getMidX(),this->getTextureRect().getMinY()));
        fishproduct->setPosition(this->getPosition());
        fishproduct->setTag(fishdaojutag);
        daoju_jiansu++;
        userDefault->setIntegerForKey("daoju_jiansu",daoju_jiansu);////未捡起来的道具

    }
    else
    {
        CCSprite *fishproduct_sprite=CCSprite::createWithSpriteFrameName("coins.png");
        fishproduct = CCMenuItemSprite::create(
           fishproduct_sprite,
            fishproduct_sprite,

            this,
            menu_selector(MonsterSprite::gospriteremoveFromParent));
        this->getParent()->getChildByTag(menutag)->addChild(fishproduct);
        //fishcoins->setPosition(ccp(this->getTextureRect().getMidX(),this->getTextureRect().getMinY()));
        fishproduct->setPosition(this->getPosition());
        fishproduct->setTag(fishcoinstag);

        daoju_jinbi++;
        userDefault->setIntegerForKey("daoju_jinbi",daoju_jinbi);////未捡起来的道具
    }
    


    //fishcoins->setScale(0.3);
    //this->getParent()->addChild(fishcoins);
    //int toy=(int)(MonsterGoSize.getMinY()+fishproduct->getContentSize().height/2);
    int toy=(int)(MonsterGoSize.getMinY()+fishproduct->getContentSize().height/4);
    CCActionInterval* fishconisdown1=CCMoveTo::create((fishproduct->getPositionY()-toy)*0.02,ccp(fishproduct->getPositionX(),toy));
    CCActionInterval* fishconisdown=CCSequence::create(fishconisdown1,CCCallFuncN::create(this,callfuncN_selector(MonsterSprite::spriteremoveFromParent)),NULL);

    CCOrbitCamera *camera1=CCOrbitCamera::create(0.5, 1, 0, 0, 180, -90, 0); 
    //CCOrbitCamera *camera2=CCOrbitCamera::create(0.5, 1, 0, 180, 0, 0, 90); 
    CCActionInterval *fanzhuan1=CCRepeatForever::create(CCSequence::create(camera1,NULL));

    //CCRotateTo::create()
    //CCActionInterval *fishconisaction=CCSpawn::create(fishconisdown,fanzhuan1,NULL);
    fishproduct->runAction(fishconisdown);
    fishproduct->runAction(fanzhuan1);

}
//select conis
void MonsterSprite::gospriteremoveFromParent(CCObject *pSender)
{
//spriteremoveFromParent((CCNode *)pSender);
    Playyinxiao::play_anjian();
CCMenuItemSprite *s=(CCMenuItemSprite *)pSender;
if(s->getTag()==(fishcoinstag))
  {
    
      do
      {
          CCMenuItemSprite *s=(CCMenuItemSprite *)(this->getParent()->getChildByTag(menutag)->getChildByTag(fishcoinstag));
     

      s->setTag(fishcoinstag+100);
    s->stopAllActions();
      if(s->getChildByTag(starstag))
      {
         s->getChildByTag(starstag)->removeFromParentAndCleanup(true);
      }
    
    CCOrbitCamera *camera1=CCOrbitCamera::create(0.1, 1, 0, 0, 0, 0, 0); 
    s->runAction(camera1);
    float shangtiao_x=s->getPositionX();
    float shangtiao_y=s->getPositionY()+s->getContentSize().height;//CCEaseBackOut//CCEaseSineOut
    CCActionInterval *action_shangtiao=CCMoveTo::create(0.4f,ccp(shangtiao_x,shangtiao_y));

      float px=s->getPositionX();
    float py=s->getPositionY()+s->getContentSize().height;
    float ex=MonsterGoSize.getMinX();
    float ey=MonsterGoSize.getMinY();
    ccBezierConfig b1; 
    b1.controlPoint_1=ccp(px+(ex-px)*0.2,py+40);
    b1.controlPoint_2=ccp(px+(ex-px)*0.6,py-40);
    b1.endPosition=ccp(ex+45,ey-40);
    CCActionInterval* fisheatgo=CCBezierTo::create(1.0f,b1);
    //CCActionInterval *moveto=CCMoveTo::create(0.1,this->monsterSystem->getposition());
      CCActionInterval *movetohou1=CCEaseSineInOut::create(CCSequence::create(action_shangtiao,fisheatgo,NULL));
      CCActionInterval *movetohou=CCSequence::create(movetohou1,CCCallFuncN::create(this,callfuncN_selector(MonsterSprite::spriteremoveFromParent)),NULL);

    s->runAction(movetohou);
      }
      while (this->getParent()->getChildByTag(menutag)->getChildByTag(fishcoinstag));
    }
else if(s->getTag()==(fishdaojutag))
{
    do
    {
        CCMenuItemSprite *s=(CCMenuItemSprite *)(this->getParent()->getChildByTag(menutag)->getChildByTag(fishdaojutag));
    

    s->setTag(fishdaojutag+100);
    s->stopAllActions();
    if(s->getChildByTag(starstag))
    {
        s->getChildByTag(starstag)->removeFromParentAndCleanup(true);
    }
    CCOrbitCamera *camera1=CCOrbitCamera::create(0.1, 1, 0, 0, 0, 0, 0);
    s->runAction(camera1);
    float shangtiao_x=s->getPositionX();
    float shangtiao_y=s->getPositionY()+s->getContentSize().height/4;
    CCActionInterval *action_shangtiao=CCMoveTo::create(0.4f,ccp(shangtiao_x,shangtiao_y));
    float px=s->getPositionX();
    float py=s->getPositionY()+s->getContentSize().height;

    float ex=pJiansuItem->getPositionX();
    float ey=pJiansuItem->getPositionY();
    ccBezierConfig b1; 
    b1.controlPoint_1=ccp(px+(ex-px)*0.2,py+40);
    b1.controlPoint_2=ccp(px+(ex-px)*0.6,py-40);
    b1.endPosition=ccp(ex-45,ey-40);
    CCActionInterval* fisheatgo=CCBezierTo::create(1.2f,b1);
    //CCActionInterval *moveto=CCMoveTo::create(0.1,this->monsterSystem->getposition());
    
    CCActionInterval *movetohou1=CCEaseSineInOut::create(CCSequence::create(action_shangtiao,fisheatgo,NULL));
    CCActionInterval *movetohou=CCSequence::create(movetohou1,CCCallFuncN::create(this,callfuncN_selector(MonsterSprite::spriteremoveFromParent)),NULL);

    s->runAction(movetohou);
    }
    while (this->getParent()->getChildByTag(menutag)->getChildByTag(fishdaojutag));
}


}

//conis down∫ÛµΩ¥ÔŒª÷√÷¥––Õ£÷π£¨ªÚ «µ„ª˜∫ÛÕÍ≥…∑…––∫Ûœ˚ ß
void MonsterSprite::spriteremoveFromParent(CCNode *pSender)
{

CCMenuItemSprite *s=(CCMenuItemSprite *)pSender;
//stop down

if (s->getTag()==fishcoinstag || s->getTag()==fishdaojutag)
{
    //s->setTag(fishcoinstag+100);
    s->stopAllActions();
    CCOrbitCamera *camera1=CCOrbitCamera::create(0.1, 1, 0, 0, 0, 0, 0);
    
    CCSprite *stars=CCSprite::create("stars.png");
    //CCSprite *stars=CCSprite::createWithSpriteFrameName("stars.png");//genghuan
    stars->setPosition(ccp(s->getContentSize().width/2,s->getContentSize().height/2));
    stars->setTag(starstag);
    s->addChild(stars);
    CCActionInterval *xuanzhuan=CCRotateBy::create(0.8, -90.0f);//旋y转Áa90
    CCActionInterval *fangdasuoxiao1=CCScaleBy::create(0.1, 1.5);//放¤?大ä¨®
    CCActionInterval *fangdasuoxiao2=CCScaleBy::create(0.4, 1.3);//放¤?大ä¨®
    CCActionInterval *fangdasuoxiao=CCSequence::create(fangdasuoxiao2,fangdasuoxiao2->reverse(),NULL);//放¤?大ä¨®缩?小?
    CCFadeIn *shanshuo1=CCFadeIn::create(0.4f);
    int result_wid = CCRANDOM_0_1()*101;
    float yanchi=(float)result_wid*0.01;
    //CCDelayTime *yanchitime=CCDelayTime::create(yanchi);
    CCFadeIn *jinru1=CCFadeIn::create(yanchi);
    //CCBlink *blink=CCBlink::create(1,3);
    CCActionInterval *shanshuo=CCSequence::create(shanshuo1,shanshuo1->reverse(),NULL);
    CCActionInterval *StarsAction1=CCSpawn::create(xuanzhuan,fangdasuoxiao,shanshuo,NULL);
    CCActionInterval *StarsAction2=CCSequence::create(jinru1,fangdasuoxiao1,fangdasuoxiao1->reverse(),StarsAction1,NULL);
    CCActionInterval *StarsAction=CCRepeatForever::create(StarsAction2);
    
    stars->runAction(StarsAction);
    
    s->runAction(camera1);

} 
else if(s->getTag()==(fishcoinstag+100))
{
    //Playyinxiao
    Playyinxiao::play_jinbi();
     umeng::MobClickCpp::bonus(typecoins[this->getMonType()]*fishiproduct[jingyandengji]/100, 1);//youmeng
    qian+=typecoins[this->getMonType()]*fishiproduct[jingyandengji];

    daoju_jinbi--;
    userDefault->setIntegerForKey("daoju_jinbi",daoju_jinbi);////未捡起来的道具
    
    userDefault->setDoubleForKey("usrqian",qian);
    userDefault->flush();
    int guankanleixing=this->getParent()->getTag();
    if (guankanleixing==guanka1_tag)
    {
        ((HelloWorld*)(this->getParent()))->activeqian();
    }
    //增加helloworld类型时候添加
    else
    {
        ((HelloWorld*)(this->getParent()))->activeqian();
    }
    //Œﬁ”√
//     else if(guankanum==guanka2_tag)
//     {
//         ((HelloWorld_gk2*)(this->getParent()))->activeqian();
//     }
    //this->getParent()->activeqian();
    s->stopAllActions();
  
    s->removeFromParentAndCleanup(true);
}
else if(s->getTag()==(fishdaojutag+100))
{
    //Playyinxiao

    int guankanum=this->getParent()->getTag();
    if (guankanum==guanka1_tag)
    {
        //((HelloWorld*)(this->getParent()))->activeqian();
        daojunum++;
        char daojunumstring[5]={0};
        sprintf(daojunumstring, "%d",daojunum);
        lableDaojuNum->setString(daojunumstring);
        userDefault->setIntegerForKey("usrDaojuNum",daojunum);
        daoju_jiansu--;
        userDefault->setIntegerForKey("daoju_jiansu",daoju_jiansu);////未捡起来的道具

        userDefault->flush();
    } 
    //Œﬁ”√
//     else if(guankanum==guanka2_tag)
//     {
//         ((HelloWorld_gk2*)(this->getParent()))->activeqian();
//     }
    //this->getParent()->activeqian();
    
    s->stopAllActions();
    s->removeFromParentAndCleanup(true);
}
else
{
    s->stopAllActions();
    s->removeFromParentAndCleanup(true);
}

}



    int MonsterSprite::getrandomID(int start,int end)
{
    int iconscount=end;
    int iconscountminID=start;
    //int iconscount=15;
    //int iconscountminID=1;
    int result = CCRANDOM_0_1()*iconscount+iconscountminID;//+1
    //int result = CCRANDOM_0_1()*(end-start+1)+start;
    //if(result>iconscount||result<0)
    if (result>=iconscount+iconscountminID||result<iconscountminID)
    {
        do 
        {
            result = CCRANDOM_0_1()*iconscount+iconscountminID;//+1
        } while (result>=iconscount+iconscountminID||result<iconscountminID);

    }
    return result;
}
void MonsterSprite::attackAnimationCallBack(CCNode* pSed){
    //CCLOG("donghuazhixing2");

    //this->unscheduleAllSelectors();
}



//“∆∂Ø
void MonsterSprite::moveRun(){
    int x=this->getPositionX();
    if(this->getMonState()==2){
        // µ±X µƒ◊¯±Í–°”⁄ ◊Ó–°µƒæ‡¿Î « –Ë“™µ˜”√ π•ª˜∂Øª≠
        //∏ƒ≥…X‘⁄◊Ó◊ÛªÚ’ﬂ◊Ó”“µ˜◊™
        x=x-this->getSpeed();
        this->setPositionX(x);
        if(x<=this->getmaxRemoving()){
            this->attackAnimation();
        }
    }

}

CCRect MonsterSprite::converNowRect(){
    // µ√µΩµ±«∞µƒ π÷ŒÔµƒÀ˘‘⁄µƒæÿ–Œ
    CCRect monsret=this->boundingBox();
    float x=monsret.getMinX()+this->getAttackRange().getMinX();
    float y=monsret.getMinY()-this->getAttackRange().getMinY();
    return CCRect(x,y,this->getAttackRange().getMaxX(),this->getAttackRange().getMaxY());
}

void MonsterSprite::setMonsterSystemUtils(MonsterSystem* monsterSystem){
    this->monsterSystem=monsterSystem;
}
MonsterSprite::~MonsterSprite(void){
    if (runArray)
    {
        runArray->removeAllObjects();

        runArray->release();
    }

    if (deathArray)
    {
        deathArray->release();
    }

    if (attackArray)
    {
        attackArray->release();
    }
    //CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFrames();//此处立即xigou被执行

}