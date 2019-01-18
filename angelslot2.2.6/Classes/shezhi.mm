#include "shezhi.h"
#include "mapchoose.h"
#include "ResouceDefine.h"
#include "HelloWorldScene.h"
#include "playyinxiao.h"
#include "storelayer.h"
#include "cocos-ext.h"
using namespace cocos2d;
/***** 
http://blog.csdn.net/onerain88/article/details/7608496
≤Œøº◊ ¡œ
*****/
ShezhiLayer::ShezhiLayer(void)
{
}


ShezhiLayer::~ShezhiLayer(void)
{
}
bool ShezhiLayer::init()
{
	bool bRet = false;

	do {
		CC_BREAK_IF(!BaseLayer::init());
        CCTextureCache::sharedTextureCache()->addImage("zhegaibj.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/shezhibj.png");
//         CCTextureCache::sharedTextureCache()->addImage("gmme/btn_home_up.png");
//         CCTextureCache::sharedTextureCache()->addImage("gmme/btn_home_down.png");
//         CCTextureCache::sharedTextureCache()->addImage("gmme/btn_resume_down.png");
//         CCTextureCache::sharedTextureCache()->addImage("gmme/btn_resume_up.png");
//         CCTextureCache::sharedTextureCache()->addImage("gmme/btn_retry_down.png");
//         CCTextureCache::sharedTextureCache()->addImage("gmme/btn_rety_up.png");


		CC_BREAK_IF(!this->setUpdateView());		

		bRet = true;
	} while (0);

	return bRet;
}


