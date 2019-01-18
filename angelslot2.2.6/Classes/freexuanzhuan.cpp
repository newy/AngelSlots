#include "freexuanzhuan.h"
#include "ResouceDefine.h"
#include "playyinxiao.h"

#include <string>
using namespace cocos2d;
/*****
http://blog.csdn.net/onerain88/article/details/7608496
≤Œøº◊ ¡œ
*****/
FreexuanzhuanDialogLayer::FreexuanzhuanDialogLayer(void)
{

}


FreexuanzhuanDialogLayer::~FreexuanzhuanDialogLayer(void)
{
}
bool FreexuanzhuanDialogLayer::init()
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


bool FreexuanzhuanDialogLayer::setUpdateView()
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
        CCSprite* shengjipic= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/congratulations.png"));
        shengjipic->setPosition(getWinCenter());
        this->addChild(shengjipic);
        const char *pLabelStrtishi = ((CCString*)(loacalstrings->objectForKey("congratulations")))->m_sString.c_str();
        CCLabelTTF *lable_congratutishi=CCLabelTTF::create(pLabelStrtishi,"Arial",35/bigsmall_factor);
        lable_congratutishi->setAnchorPoint(ccp(0.5,0.6));
        lable_congratutishi->setPosition(ccp(shengjipic->getContentSize().width/2,shengjipic->getContentSize().height*0.75));
        shengjipic->addChild(lable_congratutishi);
        lable_congratutishi->setColor(ccc3(26,69,74));
        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
            "gmme/chuangkou_guanbi.png",
            "gmme/chuangkou_guanbi.png",
            this,
            menu_selector(FreexuanzhuanDialogLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        pCloseItem->setAnchorPoint(ccp(0.85,0.85));
        pCloseItem->setPosition(ccp(shengjipic->getTextureRect().getMaxX(),shengjipic->getTextureRect().getMaxY()));
        
        /*
		// ¥¥Ω® ªÿµΩø™ ºΩÁ√Ê ≤Àµ•∞¥≈•
		CCTexture2D* texturehome_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_home_up.png");
		CCTexture2D* texturehome_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_home_down.png");
		CCMenuItemSprite* phome=CCMenuItemSprite::create(CCSprite::createWithTexture(texturehome_up),CCSprite::createWithTexture(texturehome_down),this,menu_selector(FreexuanzhuanDialogLayer::homeMenuItemCallback));
		CC_BREAK_IF(!phome);
		phome->setAnchorPoint(ccp(1,0.5));
		phome->setPosition(getWinCenter());
		phome->setPositionX(phome->getPositionX()/2);


		// ¥¥Ω® ºÃ–¯”Œœ∑≤Àµ•∞¥≈•
		CCTexture2D* textureresume_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_resume_up.png");
		CCTexture2D* textureresume_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_resume_down.png");
		CCMenuItemSprite* presume=CCMenuItemSprite::create(CCSprite::createWithTexture(textureresume_up),CCSprite::createWithTexture(textureresume_down),this,menu_selector(FreexuanzhuanDialogLayer::resumeMenuItemCallback));
		CC_BREAK_IF(!presume);
		presume->setPosition(getWinCenter());



		// ¥¥Ω® ÷ÿ–¬ø™ º”Œœ∑≤Àµ•∞¥≈•
		CCTexture2D* texturerety_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_rety_up.png");
		CCTexture2D* texturerety_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_retry_down.png");
		CCMenuItemSprite* prerety=CCMenuItemSprite::create(CCSprite::createWithTexture(texturerety_up),CCSprite::createWithTexture(texturerety_down),this,menu_selector(FreexuanzhuanDialogLayer::retyMenuItemCallback));
		CC_BREAK_IF(!prerety);
		prerety->setAnchorPoint(ccp(0,0.5));
		prerety->setPosition(getWinCenter());
		prerety->setPositionX(prerety->getPositionX()*3/2);


		m_pMenu = CCMenu::create(phome, presume,prerety, NULL);*/
        m_pMenu=CCMenu::create(pCloseItem,NULL);
		CC_BREAK_IF(!m_pMenu);
		m_pMenu->setPosition(CCPointZero);
		shengjipic->addChild(m_pMenu);
       
        //std::string tishi("you get ");
        std::string tishi = ((CCString*)(loacalstrings->objectForKey("youget")))->m_sString.c_str();
        std::string tishi1;

        char buf[10]= {0};
        sprintf(buf, "%d", freenum);
        tishi1= buf;
        //std::string tishi2(" times free spins!");
        std::string tishi2 = ((CCString*)(loacalstrings->objectForKey("timesfreespins")))->m_sString.c_str();
        
        tishi+=tishi1;
        tishi+=tishi2;
         char tishistring[50] = {0};
        // tishistring=tishi.data();
         //tishistring=tishi.c_str();8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
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
        shengjipic->addChild(pLabetishi);


		isRet=true;
	} while (0);
	return isRet;

}

