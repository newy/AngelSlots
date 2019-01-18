#include "Bonus.h"
#include "ResouceDefine.h"
#include "CardSprite.h"
#include "playyinxiao.h"
USING_NS_CC;

// #define redtag 1
// #define blacktag 2
// #define redfangtag 3
// #define redlingtag 4
// #define blackfangtag 5
// #define blacklingtag 6

#define FenGeNum 15


int hitNum_bonus_gk1[15]={3,5,6,4,5,2,7,4,9,4,5,8,4,6,8};
 



 cocos2d::CCLayer *ChooseBonusGame(int BonusNumtemp)
 {
   CCLayer *bonusLayer;
     KTPlayC::setNotificationEnabled(false);//ktplay
   if (changjing==1)
   {
   bonusLayer=new Bonus(BonusNumtemp);
   } 
   else if(changjing==2)
   {
   bonusLayer=new Bonus_gk2(BonusNumtemp);
   }
   else if(changjing==3)
   {
       bonusLayer=new Bonus_gk3(BonusNumtemp);
   }
   else if(changjing==4)
   {
       bonusLayer=new Bonus_gk4(BonusNumtemp);
   }
   return bonusLayer;
 }

 //◊™≈Ã
CCScene* Bonus::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    Bonus *layer = Bonus::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool Bonus::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    oldchangjing=changjing;    
    changjing=11;
    //music
    Playyinxiao::play_ruchangbonus();
    zhuansu=0.01;
    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
    CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
        "Bonus/CloseNormal.png",
        "Bonus/CloseNormal.png",
        this,
        menu_selector(Bonus::menuCloseCallback));

    pCloseItem->setPosition(ccp(origin.x + pCloseItem->getContentSize().width/2 ,
        origin.y + visibleSize.height-pCloseItem->getContentSize().height/2));

    CCMenuItemImage *pStartItem = CCMenuItemImage::create(
        "Bonus/button_normal.png",
        "Bonus/button_selected.png",
        "Bonus/button_disable.png",
        this,
        menu_selector(Bonus::menuStartCallback));
    pStartItem->setAnchorPoint(ccp(0.5,0.5));
    //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
   // pStartItem->setPosition(ccp(visibleSize.width-pStartItem->getContentSize().width/2, pStartItem->getContentSize().height/2));
    pStartItem->setPosition(ccp(visibleSize.width/2, pStartItem->getContentSize().height*1.5));
   // pStartItem->setAnchorPoint(ccp(0.5,0.5));
//     CCLabelTTF *pLabelstart = CCLabelTTF::create("start", "Arial", 38/bigsmall_factor);
//     pLabelstart->setPosition(ccp(pStartItem->getContentSize().width/2, pStartItem->getContentSize().height/2));
//     
//     pStartItem->addChild(pLabelstart);


    // create menu, it's an autorelease object
    const char *start_Str = ((CCString*)(loacalstrings->objectForKey("start")))->m_sString.c_str();
    CCLabelTTF *pLabellevelup = CCLabelTTF::create(start_Str, "Arial", 40/bigsmall_factor);//Helvetica 25
    pLabellevelup->setColor(ccc3(26,69,74));
    //pLabelmenu->setAnchorPoint(ccp(0.5,0.5));
    pLabellevelup->setPosition(ccp(pStartItem->getContentSize().width/2,pStartItem->getContentSize().height*0.4));
    pStartItem->addChild(pLabellevelup);
     pMenu = CCMenu::create(pCloseItem,pStartItem, NULL);
   pMenu->setPosition(CCPointZero);
    this->addChild(pMenu, 1000);
  
    /////////////////////////////
    // 3. add your codes below...

    // add a label shows "Hello World"
    // create and initialize a label
    
 

    // add "HelloWorld" splash screen"
    CCSprite* pSpritebj = CCSprite::create("HelloWorld.png");
    
    
    //pSprite->setRotation(90); 
    // position the sprite on the center of the screen
    pSpritebj->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
    float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
    pSpritebj->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
    // add the sprite as a child to this layer
    this->addChild(pSpritebj,0);
    CCSprite* pSpritetoubiao = CCSprite::create("Bonus/bonus_toubiao.png");
    pSpritetoubiao->setPosition(ccp(visibleSize.width/2,visibleSize.height-pSpritetoubiao->getTextureRect().getMidY()));
    this->addChild(pSpritetoubiao, 1);
    const char *pLabelwinStr = ((CCString*)(loacalstrings->objectForKey("win")))->m_sString.c_str();
    CCLabelTTF* pLabelwin = CCLabelTTF::create(pLabelwinStr, "Arial",40);
    pLabelwin->setColor(ccc3(24, 56, 69));
    pLabelwin->setAnchorPoint(ccp(0.5,0.5));
    pLabelwin->setPosition(ccp(pSpritetoubiao->getTextureRect().getMidX(),
                               pSpritetoubiao->getTextureRect().getMaxY()*0.7));
    pSpritetoubiao->addChild(pLabelwin, 1);
//     CCLabelTTF *pLabelwin = CCLabelTTF::create("win   ", "Arial", 34/bigsmall_factor);
//     pLabelwin->setPosition(ccp(pSpritetoubiao->getTextureRect().getMidX()*9/10,
//         pSpritetoubiao->getTextureRect().getMidY()));
   
    // add the label as a child to this layer
    
    //pSpritetoubiao->addChild(pLabelwin, 1);

    

//     CCLabelTTF *pLabelwin = CCLabelTTF::create("win", "Arial", 40/bigsmall_factor);
//     pLabelwin->setColor(ccc3(0, 0, 0));
//     // position the label on the center of the screen
//     // pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
//     //                         origin.y + visibleSize.height - pLabel->getContentSize().height));
//     pLabelwin->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
//         pSpritezhenhuan->getTextureRect().getMaxY()*3/4));

     pLabel = CCLabelTTF::create("0", "Arial", 45/bigsmall_factor);
     pLabel->setAnchorPoint(ccp(0.5,0.5));
    pLabel->setColor(ccc3(24, 56, 69));
     //pLabel->setColor(ccc3(0, 0, 0));
         // position the label on the center of the screen
         // pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
         //                         origin.y + visibleSize.height - pLabel->getContentSize().height));
    pLabel->setPosition(ccp(pSpritetoubiao->getTextureRect().getMidX(),
    pSpritetoubiao->getTextureRect().getMidY()));
    
    //pSpritezhenhuan->addChild(pLabelwin, 1);
    pSpritetoubiao->addChild(pLabel, 1);
    

    pSpritezhuanlun = CCSprite::create("Bonus/zhuanlun_1.png");


    //pSprite->setRotation(90); 
    // position the sprite on the center of the screen
    pSpritezhuanlun->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));

    // add the sprite as a child to this layer
    this->addChild(pSpritezhuanlun,2);

    CCSprite* pSpritezhenhuan = CCSprite::create("Bonus/zhenhuan.png");
    pSpritezhenhuan->setPosition(ccp(visibleSize.width/2,visibleSize.height/2 + origin.y+pSpritezhuanlun->getContentSize().height/4));
    pSpritezhenhuan->setAnchorPoint(ccp(0.416,0));
    this->addChild(pSpritezhenhuan, 3);

    int banjing=pSpritezhuanlun->getTextureRect().getMidY();
    CCSprite *pSpritezhuanlunmaoding = CCSprite::create("Bonus/maoding.png");
    //pSpritezhuanlunmaoding->setPosition(ccp(banjing, banjing));
      pSpritezhuanlunmaoding->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
    //pSpritezhuanlun->addChild(pSpritezhuanlunmaoding);

    this->addChild(pSpritezhuanlunmaoding,3);
    yajinnum=backqian;
    backqian=0;
    //bonusnum=1;//temp
    //Œß»∆÷––ƒ◊÷’˝
    for(int i=1;i<=FenGeNum;i++)
    {
       // std::string tishi1;+
        char buf[8]= {0};
        int conisnum=hitNum_bonus_gk1[i-1]*yajinnum*bonusnum;
        sprintf(buf, "%d",conisnum);
       // tishi1= buf;
        //sprintf(tishistring, "%s",tishi.c_str());
        //sprintf(buf, "%s",i);
        CCLabelBMFont* pLabebonusnum=CCLabelBMFont::create(buf,"diy_38_cuitihei.fnt");
        
        pLabebonusnum->setTag(100+i);
         pLabebonusnum->setScale(0.8);
        // pLabebonusnum->setAnchorPoint(ccp(0.5,0.5));
        //pLabebonusnum->setAnchorPoint(ccp(0.5,-4));
          pLabebonusnum->setAnchorPoint(ccp(-banjing*0.75/pLabebonusnum->getContentSize().width+0.5,0.5));//◊÷ÃÂµƒ÷––ƒ‘⁄∞Îæ∂µƒ0.75¥¶
         pLabebonusnum->setPosition(ccp(banjing,banjing));//√™µ„‘⁄÷––ƒ
         pSpritezhuanlun->addChild(pLabebonusnum);
          
        //pLabebonusnum->setRotation(i*360/FenGeNum-360/FenGeNum/2);
        pLabebonusnum->setRotation(i*360/FenGeNum-360/FenGeNum/4-4*360/FenGeNum);    
        //pLabebonusnum->setAnchorPoint(ccp(0.5,0.5));
        //pLabebonusnum->setRotation(-90);                   
    }



    return true;
}

