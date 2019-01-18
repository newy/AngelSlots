#include "MonsterSystem.h"
//#include "DefenderGameLayer.h"
//#include "MagicMatrixSprite.h"
#include "ResouceDefine.h"


USING_NS_CC;

cocos2d::CCArray* runMonsterArraytemp;
MonsterSystem::MonsterSystem(){

	idleMonsterArry= CCArray::create();// ”√¿¥±£¥Êø’œ–µƒπ÷ŒÔ
	idleMonsterArry->retain();
	this->runMonsterArray=CCArray::create(); // ”√¿¥±£¥Ê’˝‘⁄±º≈‹÷–µƒπ÷ŒÔ
	this->runMonsterArray->retain();
    runMonsterArraytemp=CCArray::create();
    runMonsterArraytemp->retain();
	/**********************************************************************
	float initBlood;// ≥ı ºªØ∆¯—™
	float initSpeed;// ≥ı ºªØÀŸ∂»
	float defend;// π÷ŒÔµƒ∑¿”˘¡¶
	float hurt;// π÷ŒÔµƒ…À∫¶÷µ
	char* picName;// π÷ŒÔµƒÕº∆¨
	char* fileName;// π÷ŒÔÀ˘∂‘”¶µƒplist Œƒº˛µƒ√˚◊÷
	int   type;// π÷ŒÔ¿‡–Õ
	int   runCount;// ±º≈‹∂Øª≠’≈ ˝
	int   actCount;// π•ª˜∂Øª≠’≈ ˝
	int   detCount;// À¿Õˆ∂Øª≠’≈ ˝
	float maxRun;// ◊Ó¥Û“∆∂Øæ‡¿Î
	float minX; // œ¬√Êµƒ’‚Àƒ∏ˆ≤Œ ˝∆‰ µ  «‘⁄π÷ŒÔ…Ì…œªÆ∂®“ª∏ˆ ‹µΩµƒπ•ª˜∑∂Œß ’‚—˘ø…“‘»√≤ªπÊ‘Úµƒ Õº∆¨ ø¥∆¿¥ ‹µΩπ•ª˜µƒ ±∫Ú∏¸±∆’Ê“ªµ„ 
	float minY;
	float maxX;
	float maxY;                                                    
	************************************************************************/
	this->dutu.initBlood=100;
	this->dutu.initSpeed=0.03;//5
	this->dutu.defend=1;
	this->dutu.hurt=10;
	this->dutu.monsName="dutu";
	this->dutu.picName="monster/dutu.png";
	this->dutu.fileName="monster/dutu.plist";
	this->dutu.type=1;
	this->dutu.runCount=8;
	this->dutu.actCount=14;
	this->dutu.detCount=8;
	this->dutu.maxRun=640*0.1;
	this->dutu.attackRangeRec="{{70,45},{30,110}}";

}
MonsterSystem::MonsterSystem(cocos2d::CCRect GoSize)
{
MonsterGoSize=GoSize;

idleMonsterArry= CCArray::create();// ”√¿¥±£¥Êø’œ–µƒπ÷ŒÔ
	idleMonsterArry->retain();
	this->runMonsterArray=CCArray::create(); // ”√¿¥±£¥Ê’˝‘⁄±º≈‹÷–µƒπ÷ŒÔ
	this->runMonsterArray->retain();
    runMonsterArraytemp=CCArray::create();
    runMonsterArraytemp->retain();
	/**********************************************************************
	float initBlood;// ≥ı ºªØ∆¯—™
	float initSpeed;// ≥ı ºªØÀŸ∂»
	float defend;// π÷ŒÔµƒ∑¿”˘¡¶
	float hurt;// π÷ŒÔµƒ…À∫¶÷µ
	char* picName;// π÷ŒÔµƒÕº∆¨
	char* fileName;// π÷ŒÔÀ˘∂‘”¶µƒplist Œƒº˛µƒ√˚◊÷
	int   type;// π÷ŒÔ¿‡–Õ
	int   runCount;// ±º≈‹∂Øª≠’≈ ˝
	int   actCount;// π•ª˜∂Øª≠’≈ ˝
	int   detCount;// À¿Õˆ∂Øª≠’≈ ˝
	float maxRun;// ◊Ó¥Û“∆∂Øæ‡¿Î
	float minX; // œ¬√Êµƒ’‚Àƒ∏ˆ≤Œ ˝∆‰ µ  «‘⁄π÷ŒÔ…Ì…œªÆ∂®“ª∏ˆ ‹µΩµƒπ•ª˜∑∂Œß ’‚—˘ø…“‘»√≤ªπÊ‘Úµƒ Õº∆¨ ø¥∆¿¥ ‹µΩπ•ª˜µƒ ±∫Ú∏¸±∆’Ê“ªµ„ 
	float minY;
	float maxX;
	float maxY;                                                    
	************************************************************************/
	this->dutu.initBlood=fishmaxblood[jingyandengji];//¬˙—™//1000
	this->dutu.initSpeed=0.03;//0.03
	this->dutu.defend=1;//Œﬁ”√
	this->dutu.hurt=10;//Œﬁ”√
	this->dutu.monsName="dutu";
	this->dutu.picName="monster/dutu.png";
	this->dutu.fileName="monster/dutu.plist";
	this->dutu.type=1;
	this->dutu.runCount=5;
	this->dutu.actCount=14;//Œﬁ”√
	this->dutu.detCount=8;//Œﬁ”√
	this->dutu.maxRun=640*0.1;//Œﬁ”√
	this->dutu.attackRangeRec="{{70,45},{30,110}}";

}


