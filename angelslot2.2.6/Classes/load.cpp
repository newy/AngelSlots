#include "load.h"
#include "HelloWorldScene.h"
#include "mapchoose.h"
#include "playyinxiao.h"
#include "SimpleAudioEngine.h"
USING_NS_CC;


CCScene* LoadScene::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();

    // 'layer' is an autorelease object
    LoadScene *layer = LoadScene::create();

    // add layer as a child to scene
    scene->addChild(layer,1,100);
 
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool LoadScene::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }

    //CCApplication::sharedApplication()->getCurrentLanguage()
     CCDirector::sharedDirector()->setDisplayStats(false);//πÿ±’œ‘ æ
    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();
      //CCLOG("visibleSize.width=%f,visibleSize.height=%f",visibleSize.width,visibleSize.height);
    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
   /* CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
        "CloseNormal.png",
        "CloseSelected.png",
        this,
        menu_selector(LoadScene::menuCloseCallback));

    pCloseItem->setPosition(ccp(origin.x + visibleSize.width - pCloseItem->getContentSize().width/2 ,
        origin.y + pCloseItem->getContentSize().height/2));

    // create menu, it's an autorelease object
    CCMenu* pMenu = CCMenu::create(pCloseItem, NULL);
    pMenu->setPosition(CCPointZero);
    this->addChild(pMenu, 1);*/

    /////////////////////////////
    // 3. add your codes below...

    // add a label shows "Hello World"
    // create and initialize a label

//     CCLabelTTF* pLabel = CCLabelTTF::create("Hello World", "Arial",24);
// 
//     // position the label on the center of the screen
//     pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
//         origin.y + visibleSize.height - pLabel->getContentSize().height));
// 
//     // add the label as a child to this layer
//     this->addChild(pLabel, 1);

    // add "HelloWorld" splash screen"
    CCSprite* pSpritebj = CCSprite::create("HelloWorld.png");

    // position the sprite on the center of the screen
    pSpritebj->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
    float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
    pSpritebj->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
    // add the sprite as a child to this layer
    this->addChild(pSpritebj, 0);

    CCSprite* pSpriteslots = CCSprite::create("slots.png");
    pSpriteslots->setPosition(ccp(visibleSize.width/2,visibleSize.height-pSpriteslots->getContentSize().height));
    pSpriteslots->setAnchorPoint(ccp(0.5,0.5));
    this->addChild(pSpriteslots, 3);

    CCSprite* pSpritetianshi = CCSprite::create("tianshi.png");
    pSpritetianshi->setPosition(ccp(visibleSize.width/2,visibleSize.height/2));
    pSpritetianshi->setAnchorPoint(ccp(0.5,0.7));
    this->addChild(pSpritetianshi, 3);




    CCDelayTime *delay=CCDelayTime::create(2);
  
    
    CCActionInterval *jinruguanka=CCSequence::create(delay,CCCallFunc::create(this,callfunc_selector(LoadScene::guankaCallback)),NULL);
    this->runAction(jinruguanka);


    return true;
}


