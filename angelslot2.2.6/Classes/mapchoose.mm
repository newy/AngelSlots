#include "mapchoose.h"
#include "HelloWorldScene.h"
//#include "cocos2d.h"
#include "SimpleAudioEngine.h"
#include "ResouceDefine.h"
#include "playyinxiao.h"
#include "load.h"
#include "storelayer.h"
#include "CCmenuNew.h"
#include "cocos-ext.h"
#import "KTPlayC.h"
#import "GameKitHelper.h"//GameCenter
//using namespace CSJson;
//USING_NS_CC;
//USING_NS_CC_EXT;
#define jingyanheight 85/bigsmall_factor //…œ≤ø∑÷µΩ÷–º‰µƒº–≤„£®◊‹æ≠—È£©
#define jingyanwidth 300/bigsmall_factor

cocos2d::CCMenuItemImage *pZuoItem;
cocos2d::CCMenuItemImage *pYouItem;
//guankanumŒ™3£¨“‚Àº3πÿ£¨◊Ó…œ√Ê∫Õœ¬√Ê∏˜”–“ª∏ˆÕº±Íπ≤5∏ˆ°£pagenum1-5


CCScene* MapChoose::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();

    // 'layer' is an autorelease object
    MapChoose *layer = MapChoose::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;

}
// on "init" you need to initialize your instance
bool MapChoose::init()
{
    bool bRet = false;
    do
    {
        if(!CCLayer::init())
        {
            return false;
        };
        CCDirector::sharedDirector()->setDisplayStats(false);
        // CCLOG("CCFileUtils::sharedFileUtils()->getSearchPaths().size=%zu",CCFileUtils::sharedFileUtils()->getSearchPaths().size());
        if (CCFileUtils::sharedFileUtils()->getSearchPaths().size()>=1)
        {
            //std::vector<std::string>
            std::vector<string> searchPaths =(std::vector<string> )(CCFileUtils::sharedFileUtils()->getSearchPaths());
            
            searchPaths.clear();
            CCFileUtils::sharedFileUtils()->setSearchPaths(searchPaths);
            //(CCFileUtils::sharedFileUtils()->getSearchPaths())->pop_back();
            //CCFileUtils::sharedFileUtils()->getSearchPaths().size()
            //searchPath.clear();
            //CCFileUtils::sharedFileUtils()->setSearchPaths(searchPath);
            
            //vector<string> searchPaths =CCFileUtils::sharedFileUtils()->getSearchPaths();µ√µΩ◊ ‘¥¬∑æ∂
            // searchPaths.insert(searchPaths.begin(),pathToSave);…Ë÷√”≈œ»‘⁄ 1 –¬¥¥Ω®µƒƒ«∏ˆƒø¬ºœ¬—∞’“◊ ‘¥£¨»Áπ˚’“≤ªµΩ‘Ÿ»•rescourseœ¬»•—∞’“
            //CCFileUtils::sharedFileUtils()->setSearchPaths(searchPaths);∂‘”≈œ»◊ ‘¥¬∑æ∂Ω¯––…Ë÷√
            
            //CCFileUtils::sharedFileUtils()->getSearchPaths().
        }
        // CCLOG("searchPath.size=%d",searchPath.size());
        // CCLOG("CCFileUtils::sharedFileUtils()->getSearchPaths().size=%d",CCFileUtils::sharedFileUtils()->getSearchPaths().size());
        
        
        
        
        //±æµÿ”√ªßŒƒº˛
        if(!userDefault->getBoolForKey("isExisted"))
        {
            userDefault->setBoolForKey("isExisted",true);//≤ª÷™µ¿userDefault «…∂£ø’˝Œƒµ⁄ŒÂ––,◊‘º∫∑≠»•
            userDefault->setDoubleForKey("usrqian",20000);//20000   1000000
            //userDefault->setIntegerForKey("usrjingyan",0);
            userDefault->setIntegerForKey("usrfishjingyan",0);//level10->40000 so 3900 level11->4200 so 4100   3900
            userDefault->setIntegerForKey("usrjingyan",0);//195000 10 // 999 0
            userDefault->setIntegerForKey("usrjingyandengji",0);//20 1915000
            //         userDefault->setBoolForKey("usrgcMUSICSTATE",false);
            //         userDefault->setBoolForKey("usrgcEFFECTSTATE",false);
            userDefault->setIntegerForKey("usrgcMUSICSTATE",0);//0为开，1，2为关，1为刚进入场景关
            userDefault->setIntegerForKey("usrDaojuNum",3);//µ¿æﬂµƒ ˝¡ø
            userDefault->setIntegerForKey("usrGotconisTime",0);//
            userDefault->setBoolForKey("usrgcEFFECTSTATE",true);
            
            
            userDefault->flush();
        }
        
        //qian=userDefault->getIntegerForKey("usrqian");
        qian=(long long int )userDefault->getDoubleForKey("usrqian");
        //第二版本新添数据段
        if(!userDefault->getDoubleForKey("Maxscore"))
        {
            
            userDefault->setDoubleForKey("Maxscore",qian);
            userDefault->setBoolForKey("isMaxscoreUpdate",false);
            userDefault->setIntegerForKey("daoju_jiansu",0);////未捡起来的道具
            userDefault->setIntegerForKey("daoju_jinbi",0);////未捡起来的jinbi
            userDefault->setBoolForKey("firstopen",true);
        }
        maxscore=(long long int )userDefault->getDoubleForKey("Maxscore");
        if(!userDefault->getBoolForKey("isMaxscoreUpdate"))
        {
            int shangchuanqian=(int)(maxscore);
            [[GameKitHelper sharedGameKitHelper] reportScore:shangchuanqian forCategory:@leadboard];//GameCenter
        }
        //
        
        currqian=qian;
        jingyandengji=userDefault->getIntegerForKey("usrjingyandengji");
        jingyan=userDefault->getIntegerForKey("usrjingyan");
        gcMUSICSTATE=userDefault->getIntegerForKey("usrgcMUSICSTATE");
        gcEFFECTSTATE=userDefault->getBoolForKey("usrgcEFFECTSTATE");
        daoju_jiansu=userDefault->getIntegerForKey("daoju_jiansu");////未捡起来的道具
        daoju_jinbi=userDefault->getIntegerForKey("daoju_jinbi");////未捡起来的道具
        
        if(gcMUSICSTATE==2)
        {
            userDefault->setIntegerForKey("usrgcMUSICSTATE",1);//∏’Ω¯»Î≥°æ∞
            userDefault->flush();
        }
        //     if(gcEFFECTSTATE==2)
        //     {
        //         userDefault->setBoolForKey("usrgcEFFECTSTATE",1);//∏’Ω¯»Î≥°æ∞
        //         userDefault->flush();
        //     }
        CCDirector::sharedDirector()->setNotificationNode(NULL);
        CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
        
        
        oldchangjing=changjing;
        changjing=0;
        LoadingScene::LoadAndeRemove();
        if (oldchangjing==0)
        {
            // pageNum =1;
            pageNum = fmin(1+jingyandengji/5,GuankaNum);//1
            
          
            
        }
        else
        {
            pageNum = oldchangjing;//pageNum = 1+oldchangjing
        }
        //«Â≥˝ª∫¥Ê£¨Ω´“Ù¿÷∫ÕÕº∆¨‘§º”‘ÿ∫Õ…æ≥˝∑≈µΩloadinglayer÷–
        //CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFramesFromFile("pic_gk1.plist");
        //changjing=0;
        
        //Playyinxiao::playmapmusic();
        Playyinxiao::playmusic();
        //≥ı ºªØ±‰¡ø
        
        
        CCSize size = CCDirector::sharedDirector()->getVisibleSize();
        //±≥æ∞
        bg = CCSprite::create("HelloWorld.png");
        bg->setPosition(ccp(size.width/2,size.height/2));
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        bg->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
        // CCLog("shanglashen=%f",shanglashen);
        this->addChild(bg);
        
        
        
        
        
        //¥¥Ω®CCScrollView£¨≤¢÷∏∂®view¥Û–°
        //effect
        //     if (!gcMUSICSTATE)
        //     {
        //        CocosDenshion::SimpleAudioEngine::sharedEngine()->stopBackgroundMusic();
        //
        //     }
        //
        //     if (!gcEFFECTSTATE)
        //     {
        //     CocosDenshion::SimpleAudioEngine::sharedEngine()->stopAllEffects();
        //     }
        
        //«Æ∫Õæ≠—ÈøÚ
        backqianimg = CCSprite::create("qiankuang_264_64.png");
        CC_BREAK_IF(! backqianimg);
        backqianimg->setAnchorPoint(ccp(0.6,0.5));
        backqianimg->setPosition(ccp(visibleSize.width/4,visibleSize.height-jingyanheight/2));
        
        this->addChild(backqianimg,5);
        
        //”Æµ√Ω«Æ
        //qian=userDefault->getIntegerForKey("qian");//≥ı ºªØ¥”¥Ê¥¢º«¬º÷–∂¡≥ˆ£¨”√ªß ˝æ›¥Ê»°±Í æ
        
        char string[15] = {0};
        sprintf(string, "%.2f",qian/100);
        //CCLabelBMFont *labelbm=CCLabelBMFont::create(string,"diy_38.fnt");//diy_38  futura-48
        labelbm = CCLabelTTF::create(string, "Arial", 30/bigsmall_factor); //HiraKakuProN-W6
        labelbm->setColor(ccc3(248,213,118));
        //labelbm=CCLabelBMFont::create(CCString::createWithFormat("%.2f",qian)->getCString(),"bitmapFontChinese.fnt");
        //this->addChild(labelbm);
        //labelbm->setScale(0.8);
        if (qian/100>999999&&qian/100<=9999999)
        {
            labelbm->setScale(0.9);
        }
        else if(qian/100>9999999&&qian/100<=999999999)
        {
            labelbm->setScale(0.8);
        }
        else if(qian/100>999999999)
        {
            labelbm->setScale(0.7);
        }
        //labelbm->setScale(1.5/(float)bigsmall_factor);
        labelbm->setAnchorPoint(ccp(0.5,0.6));
        //labelbm->setPosition(ccp(jingyanwidth/2,jingyanheight/2));
        labelbm->setPosition(ccp(backqianimg->getTextureRect().size.width/2,backqianimg->getTextureRect().size.height/2));
        backqianimg->addChild(labelbm);
        
        //labelbm->setAnchorPoint(ccp(0,0));
        
        //labelbm->setPosition(ccp(visibleSize.width/4,visibleSize.height-shangheight-jingyanheight/2));
        //labelbm->retain();
        // CCLOG("lablem=%d",labelbm->retainCount());
        labelbm->retain();
        //  CCLOG("lablem=%d",labelbm->retainCount());
        CCSprite *button_normal_store=CCSprite::create("button_normal_store.png");
        CCSprite *button_selected_store=CCSprite::create("button_selected_store.png");
        CCSprite *button_disable_store=CCSprite::create("button_disable_store.png");
        CCmenuNew *pSTOREItem =  CCmenuNew::CCMenucreateWithTexturenew(
                                                                       button_normal_store->getTexture(),
                                                                       button_selected_store->getTexture(),
                                                                       button_disable_store->getTexture(),
                                                                       this,
                                                                       menu_selector(MapChoose::menuStoreCallback));
        
        //CCmenuNew *pSTOREItem = CCmenuNew::create(
        
        //      CCMenuItemImage *pSTOREItem = CCMenuItemImage::create(
        //         "button_normal_store.png",
        //         "button_normal_store.png",
        //         "button_normal_store.png",
        //         this,
        //         menu_selector(MapChoose::menuStoreCallback));
        CC_BREAK_IF(! pSTOREItem);
        pSTOREItem->setAnchorPoint(ccp(1.3,0.5));
        //pSTOREItem->setPosition(ccp(visibleSize.width/4+jingyanwidth/2,visibleSize.height-shangheight-jingyanheight/2));
        pSTOREItem->setPosition(ccp(backqianimg->getPositionX()+backqianimg->getContentSize().width/2,backqianimg->getPositionY()));
        //æ≠—È
        
        CCSprite *backjingyanimg = CCSprite::create("jingyankuang_new.png");
        CC_BREAK_IF(! backjingyanimg);
        backjingyanimg->setAnchorPoint(ccp(0.48,0.5));
        backjingyanimg->setPosition(ccp(visibleSize.width*3/4,visibleSize.height-jingyanheight/2));
        this->addChild(backjingyanimg,5);
        //æ≠—ÈΩ¯∂»Ãı
        //jingyan=userDefault->getIntegerForKey("jingyan");//æ≠—È÷µ£¨≥ı ºªØ¥”¥Ê¥¢º«¬º÷–∂¡≥ˆ£¨”√ªß ˝æ›¥Ê»°±Í æ
        
        //jingyandengji=userDefault->getIntegerForKey("jingyandengji");//æ≠—Èµ»º∂÷µ£¨≥ı ºªØ¥”¥Ê¥¢º«¬º÷–∂¡≥ˆ£¨”√ªß ˝æ›¥Ê»°±Í æ
        
        //Ω¯∂»ÃıÕ‚±ﬂøÚ//
        CCSprite *jingyan_LV_new = CCSprite::create("jingyan_LV_new.png");//jingyankuang_300_75
        CC_BREAK_IF(!jingyan_LV_new);
        jingyan_LV_new->setAnchorPoint(ccp(0.7,0.5));
        jingyan_LV_new->setPosition(ccp(0,backjingyanimg->getTextureRect().getMidY()));
        backjingyanimg->addChild(jingyan_LV_new,1);
        //æ≠—Èµ»º∂œ‘ æµΩÕ‚øÚ…œ
        char jingyanstring[12] = {0};
        sprintf(jingyanstring, "%d",jingyandengji);
        
        //CCLabelBMFont* pLabeldengji =CCLabelBMFont::create(jingyanstring,"geneva-32.fnt");
        CCLabelTTF* pLabeldengji = CCLabelTTF::create(jingyanstring, "Arial", 35/bigsmall_factor); //HiraKakuProN-W6
        pLabeldengji->setColor(ccc3(95,73,27));
        // pLabeldengji=CCLabelAtlas::create(jingyanstring, "fps_images.png", 24, 24, '.');//–Ëª∫¥ÊÕº∆¨
        CC_BREAK_IF(! pLabeldengji);
        pLabeldengji->setPosition(ccp(jingyan_LV_new->getTextureRect().getMidX(), jingyan_LV_new->getTextureRect().getMidY()));
        //backjingyanimg->addChild(pLabeldengji, 1);
        pLabeldengji->setAnchorPoint(ccp(0.5,0.5));
        
        jingyan_LV_new->addChild(pLabeldengji, 1);
        //æ≠—Èµ»º∂œ‘ æµΩÕ‚øÚ…œend
        
        CCSprite* loadimg=CCSprite::create("jingyan_new.png");
        CC_BREAK_IF(!loadimg);
        jingyanpt = CCProgressTimer::create(loadimg);
        jingyanpt->setType(kCCProgressTimerTypeBar);// …Ë÷√≥…∫·œÚµƒ
        //ø…“‘ø¥◊˜ «∞¥æÿ–Œœ‘ æ–ßπ˚µƒΩ¯∂»Ãı¿‡–Õ
        jingyanpt->setMidpoint(ccp(0,0));
        //  ”√¿¥…Ë∂®Ω¯∂»Ãı∫·œÚ«∞Ω¯µƒ∑ΩœÚ¥”◊ÛœÚ”“ªÚ «¥””“œÚ◊Û
        jingyanpt->setBarChangeRate(ccp(1,0));
        //÷ÿ–¬…Ë÷√√™µ„
        
        //jingyanpt->setPosition(ccp(visibleSize.width*3/4,visibleSize.height-jingyanheight/2));
        jingyanpt->setPercentage(0);
        jingyanset();
        jingyanpt->setPosition(ccp(backjingyanimg->getTextureRect().getMidX(),backjingyanimg->getTextureRect().getMidY()));
        backjingyanimg->addChild(jingyanpt,0,103);
        //this->addChild(jingyanpt,4);
        
        
        layer = CCLayer::create();
        //CCMenu *menu = CCMenu::create();
        menu = CCMenu::create();
        //menu->setTouchPriority(-127);
        //for (int i=0;i<=(GuankaNum+1);i++)
        CCTextureCache::sharedTextureCache()->addImage("suo.png");
        CCTextureCache::sharedTextureCache()->addImage("suokuang.png");
        
        //for (int i=0;i<=(GuankaNum+1);i++)
        for (int i=1;i<=(GuankaNum+1);i++)
        {
            CCSprite *sprite;
            if (i==0||i==(GuankaNum+1))
                //if (i==(GuankaNum+1))
            {
                // CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                //CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite, this, menu_selector(MapChoose::menuCallback));
                //menuItem->setScale(3);
                menuItem->setAnchorPoint(ccp(0.5,0.5));
                //menuItem->setPosition(ccp(size.width/2+size.width*(i-1),size.height/2));
                menuItem->setPosition(ccp(size.width/2,size.height/2+size.height*(i-1)));
                menuItem->setTag(200+i);
                menu->addChild(menuItem);
            }
            else if(i==1)
                //if(i==1)
            {
                sprite = CCSprite::create(CCString::createWithFormat("gk%d_select.png", i)->getCString());
                //CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite, this, menu_selector(MapChoose::menuCallback));
                //menuItem->setScale(3);
                menuItem->setAnchorPoint(ccp(0.5,0.5));
                //menuItem->setPosition(ccp(size.width/2+size.width*(i-1),size.height/2));
                menuItem->setPosition(ccp(size.width/2,size.height/2+size.height*(i-1)));
                menuItem->setTag(200+i);
                menu->addChild(menuItem);
            }
            else if(i==2||i==3||i==4)
            {
                if (i==2)
                {
                    if (jingyandengji<5)
                    {
                        sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                        //CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                        CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite,sprite, this, menu_selector(MapChoose::menuCallback));
                        //menuItem->setScale(3);
                        menuItem->setAnchorPoint(ccp(0.5,0.5));
                        menuItem->setEnabled(false);
                        //menuItem->setPosition(ccp(size.width/2+size.width*(i-1),size.height/2));
                        menuItem->setPosition(ccp(size.width/2,size.height/2+size.height*(i-1)));
                        menuItem->setTag(200+i);
                        menu->addChild(menuItem);
                        //Œ¥ø™∆Ùº”À¯
                        CCSprite* jiesuolevel= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("suokuang.png"));
                        jiesuolevel->setAnchorPoint(ccp(0.4,0));
                        jiesuolevel->setPosition(ccp(menuItem->getContentSize().width/2,menuItem->getContentSize().height/4));
                        CCSprite* suopng= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("suo.png"));
                        suopng->setAnchorPoint(ccp(0.3,0.1));
                        suopng->setPosition(ccp(menuItem->getContentSize().width/4,menuItem->getContentSize().height/4));
                        
                        std::string tishi = ((CCString*)(loacalstrings->objectForKey("level")))->m_sString.c_str();
                        tishi+="5";
                        char tishistring[50] = {0};
                        sprintf(tishistring, "%s",tishi.c_str());
                        CCLabelTTF* pLabellockdengji = CCLabelTTF::create(tishistring, "Arial", 25/bigsmall_factor); //HiraKakuProN-W6
                        pLabellockdengji->setColor(ccc3(199,246,94));
                        pLabellockdengji->setAnchorPoint(ccp(0.4,0.5));
                        // pLabeldengji=CCLabelAtlas::create(jingyanstring, "fps_images.png", 24, 24, '.');//–Ëª∫¥ÊÕº∆¨
                        CC_BREAK_IF(! pLabellockdengji);
                        pLabellockdengji->setPosition(ccp(jiesuolevel->getContentSize().width/2, jiesuolevel->getContentSize().height/2));
                        jiesuolevel->addChild(pLabellockdengji);
                        menuItem->addChild(jiesuolevel);
                        menuItem->addChild(suopng);
                        
                    }
                    else
                    {
                        sprite = CCSprite::create(CCString::createWithFormat("gk%d_select.png", i)->getCString());
                        //CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                        CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite, this, menu_selector(MapChoose::menuCallback));
                        //menuItem->setScale(3);
                        menuItem->setAnchorPoint(ccp(0.5,0.5));
                        //menuItem->setPosition(ccp(size.width/2+size.width*(i-1),size.height/2));
                        menuItem->setPosition(ccp(size.width/2,size.height/2+size.height*(i-1)));
                        menuItem->setTag(200+i);
                        menu->addChild(menuItem);
                    }
                    
                }
                else if(i==3)
                {
                    if (jingyandengji<10)
                    {
                        sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                        //CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                        CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite, this, menu_selector(MapChoose::menuCallback));
                        //menuItem->setScale(3);
                        menuItem->setAnchorPoint(ccp(0.5,0.5));
                        //menuItem->setPosition(ccp(size.width/2+size.width*(i-1),size.height/2));
                        menuItem->setPosition(ccp(size.width/2,size.height/2+size.height*(i-1)));
                        menuItem->setTag(200+i);
                        menu->addChild(menuItem);
                        menuItem->setEnabled(false);
                        
                        
                        //Œ¥ø™∆Ùº”À¯
                        CCSprite* jiesuolevel= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("suokuang.png"));
                        jiesuolevel->setAnchorPoint(ccp(0.4,0));
                        jiesuolevel->setPosition(ccp(menuItem->getContentSize().width/2,menuItem->getContentSize().height/4));
                        CCSprite* suopng= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("suo.png"));
                        suopng->setAnchorPoint(ccp(0.3,0.1));
                        suopng->setPosition(ccp(menuItem->getContentSize().width/4,menuItem->getContentSize().height/4));
                        std::string tishi = ((CCString*)(loacalstrings->objectForKey("level")))->m_sString.c_str();
                        tishi+="10";
                        char tishistring[50] = {0};
                        sprintf(tishistring, "%s",tishi.c_str());
                        CCLabelTTF* pLabellockdengji = CCLabelTTF::create(tishistring, "Arial", 25/bigsmall_factor); //HiraKakuProN-W6
                        pLabellockdengji->setColor(ccc3(199,246,94));
                        pLabellockdengji->setAnchorPoint(ccp(0.4,0.5));
                        // pLabeldengji=CCLabelAtlas::create(jingyanstring, "fps_images.png", 24, 24, '.');//–Ëª∫¥ÊÕº∆¨
                        CC_BREAK_IF(! pLabellockdengji);
                        pLabellockdengji->setPosition(ccp(jiesuolevel->getContentSize().width/2, jiesuolevel->getContentSize().height/2));
                        jiesuolevel->addChild(pLabellockdengji);
                        menuItem->addChild(jiesuolevel);
                        menuItem->addChild(suopng);
                    }
                    else
                    {
                        sprite = CCSprite::create(CCString::createWithFormat("gk%d_select.png", i)->getCString());
                        //CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                        CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite, this, menu_selector(MapChoose::menuCallback));
                        //menuItem->setScale(3);
                        menuItem->setAnchorPoint(ccp(0.5,0.5));
                        //menuItem->setPosition(ccp(size.width/2+size.width*(i-1),size.height/2));
                        menuItem->setPosition(ccp(size.width/2,size.height/2+size.height*(i-1)));
                        menuItem->setTag(200+i);
                        menu->addChild(menuItem);
                        
                        
                        
                    }
                }
                else if(i==4)
                {
                    if (jingyandengji<15)
                    {
                        sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                        //CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                        CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite, this, menu_selector(MapChoose::menuCallback));
                        //menuItem->setScale(3);
                        menuItem->setAnchorPoint(ccp(0.5,0.5));
                        //menuItem->setPosition(ccp(size.width/2+size.width*(i-1),size.height/2));
                        menuItem->setPosition(ccp(size.width/2,size.height/2+size.height*(i-1)));
                        menuItem->setTag(200+i);
                        menu->addChild(menuItem);
                        menuItem->setEnabled(false);
                        
                        
                        //Œ¥ø™∆Ùº”À¯
                        CCSprite* jiesuolevel= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("suokuang.png"));
                        jiesuolevel->setAnchorPoint(ccp(0.4,0));
                        jiesuolevel->setPosition(ccp(menuItem->getContentSize().width/2,menuItem->getContentSize().height/4));
                        CCSprite* suopng= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("suo.png"));
                        suopng->setAnchorPoint(ccp(0.3,0.1));
                        suopng->setPosition(ccp(menuItem->getContentSize().width/4,menuItem->getContentSize().height/4));
                        std::string tishi = ((CCString*)(loacalstrings->objectForKey("level")))->m_sString.c_str();
                        tishi+="15";
                        char tishistring[50] = {0};
                        sprintf(tishistring, "%s",tishi.c_str());
                        CCLabelTTF* pLabellockdengji = CCLabelTTF::create(tishistring, "Arial", 25/bigsmall_factor); //HiraKakuProN-W6
                        pLabellockdengji->setColor(ccc3(199,246,94));
                        pLabellockdengji->setAnchorPoint(ccp(0.4,0.5));
                        // pLabeldengji=CCLabelAtlas::create(jingyanstring, "fps_images.png", 24, 24, '.');//–Ëª∫¥ÊÕº∆¨
                        CC_BREAK_IF(! pLabellockdengji);
                        pLabellockdengji->setPosition(ccp(jiesuolevel->getContentSize().width/2, jiesuolevel->getContentSize().height/2));
                        jiesuolevel->addChild(pLabellockdengji);
                        menuItem->addChild(jiesuolevel);
                        menuItem->addChild(suopng);
                    }
                    else
                    {
                        sprite = CCSprite::create(CCString::createWithFormat("gk%d_select.png", i)->getCString());
                        //CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
                        CCMenuItemSprite *menuItem = CCMenuItemSprite::create(sprite, sprite, this, menu_selector(MapChoose::menuCallback));
                        //menuItem->setScale(3);
                        menuItem->setAnchorPoint(ccp(0.5,0.5));
                        //menuItem->setPosition(ccp(size.width/2+size.width*(i-1),size.height/2));
                        menuItem->setPosition(ccp(size.width/2,size.height/2+size.height*(i-1)));
                        menuItem->setTag(200+i);
                        menu->addChild(menuItem);
                        
                        
                        
                    }
                }
                //CCSprite *sprite = CCSprite::create(CCString::createWithFormat("gk%d_unselect.png", i)->getCString());
            }
            
            
            //         CCSprite *spritezuo = CCSprite::create("dianti_zuo.png");
            //         spritezuo->setAnchorPoint(ccp(0,0.5));
            //         spritezuo->setPosition(ccp(size.width/2-135,size.height/2+size.height*(i-1)));
            //         spritezuo->setTag(300+i*10);
            //         layer->addChild(spritezuo,100);
            //
            //
            //         CCSprite *spriteyou = CCSprite::create("dianti_you.png");
            //         spriteyou->setAnchorPoint(ccp(1,0.5));
            //         spriteyou->setPosition(ccp(size.width/2+135,size.height/2+size.height*(i-1)));
            //         spriteyou->setTag(300+i*10+1);
            //         layer->addChild(spriteyou,100);
            //
            //         CCSprite *spritedianti = CCSprite::create("dianti_bj.png");
            //         //spriteyou->setAnchorPoint(ccp(1,0.5));
            //         spritedianti->setPosition(ccp(size.width/2,size.height/2+size.height*(i-1)));
            //         layer->addChild(spritedianti,200);
        }
        //if (oldchangjing==0)
        //{
        // pageNum =1;
        CCSprite* pguankatishi=CCSprite::create("jiantou.png");
        pguankatishi->setAnchorPoint(ccp(0.5,1));
        //pguankatishi->setPosition(getWinCenter());
        CCMenuItemSprite *menuItem =(CCMenuItemSprite*)(menu->getChildByTag(200+fmin(1+jingyandengji/5,GuankaNum)));
        pguankatishi->setPosition(ccp(menuItem->getContentSize().width/2,menuItem->getContentSize().height));
        menuItem->addChild(pguankatishi);
        //float jiantouX=pShijianItem->getPositionX()+pShijianItem->getContentSize().width/2;
        //float jiantouY=pShijianItem->getPositionY()+pShijianItem->getContentSize().height;
        CCActionInterval* actionMoveto1= CCMoveBy::create(0.4, ccp(0,15));
        //CCActionInterval* actionMoveto2= CCMoveTo::create(0.4,ccp(jiantouX,jiantouY));
        CCActionInterval *shangxia =CCRepeatForever::create(CCSequence::create(actionMoveto1,actionMoveto1->reverse(),NULL));
        pguankatishi->runAction(shangxia);
        //}
        
        menu->setPosition(CCPointZero);
        layer->addChild(menu);
        layer->setAnchorPoint(CCPointZero);
        layer->setPosition(CCPointZero);
        // scrollView = CCScrollView::create(CCSizeMake(640*6, 960),layer);
        //scrollView = CCScrollView::create(CCSizeMake(bjwidth, bjheght*(GuankaNum+2)),layer);
        scrollView = CCScrollView::create(CCSizeMake(bjwidth, bjheght*(GuankaNum+1)),layer);
        scrollView->setPosition(CCPointZero);
        scrollView->setContentOffset(CCPointZero);
        //CCLOG("scrollView->getContentOffset().x=%f",scrollView->getContentOffset().x);
        //layer->setContentSize(CCSizeMake(640*6, 960));
        //layer->setContentSize(CCSizeMake(size.width, size.height*(GuankaNum+2)));
        layer->setContentSize(CCSizeMake(size.width, size.height*(GuankaNum+1)));
        //scrollView->setViewSize(CCSizeMake(size.width, size.height*(GuankaNum+2)));
        scrollView->setViewSize(CCSizeMake(size.width, size.height*(GuankaNum+1)));
        //scrollView->setContentSize(CCSizeMake(640*6, 960));
        //scrollView->setContentSize(CCSizeMake(size.width, size.height*(GuankaNum+2)));
        scrollView->setContentSize(CCSizeMake(size.width, size.height*(GuankaNum+1)));
        // scrollView->setContainer(layer);
        scrollView->setTouchEnabled(false);
        scrollView->setDelegate(this);
        //scrollView->setDirection(kCCScrollViewDirectionHorizontal);
        scrollView->setDirection(kCCScrollViewDirectionVertical);
        
        this->addChild(scrollView);
        
        
        
        //scrollView->setContentOffset(ccp(-size.width,0), true);
        //scrollView->setContentOffset(ccp(0,-size.height*(pageNum-2)), false);
        scrollView->setContentOffset(ccp(0,-size.height*(pageNum-1)), false);
        //scrollView->setContentOffset(ccp(0,0), false);
        
        
        
        CCMenuItemImage* pSetItem = CCMenuItemImage::create(
                                                            "seticon.png",
                                                            "seticon.png",
                                                            this,
                                                            menu_selector(MapChoose::menuSetCallback));
        CC_BREAK_IF(!pSetItem);
        
        // Place the menu item bottom-right conner.
        pSetItem->setAnchorPoint(ccp(0.5,0));
        // pYouItem->setPosition(ccp(size.width*5/6,size.height/2));
        //  pSetItem->setPosition(ccp(pSetItem->getContentSize().width,pSetItem->getContentSize().height));
        pSetItem->setPosition(ccp(size.width-10-pSetItem->getContentSize().width/2,10));
        
        pZuoItem = CCMenuItemImage::create(
                                           "zuo.png",
                                           "zuo_select.png",
                                           this,
                                           menu_selector(MapChoose::menuZuoCallback));
        CC_BREAK_IF(!pZuoItem);
        
        // Place the menu item bottom-right conner.
        
        // pZuoItem->setPosition(ccp(size.width/6,size.height/2));
        //pZuoItem->setPosition(ccp(size.width*6/7,size.height/4));
        pZuoItem->setAnchorPoint(ccp(0.5,0.5));
        //pZuoItem->setPosition(ccp(size.width-pSetItem->getContentSize().width/2+10,size.height/4));
        pZuoItem->setPosition(ccp(pSetItem->getPositionX(),size.height/4));
        pZuoItem->setTag(21);
        if (pageNum==1)
        {
            pZuoItem->setVisible(false);
        }
        
        
        pYouItem = CCMenuItemImage::create(
                                           "you.png",
                                           "you_select.png",
                                           this,
                                           menu_selector(MapChoose::menuYouCallback));
        CC_BREAK_IF(!pYouItem);
        
        // Place the menu item bottom-right conner.
        
        // pYouItem->setPosition(ccp(size.width*5/6,size.height/2));
        //pYouItem->setPosition(ccp(size.width*6/7,size.height*3/4));
        pYouItem->setAnchorPoint(ccp(0.5,0.5));
        //pYouItem->setPosition(ccp(size.width-pSetItem->getContentSize().width/2+10,size.height*3/4));
        pYouItem->setPosition(ccp(pSetItem->getPositionX(),size.height*3/4));
        pYouItem->setTag(22);
        //«∞√Ê¡Ω∏ˆ∂Òœ‘ æ «ø…“‘collect µƒ—˘◊”£¨disable «Àµ√˜‘⁄µπº∆ ±
        
        pShijianItem = CCMenuItemImage::create(
                                               "shijian_red.png",
                                               "shijian_red.png",
                                               "shijian_dis.png",
                                               this,
                                               menu_selector(MapChoose::menushijianCallback));
        CC_BREAK_IF(!pShijianItem);
        pShijianItem->setAnchorPoint(ccp(0,0));
        pShijianItem->setPosition(ccp(10,10));
        if (freeconisReady)
        {
            pShijianItem->setEnabled(true);
        }
        else
        {
            pShijianItem->setEnabled(false);
        }
        pfreeconistishi=CCSprite::create("jiantou.png");
        pfreeconistishi->setAnchorPoint(ccp(0.5,0));
        pfreeconistishi->setPosition(ccp(pShijianItem->getPositionX()+pShijianItem->getContentSize().width/2,pShijianItem->getPositionY()+pShijianItem->getContentSize().height));
        this->addChild(pfreeconistishi);
        pfreeconistishi->setVisible(false);
        const char *pLabelStrtishi = ((CCString*)(loacalstrings->objectForKey("collectbonus")))->m_sString.c_str();
        lable_freeconistishi=CCLabelTTF::create(pLabelStrtishi,"Arial",25/bigsmall_factor);
        lable_freeconistishi->setAnchorPoint(ccp(0.5,0.3));
        lable_freeconistishi->setPosition(ccp(pfreeconistishi->getContentSize().width/2,pfreeconistishi->getContentSize().height));
        pfreeconistishi->addChild(lable_freeconistishi);
        lable_freeconistishi->setColor(ccc3(199,246,94));
        
        //lable_daojishi->setAnchorPoint(ccp(0.3,0.5));
        //const char *pLabelStr = ((CCString*)(loacalstrings->objectForKey("offline")))->m_sString.c_str();
        lable_daojishi=CCLabelTTF::create("","Arial",25/bigsmall_factor);
        MapChoose::panduanshijian();
        
        //lable_daojishi->setPosition(ccp(pShijianItem->getPositionX()+pShijianItem->getContentSize().width/2,pShijianItem->getPositionY()+pShijianItem->getContentSize().height/2));
        lable_daojishi->setPosition(ccp(pShijianItem->getPositionX()+pShijianItem->getContentSize().width*0.65,pShijianItem->getPositionY()+pShijianItem->getContentSize().height/2));
        
        CCMenuItemImage* pGamecenter_appleItem = CCMenuItemImage::create(
                                                                         "gamecenter_apple.png",
                                                                         "gamecenter_apple.png",
                                                                         this,
                                                                         menu_selector(MapChoose::menuGamecenter_appleCallback));
        CC_BREAK_IF(!pGamecenter_appleItem);
        pGamecenter_appleItem->setAnchorPoint(ccp(1,0));
        pGamecenter_appleItem->setPosition(ccp(pSetItem->getPositionX()-pSetItem->getContentSize().width/2-10,10));
        
        
        
        CCMenuItemImage* pGamecenterItem = CCMenuItemImage::create(
                                                                   "gamecenter.png",
                                                                   "gamecenter.png",
                                                                   this,
                                                                   menu_selector(MapChoose::menuGamecenterCallback));
        CC_BREAK_IF(!pGamecenterItem);
        pGamecenterItem->setAnchorPoint(ccp(1,0));
        pGamecenterItem->setPosition(ccp(pGamecenter_appleItem->getPositionX()-pGamecenter_appleItem->getContentSize().width-10,10));
        
        
        
        //ktplay!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@@@@@@@
        nowobject=this;
        
        pGamecenterItem->setVisible(false);
        if(KTPlayC::isEnabled())
        {
            pGamecenterItem->setVisible(true);
        }
        
        KTDispatchRewardsCallback callbackRewards = dispatchRewards;
        KTPlayC::setDidDispatchRewardsCallback(callbackRewards);
        //newsmsg
        new_msg=CCSprite::create("new_msg.png");
        new_msg->setAnchorPoint(ccp(0.65,0.65));
        new_msg->setPosition(ccp(pGamecenterItem->getContentSize().width,pGamecenterItem->getContentSize().height));
        new_msg->setVisible(false);
        pGamecenterItem->addChild(new_msg);
        KTActivityStatusChangedCallback StatuscallBACK=updateKTTip;
        KTPlayC::setActivityStatusChangedCallback(StatuscallBACK);
        KTPlayC::setViewDidDisappearCallback(onKTDisappear);//关闭时候恢复
        //设置回调
        KTPlayC::setViewDidAppearCallback(onKTAppear);
        //ktplay
        CCSpriteFrameCache *cache =  CCSpriteFrameCache::sharedSpriteFrameCache();
        
        cache->addSpriteFrame(CCSpriteFrame::create("Help_Point01.png",CCRectMake(0,0,20,20)),"Help_Point01.png");
        cache->addSpriteFrame(CCSpriteFrame::create("Help_Point02.png",CCRectMake(0,0,20,20)),"Help_Point02.png");
        //      CCTextureCache::sharedTextureCache()->addImage("Help_Point01.png");
        //       CCTextureCache::sharedTextureCache()->addImage("Help_Point02.png");
        //for (int i=1;i<=GuankaNum+2;i++)
        for (int i=1;i<=GuankaNum+1;i++)
        {
            CCSprite *point = CCSprite::createWithSpriteFrameName("Help_Point01.png");
            //CCSprite *point =CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("Help_Point01.png"));
            point->setTag(100+i);
            point->setAnchorPoint(ccp(0.5,0.5));
            //point->setPosition(ccp(size.width/2-40*3+40*i,40));
            // point->setPosition(ccp(20,size.height/2-40*3+40*i));
            point->setPosition(ccp(pSetItem->getPositionX(),size.height/2-40*5/2+40*i));
            this->addChild(point);
        }
        int pointnum=100+pageNum;
        CCSprite *point = (CCSprite *)this->getChildByTag(pointnum);
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point02.png"));
        //pmenu = CCMenu::create(pZuoItem,pYouItem,pSetItem,pSTOREItem,pShijianItem,pGamecenter_appleItem,NULL);
        pmenu = CCMenu::create(pZuoItem,pYouItem,pSetItem,pSTOREItem,pShijianItem,pGamecenterItem,pGamecenter_appleItem,NULL);//ktplay
        //pmenu = CCMenu::create(pSetItem,pSTOREItem,pShijianItem,pGamecenterItem,NULL);
        //pmenu->setTouchPriority(-129);
        pmenu->setPosition(CCPointZero);
        this->addChild(pmenu,5);
        this->addChild(lable_daojishi,6);
        //     //∏’Ω¯»Î≥°æ∞
        //     if (!NowTimeIsGet)
        //     {
        //          activeConectNet();
        //     }
        //     //¥”÷˜≥°æ∞ªÿ¿¥
        //     else
        //     {
        //         jishiqi->activeDaojishiTime();
        //     }
        
        
        
        
        
        
        //CCOrbitCamera *camera1=CCOrbitCamera::create(1, 2, 0, 0, 90, 0, 0);
        //(CCSprite *)(layer->getChildByTag(300+pageNum*10))->runAction(camera1);
        
        //CCOrbitCamera *camera2=CCOrbitCamera::create(1, 2, 0, 0, -90, 0, 0);
        //(CCSprite *)(layer->getChildByTag(300+pageNum*10+1))->runAction(camera2);
        
        //CCLOG("backmusic end=%d",CocosDenshion::SimpleAudioEngine::sharedEngine()->isBackgroundMusicPlaying());
        
        //huadongtag=false;
        bRet = true;
        
        
    } while (0);
    
    return bRet;
}