int Bonus::getrandomBonusID()
{
    int iconscount=15;
    int iconscountminID=1;
    int result = CCRANDOM_0_1()*iconscount+iconscountminID;//+1
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

void Bonus::menuCloseCallback(CCObject* pSender)
{
   /* ccdirector::shareddirector()->end();

#if (cc_target_platform == cc_platform_ios)
    exit(0);
#endif*/

//backqian=-100;

 Playyinxiao::stopeffect();
    Playyinxiao::play_anjian();

CCDirector::sharedDirector()->popScene();

   //CCScene *pScene = logo::scene();

    // run
    //CCDirector::sharedDirector()->pushScene(pScene);
    //CCDirector::sharedDirector()->replaceScene(pScene);
    /////////////////////////////
    /*   
    CCSprite *pSprite1 =(CCSprite *)this->getChildByTag(1);
  
     CCWaves *waves=CCWaves::create(4, 20, true, true, ccg(16,12),5.0f);
  
    (CCNode*)pSprite1->runAction((CCActionInterval*)waves);*///¥ÌŒÛ
/////////////////////////////////

}



void Bonus::setmenuenable()
{
    pMenu->setEnabled(true);

}
void Bonus::setbonusqian()
{
    Playyinxiao::play_dejiangbonus();
    char tishistring[10] = {0};
    // tishistring=tishi.data();
    //tishistring=tishi.c_str();
    sprintf(tishistring, "%d",backqian/100);
    pLabel->setString(tishistring);
//     CCActionInterval *fangda1 =CCScaleBy::create(0.5,1.4f);
//     CCActionInterval *fangda_1 =CCSequence::create(fangda1,fangda1->reverse(),fangda1,fangda1->reverse(),NULL);
//     CCLabelBMFont *zhongLable=(CCLabelBMFont*)pSpritezhuanlun->getChildByTag(100+zhongidtemp);
//     zhongLable->setAnchorPoint(ccp(0.5,0.5));
//     zhongLable->runAction(fangda_1);
     CCActionInterval *fangda2 =CCScaleBy::create(0.5,1.4f);
    CCActionInterval *fangda_2 =CCSequence::create(fangda2,fangda2->reverse(),fangda2,fangda2->reverse(),NULL);
    pLabel->runAction(fangda_2);
}
// void Bonus::setzhuanpanfuyuan()
// {
// int jiaodu=360-((int)pSpritezhuanlun->getRotation())%360;
// CCRotateBy *fuyuanzhuan=CCRotateBy::create(0.5,jiaodu);
// pSpritezhuanlun->runAction(fuyuanzhuan);
// }
// void Bonus::setzhongaction()
// {
//     CCActionInterval *fangda1 =CCScaleBy::create(0.5,1.1f);
//     CCActionInterval *fangda =CCSequence::create(fangda1,fangda1->reverse(),fangda1,fangda1->reverse(),NULL);
//     ((CCLabelBMFont*)pSpritezhuanlun->getChildByTag(100+zhongidtemp))->runAction(fangda);
// }
void Bonus::backtomain()
{
     Playyinxiao::stopeffect();
    CCDirector::sharedDirector()->popScene();
}
void Bonus::menuStartCallback(CCObject* pSender)
{
  Playyinxiao::stopeffect();
    Playyinxiao::play_starteffect();
    Playyinxiao::play_startbonus();
 pMenu->setEnabled(false);
 int zhongid=getrandomBonusID();
 zhongidtemp=zhongid;
 backqian+=hitNum_bonus_gk1[zhongid-1]*yajinnum*bonusnum*100;
 
 int zhuanjiao=360-((zhongid-1)*360/FenGeNum+CCRANDOM_0_1()*360/FenGeNum);
 //CCLOG("zhuanjiao=%d",zhuanjiao);
 int minquan=360*8;
 CCRotateBy *jibenzhuan1=CCRotateBy::create(zhuansu*(float)minquan,minquan);
 CCActionInterval * jibenzhuan = CCEaseSineIn::create(jibenzhuan1);
 CCRotateBy *zhuan1=CCRotateBy::create(zhuansu*0.5*(float)zhuanjiao+zhuansu*0.5*(float)minquan,zhuanjiao+minquan);
 
 CCActionInterval * zhuan = CCEaseBackOut::create(CCEaseSineInOut::create(zhuan1));//CCEaseExponentialInOut,CCEaseSineInOut 
 //CCDelayTime *delay=CCDelayTime::create(1.0f);
 CCDelayTime *bacdelay=CCDelayTime::create(3.0f);
 CCActionInterval *zhuandong;
//  if (bonusnum)
//  {
//  bonusnum--;
//  if (bonusnum)
//  {
//      zhuandong=CCSequence::create(zhuan,CCCallFunc::create(this, callfunc_selector(Bonus::setbonusqian)),delay,CCCallFunc::create(this, callfunc_selector(Bonus::setzhuanpanfuyuan)),CCCallFunc::create(this, callfunc_selector(Bonus::setmenuenable)),NULL);
//  } 
//  else
//  {
      zhuandong=CCSequence::create(zhuan,CCCallFunc::create(this, callfunc_selector(Bonus::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus::backtomain)),NULL);
//  }
 
//   } 

 pSpritezhuanlun->runAction(zhuandong);

}
CCSize Bonus::getWinSize(){
    return	CCDirector::sharedDirector()->getVisibleSize();
}
CCPoint Bonus::getWinOrigin(){
    return CCDirector::sharedDirector()->getVisibleOrigin();
}
CCPoint Bonus::getWinCenter(){
    return	ccp(getWinSize().width/2+getWinOrigin().x,getWinSize().height/2+getWinOrigin().y);
}

Bonus::Bonus()
{
}
Bonus::~Bonus()
{

}

//bonus gk2
//—°‘Òœ‡Õ¨ ˝
//level1 high wins 4;
 //        50,75,100,125,150,175 :2ge
 //level2 hign wins 4;200-325:2ge ....etc  
CCScene* Bonus_gk2::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    Bonus_gk2 *layer = Bonus_gk2::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool Bonus_gk2::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    oldchangjing=changjing;    
    changjing=21;
    //music
    Playyinxiao::play_ruchangbonus();
    zhuansu=0.01;
    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object

    CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
        "Bonus/CloseNormal.png",
        "Bonus/CloseNormal.png",
        this,
        menu_selector(Bonus_gk2::menuCloseCallback));

    pCloseItem->setPosition(ccp(origin.x + pCloseItem->getContentSize().width/2 ,
        origin.y + visibleSize.height-pCloseItem->getContentSize().height/2));

//     CCMenuItemImage *pStartItem = CCMenuItemImage::create(
//         "Bonus/button_normal.png",
//         "Bonus/button_selected.png",
//         this,
//         menu_selector(Bonus_gk2::menuStartCallback));
//     pStartItem->setAnchorPoint(ccp(1,0));
//     //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
//     pStartItem->setPosition(ccp(visibleSize.width-pStartItem->getContentSize().width/2, pStartItem->getContentSize().height/2));
//    // pStartItem->setAnchorPoint(ccp(0.5,0.5));
//     CCLabelTTF *pLabelstart = CCLabelTTF::create("start", "Arial", 38/bigsmall_factor);
//     pLabelstart->setPosition(ccp(pStartItem->getContentSize().width/2, pStartItem->getContentSize().height/2));
//     
//     pStartItem->addChild(pLabelstart);


    // create menu, it's an autorelease object
     //pMenu = CCMenu::create(pCloseItem, NULL);
  // pMenu->setPosition(CCPointZero);
    //this->addChild(pMenu, 1);
  
    /////////////////////////////
    // 3. add your codes below...

    // add a label shows "Hello World"
    // create and initialize a label
    
 

    // add "HelloWorld" splash screen"
    CCSprite* pSpritebj = CCSprite::create("HelloWorld.png");
    
    
    //pSprite->setRotation(90); 
    // position the sprite on the center of the screen
    pSpritebj->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
    float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
    pSpritebj->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
    // add the sprite as a child to this layer
    this->addChild(pSpritebj,0);
    //CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
//     CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
//     //CC_BREAK_IF(!pbg);
//     float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
//     pbg->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
//     pbg->setAnchorPoint(ccp(0.5,0.5));
//     pbg->setPosition(getWinCenter());
//     this->addChild(pbg);
    pSpritezhenhuan = CCSprite::create("Bonus/bonus_toubiao.png");
    pSpritezhenhuan->setPosition(ccp(visibleSize.width/2,visibleSize.height));
    pSpritezhenhuan->setAnchorPoint(ccp(0.5,1));
    this->addChild(pSpritezhenhuan, 1);
    const char *pLabelwinStr = ((CCString*)(loacalstrings->objectForKey("win")))->m_sString.c_str();
    CCLabelTTF* pLabelwin = CCLabelTTF::create(pLabelwinStr, "Arial",40);
    pLabelwin->setColor(ccc3(24, 56, 69));
    pLabelwin->setAnchorPoint(ccp(0.5,0.5));
    pLabelwin->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
                               pSpritezhenhuan->getTextureRect().getMaxY()*0.7));
    pSpritezhenhuan->addChild(pLabelwin, 1);
//     CCLabelTTF *pLabelwin = CCLabelTTF::create("win   ", "Arial", 34/bigsmall_factor);
//     pLabelwin->setPosition(ccp(pSpritetoubiao->getTextureRect().getMidX()*9/10,
//         pSpritetoubiao->getTextureRect().getMidY()));
   
    // add the label as a child to this layer
    
    //pSpritetoubiao->addChild(pLabelwin, 1);

  