void FreexuanzhuanDialogLayer::onEnter()
{
	BaseLayer::onEnter();
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
		this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝  
		-128, //”≈œ»º∂  
		true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ  
}

void FreexuanzhuanDialogLayer::onExit()
{
	BaseLayer::onExit();
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool FreexuanzhuanDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

	m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

	return true;
}

void FreexuanzhuanDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchMoved(pTouch, pEvent);
	}
}

void FreexuanzhuanDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}

void FreexuanzhuanDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}

/*
void FreexuanzhuanDialogLayer::homeMenuItemCallback(cocos2d::CCObject *pSender){
	
	CCScene* se=MapChoose::scene();
	CCDirector::sharedDirector()->replaceScene(CCTransitionMoveInL::create(0.5,se));
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
	

}
void FreexuanzhuanDialogLayer::retyMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
}
void FreexuanzhuanDialogLayer::resumeMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
}
*/

void FreexuanzhuanDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);
    Playyinxiao::play_anjian();

    this->removeFromParentAndCleanup(true);
}
//◊™∂ØΩ·π˚
FreexuanzhuanResultDialogLayer::FreexuanzhuanResultDialogLayer(void)
{

}


FreexuanzhuanResultDialogLayer::~FreexuanzhuanResultDialogLayer(void)
{
}
bool FreexuanzhuanResultDialogLayer::init()
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