void MapChoose::panduanshijian()
{
    
    if (!NowTimeIsGet)
    {
        const char *pLabelStr = ((CCString*)(loacalstrings->objectForKey("offline")))->m_sString.c_str();
        //lable_daojishi=CCLabelTTF::create(pLabelStr,"Arial",25/bigsmall_factor);
        lable_daojishi->setString(pLabelStr);
        pShijianItem->setEnabled(false);
        lable_daojishi->setColor(ccc3(255,255,255));
        activeConectNet();
    }
    else
    {
        //lable_daojishi=CCLabelTTF::create(" ","Arial",30/bigsmall_factor);
        
        jishiqi->activeDaojishiTime();
        if(freeconisReady)
        {
            pfreeconistishi->setVisible(true);
            float jiantouX=pShijianItem->getPositionX()+pShijianItem->getContentSize().width/2;
            float jiantouY=pShijianItem->getPositionY()+pShijianItem->getContentSize().height;
            CCActionInterval* actionMoveto1= CCMoveTo::create(0.4,ccp(jiantouX,jiantouY+20));
            CCActionInterval* actionMoveto2= CCMoveTo::create(0.4,ccp(jiantouX,jiantouY));
            CCActionInterval *shangxia =CCRepeatForever::create(CCSequence::create(actionMoveto1,actionMoveto2,actionMoveto1,actionMoveto2,NULL));
            pfreeconistishi->runAction(shangxia);
        }
        
        
    }
}
//ktplay