void LoadScene::menuCloseCallback(CCObject* pSender)//
{
 
    //CCDirector::sharedDirector()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}

void LoadScene::guankaCallback()//
{
   //CCLayerColor *layer = CCLayerColor::create(ccc4(255,0,0,255), 720, 1280);//Õ∆ºˆ π”√∆¡±Œ≤„
   /*CCLayerColor *layer=CCLayerColor::create(ccc4(255,0,0,255),640,960);
    CCDirector::sharedDirector()->setNotificationNode(layer);

    CCDirector::sharedDirector()->drawScene();*/
    CCScene *pScene=MapChoose::scene();//tem1!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    /*//
    CCScene *pScene=CCScene::create();
    CCLayer *pLayer = GalleryLayer1::create();
    pScene->addChild(pLayer);
    */
    //pScene->addChild(pLayer,18);

    CCTransitionFade *guanka= CCTransitionFade::create(2,pScene);

    CCDirector::sharedDirector()->replaceScene(guanka);
    //CCDirector::sharedDirector()->end();

}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CCScene* LoadingScene::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();

    // 'layer' is an autorelease object
    LoadingScene *layer = LoadingScene::create();

    // add layer as a child to scene
    scene->addChild(layer,1,100);
 
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool LoadingScene::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }

    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
   /* CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
        "CloseNormal.png",
        "CloseSelected.png",
        this,
        menu_selector(LoadScene::menuCloseCallback));

    pCloseItem->setPosition(ccp(origin.x + visibleSize.width - pCloseItem->getContentSize().width/2 ,
        origin.y + pCloseItem->getContentSize().height/2));

    // create menu, it's an autorelease object
    CCMenu* pMenu = CCMenu::create(pCloseItem, NULL);
    pMenu->setPosition(CCPointZero);
    this->addChild(pMenu, 1);*/

    /////////////////////////////
    // 3. add your codes below...

    // add a label shows "Hello World"
    // create and initialize a label
    CCSprite* pSprite = CCSprite::create("HelloWorld.png");

    // position the sprite on the center of the screen
    pSprite->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
    float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
    pSprite->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
    // add the sprite as a child to this layer
    this->addChild(pSprite, 0);
    
    const char *pLabelStr = ((CCString*)(loacalstrings->objectForKey("loading")))->m_sString.c_str();
    CCLabelTTF* pLabel = CCLabelTTF::create(pLabelStr, "Arial",40);
    pLabel->setColor(ccc3(24, 56, 69));
    // position the label on the center of the screen
    pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
        origin.y + visibleSize.height/3));

    // add the label as a child to this layer
    this->addChild(pLabel, 1);

    // add "HelloWorld" splash screen"
    CCSprite* pSprite_zhuan = CCSprite::create("loading_quan.png");//

    // position the sprite on the center of the screen
    pSprite_zhuan->setPosition(ccp(visibleSize.width/2 + origin.x, visibleSize.height/4 + origin.y));

    // add the sprite as a child to this layer
    this->addChild(pSprite_zhuan);
    CCRotateBy * zhuanquan=CCRotateBy::create(10,360);
//    CCMoveBy *move1=CCMoveBy::create(1,ccp(100,0));
    pSprite_zhuan->runAction(CCRepeatForever::create(zhuanquan)); //CCRepeatForever::create(zhuanquan)
    //CCDelayTime *delay=CCDelayTime::create(2);
    //CCActionInterval *jinruguanka=CCSequence::create(delay,CCCallFunc::create(this, callfunc_selector(LoadScene::menuCloseCallback)),NULL);
    
    //CCActionInterval *jinruguanka=CCSequence::create(delay,CCCallFunc::create(this,callfunc_selector(LoadScene::guankaCallback)),NULL);
    //this->runAction(jinruguanka);
    //LoadingScene::LoadAndeRemove();
   // LoadScene::menuCloseCallback(this);
    return true;
}