bool FreexuanzhuanResultDialogLayer::setUpdateView()
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
        CCSprite* shengjipic= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/congratulations.png"));
        shengjipic->setPosition(getWinCenter());
        this->addChild(shengjipic);
        const char *pLabelStrtishi = ((CCString*)(loacalstrings->objectForKey("congratulations")))->m_sString.c_str();
        CCLabelTTF *lable_congratutishi=CCLabelTTF::create(pLabelStrtishi,"Arial",35/bigsmall_factor);
        lable_congratutishi->setAnchorPoint(ccp(0.5,0.6));
        lable_congratutishi->setPosition(ccp(shengjipic->getContentSize().width/2,shengjipic->getContentSize().height*0.75));
        shengjipic->addChild(lable_congratutishi);
        lable_congratutishi->setColor(ccc3(26,69,74));
        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
            "gmme/chuangkou_guanbi.png",
            "gmme/chuangkou_guanbi.png",
            this,
            menu_selector(FreexuanzhuanResultDialogLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        pCloseItem->setAnchorPoint(ccp(0.85,0.85));
        pCloseItem->setPosition(ccp(shengjipic->getTextureRect().getMaxX(),shengjipic->getTextureRect().getMaxY()));
        
        /*
		// ¥¥Ω® ªÿµΩø™ ºΩÁ√Ê ≤Àµ•∞¥≈•
		CCTexture2D* texturehome_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_home_up.png");
		CCTexture2D* texturehome_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_home_down.png");
		CCMenuItemSprite* phome=CCMenuItemSprite::create(CCSprite::createWithTexture(texturehome_up),CCSprite::createWithTexture(texturehome_down),this,menu_selector(FreexuanzhuanResultDialogLayer::homeMenuItemCallback));
		CC_BREAK_IF(!phome);
		phome->setAnchorPoint(ccp(1,0.5));
		phome->setPosition(getWinCenter());
		phome->setPositionX(phome->getPositionX()/2);


		// ¥¥Ω® ºÃ–¯”Œœ∑≤Àµ•∞¥≈•
		CCTexture2D* textureresume_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_resume_up.png");
		CCTexture2D* textureresume_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_resume_down.png");
		CCMenuItemSprite* presume=CCMenuItemSprite::create(CCSprite::createWithTexture(textureresume_up),CCSprite::createWithTexture(textureresume_down),this,menu_selector(FreexuanzhuanResultDialogLayer::resumeMenuItemCallback));
		CC_BREAK_IF(!presume);
		presume->setPosition(getWinCenter());



		// ¥¥Ω® ÷ÿ–¬ø™ º”Œœ∑≤Àµ•∞¥≈•
		CCTexture2D* texturerety_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_rety_up.png");
		CCTexture2D* texturerety_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/btn_retry_down.png");
		CCMenuItemSprite* prerety=CCMenuItemSprite::create(CCSprite::createWithTexture(texturerety_up),CCSprite::createWithTexture(texturerety_down),this,menu_selector(FreexuanzhuanResultDialogLayer::retyMenuItemCallback));
		CC_BREAK_IF(!prerety);
		prerety->setAnchorPoint(ccp(0,0.5));
		prerety->setPosition(getWinCenter());
		prerety->setPositionX(prerety->getPositionX()*3/2);


		m_pMenu = CCMenu::create(phome, presume,prerety, NULL);*/
        m_pMenu=CCMenu::create(pCloseItem,NULL);
		CC_BREAK_IF(!m_pMenu);
		m_pMenu->setPosition(CCPointZero);
		shengjipic->addChild(m_pMenu);
       
        //std::string tishi("you win ");
        std::string tishi = ((CCString*)(loacalstrings->objectForKey("youwin")))->m_sString.c_str();
        std::string tishi1;

        char buf[10]= {0};
        sprintf(buf, "%d", freenumreslut/100);
        tishi1= buf;
        //std::string tishi2(" coinss free spin!");
        //std::string tishi2;
       
        //tishi2=" conis in free spins!";
        std::string tishi2 = ((CCString*)(loacalstrings->objectForKey("coinsinfreespins")))->m_sString.c_str();
        
        tishi+=tishi1;
        tishi+=tishi2;
         char tishistring[50] = {0};
        // tishistring=tishi.data();
         //tishistring=tishi.c_str();8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
        sprintf(tishistring, "%s",tishi.c_str());
       // pLabetishi = CCLabelTTF::create(jingyanstring, "Arial", 40/bigsmall_factor);
        //CCLabelTTF* pLabetishi = CCLabelTTF::create("Hello World", "Arial",24);
        CCLabelTTF *pLabetishi=CCLabelTTF::create(tishistring,"Arial",35/bigsmall_factor);
        // position the label on the center of the screen
        pLabetishi->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()/3));
        

//         CCLabelBMFont* pLabetishiCon=CCLabelBMFont::create("CONGRATULATIONS","diy_38_cuitihei.fnt");
//         pLabetishiCon->setScale(0.9);
//         pLabetishiCon->setAnchorPoint(ccp(0.5,1.4));
//         // position the label on the center of the screen
//         pLabetishiCon->setPosition(ccp(shengjipic->getTextureRect().getMaxX()/2,shengjipic->getTextureRect().getMaxY()));

        // add the label as a child to this layer
        //shengjipic->addChild(pLabetishiCon);
        shengjipic->addChild(pLabetishi);


		isRet=true;
	} while (0);
	return isRet;

}

void FreexuanzhuanResultDialogLayer::onEnter()
{
	BaseLayer::onEnter();
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
		this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝  
		-128, //”≈œ»º∂  
		true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ  
}