void MapChoose::showKTTip() //显示ktplay newmsg
{
    new_msg->setVisible(true);//ktplay
}
void MapChoose::hideKTTip() //隐藏ktplay newmsg
{
    new_msg->setVisible(false);//ktplay
}

//collect conis µ„ª˜
void MapChoose::menushijianCallback(CCObject* pSender)
{
    //收º?集¡¥freecoins，ê?计?时º¡À器¡Â开a始º?运?转Áa
    //conis 加¨®音°?效¡ì
    pfreeconistishi->stopAllActions();
    pfreeconistishi->setVisible(false);
    Playyinxiao::play_anjian();
    CCMenuItemImage *shijianitem =(CCMenuItemImage *)pSender;
    CCTextureCache::sharedTextureCache()->addImage("freeconis.png");
    CCPoint freeconisposition= shijianitem->getPosition();
    freeconisposition.x+=backqianimg->getContentSize().width/5;
    // CCOrbitCamera *camera1=CCOrbitCamera::create(0.1, 1, 0, 0, 0, 0, 0);
    // s->runAction(camera1);
    float px=freeconisposition.x;
    float py=freeconisposition.y+90;
    float ex=backqianimg->getPositionX()-backqianimg->getContentSize().width*0.5;
    float ey=backqianimg->getPositionY();
    ccBezierConfig b1;
    //    b1.controlPoint_1=ccp(px+(ex-px)*0.2,py+40);
    //    b1.controlPoint_2=ccp(px+(ex-px)*0.6,py-40);
    b1.controlPoint_1=ccp(px+100,(ey-py)*0.3);
    b1.controlPoint_2=ccp(px+100,(ey-py)*0.7);
    //b1.endPosition=ccp(ex+45,ey-40);
    b1.endPosition=ccp(ex,ey);
    
    
    // s->runAction(movetohou);
    for (int i=0;i<20;i++)
    {
        CCSprite* freeconis= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("freeconis.png"));
        freeconis->setTag(freeconistag);
        freeconis->setPosition(ccp(freeconisposition.x+i/10*60,freeconisposition.y+10*(i%10)+20));
        shijianitem->getParent()->getParent()->addChild(freeconis,10000);
        CCDelayTime *delai2=CCDelayTime::create(0.1f*(20-i));
        CCActionInterval* fisheatgo=CCBezierTo::create(1.0f,b1);//1.5
        //CCActionInterval *moveto=CCMoveTo::create(0.1,this->monsterSystem->getposition());
        CCActionInterval *movetohou=CCSequence::create(fisheatgo,CCCallFuncN::create(this,callfuncN_selector(MapChoose::spriteremoveFromParent)),NULL);
        CCActionInterval *conisfly=CCSequence::create(delai2,movetohou,NULL);
        
        freeconis->runAction(conisfly);
    }
    //collect
    //freecoinsvalue «œ÷‘⁄µƒ◊¥Ã¨value
    
    qian+=freecoinsvalue;
    userDefault->setDoubleForKey("usrqian",qian);
    GotconisTime=NowcoinsTime;
    userDefault->setIntegerForKey("usrGotconisTime",GotconisTime);//∏’Ω¯»Î≥°æ∞
    userDefault->flush();
    activeqian();
    Playyinxiao::play_jinbi();
    
    //     char string[15] = {0};
    //     sprintf(string, "%.2f",qian/100);
    //     //º”∂® ±∆˜ µœ÷
    //     labelbm ->setString(string);
    
    freeconisReady=false;
    jishiqi->activeDaojishiTime();
}