//     CCLabelTTF *pLabelwin = CCLabelTTF::create("win", "Arial", 40/bigsmall_factor);
//     pLabelwin->setColor(ccc3(0, 0, 0));
//     // position the label on the center of the screen
//     // pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
//     //                         origin.y + visibleSize.height - pLabel->getContentSize().height));
//     pLabelwin->setAnchorPoint(ccp(0.5,0.2));
//     pLabelwin->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
//      pSpritezhenhuan->getTextureRect().getMaxY()/2));

     pLabel = CCLabelTTF::create("0", "Arial", 45/bigsmall_factor);
     pLabel->setAnchorPoint(ccp(0.5,0.5));
     pLabel->setColor(ccc3(24, 56, 69));
         // position the label on the center of the screen
         // pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
         //                         origin.y + visibleSize.height - pLabel->getContentSize().height));
    pLabel->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
    pSpritezhenhuan->getTextureRect().getMidY()));
    
    //pSpritezhenhuan->addChild(pLabelwin, 1);
    pSpritezhenhuan->addChild(pLabel, 1);
    //Ã· æ”Ô
    const char *pLabeltabStr = ((CCString*)(loacalstrings->objectForKey("tapthesymbols")))->m_sString.c_str();
    CCLabelTTF *pLabeltab = CCLabelTTF::create(pLabeltabStr, "Arial", 40/bigsmall_factor);
     const char *pLabelfindStr = ((CCString*)(loacalstrings->objectForKey("find")))->m_sString.c_str();
    CCLabelTTF *pLabelfind = CCLabelTTF::create(pLabelfindStr, "Arial", 40/bigsmall_factor);
    int cardsize=getWinSize().width/4;
    int zigao=visibleSize.height-3*cardsize+cardsize/2-pSpritezhenhuan->getContentSize().height;
    pLabeltab->setPosition(ccp(visibleSize.width/2,3*cardsize+cardsize/2+zigao/2));
    pLabelfind->setPosition(ccp(visibleSize.width/2,3*cardsize+cardsize/2+zigao/3));
   // pLabeltab->setPosition(ccp(visibleSize.width/2,visibleSize.height*7/10));
    //pLabelfind->setPosition(ccp(visibleSize.width/2,visibleSize.height*5/8));
    this->addChild(pLabeltab, 3);
    this->addChild(pLabelfind, 3);
    pMenu = CCMenu::create();
     pMenu->addChild(pCloseItem);
    
     
     for (int i=0;i<16;i++)
     {
     CardIsOpen[i]=0;
     }
   
     //int num[16];1-8
     for (int i=0;i<16;i++)
     {
     num[i]=i%8+1;
     }

     for (int i=0;i<16;i++)
     {
     int r=getrandomBonusID(0,15);
     //CCLOG("r=%d",r);
     std::swap(num[i],num[r]);
     }
       CCSprite *spritecardout= CCSprite::create("Bonus/cardface_gk2.png");
       yajinnum=backqian;
       backqian=0;
    for (int i=0;i<16;i++)
    {
    //Õ∏√˜∞¥≈•
    CCSprite *sprite = CCSprite::create("Bonus/160_160.png");
    CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite, this, menu_selector(Bonus_gk2::menuStartCallback));
    menuItem->setPosition(ccp((i%4)*cardsize+cardsize/2,i/4*cardsize+cardsize/2));
    menuItem->setTag(200+i);
    pMenu->addChild(menuItem);
    //CCSprite *spritecard = CCSprite::create("bonus/huan-160.png");
    CCSprite *spritecardin = CCSprite::create("Bonus/huan-160.png");
    
    //–˝◊™∞¥≈•
   // CCLabelTTF *pLabelcai = CCLabelTTF::create(CCString::createWithFormat("%d", i)->getCString(), "Arial", 40/bigsmall_factor);
   // pLabelcai->setPosition(ccp(80,80));
    //spritecardout->addChild(pLabelcai);
    CardSprite *card=CardSprite::createWithTexture(spritecardin->getTexture(),spritecardout->getTexture(),0.5,num[i]);//CCString::createWithFormat("bonus/%d.png", result)->getCString()
    card->setPosition(ccp((i%4)*cardsize+cardsize/2,i/4*cardsize+cardsize/2));
    card->setTag(300+i);
    this->addChild(card,3);

    }
    
   pMenu->setPosition(CCPointZero);
    this->addChild(pMenu,1000);

    return true;
}

int Bonus_gk2::getrandomBonusID(int start,int end)
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

void Bonus_gk2::menuCloseCallback(CCObject* pSender)
{
   /* ccdirector::shareddirector()->end();

#if (cc_target_platform == cc_platform_ios)
    exit(0);
#endif*/

//backqian=-100;

 Playyinxiao::stopeffect();
    Playyinxiao::play_anjian();

CCDirector::sharedDirector()->popScene();

   //CCScene *pScene = logo::scene();

    // run
    //CCDirector::sharedDirector()->pushScene(pScene);
    //CCDirector::sharedDirector()->replaceScene(pScene);
    /////////////////////////////
    /*   
    CCSprite *pSprite1 =(CCSprite *)this->getChildByTag(1);
  
     CCWaves *waves=CCWaves::create(4, 20, true, true, ccg(16,12),5.0f);
  
    (CCNode*)pSprite1->runAction((CCActionInterval*)waves);*///¥ÌŒÛ
/////////////////////////////////

}



void Bonus_gk2::setmenuenable()
{
    pMenu->setEnabled(true);
    //CCLOG("pMenu is enabled");

}
void Bonus_gk2::setbonusqian()
{
     Playyinxiao::stopeffect();
    Playyinxiao::play_dejiangbonus();
    char tishistring[10] = {0};
    // tishistring=tishi.data();
    //tishistring=tishi.c_str();
    sprintf(tishistring, "%d",backqian/100);
    pLabel->setString(tishistring);
    CCActionInterval *fangda2 =CCScaleBy::create(0.5,1.4f);
    CCActionInterval *fangda_2 =CCSequence::create(fangda2,fangda2->reverse(),fangda2,fangda2->reverse(),NULL);
    pLabel->runAction(fangda_2);
    CCDelayTime *bacdelay=CCDelayTime::create(3.0f);
    for (int i=0;i<16;i++)
    {
        if (!CardIsOpen[i])
        {
            CardSprite *card=(CardSprite *)(pSpritezhenhuan->getParent()->getChildByTag(300+i)); 
            
           CCActionInterval *Opencardaction=CCSequence::create(bacdelay,CCCallFuncND::create(this,callfuncND_selector(Bonus_gk2::opencard),(void *)i),NULL);
                CCDelayTime *bacdelay=CCDelayTime::create(2.0f);
                CCActionInterval *quanfankai;
 
                quanfankai=CCSequence::create(Opencardaction,bacdelay,NULL);
                card->runAction(quanfankai);

        }
    }
}
// void Bonus_gk2::setzhuanpanfuyuan()
// {
// int jiaodu=360-((int)pSpritezhuanlun->getRotation())%360;
// CCRotateBy *fuyuanzhuan=CCRotateBy::create(0.5,jiaodu);
// pSpritezhuanlun->runAction(fuyuanzhuan);
// }

 void Bonus_gk2::backtomain()
{
     CCDirector::sharedDirector()->popScene();
 }

 void Bonus_gk2::opencard(CCNode* sender, void* data)
 {
    
     int cardID=(long)data;
     CardSprite* card=(CardSprite *)this->getChildByTag(300+cardID);
     card->openCard();
 }

 void Bonus_gk2::cardfangdaandsuoxiao(CCNode* sender, void* data)
 {
     CCScaleBy *fangda=CCScaleBy::create(0.5,1.2);
     CCActionInterval * FangdaAndSuoxiao = CCSequence::create(fangda,fangda->reverse(),NULL);//CCEaseExponentialInOut,CCEaseSineInOut
     int cardID=(long)data;
     CardSprite* card=(CardSprite *)this->getChildByTag(300+cardID);
     card->setZOrder(999);
     card->runAction(CCRepeat::create(FangdaAndSuoxiao,2));
 }

void Bonus_gk2::menuStartCallback(CCObject* pSender)
{
Playyinxiao::play_starteffect();
CCMenuItemSprite *itemmenu=(CCMenuItemSprite *)pSender;
int cardID=itemmenu->getTag()-200;
if (!CardIsOpen[cardID])
{
    
    //playeffect opencard
    pMenu->setEnabled(false); 
    CardIsOpen[cardID]=num[cardID];
    CCActionInterval *Opencardaction=CCSequence::create(CCCallFuncND::create(this,callfuncND_selector(Bonus_gk2::opencard),(void *)cardID),NULL);
    
    int OpenNum=num[cardID];
    for (int i=0;i<16;i++)
    {
     if (i!=cardID)
     {
        if (CardIsOpen[i]==num[cardID])
        {//find 2 of a kind 
        //playeffect reward
        backqian+=num[cardID]*100*yajinnum*bonusnum;
//         CCScaleBy *fangda=CCScaleBy::create(0.5,1.2);
//         CCActionInterval * FangdaAndSuoxiao = CCSequence::create(fangda,fangda->reverse(),NULL);//CCEaseExponentialInOut,CCEaseSineInOut
       CCActionInterval *cardfangdaandsuoxiaoaction=CCSpawn::create(CCCallFuncND::create(this,callfuncND_selector(Bonus_gk2::cardfangdaandsuoxiao),(void *)cardID),CCCallFuncND::create(this,callfuncND_selector(Bonus_gk2::cardfangdaandsuoxiao),(void *)i),NULL);
        CCDelayTime *delay=CCDelayTime::create(1.0f);
         CCDelayTime *bacdelay=CCDelayTime::create(6.0f);
        CCActionInterval *fangdasuoxiaoAndBack;
//         if (bonusnum)
//         {
//             bonusnum--;
//             if (bonusnum)
//             {//∂‡¥Œ
//                 fangdasuoxiaoAndBack=CCSequence::create(Opencardaction,delay,cardfangdaandsuoxiaoaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setbonusqian)),delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setmenuenable)),NULL);
//             } 
//             else
//             {//“ª¥Œ
//                 fangdasuoxiaoAndBack=CCSequence::create(Opencardaction,delay,cardfangdaandsuoxiaoaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::backtomain)),NULL);
//             }
//             //µ⁄∂˛¥Œ◊™‘ı√¥º∆À„µ√µΩΩ«∂»£ø£ø£ø£ø£ø£ø£ø£ø£ø£ø
//         } 
         fangdasuoxiaoAndBack=CCSequence::create(Opencardaction,delay,cardfangdaandsuoxiaoaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::backtomain)),NULL);
        this->runAction(fangdasuoxiaoAndBack);
        //break;
        return;
         }
//          else if(i==15&&CardIsOpen[i]!=num[cardID])
//          {
//          this->runAction(CCSequence::create(Opencardaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setmenuenable)),NULL));
//          break;
//           }
        
     }
    }
    this->runAction(CCSequence::create(Opencardaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setmenuenable)),NULL));
    //CCLOG("opennum=%d",OpenNum);

}