////∏˘æ›¿‡–Õ¿¥≤˙…˙œÏ”¶µƒπ÷ŒÔ
MonsterSprite*    MonsterSystem::productMonster(int type){
	if(type==1){
		MonsterSprite* sp=MonsterSprite::createWithMonsterRul(dutu.fileName,CCTextureCache::sharedTextureCache()->textureForKey(dutu.picName),dutu.monsName,dutu.runCount,dutu.actCount,dutu.detCount);
		sp->setHurt(dutu.hurt);
		sp->setDefense(dutu.defend);
		sp->setBlood(dutu.initBlood);
		sp->setSpeed(dutu.initSpeed);
		sp->setmaxRemoving(dutu.maxRun);
		sp->setMonType(dutu.type);
		sp->setMonState(1);
		sp->setAttackRange(CCRectFromString(dutu.attackRangeRec));
		sp->setMonsterSystemUtils(this);
		return sp;
	}
	return NULL;
}
// ∞—±º≈‹÷–µƒπ÷ŒÔÃÌº”µΩ ÷˜ΩÁ√Ê¿Ô√Ê
void MonsterSystem::addDefenderGameLayer(MonsterSprite* monsterSprite){
	// ªÒ»°0-1 ÷Æº‰µƒ ˝
	float ran=CCRANDOM_0_1();
	CCSize size=MonsterGoSize.size;
	float x=CCRANDOM_0_1()*(size.width-monsterSprite->getContentSize().height/2)+monsterSprite->getContentSize().height/2;
	float temp=MonsterGoSize.getMinY()+(size.height-monsterSprite->getContentSize().height)*ran+monsterSprite->getContentSize().height/2;
	//CCLOG("monster %f,%f,%f",MonsterGoSize.getMinY(),size.height*ran,monsterSprite->getContentSize().height/2);
    float y=0;
    y=temp;
// 	if (temp>=size.height){
// 		//y=size.height-monsterSprite->getContentSize().height/2;
//         y=temp;
// 	}else{
// 		if(ran!=0){
// 			if (size.height*ran<monsterSprite->getContentSize().height/2){
// 				y=temp+10;
// 			}else {
// 				y=MonsterGoSize.getMinY()+size.height*ran;
// 			}
// 
// 		}else {
// 			y=MonsterGoSize.getMinY()+monsterSprite->getContentSize().height/2;
// 		}
// 	}
	monsterSprite->setAnchorPoint(ccp(0.5,0.5));
	monsterSprite->setPosition(ccp(x,y));

	if(this->GameLayer){
		this->GameLayer->addChild(monsterSprite,3);
		monsterSprite->runAnimation();
	}
	this->getRunMonsterArray()->addObject(monsterSprite);
    //temp ÃÌº”…œ≤ø∑÷–°∂Øª≠
    if (changjing==1)
    {
        CCSprite *shanshuo_gk1=CCSprite::create("shanshuo_gk1.png");
        CCDelayTime *delay11=CCDelayTime::create(11.0f);
        CCActionInterval *forwardint = CCFadeIn::create(2.0f);
        CCActionInterval *forwardOut = CCFadeOut::create(2.0f);
        CCActionInterval *actionOut = CCSequence::create(forwardint, forwardOut,forwardint, forwardOut,delay11, NULL);
        CCActionInterval * repeatForever =CCRepeatForever::create(actionOut);
        shanshuo_gk1->setAnchorPoint(CCPointZero);
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        shanshuo_gk1->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
        shanshuo_gk1->runAction(repeatForever);
        this->GameLayer->addChild(shanshuo_gk1,2);
    }
    else if (changjing==2)
    {
        CCSprite *shanshuo_gk2=CCSprite::create("shanshuo_gk2.png");
        CCDelayTime *delay11=CCDelayTime::create(11.0f);
      //  CCActionInterval *forwardint = CCFadeIn::create(0.3f);
        CCActionInterval *forwardOut = CCFadeOut::create(0.2f);
        CCActionInterval *forwardto =CCFadeTo::create(0.3,100);
        CCActionInterval *forwardto2 =CCFadeTo::create(0.2,200);
        CCActionInterval *actioninOut = CCSequence::create(forwardto, forwardto2,forwardto,forwardto2,forwardto, forwardto2,forwardto,forwardto2,forwardOut,delay11, NULL);

        //CCActionInterval *actioninOut = CCSequence::create(forwardint, forwardOut,forwardint,forwardOut,forwardint, forwardOut,forwardint,forwardOut, NULL);
        //CCActionInterval *actionblink=CCBlink::create(4,20);
        //CCActionInterval *fadeandblin=CCSpawn::create(actioninOut,actionblink,NULL);
        CCActionInterval * repeatForever =CCRepeatForever::create(actioninOut);
        shanshuo_gk2->setAnchorPoint(CCPointZero);
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        shanshuo_gk2->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
        shanshuo_gk2->runAction(repeatForever);
        this->GameLayer->addChild(shanshuo_gk2,2);
    }
    else if(changjing==3)
    {
        CCSpriteFrameCache *frameCache=CCSpriteFrameCache::sharedSpriteFrameCache();
        frameCache->addSpriteFramesWithFile("pic_shanshuo_gk3.plist");

        CCArray *animations = CCArray::createWithCapacity(16); 
        char str[100]={0};

        for(int i = 0; i< 16; i++)
        {
            sprintf(str,"jiangshi_%d.png",i);  //grossini_dance_%02d.png                                                           
            CCSpriteFrame *frame = frameCache->spriteFrameByName(str);                                                  
             animations->addObject(frame);
         }
        CCAnimation* animation = CCAnimation::createWithSpriteFrames(animations,0.1f);
        CCAnimate *animate = CCAnimate::create(animation);
        CCSprite*shanshuo_gk3=CCSprite::create();

        //CCActionInterval * repeatForever =CCRepeatForever::create(actioninOut);
        shanshuo_gk3->setAnchorPoint(CCPointZero);
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        shanshuo_gk3->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
        CCDelayTime *delay11=CCDelayTime::create(11.0f);
        CCActionInterval *action_shanshuo_gk3 = CCSequence::create(delay11,animate,NULL);
        CCActionInterval * repeatForever =CCRepeatForever::create(action_shanshuo_gk3);
        shanshuo_gk3->runAction(repeatForever);
  
        this->GameLayer->addChild(shanshuo_gk3,2);
    

    }

    else if(changjing==4)
    {
        CCSpriteFrameCache *frameCache=CCSpriteFrameCache::sharedSpriteFrameCache();
        frameCache->addSpriteFramesWithFile("pic_shanshuo_gk4.plist");
        
        CCArray *animations = CCArray::createWithCapacity(10);
        char str[100]={0};
        
        for(int i = 0; i< 10; i++)
        {
            sprintf(str,"jiangshi_%d.png",i);  //grossini_dance_%02d.png
            CCSpriteFrame *frame = frameCache->spriteFrameByName(str);
            animations->addObject(frame);
        }
        CCAnimation* animation = CCAnimation::createWithSpriteFrames(animations,0.1f);
        CCAnimate *animate = CCAnimate::create(animation);
        CCSprite *shanshuo_gk4=CCSprite::create();
        
        //CCActionInterval * repeatForever =CCRepeatForever::create(actioninOut);
        shanshuo_gk4->setAnchorPoint(CCPointZero);
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        shanshuo_gk4->setScaleY(shanglashen);//背à3景??图a?拉¤-伸|¨?
        CCDelayTime *delay11=CCDelayTime::create(11.0f);
        CCActionInterval *action_shanshuo_gk4 = CCSequence::create(delay11,animate,NULL);
        CCActionInterval * repeatForever =CCRepeatForever::create(action_shanshuo_gk4);
        shanshuo_gk4->runAction(repeatForever);
        
        this->GameLayer->addChild(shanshuo_gk4,2);
        //
        CCArray *animations_kuang = CCArray::createWithCapacity(2);
        char str_kuang[100]={0};
        
        for(int i = 1; i<=2; i++)
        {
            sprintf(str_kuang,"shanshuo_%d_gk4.png",i);  //grossini_dance_%02d.png
            CCSpriteFrame *frame = frameCache->spriteFrameByName(str_kuang);
            animations_kuang->addObject(frame);
        }
        CCAnimation* animation_kuang = CCAnimation::createWithSpriteFrames(animations_kuang,0.5f);
        CCAnimate *animate_kuang = CCAnimate::create(animation_kuang);
        CCSprite *shanshuo_kuang_gk4=CCSprite::create();
        
        //CCActionInterval * repeatForever =CCRepeatForever::create(actioninOut);
        shanshuo_kuang_gk4->setAnchorPoint(CCPointZero);
        //float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        shanshuo_kuang_gk4->setScaleY(shanglashen);//背à3景??图a?拉¤-伸|¨?
        //CCDelayTime *delay11=CCDelayTime::create(11.0f);
        // CCActionInterval *action_shanshuo_gk4 = CCSequence::create(animate,NULL);
        CCActionInterval * repeatForever_kuang =CCRepeatForever::create(animate_kuang);
        shanshuo_kuang_gk4->runAction(repeatForever_kuang);
        shanshuo_kuang_gk4->setAnchorPoint(ccp(0.5,0));
        CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
        float  shangheight=bjwidth*pingmubili-960+shangheight_yuan;
        shanshuo_kuang_gk4->setPosition(ccp(visibleSize.width/2,visibleSize.height-shangheight-jingyanheight-kuanghoudu-kuangheight-kuanghoudu_xia));
        this->GameLayer->addChild(shanshuo_kuang_gk4,2);
        
        //
        
    }

}