bool ShezhiLayer::setUpdateView()
{
	bool isRet=false;
	do 
	{

		 CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
         float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
         pbg->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
        CC_BREAK_IF(!pbg);
		pbg->setAnchorPoint(ccp(0.5,0.5));
		pbg->setPosition(getWinCenter());
		this->addChild(pbg);
        CCNode *layer = CCNode::create();
        layer->setPosition(CCPointZero);
        this->addChild(layer);
         double layer_width = 0;
        CCSprite* shezhipic= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhibj.png"));
        shezhipic->setAnchorPoint(ccp(0.5,0.5));
        shezhipic->setPosition(getWinCenter());
        layer->addChild(shezhipic);
        layer_width+=shezhipic->getContentSize().width;
        layer->setContentSize(CCSizeMake(layer_width, 0));  
        
        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
            "gmme/chuangkou_guanbi.png",
            "gmme/chuangkou_guanbi.png",
            this,
            menu_selector(ShezhiLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        pCloseItem->setAnchorPoint(ccp(0.85,0.85));
        pCloseItem->setPosition(ccp(shezhipic->getTextureRect().getMaxX(),shezhipic->getTextureRect().getMaxY()));
        //ø™πÿ∞¥≈•

        gcMUSICSTATE=userDefault->getIntegerForKey("usrgcMUSICSTATE");
        gcEFFECTSTATE=userDefault->getBoolForKey("usrgcEFFECTSTATE");
        CCControlSwitch *switchMusicControl = CCControlSwitch::create
            (
            CCSprite::create("switch-mask.png"),
            CCSprite::create("switch-on.png"),
            CCSprite::create("switch-off.png"),
            CCSprite::create("switch-thumb.png"),
            CCLabelTTF::create("On", "Arial-BoldMT", 16),
            CCLabelTTF::create("Off", "Arial-BoldMT", 16)
            );
         switchMusicControl->setTouchPriority(-129);
         if (gcMUSICSTATE==0)
         {
             switchMusicControl->setOn(true);
         } 
         else if(gcMUSICSTATE==2||gcMUSICSTATE==1)
         {
             switchMusicControl->setOn(false);
                         
         }
    

       // switchMusicControl->setPosition(ccp(getWinCenter().x-shezhipic->getTextureRect().getMaxX()/4,getWinCenter().y+shezhipic->getTextureRect().getMaxY()/4));       
        switchMusicControl->setPosition(ccp(shezhipic->getTextureRect().getMaxX()*2/3,shezhipic->getTextureRect().getMaxY()*3/5));
        switchMusicControl->setScale(1.5);
        shezhipic->addChild(switchMusicControl,100);
        switchMusicControl->addTargetWithActionForControlEvents(this, cccontrol_selector(ShezhiLayer::callbackMusicSwitch), CCControlEventValueChanged);
        
        callbackMusicSwitch(switchMusicControl, CCControlEventValueChanged);

             CCControlSwitch * switchEffectControl = CCControlSwitch::create
                 (
                 CCSprite::create("switch-mask - Copy.png"),
                 CCSprite::create("switch-on - Copy.png"),
                 CCSprite::create("switch-off - Copy.png"),
                 CCSprite::create("switch-thumb - Copy.png"),
                 CCLabelTTF::create("On", "Arial-BoldMT", 16),
                 CCLabelTTF::create("Off", "Arial-BoldMT", 16)
                 );
             switchEffectControl->setTouchPriority(-129);
             if (gcEFFECTSTATE)
             {
                 switchEffectControl->setOn(true);
             } 
             else
             {
                 switchEffectControl->setOn(false);  
             }
           

            // switchEffectControl->setPosition(ccp(getWinCenter().x+shezhipic->getTextureRect().getMaxX()/4,getWinCenter().y+shezhipic->getTextureRect().getMaxY()/4));
             switchEffectControl->setPosition(ccp(shezhipic->getTextureRect().getMaxX()*2/3,shezhipic->getTextureRect().getMaxY()*3/10));
             switchEffectControl->setScale(1.5);
             shezhipic->addChild(switchEffectControl,100);
             switchEffectControl->addTargetWithActionForControlEvents(this, cccontrol_selector(ShezhiLayer::callbackEffectSwitch), CCControlEventValueChanged);
             
             callbackEffectSwitch(switchEffectControl, CCControlEventValueChanged);


		m_pMenu = CCMenu::create(pCloseItem, NULL);
		CC_BREAK_IF(!m_pMenu);
		m_pMenu->setPosition(CCPointZero);
		shezhipic->addChild(m_pMenu);
        
        const char *pLabelStrBGMUSIC = ((CCString*)(loacalstrings->objectForKey("bgmusic")))->m_sString.c_str();
        CCLabelTTF* pLabeMusic = CCLabelTTF::create(pLabelStrBGMUSIC, "Arial", 30/bigsmall_factor);
        //pLabeMusic->setColor(ccc3(0,0,0))
        CC_BREAK_IF(! pLabeMusic);     
        pLabeMusic->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/3, shezhipic->getTextureRect().getMaxY()*3/5));
        shezhipic->addChild(pLabeMusic, 1);
        const char *pLabelStrsound = ((CCString*)(loacalstrings->objectForKey("sound")))->m_sString.c_str();
        CCLabelTTF* pLabeEffect = CCLabelTTF::create(pLabelStrsound, "Arial", 30/bigsmall_factor);
        CC_BREAK_IF(! pLabeEffect);     
        pLabeEffect->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/3, shezhipic->getTextureRect().getMaxY()*3/10));
        shezhipic->addChild(pLabeEffect, 1);

		isRet=true;
	} while (0);
	return isRet;

}

void ShezhiLayer::callbackMusicSwitch(CCObject* pSender, CCControlEvent controlEvent)
{
    Playyinxiao::play_anjian();
    CCControlSwitch* pSwitch = (CCControlSwitch*)pSender;
    if (pSwitch->isOn())
    {
       /* m_pDisplayValueLabel->setString("On");*/
       if (userDefault->getIntegerForKey("usrgcMUSICSTATE")==2)
       {
           userDefault->setIntegerForKey("usrgcMUSICSTATE",0);  
           
           CocosDenshion::SimpleAudioEngine::sharedEngine()->resumeBackgroundMusic();  
           
           userDefault->flush();
       }
       else if (userDefault->getIntegerForKey("usrgcMUSICSTATE")==1)
       {
           userDefault->setIntegerForKey("usrgcMUSICSTATE",0);  

          Playyinxiao::playmusic(); 

           userDefault->flush();
       }

    } 
    else
    {
        if (!userDefault->getIntegerForKey("usrgcMUSICSTATE"))
        {

        /*m_pDisplayValueLabel->setString("Off");*/
        userDefault->setIntegerForKey("usrgcMUSICSTATE",2);
        //CocosDenshion::SimpleAudioEngine::sharedEngine()->stopBackgroundMusic();       
        CocosDenshion::SimpleAudioEngine::sharedEngine()->pauseBackgroundMusic();      
        userDefault->flush();
       }
    }
}
void ShezhiLayer::callbackEffectSwitch(CCObject* pSender, CCControlEvent controlEvent)
{
    //Playyinxiao::play_anjian();
    CCControlSwitch* pSwitch = (CCControlSwitch*)pSender;
    if (pSwitch->isOn())
    {
        /* m_pDisplayValueLabel->setString("On");*/
        userDefault->setBoolForKey("usrgcEFFECTSTATE",true);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->resumeAllEffects();
        userDefault->flush();
    } 
    else
    {
        /*m_pDisplayValueLabel->setString("Off");*/
        userDefault->setBoolForKey("usrgcEFFECTSTATE",false);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->stopAllEffects();
        userDefault->flush();
    }
}