void LoadingScene::LoadAndeRemove()
{
    
    Playyinxiao::preload();
    char tishistring[100] = {0};
    sprintf(tishistring, "%s",lujing.c_str());
    if (changjing==1)
    {
        CCParticleSystem *particlesystem=CCParticleSystemQuad::create("Particles/ExplodingRing.plist");
        CCSpriteFrameCache* cache = CCSpriteFrameCache::sharedSpriteFrameCache();

        //cache->addSpriteFramesWithFile("pic_gk1.plist", "pic_gk1.png");
        cache->addSpriteFramesWithFile("pic_gk1_1.plist", "pic_gk1_1.png");
        cache->addSpriteFramesWithFile("pic_xian_1.plist", "pic_xian_1.png");
        CCTextureCache::sharedTextureCache()->addImage("bigwin.png");
        CCTextureCache::sharedTextureCache()->addImage("bigwin_light.png");
        CCTextureCache::sharedTextureCache()->addImage("stars.png");
        CCTextureCache::sharedTextureCache()->addImage("coins_diaoluo.png");
//      //º”‘ÿ∞¥≈•
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_Guess_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_Guess_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_Guess_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/jiansu_anniu.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/jiansut_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/jiansu_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_sub_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_sub_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_sub_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_add_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_add_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_add_disable.png", tishistring)->getCString());


        
        //Playyinxiao::preload();
    }
    else if (changjing==2)
    {
        CCSpriteFrameCache* cache = CCSpriteFrameCache::sharedSpriteFrameCache(); 
        //cache->addSpriteFramesWithFile("pic_gk1.plist", "pic_gk1.png"); 
        
        //cache->addSpriteFramesWithFile("pic_gk2.plist", "pic_gk2.png");
        
        cache->addSpriteFramesWithFile("pic_gk2_1.plist", "pic_gk2_1.png");
        cache->addSpriteFramesWithFile("pic_xian_1.plist", "pic_xian_1.png");
        CCTextureCache::sharedTextureCache()->addImage("bigwin.png");
        CCTextureCache::sharedTextureCache()->addImage("bigwin_light.png");
        CCTextureCache::sharedTextureCache()->addImage("stars.png");
        CCTextureCache::sharedTextureCache()->addImage("coins_diaoluo.png");
       // CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_normal.png", tishistring)->getCString());

//         //º”‘ÿ∞¥≈•
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_Guess_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_Guess_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_Guess_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/jiansu_anniu.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/jiansut_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/jiansu_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_sub_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_sub_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_sub_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_add_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_add_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_add_disable.png", tishistring)->getCString());

        //Playyinxiao::preload();
    }
    else if (changjing==3)
    {
        CCSpriteFrameCache* cache = CCSpriteFrameCache::sharedSpriteFrameCache(); 
        //cache->addSpriteFramesWithFile("pic_gk1.plist", "pic_gk1.png"); 

        //cache->addSpriteFramesWithFile("pic_gk3.plist", "pic_gk3.png");
        
        cache->addSpriteFramesWithFile("pic_gk3_1.plist", "pic_gk3_1.png");
        cache->addSpriteFramesWithFile("pic_xian_1.plist", "pic_xian_1.png");
        CCTextureCache::sharedTextureCache()->addImage("bigwin.png");
        CCTextureCache::sharedTextureCache()->addImage("bigwin_light.png");
        CCTextureCache::sharedTextureCache()->addImage("stars.png");
        CCTextureCache::sharedTextureCache()->addImage("coins_diaoluo.png");
        //º”‘ÿ∞¥≈•
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_Guess_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_Guess_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_Guess_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/jiansu_anniu.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/jiansut_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/jiansu_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_sub_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_sub_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_sub_disable.png", tishistring)->getCString());
// 
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_add_normal.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_add_selected.png", tishistring)->getCString());
//         CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_add_disable.png", tishistring)->getCString());
        //Playyinxiao::preload();
    }
    else if (changjing==4)
    {
        CCSpriteFrameCache* cache = CCSpriteFrameCache::sharedSpriteFrameCache();
        //cache->addSpriteFramesWithFile("pic_gk1.plist", "pic_gk1.png");
        
        //cache->addSpriteFramesWithFile("pic_gk3.plist", "pic_gk3.png");
        
        cache->addSpriteFramesWithFile("pic_gk4_1.plist", "pic_gk4_1.png");
        cache->addSpriteFramesWithFile("pic_xian_1.plist", "pic_xian_1.png");
        CCTextureCache::sharedTextureCache()->addImage("bigwin.png");
        CCTextureCache::sharedTextureCache()->addImage("bigwin_light.png");
        CCTextureCache::sharedTextureCache()->addImage("stars.png");
        CCTextureCache::sharedTextureCache()->addImage("coins_diaoluo.png");
    }
    else if (changjing==0)
    {
        
        if (oldchangjing==0)
       {
            //Playyinxiao::preload();
       } 
       else
       {
          //  CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFramesFromFile("pic_gk1.plist");
          //œ¬√ÊŒ™ µº  π”√µƒ∑≈µÙ◊ ‘¥£¨“ÚŒ™gk3ªπ√ª◊ˆ∫√£¨‘›≤ª π”√
            //CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFramesFromFile(CCString::createWithFormat("pic_gk%d.plist", oldchangjing)->getCString());
            //CCTextureCache::sharedTextureCache()->removeAllTextures();//->addImage(CCString::createWithFormat("%s/button_start_normal.png", tishistring)->getCString());
           //放到mapchosse中释放

       }
        //“Ù–ß–∂‘ÿ‘›≤ªøº¬«
         
    }
}

void LoadingScene::menuCloseCallback(CCObject* pSender)//
{
 
    //CCDirector::sharedDirector()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}