//  Playyinxiao::play_startbonus();
//  pMenu->setEnabled(false);
//  int zhongid=getrandomBonusID();
//  backqian+=zhongid*100;
//  int zhuanjiao=360-((zhongid-1)*360/FenGeNum+CCRANDOM_0_1()*360/FenGeNum);
//  CCLOG("zhuanjiao=%d",zhuanjiao);
//  int minquan=360*8;
//  CCRotateBy *jibenzhuan1=CCRotateBy::create(zhuansu*(float)minquan,minquan);
//  CCActionInterval * jibenzhuan = CCEaseSineIn::create(jibenzhuan1);
//  CCRotateBy *zhuan1=CCRotateBy::create(zhuansu*0.5*(float)zhuanjiao+zhuansu*0.5*(float)minquan,zhuanjiao+minquan);
//  
//  CCActionInterval * zhuan = CCEaseBackOut::create(CCEaseSineInOut::create(zhuan1));//CCEaseExponentialInOut,CCEaseSineInOut
//   
// 
//  CCDelayTime *delay=CCDelayTime::create(1.0f);
//  CCDelayTime *bacdelay=CCDelayTime::create(2.0f);
//  CCActionInterval *zhuandong;
//  if (bonusnum)
//  {
//  bonusnum--;
//  if (bonusnum)
//  {
//      zhuandong=CCSequence::create(zhuan,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setbonusqian)),delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setzhuanpanfuyuan)),CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setmenuenable)),NULL);
//  } 
//  else
//  {
//      zhuandong=CCSequence::create(zhuan,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::backtomain)),NULL);
//  }
//  //µ⁄∂˛¥Œ◊™‘ı√¥º∆À„µ√µΩΩ«∂»£ø£ø£ø£ø£ø£ø£ø£ø£ø£ø
//  } 
// 
//  pSpritezhuanlun->runAction(zhuandong);

}
CCSize Bonus_gk2::getWinSize(){
    return	CCDirector::sharedDirector()->getVisibleSize();
}
CCPoint Bonus_gk2::getWinOrigin(){
    return CCDirector::sharedDirector()->getVisibleOrigin();
}
CCPoint Bonus_gk2::getWinCenter(){
    return	ccp(getWinSize().width/2+getWinOrigin().x,getWinSize().height/2+getWinOrigin().y);
}

Bonus_gk2::Bonus_gk2()
{
}
Bonus_gk2::~Bonus_gk2()
{

}

//bonus gk2 end


//bonus gk3
//Ω±¿¯ ˝◊È
int jianglishuzu_gk3[10]={100,200,300,400,500,700,900,1200,1500,2000};

CCScene* Bonus_gk3::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    Bonus_gk3 *layer = Bonus_gk3::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool Bonus_gk3::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    oldchangjing=changjing;    
    changjing=31;
    //music
    Playyinxiao::play_ruchangbonus();
    zhuansu=0;
    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
    CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
        "Bonus/CloseNormal.png",
        "Bonus/CloseSelected.png",
        this,
        menu_selector(Bonus_gk3::menuCloseCallback));

    pCloseItem->setPosition(ccp(origin.x + pCloseItem->getContentSize().width/2 ,
        origin.y + visibleSize.height-pCloseItem->getContentSize().height/2));

    pStartUpItem = CCMenuItemImage::create(
        "Bonus/selectup_gk3.png",
        "Bonus/selectedup_gk3.png",
        "Bonus/selectupunable_gk3.png",
        this,
        menu_selector(Bonus_gk3::menuStartCallback));
        pStartUpItem->setZOrder(1000);
    pStartUpItem->setTag(1000);
    pStartUpItem->setAnchorPoint(ccp(0.6,1));
    //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
    pStartUpItem->setPosition(ccp(visibleSize.width/2-pStartUpItem->getContentSize().width, visibleSize.height/2));
   // pStartItem->setAnchorPoint(ccp(0.5,0.5));
   // CCLabelTTF *pLabelstart = CCLabelTTF::create("start", "Arial", 38/bigsmall_factor);
    //pStartUpItem->setPosition(ccp(pStartItem->getContentSize().width/2, pStartItem->getContentSize().height/2));
    
   // pStartUpItem->addChild(pStartUpItem);
    const char *pLabelupStr = ((CCString*)(loacalstrings->objectForKey("high")))->m_sString.c_str();
    CCLabelTTF* pLabelup_1 = CCLabelTTF::create(pLabelupStr, "Arial",35);
    pLabelup_1->setColor(ccc3(24, 56, 69));
    pLabelup_1->setAnchorPoint(ccp(0.5,0.5));
    pLabelup_1->setPosition(ccp(pStartUpItem->getContentSize().width/2,pStartUpItem->getContentSize().height*0.35));
    pStartUpItem->addChild(pLabelup_1, 1);
    
    
    pStartDownItem = CCMenuItemImage::create(
        "Bonus/selectdown_gk3.png",
        "Bonus/selecteddown_gk3.png",
        "Bonus/selectdownunable_gk3.png",
        this,
        menu_selector(Bonus_gk3::menuStartCallback));
        pStartDownItem->setZOrder(1001);
        pStartDownItem->setTag(1001);
    pStartDownItem->setAnchorPoint(ccp(0.4,1));
    //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
    pStartDownItem->setPosition(ccp(visibleSize.width/2+pStartDownItem->getContentSize().width, visibleSize.height/2));
    // pStartItem->setAnchorPoint(ccp(0.5,0.5));
    // CCLabelTTF *pLabelstart = CCLabelTTF::create("start", "Arial", 38/bigsmall_factor);
    //pStartCloseItem->setPosition(ccp(pStartItem->getContentSize().width/2, pStartItem->getContentSize().height/2));
    
    // pStartCloseItem->addChild(pStartUpItem);
    const char *pLabeldownStr = ((CCString*)(loacalstrings->objectForKey("low")))->m_sString.c_str();
    CCLabelTTF* pLabeldown_1 = CCLabelTTF::create(pLabeldownStr, "Arial",35);
    pLabeldown_1->setColor(ccc3(24, 56, 69));
    pLabeldown_1->setAnchorPoint(ccp(0.5,0.5));
    pLabeldown_1->setPosition(ccp(pStartDownItem->getContentSize().width/2,pStartDownItem->getContentSize().height*0.68));
    pStartDownItem->addChild(pLabeldown_1, 1);
    // create menu, it's an autorelease object
     pMenu = CCMenu::create(pCloseItem,pStartUpItem,pStartDownItem,NULL);
   pMenu->setPosition(CCPointZero);
   
    this->addChild(pMenu, 1000);
  
    /////////////////////////////
    // 3. add your codes below...

    // add a label shows "Hello World"
    // create and initialize a label
    
 

    // add "HelloWorld" splash screen"
    CCSprite* pSpritebj = CCSprite::create("HelloWorld.png");
    
    
    //pSprite->setRotation(90); 
    // position the sprite on the center of the screen
    pSpritebj->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
    float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
    pSpritebj->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
    // add the sprite as a child to this layer
    this->addChild(pSpritebj,0);