void ShezhiLayer::onEnter()
{
	BaseLayer::onEnter();
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
		this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝  
		-128, //”≈œ»º∂  
		true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ  
}

void ShezhiLayer::onExit()
{
	BaseLayer::onExit();
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool ShezhiLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

	m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

	return true;
}

void ShezhiLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchMoved(pTouch, pEvent);
	}
}

void ShezhiLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}

void ShezhiLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}


void ShezhiLayer::homeMenuItemCallback(cocos2d::CCObject *pSender){
	
	CCScene* se=MapChoose::scene();
	CCDirector::sharedDirector()->replaceScene(CCTransitionMoveInL::create(0.5,se));
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
	

}
void ShezhiLayer::retyMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
}
void ShezhiLayer::resumeMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
}
void ShezhiLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    //CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);
    Playyinxiao::play_anjian();
    this->removeFromParentAndCleanup(true);
}
//


tishiLayer::tishiLayer(void)
{
}


tishiLayer::~tishiLayer(void)
{
}
bool tishiLayer::init()
{
    bool bRet = false;

    do {
        CC_BREAK_IF(!BaseLayer::init());
        CCTextureCache::sharedTextureCache()->addImage("zhegaibj.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/shezhibj.png");


        CC_BREAK_IF(!this->setUpdateView());		

        bRet = true;
    } while (0);

    return bRet;
}


bool tishiLayer::setUpdateView()
{
    bool isRet=false;
    do 
    {

        CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        pbg->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
        CC_BREAK_IF(!pbg);
        pbg->setAnchorPoint(ccp(0.5,0.5));
        pbg->setPosition(getWinCenter());
        this->addChild(pbg);
        CCNode *layer = CCNode::create();
        layer->setPosition(CCPointZero);
        this->addChild(layer);
        double layer_width = 0;
        CCSprite* shezhipic= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhibj.png"));
        shezhipic->setAnchorPoint(ccp(0.5,0.5));
        shezhipic->setPosition(getWinCenter());
        layer->addChild(shezhipic);
        layer_width+=shezhipic->getContentSize().width;
        layer->setContentSize(CCSizeMake(layer_width, 0));  

        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
            "gmme/chuangkou_guanbi.png",
            "gmme/chuangkou_guanbi.png",
            this,
            menu_selector(tishiLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        pCloseItem->setAnchorPoint(ccp(0.85,0.85));
        pCloseItem->setPosition(ccp(shezhipic->getTextureRect().getMaxX(),shezhipic->getTextureRect().getMaxY()));
        //ø™πÿ∞¥≈•

        CCMenuItemImage *pGoItem = CCMenuItemImage::create(
            "store/go.png",
            "store/go-select.png",
            this,
            menu_selector(tishiLayer::menuGoCallback));
        CC_BREAK_IF(! pGoItem);
        pGoItem->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shezhipic->getTextureRect().getMidY()/10));
        pGoItem->setAnchorPoint(ccp(0.5,-0.3));
        
        const char *ok_Str = ((CCString*)(loacalstrings->objectForKey("ok")))->m_sString.c_str();
        CCLabelTTF *pLabelok = CCLabelTTF::create(ok_Str, "Arial", 32/bigsmall_factor);//Helvetica 25
        pLabelok->setColor(ccc3(26,69,74));
        pLabelok->setPosition(ccp(pGoItem->getContentSize().width/2,pGoItem->getContentSize().height/2));
        pGoItem->addChild(pLabelok,2);
        
        m_pMenu = CCMenu::create(pCloseItem,pGoItem ,NULL);
        CC_BREAK_IF(!m_pMenu);
        m_pMenu->setPosition(CCPointZero);
        shezhipic->addChild(m_pMenu);
        const char *pLabelStrtishi = ((CCString*)(loacalstrings->objectForKey("nothave")))->m_sString.c_str();
        CCLabelTTF* pLabeMusic = CCLabelTTF::create(pLabelStrtishi, "Arial", 30/bigsmall_factor);
     

        //pLabeMusic->setColor(ccc3(0,0,0))
        CC_BREAK_IF(! pLabeMusic);     
        pLabeMusic->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2, shezhipic->getTextureRect().getMaxY()*3/5));
        shezhipic->addChild(pLabeMusic, 1);

        isRet=true;
    } while (0);
    return isRet;

}