void MapChoose::activeqian()
{
    //     if (!activeqiantag&&!activeqianDan&&!activeqianZong)
    //     {
    //         activeqiantag=true;
    //         activeqianDan=true;
    //         activeqianZong=true;
    //         //this->schedule(schedule_selector(HelloWorld::schedulejiaqian),0.1);
    this->schedule(schedule_selector(MapChoose::schedulejiaqian),0.1);
    //     }
    
}
//∂® ±∆˜πÿ±’£¨reward ∑≠∂Ø
void MapChoose::inactiveqian()
{
    //     if(!activeqianDan&&!activeqianZong)
    //     {if (activeqiantag)
    //     {
    //         activeqiantag=false;
    this->unschedule(schedule_selector(MapChoose::schedulejiaqian));
    //     }
    //     }
}

void MapChoose::schedulejiaqian(float fDelta)
{
    //CCLOG("schedulejiaqian");
    //currqian ∑≠µΩ”Îqianœ‡µ»Œ™÷π
    char string[15] = {0};
    //int weishu=0;
    //int jiaqiantemp=jiaqian;
    long long int currqiantemp=currqian;
    int wei=1;
    long long int qiantemp=qian;
    //√ø“ªŒª…œ≤Ÿ◊˜ƒ«æÕ≤ª‘ –Ì≤˙…˙Ω¯Œª
    do
    {
        if((currqiantemp%10!=qiantemp%10)&&currqiantemp%10!=9)
            
        {
            currqian+=1*wei;
            
        }
        else if((currqiantemp%10!=qiantemp%10)&&currqiantemp%10==9)
        {
            currqian-=9*wei;
        }
        
        currqiantemp/=10;
        qiantemp/=10;
        wei*=10;
        
    } while (qiantemp!=0);
    
    
    
    if(currqian!=qian)//curr±æ¿¥ «0.01±‰≥…0.009999£¨,À˘“‘ø¥ƒ‹≤ªƒ‹±‰≥…’˚ ˝¥¶¿Ì
    {
        sprintf(string, "%.2f",currqian/100 );
        //label1->setString(string);
        labelbm->setString(string);
        //CCLOG("qian a %f %f",currqian/100 ,qian/100);
    }
    else
    {
        sprintf(string, "%.2f",currqian/100 );
        //label1->setString(string);
        labelbm->setString(string);
        //CCLOG("qian a %f %f",currqian/100 ,qian/100);
        //activeqianZong=false;
        inactiveqian();
        
    }
    
    //---------------------------µ•¥ŒΩ±¿¯>
}
void MapChoose::ConnectNet(float fDelta)
{
    //CCLOG("mapchoose try connect net");
    //ªÒ»° ±º‰¥¡
    cocos2d::extension::CCHttpRequest *request=new cocos2d::extension::CCHttpRequest();
    // request->setUrl("http://www.oschina.net/action/api/news_list");
    request->setUrl("http://www.baidu.com/");
    //request->setRequestType(cocos2d::extension::CCHttpRequest::kHttpPost);
    request->setRequestType(cocos2d::extension::CCHttpRequest::kHttpGet);
    //request->setRequestData("Date",strlen("Date"));
    //     std::vector<std::string> headers;
    //     headers.push_back("Content-Type: application/json; charset=utf-8");
    //     request->setHeaders(headers);
    //     const char* postData = "catalog=2&pageIndex=1&pageSize=5";
    //     request->setRequestData(postData ,strlen(postData));
    request->setResponseCallback(this, callfuncND_selector(MapChoose::onHttpRequestCompleted));
    request->setTag("Post_My_Data");
    cocos2d::extension::CCHttpClient::getInstance()->send(request);
    request->release();
    
    
}