//     CCSprite* pSpritetoubiao = CCSprite::create("Bonus/bonus_toubiao_gk3.png");
//     pSpritetoubiao->setPosition(ccp(visibleSize.width/2,visibleSize.height-pSpritetoubiao->getTextureRect().getMidY()));
//     this->addChild(pSpritetoubiao, 1);
//     CCLabelTTF *pLabelwin = CCLabelTTF::create("win   ", "Arial", 34/bigsmall_factor);
//     pLabelwin->setPosition(ccp(pSpritetoubiao->getTextureRect().getMidX()*9/10,
//         pSpritetoubiao->getTextureRect().getMidY()));
   
    // add the label as a child to this layer
    
    //pSpritetoubiao->addChild(pLabelwin, 1);

    CCSprite* pSpritezhenhuan = CCSprite::create("Bonus/bonus_toubiao.png");
    pSpritezhenhuan->setPosition(ccp(visibleSize.width/2,visibleSize.height));
    pSpritezhenhuan->setAnchorPoint(ccp(0.5,1));
    this->addChild(pSpritezhenhuan, 3);
    const char *pLabelwinStr = ((CCString*)(loacalstrings->objectForKey("win")))->m_sString.c_str();
    CCLabelTTF* pLabelwin_1 = CCLabelTTF::create(pLabelwinStr, "Arial",40);
    pLabelwin_1->setColor(ccc3(24, 56, 69));
    pLabelwin_1->setAnchorPoint(ccp(0.5,0.5));
    pLabelwin_1->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
                               pSpritezhenhuan->getTextureRect().getMaxY()*0.7));
    pSpritezhenhuan->addChild(pLabelwin_1, 1);
    CCSprite* pSpritefuti = CCSprite::create("Bonus/futi_gk3.png");
    pSpritefuti->setPosition(ccp(visibleSize.width/2,visibleSize.height-pSpritezhenhuan->getContentSize().height));
    pSpritefuti->setAnchorPoint(ccp(0.5,0.9));
    this->addChild(pSpritefuti, 3);
    oldnum=newnum=getrandomBonusID();
    
    pLabeNum_gk3=CCLabelBMFont::create(CCString::createWithFormat("%d", oldnum)->getCString(),"Bonus/diy_90.fnt");
    pLabeNum_gk3->setAnchorPoint(ccp(0.5,0.5));
    pLabeNum_gk3->setPosition(ccp(pSpritefuti->getContentSize().width/2,pSpritefuti->getContentSize().height/2+pLabeNum_gk3->getContentSize().height/4));
     pSpritefuti->addChild(pLabeNum_gk3);

    //œ‘ æΩ±¿¯«¯”Ú–Ë“™ª∫¥Ê
    CCTextureCache::sharedTextureCache()->addImage("Bonus/conis_get_gk3.png");
    CCTextureCache::sharedTextureCache()->addImage("Bonus/conis_unget_gk3.png");
    CCTextureCache::sharedTextureCache()->addImage("Bonus/kuang_gk3.png");
    
    CCSprite* conis;
    CCLabelTTF *pLabelwin;
    yajinnum=backqian;
    backqian=0;
    for (int i=0;i<10;i++)
    {
        conis= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("Bonus/conis_unget_gk3.png"));
        int conisnum=jianglishuzu_gk3[i]*yajinnum*bonusnum;
        pLabelwin = CCLabelTTF::create(CCString::createWithFormat("%d", conisnum/100)->getCString(), "Arial", 35/bigsmall_factor);
        
        conis->setTag(2000+i);
        pLabelwin->setTag(3000+i);
        conis->setAnchorPoint(ccp(1,0.5));
        conis->setPosition(ccp(visibleSize.width/2-conis->getContentSize().width/2,visibleSize.height/10+i*conis->getContentSize().height*6/5));
        pLabelwin->setAnchorPoint(ccp(0.2,0.5));
        pLabelwin->setPosition(ccp(visibleSize.width/2,visibleSize.height/10+i*conis->getContentSize().height*6/5));
        pLabelwin->setColor(ccc3(120,120,120));//ª“…´£®120,120,120£©,¬Ã…´(24, 56, 69)
        this->addChild(conis);
        this->addChild(pLabelwin);
    }
    hanggao=conis->getContentSize().height*6/5;
    bonusJiangLiNow_gk3=-1;//≥ı ºŒª÷√£¨kuang∑≈”⁄◊Óœ¬√Ê“ª≤„£¨µ´ «¥À ±≤¢√ª≤¬∂‘
    kuang= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("Bonus/kuang_gk3.png"));
    kuang->setPosition(ccp(visibleSize.width/2,visibleSize.height/10+(bonusJiangLiNow_gk3+1)*hanggao));
    this->addChild(kuang);
    //适配ip4
    float numdingceng=visibleSize.height/10+9*conis->getContentSize().height*6/5;
    
    if(numdingceng>(pSpritefuti->getPositionY()-pSpritefuti->getContentSize().height))
    {
        pSpritefuti->setPositionY((visibleSize.height-numdingceng)/4+numdingceng+pSpritefuti->getContentSize().height*0.4);
        pSpritefuti->setScale( (visibleSize.height-numdingceng)/2/pSpritefuti->getContentSize().height);
        pSpritezhenhuan->setScale((visibleSize.height-numdingceng)/2/pSpritezhenhuan->getContentSize().height);
        
    }
    /*
    CCLabelTTF *pLabelwin = CCLabelTTF::create("win", "Arial", 40/bigsmall_factor);
    pLabelwin->setColor(ccc3(0, 0, 0));
    // position the label on the center of the screen
    // pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
    //                         origin.y + visibleSize.height - pLabel->getContentSize().height));
    pLabelwin->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
        pSpritezhenhuan->getTextureRect().getMaxY()*3/4));
     */
     pLabel = CCLabelTTF::create("0", "Arial", 45/bigsmall_factor);
     pLabel->setAnchorPoint(ccp(0.5,0.5));
     pLabel->setColor(ccc3(24, 56, 69));
         // position the label on the center of the screen
         // pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
         //                         origin.y + visibleSize.height - pLabel->getContentSize().height));
    pLabel->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
    pSpritezhenhuan->getTextureRect().getMaxY()/2));
    
    //pSpritezhenhuan->addChild(pLabelwin, 1);
    pSpritezhenhuan->addChild(pLabel, 1);
    
/*//◊™¬÷»•µÙ£¨‘⁄¥ÀÃÌº” ˝◊÷¬•
    pSpritezhuanlun = CCSprite::create("Bonus/zhuanlun_1.png");


    //pSprite->setRotation(90); 
    // position the sprite on the center of the screen
    pSpritezhuanlun->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));

    // add the sprite as a child to this layer
    this->addChild(pSpritezhuanlun,2);
    int banjing=pSpritezhuanlun->getTextureRect().getMidY();
    CCSprite *pSpritezhuanlunmaoding = CCSprite::create("Bonus/maoding.png");
    pSpritezhuanlunmaoding->setPosition(ccp(banjing, banjing));
    pSpritezhuanlun->addChild(pSpritezhuanlunmaoding);
    
    
    for(int i=1;i<=FenGeNum;i++)
    {
       // std::string tishi1;+
        char buf[4]= {0};
        sprintf(buf, "%d",  i);
       // tishi1= buf;
        //sprintf(tishistring, "%s",tishi.c_str());
        //sprintf(buf, "%s",i);
        CCLabelBMFont* pLabebonusnum=CCLabelBMFont::create(buf,"diy_38_cuitihei.fnt");
        
        pLabebonusnum->setTag(100+i);
        //pLabebonusnum->setScale(0.8);
        // pLabebonusnum->setAnchorPoint(ccp(0.5,0.5));
        pLabebonusnum->setAnchorPoint(ccp(0.5,-5));
         pLabebonusnum->setPosition(ccp(banjing,banjing));
         pSpritezhuanlun->addChild(pLabebonusnum);
          
        pLabebonusnum->setRotation(i*360/FenGeNum-360/FenGeNum/2);
       
       
        
    }
    */



    return true;
}

int Bonus_gk3::getrandomBonusID()
{
    int iconscount=10;
    int iconscountminID=0;
    int result = CCRANDOM_0_1()*iconscount+iconscountminID;//+1
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

void Bonus_gk3::menuCloseCallback(CCObject* pSender)
{
   /* ccdirector::shareddirector()->end();

#if (cc_target_platform == cc_platform_ios)
    exit(0);
#endif*/

//backqian=-100;

 Playyinxiao::stopeffect();
    Playyinxiao::play_anjian();

CCDirector::sharedDirector()->popScene();

   //CCScene *pScene = logo::scene();

    // run
    //CCDirector::sharedDirector()->pushScene(pScene);
    //CCDirector::sharedDirector()->replaceScene(pScene);
    /////////////////////////////
    /*   
    CCSprite *pSprite1 =(CCSprite *)this->getChildByTag(1);
  
     CCWaves *waves=CCWaves::create(4, 20, true, true, ccg(16,12),5.0f);
  
    (CCNode*)pSprite1->runAction((CCActionInterval*)waves);*///¥ÌŒÛ
/////////////////////////////////

}



void Bonus_gk3::setmenuenable()
{
    pMenu->setEnabled(true);

}
void Bonus_gk3::setbonusqian()
{
    //Playyinxiao::play_dejiangbonus();
    if (backqian)
    {
        Playyinxiao::stopeffect();
        Playyinxiao::play_caiduiguess();
    } 
    else
    {
        Playyinxiao::stopeffect();
        Playyinxiao::play_caicuoguess();
    }
    char tishistring[10] = {0};
    sprintf(tishistring, "%d",backqian/100);
    pLabel->setString(tishistring);
    CCActionInterval *fangda2 =CCScaleBy::create(0.5,1.4f);
    CCActionInterval *fangda_2 =CCSequence::create(fangda2,fangda2->reverse(),fangda2,fangda2->reverse(),NULL);
    pLabel->runAction(fangda_2);


}

void Bonus_gk3::backtomain()
{
    CCDirector::sharedDirector()->popScene();
}
void Bonus_gk3::menuStartCallback(CCObject* pSender)
{
    Playyinxiao::play_starteffect();
    Playyinxiao::play_startbonus();//“™±‰ ˝◊÷µƒ“Ù¿÷//–Ë“™∏ƒ£¨œ÷‘⁄”Îπÿø®1bonus“ª—˘
 //pSender gettag;////////continue;
 oldnum=newnum;
 CCMenuItemImage *ItemImage=(CCMenuItemImage *)pSender;
 int SelectDaXiao=ItemImage->getTag();//1000UP,1001DOWN
 //≥°æ∞≥ı ºªØ ±æÕ”–∏ˆ ˝◊÷£¨µ„ª˜¥À¥¶∞¥≈•◊‘∂Ø…˙≥…“ª∏ˆ ˝◊÷π˝¿¥£¨»Áπ˚∂‘±»¥Û–°”Î∞¥º¸“ª÷¬‘Ú≥…π¶°£
 
 do 
 {
   newnum=getrandomBonusID();
 } while (newnum==oldnum);

  CCDelayTime *delay=CCDelayTime::create(2.0f);
 
 //UP—°‘Ò¥Û”⁄…œ“ª∏ˆ
 if (SelectDaXiao==1000)
 {
    if (newnum>oldnum)
    {
    //right
        CCActionInterval * rightaction = CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::GuessRight)),NULL);
        this->runAction(rightaction);
    //GuessRight();
    } 
    else
    {
    //wrong
        CCActionInterval * wrongaction = CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::guesswrong)),NULL);
        this->runAction(wrongaction);
    //guesswrong();
    }
 
 }
 else
 {
     if (newnum<oldnum)
     {
         //right
         CCActionInterval * rightaction = CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::GuessRight)),NULL);
         this->runAction(rightaction);
     } 
     else
     {
         //wrong
         CCActionInterval * wrongaction = CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::guesswrong)),NULL);
         this->runAction(wrongaction);
     }

 }

    
    pMenu->setEnabled(false);
    // ˝◊÷±‰ªØ,–Ë“™ÃÌº”–ßπ˚

    int minquan = 360*8;
    CCRotateBy *jibenzhuan1 = CCRotateBy::create(1.0f,minquan);
    CCActionInterval * jibenzhuan = CCEaseSineIn::create(jibenzhuan1);
    CCRotateBy *zhuan1 = CCRotateBy::create(1.0f,minquan);
    
    CCActionInterval * zhuan = CCEaseBackOut::create(CCEaseSineInOut::create(zhuan1));//CCEaseExponentialInOut,CCEaseSineInOut 
    
    CCScaleBy *suoxiao=CCScaleBy::create(0.5,0.005);
     CCActionInterval *suoxiaofangda=CCSequence::create(suoxiao,suoxiao->reverse(),NULL);
     CCActionInterval *zhuanAndesuofang=CCSpawn::create(zhuan1,suoxiaofangda,NULL);
    //CCActionInterval * zhuandong = CCSequence::create(zhuan,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setbonusqian)),delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setzhuanpanfuyuan)),CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setmenuenable)),NULL);
    pLabeNum_gk3->runAction(zhuanAndesuofang);
    char newstring[10] = {0};
    sprintf(newstring, "%d",newnum);
    pLabeNum_gk3->setString(newstring);