//¥´»Îπ≠º˝ ºÏ≤‚ «∑Ò∫Õπ÷ŒÔ∑¢…˙≈ˆ◊≤
// bool MonsterSystem::collisionDetection(BulletsSprite* bulletsSprite){
// 	bool iscon=false;
// 	if (this->getRunMonsterArray())
// 	{
// 		// œ¬√Ê «ºÏ≤‚ π≠º˝  «∑Ò∫Õπ÷ŒÔ∑¢…˙≈ˆ◊≤
// 		for(int i=0;i<this->getRunMonsterArray()->count();i++){
// 			MonsterSprite* monsterSprite=(MonsterSprite*)this->getRunMonsterArray()->objectAtIndex(i);
// 			// π÷ŒÔµƒ◊¥Ã¨±ÿ–Î≤ª «À¿Õˆµƒ◊¥Ã¨
// 			if (monsterSprite->getMonState()!=4) 
// 			{
// 				// ≈–∂œµ±«∞µƒπ÷ŒÔÀ˘ ‹π•ª˜µƒ«¯”Ú ±∫Ú∫Õπ≠º˝  «∑Ò∑¢…˙≈ˆ◊≤
// 			    iscon=bulletsSprite->boundingBox().intersectsRect(monsterSprite->converNowRect());
// 				if (iscon)
// 				{
// 					// ±Ì æπ÷ŒÔ ‹µΩπ•ª˜ π÷ŒÔ“™Ω¯––µÙ—™ ≤Ÿ◊˜
// 					monsterSprite->fallBlood(bulletsSprite->getHurt());
// 					iscon=true;
// 					break;
// 				}else{
// 					continue;
// 				}
// 			}
// 
// 		}
// 	}
// 	return iscon;
// }