void MapChoose::activeConectNet()
{
    if (!NowTimeIsGet)
    {
        this->schedule(schedule_selector(MapChoose::ConnectNet),2);
        
    }
}

void MapChoose::inactiveConectNet()
{
    if (NowTimeIsGet)
    {
        this->unschedule(schedule_selector(MapChoose::ConnectNet));
    }
}

void MapChoose::menuGamecenterCallback(CCObject* pSender)
{
    //ktplay
    Playyinxiao::play_anjian();
    KTPlayC::show();
}
void MapChoose::menuGamecenter_appleCallback(CCObject* pSender)
{
    if(maxscore<qian)
    {
        int shangchuanqian=(int)(qian);
        [[GameKitHelper sharedGameKitHelper] reportScore:shangchuanqian forCategory:@leadboard];//GameCenter
        maxscore=qian;
        userDefault->setDoubleForKey("Maxscore",qian);
        
    }
    //显示排行榜

    [[GameKitHelper sharedGameKitHelper] showLeaderboard];//GameCenter
    
}
void MapChoose::onHttpRequestCompleted(cocos2d::CCNode *sender ,void *data)
{
    //
    //     AllocConsole();
    //     freopen("CONIN$", "r", stdin);
    //     freopen("CONOUT$", "w", stdout);
    //     freopen("CONOUT$", "w", stderr);
    
    cocos2d::extension::CCHttpResponse *response = (cocos2d::extension::CCHttpResponse*)data;
    if (!response)
    {
        return;
    }
    if (0 != strlen(response->getHttpRequest()->getTag()))
    {
        // CCLog("%s completed", response->getHttpRequest()->getTag());
    }
    //int statusCode = response->getResponseCode();
    
    //char statusString[64] = {};
    //sprintf(statusString ,"Http status code:%d ,tag = %s" ,statusCode ,response->getHttpRequest()->getTag());
    //  CCLog("response code:%d" ,statusCode);
    if (!response->isSucceed())
    {
        //  CCLog("response failed");
        //CCLog("error buffer:%s" ,response->getErrorBuffer());
        //œ‘ æoffline
        
    }
    //     std::vector<char> *buffer = response->getResponseData();
    //     printf("Http response,dump data:");
    //     std::string result = "";
    //     for (unsigned int i = 0; i < buffer->size(); i ++)
    //     {
    //         printf("%c" ,(*buffer)[i]);
    //     }
    else
    {
        std::vector<char> *buffer = response->getResponseHeader();
        // printf("Http response,getResponseHeader data:");
        std::string result = "";
        std::string headerdata;
        for (unsigned int i = 0; i < buffer->size(); i ++)
        {
            //printf("%c" ,(*buffer)[i]);
            //char *temp;
            headerdata+=((*buffer)[i]);
        }
        headerdata+='\0';
        int weizhi=headerdata.find_first_of("Date:");
        // CCLOG("date weizhi =%d",weizhi);
        string gmtdate=headerdata.substr(weizhi+6,30);
        // CCLOG("gmtdate=%s",gmtdate.c_str());
        int gtmtime_day=atoi(gmtdate.substr(5,2).c_str());
        int gtmtime_hour=atoi(gmtdate.substr(17,2).c_str());
        int gtmtime_min=atoi(gmtdate.substr(20,2).c_str());
        int gtmtime_second=atoi(gmtdate.substr(23,2).c_str());
        
        int zong_second=gtmtime_day*3600*24+gtmtime_hour*3600+gtmtime_min*60+gtmtime_second;//ÃÏ ±∑÷√Îπª”√¡À
        
        NowTimeIsGet=true;
        NowcoinsTime=zong_second;
        inactiveConectNet();
        if (!userDefault->getIntegerForKey("usrGotconisTime"))
        {
            GotconisTime=NowcoinsTime;
            userDefault->setIntegerForKey("usrGotconisTime",GotconisTime);//∏’Ω¯»Î≥°æ∞
            userDefault->flush();
        }
        //compute diff of the nowtime and the gmtime
        //activeDaojishiTime();
        GotconisTime=userDefault->getIntegerForKey("usrGotconisTime");
        jishiqi=new GlobalTime();
        jishiqi->activeDaojishiTime();
        lable_daojishi->setString("");
        lable_daojishi->setFontSize(30);
        //lable_daojishi->setAnchorPoint(ccp(0.2,0.5));
    }
    //     struct tm  xmas = { 0, 0, 8, 1, 1, 112 }; // 01-Feb-2003 08:00:00 GTM ø™ º
    //     time_t start = mktime( &xmas ) ;
    //     CCLOG("UTC:%d\n",start);
    //
    //     time_t ltime ;
    //     time(&ltime);
    //
    //     CCLOG( "time and date:\t %s\n", ctime( &ltime ) );
    
    
    //     Reader reader;
    //     Value val;
    //
    //    //jsondata->insert(jsondata.begin(),buffer->begin(),buffer->end());
    //     if (reader.parse(jsondata,val))
    //     {
    //         if (!val["Date"].isNull())
    //         {
    //            string a=val["Date"].asString();
    //             CCLOG("date: %s",a);
    //         }
    //
    //     }
    
}