void tishiLayer::onEnter()
{
    BaseLayer::onEnter();
    CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
        this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝  
        -128, //”≈œ»º∂  
        true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ  
}

void tishiLayer::onExit()
{
    BaseLayer::onExit();
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool tishiLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

    m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

    return true;
}

void tishiLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchMoved(pTouch, pEvent);
    }
}

void tishiLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchEnded(pTouch, pEvent);
        m_bTouchedMenu = false;
    }
}

void tishiLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchEnded(pTouch, pEvent);
        m_bTouchedMenu = false;
    }
}


void tishiLayer::menuGoCallback(cocos2d::CCObject *pSender)
{
    //CCDirector::sharedDirector()->resume();
    StoreDialogLayer* StoreLayer=StoreDialogLayer::create();
    if(StoreLayer)
    {		
        // CCDirector::sharedDirector()->pause();// ‘›Õ£”Œœ∑
        //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
        //pauseGameDialogLayer->setPosition(CCPointZero);
        CCSprite* pbg= CCSprite::create("zhegaibj.png");
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        pbg->setScaleY(shanglashen);//±≥æ∞Õº¿≠…Ï
        pbg->setAnchorPoint(ccp(0.5,0.5));
        pbg->setPosition(getWinCenter());
        this->getParent()->addChild(pbg,100);

        pbg->setTag(zhegaitag);
        StoreLayer->setPosition(CCPointZero);
        //FreeDialogLayer->freenum=freexuanzhuantemp;;

        this->getParent()->addChild(StoreLayer,100);

    }
    this->removeFromParentAndCleanup(true);
}

void tishiLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    //CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);

    this->removeFromParentAndCleanup(true);
}

//newhand  新?手o?
NewhandtishiLayer::NewhandtishiLayer(void)
{
}


NewhandtishiLayer::~NewhandtishiLayer(void)
{
}
bool NewhandtishiLayer::init()
{
    bool bRet = false;
    
    do {
        CC_BREAK_IF(!BaseLayer::init());
        CCTextureCache::sharedTextureCache()->addImage("zhegaibj.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/shezhibj.png");
        
        
        CC_BREAK_IF(!this->setUpdateView());
        
        bRet = true;
    } while (0);
    
    return bRet;
}


