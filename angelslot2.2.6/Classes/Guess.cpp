#include "Guess.h"
#include "ResouceDefine.h"
#include "CardSprite.h"
#include "playyinxiao.h"
#import "KTPlayC.h"
USING_NS_CC;

#define redtag 1
#define blacktag 2
#define redfangtag 3
#define redtaotag 4
#define blackcaotag 5
#define blacktaotag 6
 
CCScene* Guess::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    Guess *layer = Guess::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool Guess::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    Playyinxiao::play_ruchangguess();
    KTPlayC::setNotificationEnabled(false);//ktplay
    oldchangjing=changjing;
    changjing=10;
    //Playyinxiao::playmusic();
    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
    CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
        "guess/CloseNormal.png",
        "guess/CloseNormal.png",
        this,
        menu_selector(Guess::menuCloseCallback));
        pCloseItem->setAnchorPoint(ccp(0,1));
    pCloseItem->setPosition(ccp(origin.x + 0 ,
        origin.y + visibleSize.height));

//     CCMenuItemImage *pStartItem = CCMenuItemImage::create(
//         "guess/button_normal.png",
//         "guess/button_selected.png",
//         this,
//         menu_selector(Guess::menuStartCallback));
//     pStartItem->setAnchorPoint(ccp(1,0));
//     //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
//     pStartItem->setPosition(ccp(visibleSize.width-pStartItem->getContentSize().width/2, pStartItem->getContentSize().height/2));

    
    
    CCMenuItemImage *pRedItem = CCMenuItemImage::create(
        "guess/red.png",
        "guess/red-selected.png",
        this,
        menu_selector(Guess::menuStartCallback));
        pRedItem->setTag(redtag);
    pRedItem->setAnchorPoint(ccp(0.5,0.4));
    //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
    pRedItem->setPosition(ccp(visibleSize.width/4, visibleSize.height/4));

    CCSprite *jiantou_pRedItem=CCSprite::create("jiantou.png");
    jiantou_pRedItem->setAnchorPoint(ccp(0.5,0));
    jiantou_pRedItem->setPosition(ccp(pRedItem->getPositionX(),pRedItem->getPositionY()+pRedItem->getContentSize().height*0.5));
    this->addChild(jiantou_pRedItem,2);
    
    CCMenuItemImage *pBlackItem = CCMenuItemImage::create(
        "guess/black.png",
        "guess/black-selected.png",
        this,
        menu_selector(Guess::menuStartCallback));
    pBlackItem->setTag(blacktag);
    pBlackItem->setAnchorPoint(ccp(0.5,0.4));
    //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
    pBlackItem->setPosition(ccp(visibleSize.width*3/4, visibleSize.height/4));

    CCSprite *jiantou_pBlackItem=CCSprite::create("jiantou.png");
    jiantou_pBlackItem->setAnchorPoint(ccp(0.5,0));
    jiantou_pBlackItem->setPosition(ccp(pBlackItem->getPositionX(),pBlackItem->getPositionY()+pBlackItem->getContentSize().height*0.5));
    this->addChild(jiantou_pBlackItem,2);
    
    CCMenuItemImage *pRedfangItem = CCMenuItemImage::create(
        "guess/redfang.png",
        "guess/redfang-selected.png",
        this,
        menu_selector(Guess::menuStartCallback));
    pRedfangItem->setTag(redfangtag);
    pRedfangItem->setAnchorPoint(ccp(0.5,0.3));
    //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
    pRedfangItem->setPosition(ccp(visibleSize.width/8, visibleSize.height/20));
    
    
    CCSprite *jiantou_pRedfangItem=CCSprite::create("jiantou.png");
    jiantou_pRedfangItem->setAnchorPoint(ccp(0.5,0));
    jiantou_pRedfangItem->setPosition(ccp(pRedfangItem->getPositionX(),pRedfangItem->getPositionY()+pRedfangItem->getContentSize().height*0.6));
    this->addChild(jiantou_pRedfangItem,2);
    
    CCMenuItemImage *pRedlingItem = CCMenuItemImage::create(
        "guess/redling.png",
        "guess/redling-selected.png",
        this,
        menu_selector(Guess::menuStartCallback));
    pRedlingItem->setTag(redtaotag);
    pRedlingItem->setAnchorPoint(ccp(0.5,0.3));
    //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
    pRedlingItem->setPosition(ccp(visibleSize.width*3/8, visibleSize.height/20));
    
    
    CCSprite *jiantou_pRedlingItem=CCSprite::create("jiantou.png");
    jiantou_pRedlingItem->setAnchorPoint(ccp(0.5,0));
    jiantou_pRedlingItem->setPosition(ccp(pRedlingItem->getPositionX(),pRedlingItem->getPositionY()+pRedlingItem->getContentSize().height*0.6));
    this->addChild(jiantou_pRedlingItem,2);
    
    CCMenuItemImage *pBlackfangItem = CCMenuItemImage::create(
        "guess/blackfang.png",
        "guess/blackfang-selected.png",
        this,
        menu_selector(Guess::menuStartCallback));
    pBlackfangItem->setTag(blackcaotag);
    pBlackfangItem->setAnchorPoint(ccp(0.5,0.3));
    //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
    pBlackfangItem->setPosition(ccp(visibleSize.width*5/8, visibleSize.height/20));

    
    CCSprite *jiantou_pBlackfangItem=CCSprite::create("jiantou.png");
    jiantou_pBlackfangItem->setAnchorPoint(ccp(0.5,0));
    jiantou_pBlackfangItem->setPosition(ccp(pBlackfangItem->getPositionX(),pBlackfangItem->getPositionY()+pBlackfangItem->getContentSize().height*0.6));
    this->addChild(jiantou_pBlackfangItem,2);
    
    CCMenuItemImage *pBlacklingItem = CCMenuItemImage::create(
        "guess/blackling.png",
        "guess/blackling-selected.png",
        this,
        menu_selector(Guess::menuStartCallback));
    pBlacklingItem->setTag(blacktaotag);
    pBlacklingItem->setAnchorPoint(ccp(0.5,0.3));
 
    //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
    pBlacklingItem->setPosition(ccp(visibleSize.width*7/8, visibleSize.height/20));

    
    CCSprite *jiantou_pBlacklingItem=CCSprite::create("jiantou.png");
    jiantou_pBlacklingItem->setAnchorPoint(ccp(0.5,0));
    jiantou_pBlacklingItem->setPosition(ccp(pBlacklingItem->getPositionX(),pBlacklingItem->getPositionY()+pBlacklingItem->getContentSize().height*0.6));
    this->addChild(jiantou_pBlacklingItem,2);
    
    CCActionInterval* actionMoveto1= CCMoveBy::create(0.4, ccp(0,15));
    CCActionInterval* actionMoveto2= CCMoveBy::create(0.4, ccp(0,15));
    CCActionInterval* actionMoveto3= CCMoveBy::create(0.4, ccp(0,15));
    CCActionInterval* actionMoveto4= CCMoveBy::create(0.4, ccp(0,15));
    CCActionInterval* actionMoveto5= CCMoveBy::create(0.4, ccp(0,15));
    CCActionInterval* actionMoveto6= CCMoveBy::create(0.4, ccp(0,15));
    
    CCActionInterval *shangxia1 =CCRepeatForever::create(CCSequence::create(actionMoveto1,actionMoveto1->reverse(),NULL));
     CCActionInterval *shangxia2 =CCRepeatForever::create(CCSequence::create(actionMoveto2,actionMoveto1->reverse(),NULL));
     CCActionInterval *shangxia3 =CCRepeatForever::create(CCSequence::create(actionMoveto3,actionMoveto1->reverse(),NULL));
     CCActionInterval *shangxia4 =CCRepeatForever::create(CCSequence::create(actionMoveto4,actionMoveto1->reverse(),NULL));
     CCActionInterval *shangxia5 =CCRepeatForever::create(CCSequence::create(actionMoveto5,actionMoveto1->reverse(),NULL));
     CCActionInterval *shangxia6 =CCRepeatForever::create(CCSequence::create(actionMoveto6,actionMoveto1->reverse(),NULL));
    jiantou_pRedItem->runAction(shangxia1);
    jiantou_pBlackItem->runAction(shangxia2);
    jiantou_pRedfangItem->runAction(shangxia3);
    jiantou_pRedlingItem->runAction(shangxia4);
    jiantou_pBlackfangItem->runAction(shangxia5);
    jiantou_pBlacklingItem->runAction(shangxia6);
    
    
    // create menu, it's an autorelease object
    pMenu = CCMenu::create(pCloseItem,pRedItem,pRedfangItem,pRedlingItem,pBlackItem,pBlackfangItem,pBlacklingItem, NULL);
    pMenu->setPosition(CCPointZero);
    this->addChild(pMenu, 10);
  
    /////////////////////////////
    // 3. add your codes below...

    // add a label shows "Hello World"
    // create and initialize a label
    
 

    // add "HelloWorld" splash screen"
    CCSprite* pSpritebj = CCSprite::create("guess/guessbj.png");
    
    
    //pSprite->setRotation(90); 
    // position the sprite on the center of the screen
    pSpritebj->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
    float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
    pSpritebj->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
    // add the sprite as a child to this layer
    this->addChild(pSpritebj,0);
    CCSprite* pSpritetoubiao = CCSprite::create("guess/guess_toubiao.png");
    pSpritetoubiao->setPosition(ccp(visibleSize.width/2,visibleSize.height-pSpritetoubiao->getTextureRect().getMidY()));
    this->addChild(pSpritetoubiao, 1);