void MapChoose::spriteremoveFromParent(CCNode *pSender)
{
    
    CCMenuItemImage *s=(CCMenuItemImage *)pSender;
    if(s->getTag()==freeconistag)
    {
        //Playyinxiao
        //         qian+=typecoins[this->getMonType()]*100;
        //
        //         userDefault->setDoubleForKey("usrqian",qian);
        //         userDefault->flush();
        //         int guankanum=this->getParent()->getTag();
        //         if (guankanum==guanka1_tag)
        //         {
        //             ((HelloWorld*)(this->getParent()))->activeqian();
        //         }
        
        s->stopAllActions();
        s->removeFromParentAndCleanup(true);
    }
    
    else
    {
        s->stopAllActions();
        s->removeFromParentAndCleanup(true);
    }
    
}


void MapChoose::menuStoreCallback(CCObject* pSender)
{
    Playyinxiao::play_anjian();
    StoreDialogLayer* GoStoreDialogLayer=StoreDialogLayer::create();
    if(GoStoreDialogLayer)
    {
        //CCDirector::sharedDirector()->pause();// ‘›Õ£”Œœ∑
        //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
        //pauseGameDialogLayer->setPosition(getWinCenter());
        GoStoreDialogLayer->setPosition(CCPointZero);
        // CCMoveBy *layermove=CCMoveBy::create(3,ccp(50,0));
        //CCActionInterval* storeAction=CCSequence::create(layermove,NULL);
        
        CCSprite* pbg= CCSprite::create("zhegaibj.png");
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        pbg->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
        pbg->setAnchorPoint(ccp(0.5,0.5));
        pbg->setPosition(getWinCenter());
        //bg->addChild(pbg,100);
        this->addChild(pbg,100);
        pbg->setTag(zhegaitag);
        
        
        // bg->addChild(GoStoreDialogLayer,100);
        this->addChild(GoStoreDialogLayer,100);
    }
    
}
void MapChoose::jingyanset()
{
    if (jingyandengji<=maxdengji-1)
    {
        
        //jingyan+=yajin;
        //            if (jingyan>=dengjishuzu[maxdengji])
        //            {
        //                jingyan=dengjishuzu[maxdengji];
        //                jingyanpt->setPercentage(100);
        //            }
        //            else if(jingyan<dengjishuzu[maxdengji])
        //                if(jingyan<dengjishuzu[maxdengji])
        //               {
        // //CCProgressTimer* pt=(CCProgressTimer*)this->getChildByTag(100);
        ////float now=jingyanpt->getPercentage();
        ////jingyanpt->setPercentage(100.0/jingyan+now);//’‚—˘ø…“‘ πµ√Ω¯∂»Ãıø¥∆¿¥“ªø™ º∫‹øÏ£¨  ∫œº”‘ÿ◊ ‘¥µƒ ±∫Ú”√
        
        if(jingyan>=dengjishuzu[jingyandengji+1])
        {
            jingyandengji++;
            jingyanpt->setPercentage((jingyan-dengjishuzu[jingyandengji])*100/(dengjishuzu[jingyandengji+1]-dengjishuzu[jingyandengji]));
            
        }
        else
        {
            //jingyanpt->setPercentage(100);
            jingyanpt->setPercentage((jingyan-dengjishuzu[jingyandengji])*100/(dengjishuzu[jingyandengji+1]-dengjishuzu[jingyandengji]));
        }
        // }
        
    }
    else
    {
        
        if (jingyan>=dengjishuzu[maxdengji+1])
        {
            jingyan=dengjishuzu[maxdengji+1];
            jingyanpt->setPercentage(100);
        }
        else
        {
            jingyanpt->setPercentage((jingyan-dengjishuzu[jingyandengji])*100/(dengjishuzu[jingyandengji+1]-dengjishuzu[jingyandengji]));
        }
        
    }
    
    userDefault->setIntegerForKey("usrjingyandengji",jingyandengji);
    userDefault->setIntegerForKey("usrjingyan",jingyan);
    userDefault->flush();
}
// void MapChoose::kaimen(int num)
// {
//     int pageNum=num;
//     CCOrbitCamera *camera1=CCOrbitCamera::create(1, 1, 0, 0, 80, 0,0);
//     CCActionInterval *kaimenaction1=CCSequence::create(camera1,camera1->reverse(),NULL);
//     (CCSprite *)(layer->getChildByTag(300+pageNum*10))->runAction(kaimenaction1);
//
//     CCOrbitCamera *camera2=CCOrbitCamera::create(1, 1, 0, 0, -80, 0, 0);
//     CCActionInterval *kaimenaction2=CCSequence::create(camera2,camera2->reverse(),NULL);
//     (CCSprite *)(layer->getChildByTag(300+pageNum*10+1))->runAction(kaimenaction2);
//
// }
void MapChoose::menuZuoCallback(CCObject* pSender)
{
    Playyinxiao::play_anjian();
    float offsetjulitemp=scrollView->getContentOffset().y+getWinSize().height*(pageNum-1);
    if (offsetjulitemp==0)
    {
        CCSpriteFrameCache *cache =  CCSpriteFrameCache::sharedSpriteFrameCache();
        CCSprite *point = (CCSprite *)(pmenu->getParent()->getChildByTag(100+pageNum));
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point01.png"));
        pageNum--;
        if (pageNum <=1)
        {
            pageNum = 1;
            pZuoItem->setVisible(false);
            //pZuoItem->setEnabled(false);
        }
        else if(pageNum >= (GuankaNum+1))
        {
            pageNum =(GuankaNum+1);
            pYouItem->setVisible(false);
        }
        else if(pageNum<(GuankaNum+1)&&pageNum>1)
        {
            pZuoItem->setVisible(true);
            pYouItem->setVisible(true);
        }
        point = (CCSprite *)(pmenu->getParent()->getChildByTag(100+pageNum));
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point02.png"));
        
        CCSize size =CCDirector::sharedDirector()->getVisibleSize();
        //CCPoint  adjustPos = ccp(-size.width*(pageNum-1),0);
        CCPoint  adjustPos = ccp(0,-size.height*(pageNum-1));
        //CCLOG("size.width= %f ,pagenum= %d, djustPos.x=%f",size.width,pageNum,adjustPos.x);
        scrollView->setContentOffset(adjustPos, true);
        //kaimen(pageNum);
    }
    
}