bool NewhandtishiLayer::setUpdateView()
{
    bool isRet=false;
    do
    {
        
        MaxNewhandNum=7;
        NowNewhandNum=1;
        visibleSize = CCDirector::sharedDirector()->getVisibleSize();
        CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        pbg->setScaleY(shanglashen);//背à3景??图a?拉¤-伸|¨?
        CC_BREAK_IF(!pbg);
        pbg->setAnchorPoint(ccp(0.5,0.5));
        pbg->setPosition(getWinCenter());
        this->addChild(pbg);
        layer = CCNode::create();
        layer->setPosition(CCPointZero);
        this->addChild(layer);
        double layer_width = 0;
        CCSprite* shezhipic= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhibj.png"));
        shezhipic->setAnchorPoint(ccp(0.5,0.5));
        shezhipic->setPosition(getWinCenter());
        layer->addChild(shezhipic);
        layer_width+=shezhipic->getContentSize().width;
        layer->setContentSize(CCSizeMake(layer_width, 0));
        
        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
                                                              "gmme/chuangkou_guanbi.png",
                                                              "gmme/chuangkou_guanbi.png",
                                                              this,
                                                              menu_selector(NewhandtishiLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        pCloseItem->setAnchorPoint(ccp(0.85,0.85));
        pCloseItem->setPosition(ccp(shezhipic->getPositionX()+shezhipic->getTextureRect().getMaxX()/2,shezhipic->getPositionY()+shezhipic->getTextureRect().getMaxY()/2));
        //开a关?按???钮￡¤
        
        CCMenuItemImage *pGoItem = CCMenuItemImage::create(
                                                           "kongbai.png",
                                                           "kongbai.png",
                                                           this,
                                                           menu_selector(NewhandtishiLayer::menuGoCallback));
        //CC_BREAK_IF(! pGoItem);
        // pGoItem->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shezhipic->getTextureRect().getMidY()/10));
        //pGoItem->setAnchorPoint(ccp(0.5,-0.3));
        pGoItem->setScaleY(shanglashen);//背à3景??图a?拉¤-伸|¨?
        CC_BREAK_IF(!pGoItem);
        pGoItem->setAnchorPoint(ccp(0.5,0.5));
        pGoItem->setPosition(getWinCenter());
        //this->addChild(pGoItem);
        
        m_pMenu = CCMenu::create(pCloseItem,pGoItem ,NULL);
        CC_BREAK_IF(!m_pMenu);
        m_pMenu->setPosition(CCPointZero);
        layer->addChild(m_pMenu);
        const char *pLabelStrtishi = ((CCString*)(loacalstrings->objectForKey("newhand")))->m_sString.c_str();
        CCLabelTTF * pLabeNewhandtou = CCLabelTTF::create(pLabelStrtishi, "Arial", 35/bigsmall_factor);
        pLabeNewhandtou->setAnchorPoint(ccp(0.5,1.5));
        pLabeNewhandtou->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2, shezhipic->getTextureRect().getMaxY()));
        shezhipic->addChild(pLabeNewhandtou, 1);
        
        // const char *pLabelStrnewhand = ((CCString*)(loacalstrings->objectForKey("newhand")))->m_sString.c_str();
        const char *pLabelStrnewhand = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("newhand_%d", NowNewhandNum)->getCString())))->m_sString.c_str();
        
        pLabeNewhand = CCLabelTTF::create(pLabelStrnewhand, "Arial", 24/bigsmall_factor);
        pLabeNewhand->setAnchorPoint(ccp(0.5,0.8));
        //pLabeMusic->setColor(ccc3(0,0,0))
        CC_BREAK_IF(! pLabeNewhand);
        pLabeNewhand->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2, shezhipic->getTextureRect().getMaxY()*3/5));
        shezhipic->addChild(pLabeNewhand, 1);
        
        setNowItem();
        const char *pLabelStrtouch = ((CCString*)(loacalstrings->objectForKey("touchthescreen")))->m_sString.c_str();
        CCLabelTTF * pLabeNewhandtouch= CCLabelTTF::create(pLabelStrtouch, "Arial", 20/bigsmall_factor);
        pLabeNewhandtouch->setAnchorPoint(ccp(0.5,-1.5));
        pLabeNewhandtouch->setPosition(ccp(shezhipic->getTextureRect().getMaxX()*3/5, shezhipic->getTextureRect().getMinY()));
        shezhipic->addChild(pLabeNewhandtouch, 1);
        //((HelloWorld*)nowobject)->pMenu->setEnabled(false);
        if (userDefault->getBoolForKey("firstopen"))
        {
            userDefault->setBoolForKey("firstopen",false);
            userDefault->flush();
        }
        
        isRet=true;
    } while (0);
    return isRet;
    
}


