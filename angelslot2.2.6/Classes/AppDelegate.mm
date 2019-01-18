#include "cocos2d.h"
#include "CCEGLView.h"
#include "AppDelegate.h"

#include "SimpleAudioEngine.h"
#include "HelloWorldScene.h"
#include "mapchoose.h"
#include "load.h"
#include "MobClickCpp.h"//youmeng
#import "GameKitHelper.h"//GameCenter
using namespace CocosDenshion;

USING_NS_CC;

AppDelegate::AppDelegate()
{
    
  
}

AppDelegate::~AppDelegate()
{
    umeng::MobClickCpp::end();//youmeng
    loacalstrings->release();
    SimpleAudioEngine::end();
    
    //CocosDenshion::SimpleAudioEngine::sharedEngine()->end();
}

bool AppDelegate::applicationDidFinishLaunching()
{
 // initialize director
    CCDirector *pDirector = CCDirector::sharedDirector();
    pDirector->setOpenGLView(CCEGLView::sharedOpenGLView());

    CCSize screenSize = CCEGLView::sharedOpenGLView()->getFrameSize();

   // CCSize designSize = CCSizeMake(960, 640);
    CCSize designSize = CCSizeMake(640, 960);
    //CCSize designSize = CCSizeMake(640, 1136);
    //CCSize designSize = CCSizeMake(320, 480);
    if (screenSize.height != 960)
    {
        //CCSize resourceSize = CCSizeMake(960, 640);
       CCSize resourceSize = CCSizeMake(640, 960);
        //pDirector->setContentScaleFactor(resourceSize.height / designSize.height);
        //∏ƒ∂Ø14
        //ºŸ»Á «÷˜“™‘ˆº”∏ﬂ∂»µƒ±»¿˝£®5S°£°£°££©
        pingmubili=screenSize.height/screenSize.width;
        
        

        //∏ƒ∂Ø14end
        
    }
   //∏ƒ∂Ø14
   //∏¸∏ƒº”‘ÿ¬∑æ∂
//     std::vector<std::string> searchPath;
//     searchPath.push_back("1");
//     CCFileUtils::sharedFileUtils()->setSearchPaths(searchPath);
     pingmubili=screenSize.height/screenSize.width;
    if(pingmubili>1.4)
    {
    CCEGLView::sharedOpenGLView()->setDesignResolutionSize(designSize.width, designSize.width*pingmubili, kResolutionShowAll);
    }        //
    else
    {
        pingmubili=1.775;
        CCEGLView::sharedOpenGLView()->setDesignResolutionSize(designSize.width, 1136, kResolutionShowAll);
            //CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
             // CCLOG("visibleSize.width=%f,visibleSize.height=%f",visibleSize.width,visibleSize.height);
    }
    //CCEGLView::sharedOpenGLView()->setDesignResolutionSize(designSize.width, designSize.height, kResolutionShowAll);
    // set FPS. the default value is 1.0/60 if you don't call this
    pDirector->setAnimationInterval(1.0 / 60);
    
   
    mylanguage=CCApplication::sharedApplication()->getCurrentLanguage();
    //mylanguage=kLanguageChinese;
    //mylanguage=kLanguageEnglish;
    if(mylanguage==kLanguageChinese)
    {
        loacalstrings = CCDictionary::createWithContentsOfFile("plist/strings_zh.xml");
       
    }
     //繁体
    else if (mylanguage==kLanguageChinese2)
    {
         loacalstrings = CCDictionary::createWithContentsOfFile("plist/strings_zhs.xml");
    }
    else
    {
        loacalstrings = CCDictionary::createWithContentsOfFile("plist/strings_en.xml");
    }
    loacalstrings->retain();
    //CCScene *pScene = CCScene::create();
	//CCLayer *pLayer = GalleryLayer::create();
	//CCLayer *pLayer=ListViewLayer::create();
    //CCScene *pScene=HelloWorld::scene();//tem1!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    CCScene *pScene=MapChoose::scene();
      //CCScene *pScene=LoadScene::scene();//huan
    //pScene->addChild(pLayer,18);
    CCTransitionFade *loadanction= CCTransitionFade::create(1,pScene);

    CCDirector::sharedDirector()->runWithScene(loadanction);
    //GameCenter登陆
    [[GameKitHelper sharedGameKitHelper] authenticateLocalUser];//GameCenter
    
      KTPlayC::setNotificationEnabled(false);//ktplay
    MOBCLICKCPP_START_WITH_APPKEY_AND_CHANNEL("543cd847fd98c5cb8802c878", "appstore");//youmeng
    umeng::MobClickCpp::setLogEnabled(false);//youmeng
    


    //pDirector->runWithScene(pScene);
    return true;
}/*
bool AppDelegate::applicationDidFinishLaunching()
{
    // initialize director
    CCDirector *pDirector = CCDirector::sharedDirector();
    pDirector->setOpenGLView(CCEGLView::sharedOpenGLView());

    CCSize screenSize = CCEGLView::sharedOpenGLView()->getFrameSize();

    CCSize designSize = CCSizeMake(960, 640);

    if (screenSize.height != 960)
    {
        CCSize resourceSize = CCSizeMake(960, 640);
        pDirector->setContentScaleFactor(resourceSize.height / designSize.height);
    }

    CCEGLView::sharedOpenGLView()->setDesignResolutionSize(designSize.width, designSize.height, kResolutionNoBorder);
    // set FPS. the default value is 1.0/60 if you don't call this
    pDirector->setAnimationInterval(1.0 / 60);
     CCScene *pScene=MapChoose::scene();
   // CCScene *pScene = CCScene::create();
   // CCLayer *pLayer = GalleryLayer::create();
   // pScene->addChild(pLayer);
    //
    pDirector->runWithScene(pScene);
    return true;
}
*/
// This function will be called when the app is inactive. When comes a phone call,it's be invoked too
void AppDelegate::applicationDidEnterBackground()
{
    CCDirector::sharedDirector()->stopAnimation();
   
    //CCLOG("gcMUSICSTATE1=%d",CCUserDefault::sharedUserDefault()->getIntegerForKey("usrgcMUSICSTATE"));
    if (CCUserDefault::sharedUserDefault()->getIntegerForKey("usrgcMUSICSTATE")==0)
    {
       SimpleAudioEngine::sharedEngine()->pauseAllEffects();
        if (SimpleAudioEngine::sharedEngine()->isBackgroundMusicPlaying())
        {
            SimpleAudioEngine::sharedEngine()->pauseBackgroundMusic();
        }
    
   
    }
    umeng::MobClickCpp::applicationDidEnterBackground();//youmeng

    
    //CCLOG("come in back");
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground()
{
    //CCLOG("come in foreground");
    NowTimeIsGet=false;
    freeconisReady=false;
    jishiqi->inactiveDaojishiTime();
        if(changjing==0)
        {
            pfreeconistishi->setVisible(false);
            pfreeconistishi->stopAllActions();
            ((MapChoose *)nowobject)->panduanshijian();
          
        }
        else
        {
            
            
        }
        
    

    
    CCDirector::sharedDirector()->startAnimation();
    //CCLOG("gcMUSICSTATE2=%d",CCUserDefault::sharedUserDefault()->getIntegerForKey("usrgcMUSICSTATE"));
    if (CCUserDefault::sharedUserDefault()->getIntegerForKey("usrgcMUSICSTATE")==0)
    {
    SimpleAudioEngine::sharedEngine()->resumeBackgroundMusic();
    SimpleAudioEngine::sharedEngine()->resumeAllEffects();
    } 
    else
    {
    SimpleAudioEngine::sharedEngine()->pauseBackgroundMusic();
    SimpleAudioEngine::sharedEngine()->pauseAllEffects();
    }
    umeng::MobClickCpp::applicationWillEnterForeground();//youmeng
    
}