void MapChoose::menuYouCallback(CCObject* pSender)
{
    Playyinxiao::play_anjian();
    float offsetjulitemp=scrollView->getContentOffset().y+getWinSize().height*(pageNum-1);
    //∑¿÷πŒÛ≤Ÿ◊˜£¨”÷µ„ª˜”“ª¨∂Ø‘Ï≥…√ø¥Œ“∆∂Ø¡Ω∏ˆ
    if (offsetjulitemp==0)
    {
        
        CCSpriteFrameCache *cache =  CCSpriteFrameCache::sharedSpriteFrameCache();
        CCSprite *point = (CCSprite *)(pmenu->getParent()->getChildByTag(100+pageNum));
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point01.png"));
        pageNum++;
        if (pageNum <=1)
        {
            pageNum = 1;
            pZuoItem->setVisible(false);
        }
        else if(pageNum >= (GuankaNum+1))
        {
            pageNum =GuankaNum+1;
            pYouItem->setVisible(false);
        }
        else if(pageNum<(GuankaNum+1)&&pageNum>1)
        {
            pZuoItem->setVisible(true);
            pYouItem->setVisible(true);
        }
        point = (CCSprite *)(pmenu->getParent()->getChildByTag(100+pageNum));
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point02.png"));
        
        CCSize size =CCDirector::sharedDirector()->getVisibleSize();
        //CCPoint  adjustPos = ccp(-size.width*(pageNum-1),0);
        CCPoint  adjustPos = ccp(0,-size.height*(pageNum-1));
        // CCLOG("size.width= %f ,pagenum= %d, djustPos.x=%f",size.width,pageNum,adjustPos.x);
        scrollView->setContentOffset(adjustPos, true);
        //kaimen(pageNum);
    }
    
}

void MapChoose::menuSetCallback(CCObject* pSender)
{
    
    
    ShezhiLayer* ShezhiLayer=ShezhiLayer::create();
    if(ShezhiLayer){
        ShezhiLayer->setPosition(CCPointZero);
        this->addChild(ShezhiLayer,7);
    }
}