void FreexuanzhuanResultDialogLayer::onExit()
{
	BaseLayer::onExit();
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool FreexuanzhuanResultDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

	m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

	return true;
}

void FreexuanzhuanResultDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchMoved(pTouch, pEvent);
	}
}

void FreexuanzhuanResultDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}

void FreexuanzhuanResultDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}



void FreexuanzhuanResultDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);
    Playyinxiao::play_anjian();


    this->removeFromParentAndCleanup(true);
}

//◊™∂ØΩ·π˚end
//‘Ÿ“ª¥Œ◊™
AgainFreexuanzhuanDialogLayer::AgainFreexuanzhuanDialogLayer(void)
{
}
AgainFreexuanzhuanDialogLayer::~AgainFreexuanzhuanDialogLayer(void)
{
}
bool AgainFreexuanzhuanDialogLayer::init()
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


bool AgainFreexuanzhuanDialogLayer::setUpdateView()
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
        //std::string tishi("you get another ");
        std::string tishi = ((CCString*)(loacalstrings->objectForKey("yougetanother")))->m_sString.c_str();
        std::string tishi1;

        char buf[10]= {0};
        sprintf(buf, "%d", freenum);
        tishi1= buf;

        //std::string tishi2(" times free spins!");
        std::string tishi2 = ((CCString*)(loacalstrings->objectForKey("timesfreespins")))->m_sString.c_str();
        tishi+=tishi1;
        tishi+=tishi2;
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
       // CCActionInterval *tishiaction=CCSequence::create(delai2,yincang,CCCallFunc::create(this,callfunc_selector(AgainFreexuanzhuanDialogLayer::menuCloseCallback)));
        //this->runAction(tishiaction);
        //this->scheduleOnce(schedule_selector(AgainFreexuanzhuanDialogLayer::menuCloseCallback),2);

		isRet=true;
	} while (0);
	return isRet;

}

void AgainFreexuanzhuanDialogLayer::onEnter()
{
	BaseLayer::onEnter();
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
		this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝  
		-127, //”≈œ»º∂  
		true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ  
}

void AgainFreexuanzhuanDialogLayer::onExit()
{
	BaseLayer::onExit();
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool AgainFreexuanzhuanDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

	//m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

	return true;
}

void AgainFreexuanzhuanDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	//if (m_bTouchedMenu) {
		//m_pMenu->ccTouchMoved(pTouch, pEvent);
	//}
}

void AgainFreexuanzhuanDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	//if (m_bTouchedMenu) {
		//m_pMenu->ccTouchEnded(pTouch, pEvent);
		//m_bTouchedMenu = false;
	//}
}

void AgainFreexuanzhuanDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	/*if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}*/
}


void AgainFreexuanzhuanDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    //CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);
    
    this->removeFromParentAndCleanup(true);
}