void NewhandtishiLayer::setNowItem()
{
    if (layer->getChildByTag(888))
    {
        do
        {
            ((CCSprite *)layer->getChildByTag(888))->removeFromParentAndCleanup(true);
        } while (layer->getChildByTag(888));
    }
    if (NowNewhandNum==1)
    {
        CCSprite *button_start=CCSprite::createWithSpriteFrameName("button_start_normal.png");
        // button_start->setAnchorPoint(ccp(0.5,start_maodianY));
        // button_start->setPosition(ccp(visibleSize.width/2, 0));
        // CCLOG("x=%f,y=%f",((CCMenuItemSprite *)(((HelloWorld*)nowobject)->pStartItem))->getAnchorPoint().x,((CCMenuItemSprite *)(((HelloWorld*)nowobject)->pStartItem))->getAnchorPoint().y);
        //button_start->setAnchorPoint(((HelloWorld*)nowobject)->pStartItem->getAnchorPoint());
        //button_start->setPosition(((HelloWorld*)nowobject)->pStartItem->getPosition());
        button_start->setAnchorPoint(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_pstart_tag)->getAnchorPoint());
        button_start->setPosition(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_pstart_tag)->getPosition());
        button_start->setTag(888);
        layer->addChild(button_start);
    }
    else if(NowNewhandNum==2)
    {
        CCSprite *button_sub_normal=CCSprite::createWithSpriteFrameName("button_sub_normal.png");
        //          button_sub_normal->setAnchorPoint(ccp(0,0.5));
        //          button_sub_normal->setPosition(ccp(0,(visibleSize.height-shangheight-jingyanheight-kuanghoudu*2-kuangheight)/4));
        //             button_sub_normal->setAnchorPoint(((HelloWorld*)nowobject)->pSUBItem->getAnchorPoint());
        //             button_sub_normal->setPosition(((HelloWorld*)nowobject)->pSUBItem->getPosition());
        button_sub_normal->setAnchorPoint(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_psub_tag)->getAnchorPoint());
        button_sub_normal->setPosition(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_psub_tag)->getPosition());
        button_sub_normal->setTag(888);
        layer->addChild(button_sub_normal);
        CCSprite *button_add_normal=CCSprite::createWithSpriteFrameName("button_add_normal.png");
        //          button_add_normal->setAnchorPoint(ccp(Add_maodianX,0.5));
        //          button_add_normal->setPosition(ccp(backyajin->getPositionX()+backyajin->getContentSize().width,backyajin->getPositionY()));
        //          button_add_normal->setAnchorPoint(((HelloWorld*)nowobject)->pADDItem->getAnchorPoint());
        //          button_add_normal->setPosition(((HelloWorld*)nowobject)->pADDItem->getPosition());
        button_add_normal->setAnchorPoint(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_padd_tag)->getAnchorPoint());
        button_add_normal->setPosition(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_padd_tag)->getPosition());
        button_add_normal->setTag(888);
        layer->addChild(button_add_normal);
    }
    else if(NowNewhandNum==3)
    {
        CCSprite *button_Guess_normal=CCSprite::createWithSpriteFrameName("button_Guess_normal.png");
        //           button_Guess_normal->setAnchorPoint(((HelloWorld*)nowobject)->pGuessItem->getAnchorPoint());
        //           button_Guess_normal->setPosition(((HelloWorld*)nowobject)->pGuessItem->getPosition());
        button_Guess_normal->setAnchorPoint(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_pguess_tag)->getAnchorPoint());
        button_Guess_normal->setPosition(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_pguess_tag)->getPosition());
        button_Guess_normal->setTag(888);
        layer->addChild(button_Guess_normal);
    }
    else if(NowNewhandNum==4)
    {
        CCSprite *jiansu_anniu=CCSprite::createWithSpriteFrameName("jiansu_anniu.png");
        //         jiansu_anniu->setAnchorPoint(pJiansuItem->getAnchorPoint());
        //         jiansu_anniu->setPosition(pJiansuItem->getPosition());
        jiansu_anniu->setAnchorPoint(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_pjiansu_tag)->getAnchorPoint());
        jiansu_anniu->setPosition(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_pjiansu_tag)->getPosition());
        
        CCSprite* daojusprite=CCSprite::createWithSpriteFrameName("daoju_num.png");
        daojusprite->setAnchorPoint(ccp(1.2,1));
        daojusprite->setPosition(ccp(jiansu_anniu->getContentSize().width,jiansu_anniu->getContentSize().height));
        jiansu_anniu->addChild(daojusprite);
        char daojunumstring[5]={0};
        int daojunum=userDefault->getIntegerForKey("usrDaojuNum");
        sprintf(daojunumstring, "%d",daojunum);
        CCLabelTTF * newhandlableDaojuNum=CCLabelTTF::create(daojunumstring,"Arial",35/bigsmall_factor);
        newhandlableDaojuNum->setAnchorPoint(ccp(0.5,0.5));
        newhandlableDaojuNum->setPosition(ccp(daojusprite->getContentSize().width/2,daojusprite->getContentSize().height/2));
        daojusprite->addChild(newhandlableDaojuNum);
        jiansu_anniu->setTag(888);
        layer->addChild(jiansu_anniu);
    }
    else if(NowNewhandNum==5)
    {
        CCSprite *TableNormal=CCSprite::createWithSpriteFrameName("table.png");
        //         TableNormal->setAnchorPoint(((HelloWorld*)nowobject)->pTableItem->getAnchorPoint());
        //         TableNormal->setPosition(((HelloWorld*)nowobject)->pTableItem->getPosition());
        TableNormal->setAnchorPoint(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_ptable_tag)->getAnchorPoint());
        TableNormal->setPosition(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_ptable_tag)->getPosition());
        TableNormal->setTag(888);
        layer->addChild(TableNormal);
    }
    else if(NowNewhandNum==6)
    {
        
    }
    else if(NowNewhandNum==MaxNewhandNum)
    {
        CCSprite *button_start=CCSprite::createWithSpriteFrameName("button_start_normal.png");
        CCMenuItemSprite* pStartItem = CCMenuItemSprite::create(
                                              button_start,
                                              button_start,
                                              button_start,
                                              this,
                                              menu_selector(NewhandtishiLayer::menuGoCallback));
        pStartItem->setAnchorPoint(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_pstart_tag)->getAnchorPoint());
        pStartItem->setPosition(((HelloWorld*)nowobject)->pMenu->getChildByTag(menu_pstart_tag)->getPosition());
        pStartItem->setTag(888);
        m_pMenu->addChild(pStartItem);
        //((HelloWorld*)nowobject)->menuStartCallback(this);
        
        CCSprite* pguankatishi=CCSprite::create("jiantou.png");
        pguankatishi->setAnchorPoint(ccp(0.5,0));
        //pguankatishi->setPosition(getWinCenter());
        
        pguankatishi->setPosition(ccp(pStartItem->getContentSize().width/2,pStartItem->getContentSize().height));
        pStartItem->addChild(pguankatishi);
        //float jiantouX=pShijianItem->getPositionX()+pShijianItem->getContentSize().width/2;
        //float jiantouY=pShijianItem->getPositionY()+pShijianItem->getContentSize().height;
        CCActionInterval* actionMoveto1= CCMoveBy::create(0.4, ccp(0,15));
        //CCActionInterval* actionMoveto2= CCMoveTo::create(0.4,ccp(jiantouX,jiantouY));
        CCActionInterval *shangxia =CCRepeatForever::create(CCSequence::create(actionMoveto1,actionMoveto1->reverse(),NULL));
        pguankatishi->runAction(shangxia);
    }
}
void NewhandtishiLayer::onEnter()
{
    BaseLayer::onEnter();
    CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(
                                                                            this,//在¨2那?个?类¤¨¤中D实o|ì现?触?￡¤屏¨￠回?调ì??函?￥数oy
                                                                            -128, //优??先¨¨级?
                                                                            true);//触?￡¤摸t时o?à间?是o?否¤?被à?该?目?标à¨o截?获?
}

