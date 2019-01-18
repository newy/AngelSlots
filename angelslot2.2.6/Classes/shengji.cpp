#include "shengji.h"
#include "ResouceDefine.h"
#import "KTPlayC.h"
#include "playyinxiao.h"

using namespace cocos2d;
/*****
http://blog.csdn.net/onerain88/article/details/7608496
≤Œøº◊ ¡œ
*****/
ShengjiDialogLayer::ShengjiDialogLayer(void)
{
}


ShengjiDialogLayer::~ShengjiDialogLayer(void)
{
}
bool ShengjiDialogLayer::init()
{
	bool bRet = false;

	do {
		CC_BREAK_IF(!BaseLayer::init());
        CCTextureCache::sharedTextureCache()->addImage("zhegaibj.png");
         CCTextureCache::sharedTextureCache()->addImage("gmme/shengji_bj.png");
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


bool ShengjiDialogLayer::setUpdateView()
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
        CCSprite* shengjipic= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/shengji_bj.png"));
        shengjipic->setPosition(getWinCenter());
        this->addChild(shengjipic);
        const char *levelup_Str = ((CCString*)(loacalstrings->objectForKey("levelup")))->m_sString.c_str();
        CCLabelTTF *pLabellevelup = CCLabelTTF::create(levelup_Str, "Arial", 40/bigsmall_factor);//Helvetica 25
        pLabellevelup->setColor(ccc3(26,69,74));
        //pLabelmenu->setAnchorPoint(ccp(0.5,0.5));
        pLabellevelup->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()*0.91));
        shengjipic->addChild(pLabellevelup);
      

        int jingyandengji=userDefault->getIntegerForKey("usrjingyandengji");
        char jingyanstring[12] = {0};
        sprintf(jingyanstring, "%d",jingyandengji+1);
        CCLabelBMFont* labelbm=CCLabelBMFont::create(jingyanstring,"diy_38_cuitihei.fnt");
        labelbm->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()*0.77));
        labelbm->setScale(1.5);
        shengjipic->addChild(labelbm);
        std::string tishi;
        std::string tishi1 = ((CCString*)(loacalstrings->objectForKey("maxbet")))->m_sString.c_str();
        //std::string tishi1(" Max Bet !");
        char buf[10]= {0};
        sprintf(buf, "%d", yajinshuzu[(int)fmin(jingyandengji+4,maxdengji)]);
        tishi= buf;
        tishi+=tishi1;
        char tishistring[50] = {0};
        sprintf(tishistring, "%s",tishi.c_str());
        CCLabelTTF *pLabetishi=CCLabelTTF::create(tishistring,"Arial",35/bigsmall_factor);
        pLabetishi->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()*0.5));
        pLabetishi->setAnchorPoint(ccp(0,0.1));
        shengjipic->addChild(pLabetishi);
        
//         CCLabelTTF *pLabetishishare=CCLabelTTF::create("Share With Your Friends !","Arial",40/bigsmall_factor);
//         pLabetishishare->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()*0.3));
//         pLabetishishare->setAnchorPoint(ccp(0.5,0.3));
//         shengjipic->addChild(pLabetishishare);