//     CCSprite* pSpritezhenhuan = CCSprite::create("Bonus/tuohan_300_166.png");
//     pSpritezhenhuan->setPosition(ccp(visibleSize.width/2,visibleSize.height));
//     pSpritezhenhuan->setAnchorPoint(ccp(0.5,0.75));
//     this->addChild(pSpritezhenhuan, 3);

// 
//     CCLabelTTF *pLabelwin = CCLabelTTF::create("win", "Arial", 40/bigsmall_factor);
//     pLabelwin->setColor(ccc3(0, 0, 0));
//     pLabelwin->setAnchorPoint(ccp(0.5,0.2));
//     pLabelwin->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
//         pSpritezhenhuan->getTextureRect().getMaxY()/2));
    const char *pLabelwinStr = ((CCString*)(loacalstrings->objectForKey("win")))->m_sString.c_str();
    CCLabelTTF* pLabelwin = CCLabelTTF::create(pLabelwinStr, "Arial",40);
    pLabelwin->setColor(ccc3(24, 56, 69));
     pLabelwin->setAnchorPoint(ccp(0.5,-1));
    pLabelwin->setPosition(ccp(pSpritetoubiao->getTextureRect().getMidX(),
                            pSpritetoubiao->getTextureRect().getMaxY()/2));
     pSpritetoubiao->addChild(pLabelwin, 1);
    
        char tishistring[10] = {0};      
        sprintf(tishistring, "%d",backqian/100);        
     pLabel = CCLabelTTF::create(tishistring, "Arial", 40/bigsmall_factor);

    // position the label on the center of the screen
    // pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
    //                         origin.y + visibleSize.height - pLabel->getContentSize().height));