void NewhandtishiLayer::onExit()
{
    BaseLayer::onExit();
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool NewhandtishiLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    
    m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);
    
    return true;
}

void NewhandtishiLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchMoved(pTouch, pEvent);
    }
}

void NewhandtishiLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchEnded(pTouch, pEvent);
        m_bTouchedMenu = false;
    }
}

void NewhandtishiLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchEnded(pTouch, pEvent);
        m_bTouchedMenu = false;
    }
}


void NewhandtishiLayer::menuGoCallback(cocos2d::CCObject *pSender)
{

     NowNewhandNum++;
    if (NowNewhandNum==(MaxNewhandNum+1))
    {
        CCMenuItemSprite *itemobject=(CCMenuItemSprite *)pSender;
        if(itemobject->getTag()==888)
        {
            Playyinxiao::play_anjian();
            //NowNewhandNum++;
           
            setNowItem();
            ((HelloWorld*)nowobject)->menuStartCallback(this);
            this->removeFromParentAndCleanup(true);
        }
        else
        {
            NowNewhandNum--;
        }

    }
    else
    {
        Playyinxiao::play_anjian();
        //NowNewhandNum++;
        setNowItem();
        const char *pLabelStrnewhand = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("newhand_%d", NowNewhandNum)->getCString())))->m_sString.c_str();
        
        pLabeNewhand->setString(pLabelStrnewhand);
    }
    
    
    
}

void NewhandtishiLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    //CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);
    
    this->removeFromParentAndCleanup(true);
}