//bigwin
BigwinDialogLayer::BigwinDialogLayer(void)
{
}
BigwinDialogLayer::~BigwinDialogLayer(void)
{
}
bool BigwinDialogLayer::init()
{
    bool bRet = false;
    
    do {
        CC_BREAK_IF(!BaseLayer::init());
        //CCTextureCache::sharedTextureCache()->addImage("bigwin.png");
        //CCTextureCache::sharedTextureCache()->addImage("bigwin_light.png");
        //CCTextureCache::sharedTextureCache()->addImage("stars.png");
        //CCTextureCache::sharedTextureCache()->addImage("coins_diaoluo.png");
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


bool BigwinDialogLayer::setUpdateView()
{
    bool isRet=false;
    do
    {
        
        // CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
        
        //CC_BREAK_IF(!pbg);
        //pbg->setAnchorPoint(ccp(0.5,0.5));
        //pbg->setPosition(getWinCenter());
        //this->addChild(pbg);
        CCSprite* bigwin_light= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("bigwin_light.png"));
        CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
        bigwin_light->setPosition(ccp(visibleSize.width/2,visibleSize.height*5/8));
        //bigwin_light->setPosition(getWinCenter());
        this->addChild(bigwin_light);
        CCRotateBy *wildxuanzhuan1=CCRotateBy::create(10,360);
        bigwin_light->runAction(wildxuanzhuan1);
        
        float px=visibleSize.width/2;
        float py=visibleSize.height/2;
        for(int i=0;i<100;i++)
        {
            //CCSprite* diaoqian= CCSprite::createWithSpriteFrameName("laohu_10.png");//coins coins_diaoluo
            CCSprite* diaoqian= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("coins_diaoluo.png"));
            
            int result_wid = CCRANDOM_0_1()*101-50;//(0~10)-5   -5~5
            //if(result>iconscount||result<0)
            if (result_wid>=51||result_wid<-50)
            {
                do
                {
                    result_wid = CCRANDOM_0_1()*101-50;//+1
                } while (result_wid>=51||result_wid<-50);
                
            }
            int result_hei = CCRANDOM_0_1()*101-50;//(0~10)-5   -5~5
            //if(result>iconscount||result<0)
            if (result_hei>=51||result_hei<-50)
            {
                do
                {
                    result_hei = CCRANDOM_0_1()*101-50;//+1
                } while (result_hei>=51||result_hei<-50);
                
            }
            float fishieat_x=px+(float)result_wid/50.0*px;
            float fishieat_y=py+(float)result_hei/50.0*py;
            diaoqian->setPosition(ccp(fishieat_x,fishieat_y));
            // CCActionInterval *diaoluo_0 =CCMoveBy::create(0.5,ccp(0,py/4.0));
            //CCActionInterval *diaoluo_1 =CCMoveBy::create(4,ccp(0,-py*2));
            //CCActionInterval *diaoluo_2=CCEaseBackIn::create(diaoluo_1);
            // CCActionInterval *diaoluo=CCSequence::create(diaoluo_0,diaoluo_2,NULL);
            // CCDelayTime *startdelay=CCDelayTime::create(i*0.01);
            //CCDelayTime *starttingdelay=CCDelayTime::create(0);
            // CCActionInterval *diaoluo= CCSequence::create(CCEaseExponentialOut::create(CCMoveBy::create(2,ccp(0,py*2.0))),CCEaseSineIn::create(CCMoveBy::create(2,ccp(0,-py*2))),NULL);
            CCActionInterval *diaoluo= CCSequence::create(CCDelayTime::create(2),CCEaseExponentialIn::create(CCMoveBy::create(2,ccp(0,-py*2))),NULL);
            CCRotateBy *xuanzhuan1=CCRotateBy::create(4,360);
            CCActionInterval *DiaoluoAndXuanzhuan=CCSpawn::create(diaoluo,xuanzhuan1,NULL);
            diaoqian->runAction(DiaoluoAndXuanzhuan);
            this->addChild(diaoqian);
            //int result_gailv = CCRANDOM_0_1()*5;
            //if(result_gailv==0)
            //{
            CCSprite *stars=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("stars.png"));
            //CCSprite *stars=CCSprite::createWithSpriteFrameName("stars.png");//genghuan
            stars->setPosition(ccp(diaoqian->getContentSize().width/2,diaoqian->getContentSize().height/2));
            stars->setTag(starstag);
            diaoqian->addChild(stars);
            // CCActionInterval *xuanzhuan=CCRotateBy::create(0.8, 0.0f);//旋y转áa90
            CCActionInterval *fangdasuoxiao1=CCScaleTo::create(0.1, 3);//放¤?大?¨?
            CCActionInterval *suoxiao1=CCScaleBy::create(0.1, 0.01);//放¤?大?¨?
            // CCActionInterval *fangdasuoxiao2=CCScaleBy::create(0.4, 2);//放¤?大?¨?
            //CCActionInterval *fangdasuoxiao=CCSequence::create(fangdasuoxiao2,fangdasuoxiao2->reverse(),NULL);//放¤?大?¨?缩?小?
            // CCFadeIn *shanshuo1=CCFadeIn::create(0.4f);
            
            //CCBlink *blink=CCBlink::create(1,3);
            //CCActionInterval *shanshuo=CCSequence::create(shanshuo1,shanshuo1->reverse(),NULL);
            //CCActionInterval *StarsAction1=CCSpawn::create(xuanzhuan,fangdasuoxiao,shanshuo,NULL);
            //int result_yanchi = CCRANDOM_0_1()*40;
            //CCDelayTime *delai=CCDelayTime::create((float)result_yanchi/10.0);
            //CCDelayTime *delai=CCDelayTime::create((float)i*0.04)
            CCFadeIn *jinru1=CCFadeIn::create((float)i*0.04f);
            CCActionInterval *StarsAction2=CCSequence::create(suoxiao1,jinru1,fangdasuoxiao1,suoxiao1,NULL);
            // CCActionInterval *StarsAction=CCRepeatForever::create(StarsAction2);
            stars->runAction(StarsAction2);
           
        
        CCSprite* bigwin= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("bigwin.png"));
        bigwin->setPosition(ccp(visibleSize.width/2,visibleSize.height*5/8));
        //bigwin->setPosition(getWinCenter());
        bigwin->setScale(0.01f);
        this->addChild(bigwin);
        
        //CCActionInterval *suoxiao1 =CCScaleTo::create(0.01,0.01f);
        CCActionInterval *fangda2 =CCScaleTo::create(2,1.2f);
         CCActionInterval *suoxiao3 =CCScaleTo::create(1,1.0f);
        CCActionInterval *fangda =CCSequence::create(fangda2,suoxiao3,NULL);
        CCActionInterval * zhuan1 = CCEaseBackOut::create(CCEaseSineInOut::create(fangda));//
        
        CCActionInterval *fangda3 =CCScaleBy::create(0.4f,20.0f);
        //CCDelayTime *delai3=CCDelayTime::create(2.7f);
        // CCActionInterval *suoxiao2 =CCScaleBy::create(0.1f,0.01f);
        CCFadeOut *xiaoshi=CCFadeOut::create(0.3f);
        // CCFadeOut *yincang=CCFadeOut::create(3.0f);
        CCActionInterval *fangdaxiaoshi=CCSpawn::create(fangda3,xiaoshi,NULL);
        CCActionInterval *tishiaction=CCSequence::create(zhuan1,fangdaxiaoshi,NULL);

        bigwin->runAction(tishiaction);
        }
        //CCDelayTime *delai2=CCDelayTime::create(1.5f);
        // CCFadeOut *yincang=CCFadeOut::create(1.5f);
        // CCActionInterval *tishiaction=CCSequence::create(delai2,yincang,CCCallFunc::create(this,callfunc_selector(AgainFreexuanzhuanDialogLayer::menuCloseCallback)));
        //this->runAction(tishiaction);
        //this->scheduleOnce(schedule_selector(AgainFreexuanzhuanDialogLayer::menuCloseCallback),2);
        
        isRet=true;
    } while (0);
    return isRet;
    
}

void BigwinDialogLayer::onEnter()
{
    BaseLayer::onEnter();
    CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(
                                                                            this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝
                                                                            -127, //”≈œ»º∂
                                                                            true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ
}

void BigwinDialogLayer::onExit()
{
    BaseLayer::onExit();
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}
bool BigwinDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    
    //m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);
    
    return true;
}

void BigwinDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    //if (m_bTouchedMenu) {
    //m_pMenu->ccTouchMoved(pTouch, pEvent);
    //}
}

void BigwinDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    //if (m_bTouchedMenu) {
    //m_pMenu->ccTouchEnded(pTouch, pEvent);
    //m_bTouchedMenu = false;
    //}
}

void BigwinDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    /*if (m_bTouchedMenu) {
     m_pMenu->ccTouchEnded(pTouch, pEvent);
     m_bTouchedMenu = false;
     }*/
}


void BigwinDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    //CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);
    
    this->removeFromParentAndCleanup(true);
}