//         CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
//             "btnclose.png",
//             "btnclose.png",
//             this,
//             menu_selector(ShengjiDialogLayer::menuCloseCallback));
//         CC_BREAK_IF(! pCloseItem);
//         pCloseItem->setPosition(ccp(shengjipic->getTextureRect().getMaxX(),shengjipic->getTextureRect().getMaxY()));
//         pCloseItem->setAnchorPoint(ccp(0.85,0.85));
        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
            "gmme/chuangkou_guanbi.png",
            "gmme/chuangkou_guanbi.png",
            this,
            menu_selector(ShengjiDialogLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        pCloseItem->setAnchorPoint(ccp(0.75,0.85));
        pCloseItem->setPosition(ccp(shengjipic->getTextureRect().getMaxX(),shengjipic->getTextureRect().getMaxY()*11/12));
        pCloseItem->setTag(111);
        
        const char *share_Str = ((CCString*)(loacalstrings->objectForKey("share")))->m_sString.c_str();
        CCLabelTTF *pLabelshare = CCLabelTTF::create(share_Str, "Arial", 30/bigsmall_factor);//Helvetica 25
        //pLabelshare->setColor(ccc3(26,69,74));
        //pLabelmenu->setAnchorPoint(ccp(0.5,0.5));
        pLabelshare->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()*0.32));
        shengjipic->addChild(pLabelshare);
        
        CCMenuItemImage *pOKItem = CCMenuItemImage::create(
            "gmme/shengji-anjian-normal.png",
            "gmme/shengji-anjian-normal.png",//shengji-anjian-select.png
            this,
            menu_selector(ShengjiDialogLayer::menuCloseCallback));
        CC_BREAK_IF(! pOKItem);
        pOKItem->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()/10));
        pOKItem->setAnchorPoint(ccp(0.5,0));
        pOKItem->setTag(222);
        const char *ok_Str = ((CCString*)(loacalstrings->objectForKey("ok")))->m_sString.c_str();
        CCLabelTTF *pLabelok = CCLabelTTF::create(ok_Str, "Arial", 32/bigsmall_factor);//Helvetica 25
        pLabelok->setColor(ccc3(26,69,74));
        pLabelok->setPosition(ccp(pOKItem->getContentSize().width/2,pOKItem->getContentSize().height/2));
        pOKItem->addChild(pLabelok,2);
        /*
		// ¥¥Ω® ªÿµΩø™ ºΩÁ√Ê ≤Àµ•∞¥≈•
		CCTexture2D* texturehome_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_home_up.png");
		CCTexture2D* texturehome_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_home_down.png");
		CCMenuItemSprite* phome=CCMenuItemSprite::create(CCSprite::createWithTexture(texturehome_up),CCSprite::createWithTexture(texturehome_down),this,menu_selector(ShengjiDialogLayer::homeMenuItemCallback));
		CC_BREAK_IF(!phome);
		phome->setAnchorPoint(ccp(1,0.5));
		phome->setPosition(getWinCenter());
		phome->setPositionX(phome->getPositionX()/2);


		// ¥¥Ω® ºÃ–¯”Œœ∑≤Àµ•∞¥≈•
		CCTexture2D* textureresume_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_resume_up.png");
		CCTexture2D* textureresume_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_resume_down.png");
		CCMenuItemSprite* presume=CCMenuItemSprite::create(CCSprite::createWithTexture(textureresume_up),CCSprite::createWithTexture(textureresume_down),this,menu_selector(ShengjiDialogLayer::resumeMenuItemCallback));
		CC_BREAK_IF(!presume);
		presume->setPosition(getWinCenter());



		// ¥¥Ω® ÷ÿ–¬ø™ º”Œœ∑≤Àµ•∞¥≈•
		CCTexture2D* texturerety_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_rety_up.png");
		CCTexture2D* texturerety_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_retry_down.png");
		CCMenuItemSprite* prerety=CCMenuItemSprite::create(CCSprite::createWithTexture(texturerety_up),CCSprite::createWithTexture(texturerety_down),this,menu_selector(ShengjiDialogLayer::retyMenuItemCallback));
		CC_BREAK_IF(!prerety);
		prerety->setAnchorPoint(ccp(0,0.5));
		prerety->setPosition(getWinCenter());
		prerety->setPositionX(prerety->getPositionX()*3/2);


		m_pMenu = CCMenu::create(phome, presume,prerety, NULL);*/
        m_pMenu=CCMenu::create(pCloseItem,pOKItem,NULL);
		CC_BREAK_IF(!m_pMenu);
		m_pMenu->setPosition(CCPointZero);
		shengjipic->addChild(m_pMenu);
		isRet=true;
	} while (0);
	return isRet;

}

void ShengjiDialogLayer::onEnter()
{
	BaseLayer::onEnter();
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
		this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝  
		-128, //”≈œ»º∂  
		true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ  
}

void ShengjiDialogLayer::onExit()
{
	BaseLayer::onExit();
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool ShengjiDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

	m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

	return true;
}

void ShengjiDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchMoved(pTouch, pEvent);
	}
}

void ShengjiDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}

void ShengjiDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}

/*
void ShengjiDialogLayer::homeMenuItemCallback(cocos2d::CCObject *pSender){
	
	CCScene* se=MapChoose::scene();
	CCDirector::sharedDirector()->replaceScene(CCTransitionMoveInL::create(0.5,se));
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
	

}
void ShengjiDialogLayer::retyMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
}
void ShengjiDialogLayer::resumeMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
}
*/

void ShengjiDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    
    Playyinxiao::play_anjian();
    CCMenuItemImage *s=(CCMenuItemImage *)pSender;
    if (s->getTag()==222)
    {
      KTPlayC::shareScreenshotToKT(" ");
        //升级后分享代码处社交分享
        
    }
    CCDirector::sharedDirector()->resume();
    this->removeFromParentAndCleanup(true);
}