//      pLabel->setPosition(ccp(pSpritezhenhuan->getTextureRect().getMidX(),
//      pSpritezhenhuan->getTextureRect().getMaxY()/3));
    pLabel->setAnchorPoint(ccp(0.5,1.1));
    pLabel->setPosition(ccp(pSpritetoubiao->getTextureRect().getMidX(),
    pSpritetoubiao->getTextureRect().getMaxY()/2));

    // add the label as a child to this layer
    pLabel->setAnchorPoint(ccp(0.5,0));
    pLabel->setColor(ccc3(24, 56, 69));
   // pSpritetoubiao->addChild(pLabel, 1);
    //pSpritezhenhuan->addChild(pLabelwin, 1);
    pSpritetoubiao->addChild(pLabel, 1);
    /*

   
    CCSprite* pSprite1 = CCSprite::create("Icon.png");
    pSprite1->setTag(1);
    pSprite1->setPosition(ccp(visibleSize.width/2 , visibleSize.height/2 ));
   
    this->addChild(pSprite1,2000);
 */
 //pai
    //¥¥Ω®∑≠≈∆sprite, ≤Œ ˝£∫ø®∆¨¿Ô√ÊµƒÕº£¨ø®∆¨µƒ∑‚√Ê£¨∑≠≈∆À˘ª® ±º‰