// ¥´»Îƒß∑®’Ûø¥ø¥ «∑Òœ‡◊≤
// void MonsterSystem::collisionMagc(MagicMatrixSprite* maSprite,cocos2d::CCSprite* magicmat){
// 	bool iscon=false;
// 	if (this->getRunMonsterArray())
// 	{
// 		// œ¬√Ê «ºÏ≤‚ π≠º˝  «∑Ò∫Õπ÷ŒÔ∑¢…˙≈ˆ◊≤
// 		for(int i=0;i<this->getRunMonsterArray()->count();i++){
// 			MonsterSprite* monsterSprite=(MonsterSprite*)this->getRunMonsterArray()->objectAtIndex(i);
// 			// π÷ŒÔµƒ◊¥Ã¨±ÿ–Î≤ª «À¿Õˆµƒ◊¥Ã¨
// 			if (monsterSprite->getMonState()!=4) 
// 			{
// 				// ≈–∂œµ±«∞µƒπ÷ŒÔÀ˘ ‹π•ª˜µƒ«¯”Ú ±∫Ú∫Õƒß∑®’Û  «∑Ò∑¢…˙≈ˆ◊≤
// 				iscon=magicmat->boundingBox().intersectsRect(monsterSprite->converNowRect());
// 				if (iscon)
// 				{
// 					// ±Ì æπ÷ŒÔ ‹µΩπ•ª˜ π÷ŒÔ“™Ω¯––µÙ—™ ≤Ÿ◊˜
// 					monsterSprite->fallBlood(maSprite->getHurt());
// 				}
// 			}
// 
// 		}
// 	}
// }