void  MapChoose::menuCallback(CCObject* pSender)
{
    
    //  CCSize size=getWinSize();
    //float offsetjulitemp=scrollView->getContentOffset().y+size.height*(pageNum-2);
    //CCLOG("offsetjulitemp=%f,scrollView->getContentOffset().y=%f size.height=%f, -size.height*(pageNum-1)=%f",offsetjulitemp,scrollView->getContentOffset().y,size.height,-size.height*(pageNum-1));
    CCMenuItemImage *itemguanka=(CCMenuItemImage *)pSender;
    if ((itemguanka->getTag()-200==0)||(itemguanka->getTag()-200==5))
    {
        return;
    }
    if (offsetjuli>-10&&offsetjuli<10)
    {
        
        
        //CCLayerColor *layer = CCLayerColor::create(ccc4(255,0,0,255), 640, 960);//Õ∆ºˆ π”√∆¡±Œ≤„
        
        Playyinxiao::play_anjian();
        LoadingScene *layer=LoadingScene::create();
        CCDirector::sharedDirector()->setNotificationNode(layer);//“™∑≈‘⁄≥°æ∞≥ı ºªØ÷Æ«∞°£≤ª»ªΩ¯»Î≥°æ∞£¨loadªπ «‘⁄
        //(CCDirector::sharedDirector()->getNotificationNode())->onEnter();
        //CCLOG("CCDirector::sharedDirector()->getNotificationNode()->isRunning()=%d",CCDirector::sharedDirector()->getNotificationNode()->isRunning());
        CCDirector::sharedDirector()->drawScene();
        //CCScene *pScene;
        CCScene *pScene;
        Playyinxiao::stopmusic();
        
        
        
        
        if (itemguanka->getTag()-200==1)
        {
            lujing="plist/gk1";
            searchPath.push_back(lujing);
            //CCLOG("searchPath.size()=%d",searchPath.size());
            CCFileUtils::sharedFileUtils()->setSearchPaths(searchPath);
            searchPath.clear();
            oldchangjing=changjing;
            changjing=1;
            loadchangjingdata();
            pScene=HelloWorld::scene();
            CCDirector::sharedDirector()->replaceScene(pScene);
            
        }
        else if (itemguanka->getTag()-200==2)
        {
            lujing="plist/gk2";
            //lujing="gk2";
            searchPath.push_back(lujing);
            // CCLOG("searchPath.size()=%d",searchPath.size());
            CCFileUtils::sharedFileUtils()->setSearchPaths(searchPath);
            searchPath.clear();
            oldchangjing=changjing;
            changjing=2;
            loadchangjingdata();
            pScene=HelloWorld::scene();
            CCDirector::sharedDirector()->replaceScene(pScene);
            //pScene=HelloWorld_gk2::scene();
        }
        else if (itemguanka->getTag()-200==3)
        {
            lujing="plist/gk3";
            searchPath.push_back(lujing);
            CCFileUtils::sharedFileUtils()->setSearchPaths(searchPath);
            searchPath.clear();
            oldchangjing=changjing;
            changjing=3;
            loadchangjingdata();
            pScene=HelloWorld::scene();
            CCDirector::sharedDirector()->replaceScene(pScene);
            //pScene=HelloWorld_gk2::scene();
        }
        else if (itemguanka->getTag()-200==4)
        {
            lujing="plist/gk4";
            searchPath.push_back(lujing);
            CCFileUtils::sharedFileUtils()->setSearchPaths(searchPath);
            searchPath.clear();
            oldchangjing=changjing;
            changjing=4;
            loadchangjingdata();
            pScene=HelloWorld::scene();
            CCDirector::sharedDirector()->replaceScene(pScene);
            //pScene=HelloWorld_gk2::scene();
        }
        
        
    }
    
    
}

void MapChoose::scrollViewDidScroll(cocos2d::extension::CCScrollView *view)
{
    
}

void MapChoose::scrollViewDidZoom(cocos2d::extension::CCScrollView *view)
{
}

void MapChoose::onEnterTransitionDidFinish()
{
    CCLayer::onEnterTransitionDidFinish();
    if (oldchangjing==0)
    {
        //Playyinxiao::preload();
       
            // pageNum =1;
            pageNum = fmin(1+jingyandengji/5,GuankaNum);//1
            
            if ([[GameKitHelper sharedGameKitHelper]gameCenterAvailable])
            {
                
                if ([GKLocalPlayer localPlayer].authenticated == YES) {
                    //[[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:nil];
                    //显示排行榜
                    
                    [[GameKitHelper sharedGameKitHelper] showLeaderboard];//GameCenter
                }
            }
            
        
    }
    else
    {
        //  CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFramesFromFile("pic_gk1.plist");
        //œ¬√ÊŒ™ µº  π”√µƒ∑≈µÙ◊ ‘¥£¨“ÚŒ™gk3ªπ√ª◊ˆ∫√£¨‘›≤ª π”√
        //        CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFramesFromFile("pic_gk1_1.plist");
        //        CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFramesFromFile("pic_gk1_2.plist");
        //        CCTextureCache::sharedTextureCache()->removeTextureForKey("pic_gk1_1.png");
        //        CCTextureCache::sharedTextureCache()->removeTextureForKey("pic_gk1_2.png");
        CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFrames();
        CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFramesFromFile(CCString::createWithFormat("pic_gk%d_1.plist", oldchangjing)->getCString());
        CCSpriteFrameCache::sharedSpriteFrameCache()->removeSpriteFramesFromFile("pic_xian_1.plist");
        CCTextureCache::sharedTextureCache()->removeAllTextures();
        //CCTextureCache::sharedTextureCache()->removeUnusedTextures();
        
        
        //->addImage(CCString::createWithFormat("%s/button_start_normal.png", tishistring)->getCString());
        CCSpriteFrameCache *cache =  CCSpriteFrameCache::sharedSpriteFrameCache();
        
        cache->addSpriteFrame(CCSpriteFrame::create("Help_Point01.png",CCRectMake(0,0,20,20)),"Help_Point01.png");
        cache->addSpriteFrame(CCSpriteFrame::create("Help_Point02.png",CCRectMake(0,0,20,20)),"Help_Point02.png");
        //CCTextureCache::sharedTextureCache()->dumpCachedTextureInfo();
        
        
        // CocosDenshion::SimpleAudioEngine::sharedEngine()->end();
        
    }
}
void MapChoose::onEnter()
{
    CCLayer::onEnter();
    CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(this, -128, false);
    
    
}
void MapChoose::onExit()
{
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
    labelbm->release();
    CCLayer::onExit();
    
    //CocosDenshion::SimpleAudioEngine::sharedEngine()->unloadEffect(jinbi_m);
    //CocosDenshion::SimpleAudioEngine::sharedEngine()->end();
    
}


bool MapChoose::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    sethuadong(true);
    touchPoint = pTouch->getLocation();
    scrollPoint=scrollView->getContentOffset();
    return true;
}

void MapChoose::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    
    CCPoint nowPoint = pTouch->getLocation();
    //gensui(nowPoint.x-touchPoint.x);
    //CCLOG("pZuoItem->isSelected()=%d,pYouItem->isSelected()=%d",pZuoItem->isSelected(),pYouItem->isSelected());
    if (!pZuoItem->isSelected()&&!pYouItem->isSelected())
    {
        gensui(nowPoint.y-touchPoint.y);
    }
    
    
    
}

void MapChoose::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    
    //sethuadong()
    CCPoint endPoint = pTouch->getLocation();
    //adjustScrollView(endPoint.x-touchPoint.x);
    offsetjuli=endPoint.y-touchPoint.y;
    //CCLOG("offsetjuli=%f",offsetjuli);
    adjustScrollView(offsetjuli);
    //CCLOG("endPoint.y-touchPoint.y=%f",endPoint.y-touchPoint.y);
    
}

void MapChoose::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    CCPoint endPoint = pTouch->getLocation();
    offsetjuli=endPoint.y-touchPoint.y;
    adjustScrollView(offsetjuli);
    
}

void MapChoose::sethuadong(bool huadong)
{
    huadongtag=huadong;
}

void MapChoose::adjustScrollView(float offset)
{
    if (offset<10&&offset>-10)
    {
        
    }
    else
    {
        
        CCSpriteFrameCache *cache =  CCSpriteFrameCache::sharedSpriteFrameCache();
        CCSprite *point = (CCSprite *)this->getChildByTag(100+pageNum);
        
        
        cocos2d::CCSpriteFrame *pNewFrame=cache->spriteFrameByName("Help_Point01.png");
        //CCLOG(" point-retainCount()=%d", point->retainCount());
        point->setDisplayFrame(pNewFrame);
        // point->setDisplayFrame(cache->spriteFrameByName("Help_Point01.png"));
        if (offset<0)
        {
            pageNum ++;
            
        }
        else if(offset>0)
        {
            pageNum --;
        }
        
        if (pageNum <=1)
        {
            pageNum = 1;
            pZuoItem->setVisible(false);
        }
        else if(pageNum >= (GuankaNum+1))
        {
            pageNum =(GuankaNum+1);
            pYouItem->setVisible(false);
        }
        else if (pageNum<(GuankaNum+1)&&pageNum>1)
        {
            pZuoItem->setVisible(true);
            pYouItem->setVisible(true);
        }
        point = (CCSprite *)this->getChildByTag(100+pageNum);
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point02.png"));
    }
    CCSize size =CCDirector::sharedDirector()->getVisibleSize();
    //CCPoint  adjustPos = ccp(-size.width*(pageNum-1),0);
    CCPoint  adjustPos = ccp(0,-size.height*(pageNum-1));
    //CCLOG("size.width= %f ,pagenum= %d, djustPos.x=%f",size.width,pageNum,adjustPos.x);
    scrollView->setContentOffset(adjustPos, true);////////
    //kaimen(pageNum);
    sethuadong(false);
    
    
}


void MapChoose::gensui(float offset)
{
    
    //scrollView->setContentOffset(ccp(offset,0), true);
    //scrollView->setContentOffset(ccpAdd(ccp(offset,0),scrollPoint));
    
    if (offset<10&&offset>-10)
    {
        
    } 
    else
    {
        scrollView->setContentOffset(ccpAdd(ccp(0,offset),scrollPoint));
    }
    
}

CCSize MapChoose::getWinSize(){
    return	CCDirector::sharedDirector()->getVisibleSize();
}
CCPoint MapChoose::getWinOrigin(){
    return CCDirector::sharedDirector()->getVisibleOrigin();
}
CCPoint MapChoose::getWinCenter(){
    return	ccp(getWinSize().width/2+getWinOrigin().x,getWinSize().height/2+getWinOrigin().y);
}