//     int result = CCRANDOM_0_1()*2+1;//52+
//     if (result>=3)//53
//     {
//         do 
//         {
//             result =CCRANDOM_0_1()*2+1;//+1
//         } while (result>=CCRANDOM_0_1()*2+1);
// 
//     }
    //CCLOG("result:%d",result);
    cardArray=CCArray::create();
    cardArray->retain();
    for (int i=0;i<5;i++)
    {
      int result=getrandomcardID();
      CardSprite *card=CardSprite::create( "guess/bei.png",CCString::createWithFormat("guess/%d.png", result)->getCString(), 0.5);
      card->setScale(0.8);//0.18
      //card->setPosition(ccp(visibleSize.width/2+66*i-66*4,visibleSize.height/2+200));
      //card->setPosition(ccp(visibleSize.width/2+66*i-66*4,visibleSize.height/2+200));
      card->setPosition(ccp(visibleSize.width/2+130*i-130*2,visibleSize.height/2+250));
      cardArray->addObject(card);
      this->addChild(card);
    }
    
    int result=getrandomcardID();
    nowcard = CardSprite::create(CCString::createWithFormat("guess/%d.png", result)->getCString(), "guess/bei.png", 0.5);
    nowcard->setPosition(ccp(visibleSize.width/2, visibleSize.height/2));
    nowcard->setTag(result);
    //nowcard->setScale(0.3);
    this->addChild(nowcard);

    const char *pLabelGuessStr = ((CCString*)(loacalstrings->objectForKey("guess")))->m_sString.c_str();
    CCLabelTTF *pLabelGuess = CCLabelTTF::create(pLabelGuessStr, "Arial", 34/bigsmall_factor);
    //pLabelGuess->setAnchorPoint(ccp(0.5,0.5));
    //pLabelGuess->setColor(ccc3(255,0,0));
    pLabelGuess->setPosition(ccp(visibleSize.width/2, visibleSize.height/2));
    this->addChild(pLabelGuess,2);
    CCScaleBy *fangda=CCScaleBy::create(0.4,1.3);
    CCActionInterval * FangdaAndSuoxiao = CCSequence::create(fangda,fangda->reverse(),fangda,fangda->reverse(),NULL);
    pLabelGuess->runAction(FangdaAndSuoxiao);
    
     const char *pLabelDOUBLEStr = ((CCString*)(loacalstrings->objectForKey("DOUBLE")))->m_sString.c_str();
    CCLabelTTF *pLabeldouble1 = CCLabelTTF::create(pLabelDOUBLEStr, "Arial", 34/bigsmall_factor);
    pLabeldouble1->setAnchorPoint(ccp(0.6,1));
    pLabeldouble1->setPosition(ccp(visibleSize.width/2, visibleSize.height*3/8));
    this->addChild(pLabeldouble1);

    //std::string tishi("DOUBLE WIN $");
    std::string tishi1;
    
    char bufdou[10]= {0};
    sprintf(bufdou, "%d", backqian/100*2);
    tishi1= bufdou;
    // tishi+=tishi1;
    char tishidoustring[15] = {0};
    sprintf(tishidoustring, "%s",tishi1.c_str());
    pLabeldouble = CCLabelTTF::create(tishidoustring, "Arial", 34/bigsmall_factor);
    pLabeldouble->setAnchorPoint(ccp(0,1));
    pLabeldouble->setPosition(ccp(visibleSize.width/2+pLabeldouble1->getContentSize().width*0.4, visibleSize.height*3/8));
    this->addChild(pLabeldouble);
    
    /*std::string tishiqua("QUADRUPLE WIN $");
    std::string tishiqua1;

    char bufqua[10]= {0};
    sprintf(bufqua, "%d", backqian/100*4);
    tishiqua1= bufqua;
    tishiqua+=tishiqua1;

    char tishiquastring[15] = {0};

    sprintf(tishiquastring, "%s",tishiqua.c_str());*/
      const char *pLabelQUADRUPLEtr = ((CCString*)(loacalstrings->objectForKey("QUADRUPLE")))->m_sString.c_str();
    CCLabelTTF *pLabelquadruple1 = CCLabelTTF::create(pLabelQUADRUPLEtr, "Arial", 34/bigsmall_factor);
    pLabelquadruple1->setAnchorPoint(ccp(0.6,1));
    pLabelquadruple1->setPosition(ccp(visibleSize.width/2, visibleSize.height*3/16));
    this->addChild(pLabelquadruple1);
    
   std::string tishiqua1;
    char bufqua[10]= {0};
    sprintf(bufqua, "%d", backqian/100*4);
    tishiqua1= bufqua;
    // tishi+=tishi1;
    char tishiquastring[15] = {0};
    sprintf(tishiquastring, "%s",tishiqua1.c_str());
    pLabelquadruple = CCLabelTTF::create(tishiquastring, "Arial", 34/bigsmall_factor);
    pLabelquadruple->setAnchorPoint(ccp(0,1));
    pLabelquadruple->setPosition(ccp(visibleSize.width/2+pLabelquadruple1->getContentSize().width*0.4, visibleSize.height*3/16));
    this->addChild(pLabelquadruple);







    num=backqian;
    //backqian=num;
    guesstag=false;

    return true;
}