void MonsterSystem::raisefishijingyan(int jingyan)
{
    int temp=this->getRunMonsterArray()->count();//
    for(int j=0;j<temp;j++)
    {

        MonsterSprite* temmon=(MonsterSprite*)this->getRunMonsterArray()->objectAtIndex(j);
//         if (temmon->getMonType()==type){
//             runmon=temmon;
//             break;
//         }
        CCActionInterval *yanchifishijingyang;
      if(jingyan==-1)
      {
          yanchifishijingyang=CCSequence::create(CCDelayTime::create(0.1),CCCallFuncND::create(temmon,callfuncND_selector(MonsterSystem::raisefishijingyannew),(void *)jingyan),NULL);
      }
        else
        {
             yanchifishijingyang=CCSequence::create(CCDelayTime::create(1.0),CCCallFuncND::create(temmon,callfuncND_selector(MonsterSystem::raisefishijingyannew),(void *)jingyan),NULL);//延迟为等金币飞过来
        }
  
        
     temmon->runAction(yanchifishijingyang);
    }
}
//Œ™¡À‘⁄fishieat fly to the end time£¨change the fishijingyan bar £¨so do this
//void raisefishijingyannew::raisefishijingyan(int jingyan)
void MonsterSystem::raisefishijingyannew(CCNode* sender, void* data)
{
    int jingyan=(long)data;
    int temp=this->getRunMonsterArray()->count();//
    for(int j=0;j<temp;j++)
    {
        MonsterSprite* temmon=(MonsterSprite*)this->getRunMonsterArray()->objectAtIndex(j);
        //         if (temmon->getMonType()==type){
        //             runmon=temmon;
        //             break;
        //         }
       // CCActionInterval *yanchifishijingyang=CCSequence::create(CCDelayTime::create(1),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
        temmon->RaiseBlood((CCNode *)temmon,(void *)jingyan);
    }
    }