//  int minquan=360*8;
//  CCRotateBy *jibenzhuan1=CCRotateBy::create(zhuansu*(float)minquan,minquan);
//  CCActionInterval * jibenzhuan = CCEaseSineIn::create(jibenzhuan1);
//  CCRotateBy *zhuan1=CCRotateBy::create(zhuansu*0.5*(float)zhuanjiao+zhuansu*0.5*(float)minquan,zhuanjiao+minquan);
//  
//  CCActionInterval * zhuan = CCEaseBackOut::create(CCEaseSineInOut::create(zhuan1));//CCEaseExponentialInOut,CCEaseSineInOut 
//  CCDelayTime *delay=CCDelayTime::create(1.0f);
//  CCDelayTime *bacdelay=CCDelayTime::create(2.0f);
//  CCActionInterval *zhuandong;
//  if (bonusnum)
//  {
// 
//  bonusnum--;
//  if (bonusnum)
//  {
//      zhuandong=CCSequence::create(zhuan,CCCallFunc::create(this, callfunc_selector(Bonus::setbonusqian)),delay,CCCallFunc::create(this, callfunc_selector(Bonus::setzhuanpanfuyuan)),CCCallFunc::create(this, callfunc_selector(Bonus::setmenuenable)),NULL);
//  } 
//  else
//  {
//      zhuandong=CCSequence::create(zhuan,CCCallFunc::create(this, callfunc_selector(Bonus::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus::backtomain)),NULL);
//  }
//  //µ⁄∂˛¥Œ◊™‘ı√¥º∆À„µ√µΩΩ«∂»£ø£ø£ø£ø£ø£ø£ø£ø£ø£ø
//  } 
// 
//  pLabeNum_gk3->runAction(zhuandong);

}


void Bonus_gk3::GuessRight()
{
  

  bonusJiangLiNow_gk3++;
  int conisnum=jianglishuzu_gk3[bonusJiangLiNow_gk3]*yajinnum*bonusnum;
  backqian=conisnum;
  CCDelayTime *delay=CCDelayTime::create(0.0f);
  CCDelayTime *bacdelay=CCDelayTime::create(3.0f);
  CCActionInterval *caidaxiao;  
      if (bonusJiangLiNow_gk3<9)
      {
          kuang->setPosition(ccp(getWinSize().width/2,getWinSize().height/10+(bonusJiangLiNow_gk3+1)*hanggao));
          CCSprite * conis=(CCSprite *)(kuang->getParent()->getChildByTag(2000+bonusJiangLiNow_gk3));
          conis->setTexture(CCTextureCache::sharedTextureCache()->textureForKey("Bonus/conis_get_gk3.png"));
          CCLabelTTF *pLabelwin=(CCLabelTTF *)(kuang->getParent()->getChildByTag(3000+bonusJiangLiNow_gk3));
          pLabelwin->setColor(ccc3(24, 56, 69));//ª“…´£®120,120,120£©,¬Ã…´(24, 56, 69)

          caidaxiao=CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setbonusqian)),delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setmenuenable)),NULL);
      } 
      else 
      {
          //–Ë“™∑≈∏ˆµ√¥ÛΩ±µƒ“Ù¿÷£ø 
          CCSprite * conis=(CCSprite *)(kuang->getParent()->getChildByTag(2000+bonusJiangLiNow_gk3));
          conis->setTexture(CCTextureCache::sharedTextureCache()->textureForKey("Bonus/conis_get_gk3.png"));
          CCLabelTTF *pLabelwin=(CCLabelTTF *)(kuang->getParent()->getChildByTag(3000+bonusJiangLiNow_gk3));
          pLabelwin->setColor(ccc3(24, 56, 69));//ª“…´£®120,120,120£©,¬Ã…´(24, 56, 69)     
          caidaxiao=CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::backtomain)),NULL);
      }
      //µ⁄∂˛¥Œ◊™‘ı√¥º∆À„µ√µΩΩ«∂»£ø£ø£ø£ø£ø£ø£ø£ø£ø£ø

  pLabeNum_gk3->runAction(caidaxiao);

}

void Bonus_gk3::guesswrong()
{

    CCDelayTime *delay=CCDelayTime::create(0.0f);
    CCDelayTime *bacdelay=CCDelayTime::create(2.0f);
    CCActionInterval *caidaxiao;
//     if (bonusnum)
//     {
// 
//         bonusnum--;
//         if (bonusnum)
//         {
//             caidaxiao=CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setbonusqian)),delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setmenuenable)),NULL);
//         } 
//         else
//         {
//             backqian=0;
//             caidaxiao=CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::backtomain)),NULL);
//         }
//         //µ⁄∂˛¥Œ◊™‘ı√¥º∆À„µ√µΩΩ«∂»£ø£ø£ø£ø£ø£ø£ø£ø£ø£ø
//     } 
        //backqian=0;
        caidaxiao=CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus_gk3::backtomain)),NULL);
    pLabeNum_gk3->runAction(caidaxiao);
}

CCSize Bonus_gk3::getWinSize(){
    return	CCDirector::sharedDirector()->getVisibleSize();
}
CCPoint Bonus_gk3::getWinOrigin(){
    return CCDirector::sharedDirector()->getVisibleOrigin();
}
CCPoint Bonus_gk3::getWinCenter(){
    return	ccp(getWinSize().width/2+getWinOrigin().x,getWinSize().height/2+getWinOrigin().y);
}

Bonus_gk3::Bonus_gk3()
{
}
Bonus_gk3::~Bonus_gk3()
{

}