int Guess::getrandomcardID()
{
    int iconscount=4;//2
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

void Guess::menuCloseCallback(CCObject* pSender)
{
   /* ccdirector::shareddirector()->end();

#if (cc_target_platform == cc_platform_ios)
    exit(0);
#endif*/

//backqian=-100;
if (guesstag==false)
{
    backqian=0;
} 
else
{
    backqian-=num;
}
 
Playyinxiao::stopeffect();
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
void Guess::newsendcard()
{
    int result=getrandomcardID();
    nowcard = CardSprite::create(CCString::createWithFormat("guess/%d.png", result)->getCString(), "guess/bei.png", 0.5);
    nowcard->setPosition(getWinCenter());
    //CCFadeIn *cardin=CCFadeIn::create(1.0f);
   // CCFadeOut *cardout=CCFadeOut::create(1.0f);
    //CCActionInterval *cardsend=CCSequence::create(cardin,cardout,NULL);
    nowcard->setVisible(false);
    //nowcard->setScale(0.3);
    nowcard->setTag(result);
    this->addChild(nowcard);

    //nowcard->runAction(cardsend);
}
void Guess::setGuessqian()
{
    char tishistring[10] = {0};
    // tishistring=tishi.data();
    //tishistring=tishi.c_str();
    if (backqian>0)
    {
     sprintf(tishistring, "%d",backqian/100);
    } 
    else
    {
    sprintf(tishistring, "%d",0);
    }
//sprintf(tishistring, "%d",backqian/100);   
 pLabel->setString(tishistring);

    //std::string tishi("DOUBLE WIN $");
    std::string tishi1;

    char bufdou[20]= {0};
    if (backqian>0)
    {
        sprintf(bufdou, "%d",backqian/100*2);
    } 
    else
    {
        sprintf(bufdou, "%d",0);
    }
    //sprintf(bufdou, "%d", backqian/100*2);
    tishi1= bufdou;
    //tishi+=tishi1;
    char tishidoustring[15] = {0};
    sprintf(tishidoustring, "%s",tishi1.c_str());
    pLabeldouble->setString(tishidoustring);

    //std::string tishiqua("QUADRUPLE WIN $");
    std::string tishiqua1;

    char bufqua[20]= {0};
    if (backqian>0)
    {
        sprintf(bufqua, "%d",backqian/100*4);
    } 
    else
    {
        sprintf(bufqua, "%d",0);
    }
    //sprintf(bufqua, "%d", backqian/100*4);
    tishiqua1= bufqua;
    //tishiqua+=tishiqua1;

    char tishiquastring[30] = {0};

    sprintf(tishiquastring, "%s",tishiqua1.c_str());
//    pLabelquadruple = CCLabelTTF::create(tishiquastring, "Arial", 34/bigsmall_factor);
    pLabelquadruple->setString(tishiquastring);





    
   
}
void Guess::guesswrong()
{
    //¥ÌŒÛ£¨play wrong effect
    Playyinxiao::stopeffect();
    Playyinxiao::stopmusic();
    
    backqian=-num;
    setGuessqian();
    nowcard->openCard();
    CCActionInterval *back=CCSequence::create(CCDelayTime::create(4),CCCallFunc::create(this, callfunc_selector(Guess::getback)),NULL);
    CCActionInterval *playwrong=CCSequence::create(CCDelayTime::create(0.5),CCCallFunc::create(this, callfunc_selector(Guess::guesswrongmusic)),NULL);
    CCActionInterval *guesswronganction=CCSpawn::create(back,playwrong,NULL);
    this->runAction(guesswronganction);
}

void Guess::guesswrongmusic()
{
Playyinxiao::play_caicuoguess();
}
void Guess::GuessRightAndcardmove(int fanNum)
{
    //’˝»∑£¨≤•∑≈’˝»∑“Ù–ß
    
    //backqian*=2;
    backqian*=fanNum;
    nowcard->openCardAndMove();//’˝»∑£¨∑≠≈∆«“…œ“∆
    //setGuessqian();
    oldcard=nowcard;
    newsendcard();
    CCObject* arrayItem;
    CCARRAY_FOREACH(cardArray,arrayItem)
    {
        CardSprite* pSpriteold = (CardSprite*)(arrayItem);
       // CCMoveBy *cardarraymove1=CCMoveBy::create(0.6,ccp(-66,0));
        CCMoveBy *cardarraymove1=CCMoveBy::create(0.6,ccp(-130,0));
        CCActionInterval *cardarraymove=CCSequence::create(CCDelayTime::create(1.5),cardarraymove1,NULL);
        pSpriteold->runAction(cardarraymove);
        }
         CCActionInterval *back=CCSequence::create(CCDelayTime::create(2.1),CCCallFunc::create(this, callfunc_selector(Guess::removelastcard)),CCCallFunc::create(this, callfunc_selector(Guess::setGuessqian)),NULL);
         CCActionInterval *playright=CCSequence::create(CCDelayTime::create(0.5),CCCallFunc::create(this, callfunc_selector(Guess::guessrightmusic)),NULL);
         CCActionInterval *guessrightanction=CCSpawn::create(back,playright,NULL);
        this->runAction(guessrightanction);
         //CardSprite *S=(CardSprite *)cardArray->lastObject();

}

void Guess::guessrightmusic()
{
 Playyinxiao::play_caiduiguess();
}
void Guess::getback()
{
  Playyinxiao::stopeffect();
  CCDirector::sharedDirector()->popScene();
}
void Guess::removelastcard()
{
    CardSprite *S=(CardSprite *)cardArray->objectAtIndex(0);
    S->removeFromParentAndCleanup(true);
    //cardArray->removeLastObject(true);
    cardArray->removeObjectAtIndex(0);
    //cardArray->insertObject(nowcard,0);
    cardArray->addObject(oldcard);

    CCActionInterval *cardin=CCFadeIn::create(0.5f);
    CCActionInterval *cardout=CCFadeOut::create(0.5f);
    CCActionInterval *cardsend=CCSequence::create(cardin,cardout,NULL);
    
    CCBlink *shanshuo=CCBlink::create(1,4);
    CCActionInterval *newcradAndReady=CCSequence::create(shanshuo,CCCallFunc::create(this, callfunc_selector(Guess::setmenuenable)),NULL);
    nowcard->setVisible(true);
    nowcard->runAction(newcradAndReady);

    
    
}

void Guess::setmenuenable()
{
    pMenu->setEnabled(true);
}
void Guess::menuStartCallback(CCObject* pSender)
{
    if (guesstag==false)
    {
        guesstag=true;
    }
  pMenu->setEnabled(false);
CCMenuItemImage* selectitem=(CCMenuItemImage*)pSender;
int nowcardtag=nowcard->getTag();
int selectitemtag=selectitem->getTag();
if (selectitemtag==redtag)
{
    //if (nowcardtag>=1&&nowcardtag<=26)
    if (nowcardtag==1||nowcardtag==2)
    {
    //win
    
    GuessRightAndcardmove(2);
    } 
    else
    {//wrong£¨back
        guesswrong();
    }
}
else if (selectitemtag==redfangtag)
{
    //if (nowcardtag>=1&&nowcardtag<=13)
    if (nowcardtag==1)
    {
        //win
       GuessRightAndcardmove(4);
    } 
    else
    {//wrong£¨back
        guesswrong();
    }
}
else if (selectitemtag==redtaotag)
{
    //if (nowcardtag>=14&&nowcardtag<=26)
    if (nowcardtag==2)
    {
        //win
        GuessRightAndcardmove(4);
    } 
    else
    {//wrong£¨back
        guesswrong();
    }
}
else if (selectitemtag==blacktag)
{
    //if (nowcardtag>=27&&nowcardtag<=52)
    if (nowcardtag==3||nowcardtag==4)
    {
        //win
        GuessRightAndcardmove(2);
    } 
    else
    {//wrong£¨back
        guesswrong();
    }
}
else if (selectitemtag==blackcaotag)
{
    //if (nowcardtag>=27&&nowcardtag<=39)
    if (nowcardtag==3)
    {
        //win
         GuessRightAndcardmove(4);
    } 
    else
    {//wrong£¨back
        guesswrong();
    }
}
else if (selectitemtag==blacktaotag)
{
    //if (nowcardtag>=40&&nowcardtag<=52)
    if (nowcardtag==4)
    {
        //win
        GuessRightAndcardmove(4);
    } 
    else
    {//wrong£¨back
        guesswrong();
    }
}
//card->openCard();//÷ª∑≠≈∆


}
CCSize Guess::getWinSize(){
    return	CCDirector::sharedDirector()->getVisibleSize();
}
CCPoint Guess::getWinOrigin(){
    return CCDirector::sharedDirector()->getVisibleOrigin();
}
CCPoint Guess::getWinCenter(){
    return	ccp(getWinSize().width/2+getWinOrigin().x,getWinSize().height/2+getWinOrigin().y);
}

Guess::Guess()
{
}
Guess::~Guess()
{
cardArray->release();
}