void MonsterSystem::recoverMonster(MonsterSprite* monsterSprite)
{
	// ∞—À¿µÙµƒπ÷ŒÔªÿ ’“‘œ¬
	this->getRunMonsterArray()->removeObject(monsterSprite,false);
	// ¥”ΩÁ√Ê…œ“∆≥˝µÙ
	this->GameLayer->removeChild(monsterSprite,false);
	// ªπ‘≠π÷ŒÔµƒ ≤ø∑÷ Ù–‘
	if(monsterSprite->getMonType()==1){
		monsterSprite->setBlood(dutu.initBlood);
		monsterSprite->setPosition(CCPointZero);
		monsterSprite->setMonType(dutu.type);
		// Õ£µÙÀ˘”–∂Øª≠
		monsterSprite->stopAllActions();
	}
	this->getIdleMonsterArry()->addObject(monsterSprite);
}
//∏ƒ∂Ø
//void MonsterSystem::setFishRoute(MonsterSprite* monsterSprite,float dt,bool direction)
void MonsterSystem::setFishRoute(MonsterSprite* monsterSprite,bool direction)
{
    //int direction = abs(rand()%2),route = abs(rand()%2); //ÀÊª˙…Ë÷√¬∑œﬂ∫Õ∑ΩœÚ
    //int direction = CCRANDOM_0_1()*2,
    direction=!direction;
    int route = CCRANDOM_0_1()*2;
    //CCSize winSize = CCDirector::sharedDirector()->getWinSize();
    float ex=monsterSprite->getPositionX();
    float ey=monsterSprite->getPositionY();

    float pxtemp;
    float px;
    //right
    if (direction)
    {
    
    pxtemp=ex+300+(CCRANDOM_0_1()*(MonsterGoSize.size.width-300));
    px=fmin(pxtemp,MonsterGoSize.getMaxX()-monsterSprite->getContentSize().width);
    } 
    //left
    else
    {
     pxtemp=ex-300-(CCRANDOM_0_1()*(MonsterGoSize.size.width-300));
     //px=max(pxtemp,monsterSprite->getContentSize().width/2);
     px=fmax(pxtemp,monsterSprite->getContentSize().width);
    }
    int shangxia=CCRANDOM_0_1()*2;
    float pytemp;
    float py;
    //…œ
    if (shangxia)
    {
    pytemp=ey+100+(CCRANDOM_0_1()*(MonsterGoSize.size.height-100));
        py=fmin(pytemp,MonsterGoSize.getMaxY()-monsterSprite->getContentSize().height*3/4);
    } 
    else
    {
        pytemp=ey-100-(CCRANDOM_0_1()*(MonsterGoSize.size.height-100));
        py=fmax(pytemp,MonsterGoSize.getMinY()+monsterSprite->getContentSize().height/2);
    }
    cocos2d::CCPoint to=ccp(px,py);
    //float dt=((px-ex)*(px-ex)+(py-ey)*(py-ey))*monsterSprite->getSpeed();
    float dt=ccpDistance(monsterSprite->getPosition(),to);
    dt*=monsterSprite->getSpeed();
    //linerRoute(monsterSprite,to,dt,direction);
    if(route == 0) {
        linerRoute(monsterSprite,to,dt,direction);
    }
    else {
        bezierRoute(monsterSprite,to,dt,direction);
    }
}

void MonsterSystem::linerRoute(MonsterSprite* monsterSprite,cocos2d::CCPoint to, float dt,bool direction)
{
    monsterSprite->setFlipX(direction);
    //monsterSprite->setPosition(from);
    //monsterSprite->setScale(0.5f);
    CCMoveTo* move = CCMoveTo::create(dt, to);
    //CCCallFuncN* end = CCCallFuncN::create(this,callfuncN_selector(MonsterSystem::moveActionEnd));
    //CCAction* action = CCSequence::create(move, CCCallFuncN::create(monsterSprite,callfuncN_selector(MonsterSystem::moveActionEnd)), NULL);
    CCAction* action = CCSequence::create(move, CCCallFuncND::create(monsterSprite,callfuncND_selector(MonsterSystem::moveActionEnd),(void *)direction), NULL);

    monsterSprite->runAction(action);
}
void MonsterSystem::bezierRoute(MonsterSprite* monsterSprite,cocos2d::CCPoint to,float dt, bool direction)
{
    //CCSize s = CCDirector::sharedDirector()->getWinSize();
    CCSize s=MonsterGoSize.size;
  //  float h[] = { 55.0f, s.height - 10.0f };
 //   float r[] = { (h[1] - h[0]) / 2, -(h[1] - h[0]) / 2 };

    monsterSprite->setFlipX(direction);

//     ccBezierConfig b1,b2;
// 
//     b1.controlPoint_1 = b1.controlPoint_2 = ccp(s.width / 2 +
//         r[!direction] / 3, h[direction]);
//     b1.endPosition = ccp(s.width / 2, h[0] + r[0]);
// 
//     b2.controlPoint_1 = b2.controlPoint_2 = ccp(s.width / 2 +
//         r[direction] / 3, h[!direction]);
//     b2.endPosition = ccp(s.width / 2 + r[direction], h[!direction]);

//     CCActionInterval* move = CCSequence::create(
//         CCMoveTo::create(dt / 4, ccp(s.width / 2 + r[!direction], h[direction])),
//         CCBezierTo::create(dt / 4, b1),
//         CCBezierTo::create(dt / 4, b2),
//         CCMoveTo::create(dt / 4, to),
//         NULL);

   // CCCallFuncN* end = CCCallFuncN::create(this,
    //    callfuncN_selector(MonsterSystem::moveActionEnd));
    ccBezierConfig b1;
    float sx=monsterSprite->getPositionX();
    float sy=monsterSprite->getPositionY();
    float ex=to.x;
    float ey=to.y;
    //b1.controlPoint_1=ccp(sx,sy);
    b1.controlPoint_1=ccp(sx+(ex-sx)*0.2,sy+(ey-sy)*0.8);
    b1.controlPoint_2=ccp(sx+(ex-sx)*0.6,sy+(ey-sy)*0.2);
    b1.endPosition=to;
    CCActionInterval* move=CCBezierTo::create(dt,b1);
    CCActionInterval* action = CCSequence::create(move,CCCallFuncND::create(monsterSprite,callfuncND_selector(MonsterSystem::moveActionEnd),(void *)direction),NULL);
    //CCActionInterval* action = CCSequence::create(move,CCCallFuncN::create(this,callfuncN_selector(MonsterSystem::moveActionEnd)),NULL);
    monsterSprite->runAction(action);
}