//bonus gk3 end
//bonus gk4
//选?择?相¨¤同ª?数ºy
//level1 high wins 4;
//        50,75,100,125,150,175 :2ge
//level2 hign wins 4;200-325:2ge ....etc
CCScene* Bonus_gk4::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    Bonus_gk2 *layer = Bonus_gk2::create();
    
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool Bonus_gk4::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    oldchangjing=changjing;
    changjing=41;
    //music
    Playyinxiao::play_ruchangbonus();
    zhuansu=0.01;
    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();
    
    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.
    
    // add a "close" icon to exit the progress. it's an autorelease object
    
    CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
                                                          "Bonus/CloseNormal.png",
                                                          "Bonus/CloseNormal.png",
                                                          this,
                                                          menu_selector(Bonus_gk2::menuCloseCallback));
    
    pCloseItem->setPosition(ccp(origin.x + pCloseItem->getContentSize().width/2 ,
                                origin.y + visibleSize.height-pCloseItem->getContentSize().height/2));
    
    //     CCMenuItemImage *pStartItem = CCMenuItemImage::create(
    //         "Bonus/button_normal.png",
    //         "Bonus/button_selected.png",
    //         this,
    //         menu_selector(Bonus_gk2::menuStartCallback));
    //     pStartItem->setAnchorPoint(ccp(1,0));
    //     //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
    //     pStartItem->setPosition(ccp(visibleSize.width-pStartItem->getContentSize().width/2, pStartItem->getContentSize().height/2));
    //    // pStartItem->setAnchorPoint(ccp(0.5,0.5));
    //     CCLabelTTF *pLabelstart = CCLabelTTF::create("start", "Arial", 38/bigsmall_factor);
    //     pLabelstart->setPosition(ccp(pStartItem->getContentSize().width/2, pStartItem->getContentSize().height/2));
    //
    //     pStartItem->addChild(pLabelstart);
    
    
    // create menu, it's an autorelease object
    //pMenu = CCMenu::create(pCloseItem, NULL);
    // pMenu->setPosition(CCPointZero);
    //this->addChild(pMenu, 1);
    
    /////////////////////////////
    // 3. add your codes below...
    
    // add a label shows "Hello World"
    // create and initialize a label
    
    
    
    // add "HelloWorld" splash screen"
    CCSprite* pSpritebj = CCSprite::create("HelloWorld.png");
    
    
    //pSprite->setRotation(90);
    // position the sprite on the center of the screen
    pSpritebj->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
    float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
    pSpritebj->setScaleY(shanglashen);//背À3景¡ã图ª?拉¤-伸¦¨¬
    // add the sprite as a child to this layer
    this->addChild(pSpritebj,0);
    //CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
    //     CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
    //     //CC_BREAK_IF(!pbg);
    //     float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
    //     pbg->setScaleY(shanglashen);//背À3景¡ã图ª?拉¤-伸¦¨¬
    //     pbg->setAnchorPoint(ccp(0.5,0.5));
    //     pbg->setPosition(getWinCenter());
    //     this->addChild(pbg);
    pSpritezhenhuan = CCSprite::create("Bonus/bonus_toubiao.png");
    pSpritezhenhuan->setPosition(ccp(visibleSize.width/2,visibleSize.height));
    pSpritezhenhuan->setAnchorPoint(ccp(0.5,1));
    this->addChild(pSpritezhenhuan, 1);
    const char *pLabelwinStr = ((CCString*)(loacalstrings->objectForKey("win")))->m_sString.c_str();
    CCLabelTTF* pLabelwin = CCLabelTTF::create(pLabelwinStr, "Arial",40);
    pLabelwin->setColor(ccc3(24, 56, 69));
    pLabelwin->setAnchorPoint(ccp(0.5,0.5));
    pLabelwin->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
                               pSpritezhenhuan->getTextureRect().getMaxY()*0.7));
    pSpritezhenhuan->addChild(pLabelwin, 1);
    //     CCLabelTTF *pLabelwin = CCLabelTTF::create("win   ", "Arial", 34/bigsmall_factor);
    //     pLabelwin->setPosition(ccp(pSpritetoubiao->getTextureRect().getMidX()*9/10,
    //         pSpritetoubiao->getTextureRect().getMidY()));
    
    // add the label as a child to this layer
    
    //pSpritetoubiao->addChild(pLabelwin, 1);
    
    
    
    //     CCLabelTTF *pLabelwin = CCLabelTTF::create("win", "Arial", 40/bigsmall_factor);
    //     pLabelwin->setColor(ccc3(0, 0, 0));
    //     // position the label on the center of the screen
    //     // pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
    //     //                         origin.y + visibleSize.height - pLabel->getContentSize().height));
    //     pLabelwin->setAnchorPoint(ccp(0.5,0.2));
    //     pLabelwin->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
    //      pSpritezhenhuan->getTextureRect().getMaxY()/2));
    
    pLabel = CCLabelTTF::create("0", "Arial", 45/bigsmall_factor);
    pLabel->setAnchorPoint(ccp(0.5,0.5));
    pLabel->setColor(ccc3(24, 56, 69));
    // position the label on the center of the screen
    // pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
    //                         origin.y + visibleSize.height - pLabel->getContentSize().height));
    pLabel->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX()*1.03,
                            pSpritezhenhuan->getTextureRect().getMidY()));
    
    //pSpritezhenhuan->addChild(pLabelwin, 1);
    pSpritezhenhuan->addChild(pLabel, 1);
    //提¬¨¢示º?语®?
    
    const char *pLabeltabStr = ((CCString*)(loacalstrings->objectForKey("tapthesymbols")))->m_sString.c_str();
    CCLabelTTF *pLabeltab = CCLabelTTF::create(pLabeltabStr, "Arial", 40/bigsmall_factor);
    const char *pLabelfindStr = ((CCString*)(loacalstrings->objectForKey("find")))->m_sString.c_str();
    CCLabelTTF *pLabelfind = CCLabelTTF::create(pLabelfindStr, "Arial", 40/bigsmall_factor);
    int cardsize=getWinSize().width/4;
    int zigao=visibleSize.height-3*cardsize+cardsize/2-pSpritezhenhuan->getContentSize().height;
    pLabeltab->setPosition(ccp(visibleSize.width/2,3*cardsize+cardsize/2+zigao/2));
    pLabelfind->setPosition(ccp(visibleSize.width/2,3*cardsize+cardsize/2+zigao/3));
    //     pLabeltab->setPosition(ccp(visibleSize.width/2,visibleSize.height*7/10));
    //     pLabelfind->setPosition(ccp(visibleSize.width/2,visibleSize.height*5/8));
    this->addChild(pLabeltab, 3);
    this->addChild(pLabelfind, 3);
    pMenu = CCMenu::create();
    pMenu->addChild(pCloseItem);
    //int cardsize=getWinSize().width/4;
    
    for (int i=0;i<16;i++)
    {
        CardIsOpen[i]=0;
    }
    
    //int num[16];1-8
    for (int i=0;i<16;i++)
    {
        num[i]=i%8+1;
    }
    
    for (int i=0;i<16;i++)
    {
        int r=getrandomBonusID(0,15);
        CCLOG("r=%d",r);
        std::swap(num[i],num[r]);
    }
    
    yajinnum=backqian;
    backqian=0;
    for (int i=0;i<16;i++)
    {
        //透ª?明¡Â按ã¡ä钮£¤
        CCSprite *sprite = CCSprite::create("Bonus/160_160.png");
        CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite, this, menu_selector(Bonus_gk4::menuStartCallback));
        menuItem->setPosition(ccp((i%4)*cardsize+cardsize/2,i/4*cardsize+cardsize/2));
        menuItem->setTag(200+i);
        pMenu->addChild(menuItem);
        //CCSprite *spritecard = CCSprite::create("bonus/huan-160.png");
        CCSprite *spritecardin = CCSprite::create("Bonus/huan-160.png");
        
        CCSprite *spritecardout= CCSprite::create(CCString::createWithFormat("Bonus/gk4/qiqiu_%d.png", i)->getCString());
        //旋y转Áa按ã¡ä钮£¤
        // CCLabelTTF *pLabelcai = CCLabelTTF::create(CCString::createWithFormat("%d", i)->getCString(), "Arial", 40/bigsmall_factor);
        // pLabelcai->setPosition(ccp(80,80));
        //spritecardout->addChild(pLabelcai);
        CardSprite *card=CardSprite::createWithTexture(spritecardin->getTexture(),spritecardout->getTexture(),0.01,num[i]);//CCString::createWithFormat("bonus/%d.png", result)->getCString()
        card->setPosition(ccp((i%4)*cardsize+cardsize/2,i/4*cardsize+cardsize/2));
        card->setTag(300+i);
        this->addChild(card,3);
        
    }
    
    pMenu->setPosition(CCPointZero);
    this->addChild(pMenu);
    
    return true;
}

int Bonus_gk4::getrandomBonusID(int start,int end)
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

void Bonus_gk4::menuCloseCallback(CCObject* pSender)
{
    /* ccdirector::shareddirector()->end();
     
     #if (cc_target_platform == cc_platform_ios)
     exit(0);
     #endif*/
    
    //backqian=-100;
    
    Playyinxiao::stopeffect();
    Playyinxiao::play_anjian();
    CCDirector::sharedDirector()->popScene();
    
    //CCScene *pScene = logo::scene();
    
    // run
    //CCDirector::sharedDirector()->pushScene(pScene);
    //CCDirector::sharedDirector()->replaceScene(pScene);
    /////////////////////////////
    /*
     CCSprite *pSprite1 =(CCSprite *)this->getChildByTag(1);
     
     CCWaves *waves=CCWaves::create(4, 20, true, true, ccg(16,12),5.0f);
     
     (CCNode*)pSprite1->runAction((CCActionInterval*)waves);*///错ä¨ª误¨®
    /////////////////////////////////
    
}



void Bonus_gk4::setmenuenable()
{
    pMenu->setEnabled(true);
    CCLOG("pMenu is enabled");
    
}
void Bonus_gk4::setbonusqian()
{
    Playyinxiao::stopeffect();
    Playyinxiao::play_dejiangbonus();
    char tishistring[10] = {0};
    // tishistring=tishi.data();
    //tishistring=tishi.c_str();
    sprintf(tishistring, "%d",backqian/100);
    pLabel->setString(tishistring);
    CCActionInterval *fangda2 =CCScaleBy::create(0.5,1.4f);
    CCActionInterval *fangda_2 =CCSequence::create(fangda2,fangda2->reverse(),fangda2,fangda2->reverse(),NULL);
    pLabel->runAction(fangda_2);
    
    int tempjiange=0;
    
    for (int i=0;i<16;i++)
    {
        CCDelayTime *bacdelay=CCDelayTime::create(2.0f+tempjiange*0.15);
        if (!CardIsOpen[i])
        {
            tempjiange++;
            CardSprite *card=(CardSprite *)(pSpritezhenhuan->getParent()->getChildByTag(300+i));
            
            CCActionInterval *Opencardaction=CCSequence::create(bacdelay,CCCallFuncND::create(this,callfuncND_selector(Bonus_gk4::opencard),(void *)i),NULL);
            CCDelayTime *bacdelay2=CCDelayTime::create(2.0f);
            CCActionInterval *quanfankai;
            
            quanfankai=CCSequence::create(Opencardaction,bacdelay2,NULL);
            card->runAction(quanfankai);
            
        }
    }
}
// void Bonus_gk2::setzhuanpanfuyuan()
// {
// int jiaodu=360-((int)pSpritezhuanlun->getRotation())%360;
// CCRotateBy *fuyuanzhuan=CCRotateBy::create(0.5,jiaodu);
// pSpritezhuanlun->runAction(fuyuanzhuan);
// }

void Bonus_gk4::backtomain()
{
    CCDirector::sharedDirector()->popScene();
}

void Bonus_gk4::opencard(CCNode* sender, void* data)
{
    
    Playyinxiao::play_bonus_gk4_pa();
    int cardID=(long)data;
    CardSprite* card=(CardSprite *)this->getChildByTag(300+cardID);
    card->openCard();
}