void MonsterSystem::moveActionEnd(cocos2d::CCNode* sender, void* data)
{
//CCRect temp=MonsterGoSize;
this->setFishRoute((MonsterSprite*)sender,(bool)data);
}
cocos2d::CCPoint MonsterSystem::getposition()
{
//CCLOG(" i am in monstersystem getposition 341");
MonsterSprite* temmon=(MonsterSprite*)this->getRunMonsterArray()->objectAtIndex(0);
return temmon->getPosition();
}
;// ”√”⁄÷˜œﬂ≥Ãµ˜”√¿¥‘∂‘∂≤ª∂œµƒ≤˙…˙π÷ŒÔ
void MonsterSystem::addMonster(int type,int count){

	for(int i=0;i<count;i++){
		MonsterSprite* runmon=NULL;

		for(int j=0;j<this->getIdleMonsterArry()->count();j++){
			MonsterSprite* temmon=(MonsterSprite*)this->getIdleMonsterArry()->objectAtIndex(j);
			if (temmon->getMonType()==type){
				runmon=temmon;
				break;
			}

		}
		// »Áπ˚¥”ø’œ–µƒœﬂ≥Ã µ√µΩ¡À–Ë“™µƒ π÷ŒÔ¿‡–Õ  æÕÃÌº”µΩΩÁ√Ê…œ ∑¥÷Æ ‘Ú–Ë“™¥¥Ω®“ª∏ˆ
		if (runmon){
			this->getIdleMonsterArry()->removeObject(runmon,false);
			this->addDefenderGameLayer(runmon);
            this->setFishRoute(runmon,0);
		}else {
			MonsterSprite* temmon= this->productMonster(type);
			if (temmon)
			{
				this->getIdleMonsterArry()->addObject( this->productMonster(type));
				i--;//iºı…Ÿ£¨‘Ÿ¥Œ—≠ª∑“ª¥Œ
			}else {
				break;
			}

		}


	}

}
void MonsterSystem::setDefenderGameLayer(cocos2d::CCLayer* GameLayer){
	this->GameLayer=GameLayer;
}

CCArray* MonsterSystem::getRunMonsterArray(){
	//return this->runMonsterArray;
    return runMonsterArraytemp;
}
CCArray* MonsterSystem::getIdleMonsterArry(){
	return this->idleMonsterArry;
}

MonsterSystem::~MonsterSystem(){
	if (idleMonsterArry)
	{
        this->idleMonsterArry->removeAllObjects();

		this->idleMonsterArry->release();
	}
	if (runMonsterArray)
	{
        this->runMonsterArray->removeAllObjects();

		this->runMonsterArray->release();
	}
    
    runMonsterArraytemp->removeAllObjects();
    
    runMonsterArraytemp->release();

    CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFrames();
}