void Bonus_gk4::cardfangdaandsuoxiao(CCNode* sender, void* data)
{
    CCScaleBy *fangda=CCScaleBy::create(0.5,1.2);
    CCActionInterval * FangdaAndSuoxiao = CCSequence::create(fangda,fangda->reverse(),NULL);//CCEaseExponentialInOut,CCEaseSineInOut
    int cardID=(long)data;
    CardSprite* card=(CardSprite *)this->getChildByTag(300+cardID);
    card->setZOrder(999);
    card->runAction(CCRepeat::create(FangdaAndSuoxiao,2));
}

void Bonus_gk4::menuStartCallback(CCObject* pSender)
{
    Playyinxiao::play_bonus_gk4_pa();
    CCMenuItemSprite *itemmenu=(CCMenuItemSprite *)pSender;
    int cardID=itemmenu->getTag()-200;
    if (!CardIsOpen[cardID])
    {
        
        //playeffect opencard
        pMenu->setEnabled(false);
        itemmenu->setEnabled(false);
        CardIsOpen[cardID]=num[cardID];
        CCActionInterval *Opencardaction=CCSequence::create(CCCallFuncND::create(this,callfuncND_selector(Bonus_gk4::opencard),(void *)cardID),NULL);
        
        int OpenNum=num[cardID];
        for (int i=0;i<16;i++)
        {
            if (i!=cardID)
            {
                if (CardIsOpen[i]==num[cardID])
                {//find 2 of a kind
                    //playeffect reward
                    backqian+=num[cardID]*100*yajinnum*bonusnum;
                    //         CCScaleBy *fangda=CCScaleBy::create(0.5,1.2);
                    //         CCActionInterval * FangdaAndSuoxiao = CCSequence::create(fangda,fangda->reverse(),NULL);//CCEaseExponentialInOut,CCEaseSineInOut
                    CCActionInterval *cardfangdaandsuoxiaoaction=CCSpawn::create(CCCallFuncND::create(this,callfuncND_selector(Bonus_gk4::cardfangdaandsuoxiao),(void *)cardID),CCCallFuncND::create(this,callfuncND_selector(Bonus_gk4::cardfangdaandsuoxiao),(void *)i),NULL);
                    CCDelayTime *delay=CCDelayTime::create(1.0f);
                    CCDelayTime *bacdelay=CCDelayTime::create(6.0f);
                    CCActionInterval *fangdasuoxiaoAndBack;
                    //         if (bonusnum)
                    //         {
                    //             bonusnum--;
                    //             if (bonusnum)
                    //             {//多¨¤次ä?
                    //                 fangdasuoxiaoAndBack=CCSequence::create(Opencardaction,delay,cardfangdaandsuoxiaoaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setbonusqian)),delay,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setmenuenable)),NULL);
                    //             }
                    //             else
                    //             {//一°?次ä?
                    //                 fangdasuoxiaoAndBack=CCSequence::create(Opencardaction,delay,cardfangdaandsuoxiaoaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::backtomain)),NULL);
                    //             }
                    //             //第Ì¨²二t次ä?转Áa怎?么¡ä计?算?得Ì?到Ì?角?度¨¨？ê?？ê?？ê?？ê?？ê?？ê?？ê?？ê?？ê?？ê?
                    //         }
                    fangdasuoxiaoAndBack=CCSequence::create(Opencardaction,delay,cardfangdaandsuoxiaoaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk4::setbonusqian)),bacdelay,CCCallFunc::create(this, callfunc_selector(Bonus_gk4::backtomain)),NULL);
                    this->runAction(fangdasuoxiaoAndBack);
                    //break;
                    return;
                }
                //          else if(i==15&&CardIsOpen[i]!=num[cardID])
                //          {
                //          this->runAction(CCSequence::create(Opencardaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk2::setmenuenable)),NULL));
                //          break;
                //           }
                
            }
        }
        this->runAction(CCSequence::create(Opencardaction,CCCallFunc::create(this, callfunc_selector(Bonus_gk4::setmenuenable)),NULL));
        CCLOG("opennum=%d",OpenNum);
        
    }
    
    
    
}
CCSize Bonus_gk4::getWinSize(){
    return	CCDirector::sharedDirector()->getVisibleSize();
}
CCPoint Bonus_gk4::getWinOrigin(){
    return CCDirector::sharedDirector()->getVisibleOrigin();
}
CCPoint Bonus_gk4::getWinCenter(){
    return	ccp(getWinSize().width/2+getWinOrigin().x,getWinSize().height/2+getWinOrigin().y);
}

Bonus_gk4::Bonus_gk4()
{
    
}
Bonus_gk4::~Bonus_gk4()
{
    
}

//bonus gk4 end

//Bonus tips
//‘Ÿ“ª¥Œ◊™
BonusTishiDialogLayer::BonusTishiDialogLayer(void)
{
}
BonusTishiDialogLayer::~BonusTishiDialogLayer(void)
{
}
bool BonusTishiDialogLayer::init()
{
	bool bRet = false;

	do {
		CC_BREAK_IF(!BaseLayer::init());
        CCTextureCache::sharedTextureCache()->addImage("zhegaibj.png");
         CCTextureCache::sharedTextureCache()->addImage("gmme/congratulations.png");
         /*
        CCTextureCache::sharedTextureCache()->addImage("gmme/btn_home_up.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/btn_home_down.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/btn_resume_down.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/btn_resume_up.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/btn_retry_down.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/btn_rety_up.png");
        */

		CC_BREAK_IF(!this->setUpdateView());		

		bRet = true;
	} while (0);

	return bRet;
}


bool BonusTishiDialogLayer::setUpdateView()
{
	bool isRet=false;
	do 
	{

		// CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
		
        //CC_BREAK_IF(!pbg);
		//pbg->setAnchorPoint(ccp(0.5,0.5));
		//pbg->setPosition(getWinCenter());
		//this->addChild(pbg);
        CCSprite* shengjipic= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/congratulations.png"));
        shengjipic->setPosition(getWinCenter());
        this->addChild(shengjipic);
        const char *pLabelStrtishi = ((CCString*)(loacalstrings->objectForKey("congratulations")))->m_sString.c_str();
        CCLabelTTF *lable_congratutishi=CCLabelTTF::create(pLabelStrtishi,"Arial",35/bigsmall_factor);
        lable_congratutishi->setAnchorPoint(ccp(0.5,0.6));
        lable_congratutishi->setPosition(ccp(shengjipic->getContentSize().width/2,shengjipic->getContentSize().height*0.75));
        shengjipic->addChild(lable_congratutishi);
        lable_congratutishi->setColor(ccc3(26,69,74));
        //std::string tishi("you get 1 time bonus game! X ");
        std::string tishi = ((CCString*)(loacalstrings->objectForKey("bonus")))->m_sString.c_str();
        std::string tishi1;

        char buf[10]= {0};
        sprintf(buf, "%d", bonusnum);
        tishi1= buf;
//         std::string tishi2;
//         if (bonusnum==1)
//         {
// 
//             tishi2=" time bonus game!";
//         } 
//         else
//         {
//             tishi2=" times bonus game!";
//         }
// 
//        // std::string tishi2(" times bonus game!");
         tishi+=tishi1;
//         tishi+=tishi2;
        char tishistring[50] = {0};
        // tishistring=tishi.data();
        //tishistring=tishi.c_str();
        sprintf(tishistring, "%s",tishi.c_str());
        // pLabetishi = CCLabelTTF::create(jingyanstring, "Arial", 40/bigsmall_factor);
        //CCLabelTTF* pLabetishi = CCLabelTTF::create("Hello World", "Arial",24);
        CCLabelTTF *pLabetishi=CCLabelTTF::create(tishistring,"Arial",30/bigsmall_factor);
        // position the label on the center of the screen
        pLabetishi->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()/3));
//         CCLabelBMFont* pLabetishiCon=CCLabelBMFont::create("CONGRATULATIONS","diy_38_cuitihei.fnt");
//         pLabetishiCon->setScale(0.9);
//         pLabetishiCon->setAnchorPoint(ccp(0.5,1.4));
//         // position the label on the center of the screen
//         pLabetishiCon->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()));
// 
//         // add the label as a child to this layer
//         shengjipic->addChild(pLabetishiCon);
        // add the label as a child to this layer
        shengjipic->addChild(pLabetishi);
        //CCDelayTime *delai2=CCDelayTime::create(1.5f);
       // CCFadeOut *yincang=CCFadeOut::create(1.5f);
       // CCActionInterval *tishiaction=CCSequence::create(delai2,yincang,CCCallFunc::create(this,callfunc_selector(BonusTishiDialogLayer::menuCloseCallback)));
        //this->runAction(tishiaction);
        //this->scheduleOnce(schedule_selector(BonusTishiDialogLayer::menuCloseCallback),2);

		isRet=true;
	} while (0);
	return isRet;

}

void BonusTishiDialogLayer::onEnter()
{
	BaseLayer::onEnter();
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
		this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝  
		-128, //”≈œ»º∂  
		true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ  
}

void BonusTishiDialogLayer::onExit()
{
	BaseLayer::onExit();
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool BonusTishiDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

	//m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

	return true;
}

void BonusTishiDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	//if (m_bTouchedMenu) {
		//m_pMenu->ccTouchMoved(pTouch, pEvent);
	//}
}

void BonusTishiDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	//if (m_bTouchedMenu) {
		//m_pMenu->ccTouchEnded(pTouch, pEvent);
		//m_bTouchedMenu = false;
	//}
}

void BonusTishiDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	/*if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}*/
}


void BonusTishiDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    //CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);
    Playyinxiao::play_anjian();

    this->removeFromParentAndCleanup(true);
}