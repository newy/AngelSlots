#include "storelayer.h"
#include "CCRadioMenu.h" 
#include "IOSIAP_Bridge.h"
#include "playyinxiao.h"
#include "mapchoose.h"
#include "HelloWorldScene.h"
using namespace cocos2d;
/*****
http://blog.csdn.net/onerain88/article/details/7608496
参考资料
*****/



StoreDialogLayer::StoreDialogLayer(void)
{
}
StoreDialogLayer::~StoreDialogLayer(void)
{
}
bool StoreDialogLayer::init()
{
	bool bRet = false;

	do {
		CC_BREAK_IF(!BaseLayer::init());
        //CCTextureCache::sharedTextureCache()->addImage("zhegaibj.png");
         //CCTextureCache::sharedTextureCache()->addImage("freexuanzhuan.png");
         CCTextureCache::sharedTextureCache()->addImage("store/storebj.png");
         CCTextureCache::sharedTextureCache()->addImage("store/store_jiage.png");
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


bool StoreDialogLayer::setUpdateView()
{
	bool isRet=false;
	do 
	{

		/* CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
		
        CC_BREAK_IF(!pbg);
		pbg->setAnchorPoint(ccp(0.5,0.5));
		pbg->setPosition(getWinCenter());
		this->addChild(pbg);*/
        yaomaiID=6;
        CCSprite* storebj= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("store/storebj.png"));
        storebj->setPosition(getWinCenter());
        storebj->setAnchorPoint(ccp(0.5,0.5));
        this->addChild(storebj);
        const char *menu_Str = ((CCString*)(loacalstrings->objectForKey("store")))->m_sString.c_str();
        CCLabelTTF *pLabelmenu = CCLabelTTF::create(menu_Str, "Arial", 38/bigsmall_factor);//Helvetica 25
        pLabelmenu->setColor(ccc3(26,69,74));
        //pLabelmenu->setAnchorPoint(ccp(0.5,0));
        pLabelmenu->setPosition(ccp(storebj->getTextureRect().getMaxX()/2,storebj->getTextureRect().getMaxY()*0.95));
        storebj->addChild(pLabelmenu,2);
        
        //CCSprite* store_jiage= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("store/store_jiage.png"));
        //store_jiage->setPosition(ccp(storebj->getTextureRect().getMidX(),storebj->getTextureRect().getMidY()));
        //storebj->addChild(store_jiage,2);
        int jiange=77;
        //CCString::createWithFormat("store_%d", i)->getCString()
        CCSprite* store_coins_1= CCSprite::create("coins.png");
        store_coins_1->setScale(0.9f);
        store_coins_1->setPosition(ccp(storebj->getTextureRect().getMaxX()/5,storebj->getTextureRect().getMidY()+3*jiange));
        store_coins_1->setAnchorPoint(ccp(0.5,1));
        storebj->addChild(store_coins_1,2);
        
        
        CCLabelTTF* pLabel_1 = CCLabelTTF::create(store_1, "Arial", 45/bigsmall_factor);
        pLabel_1->setScale(0.8);
        pLabel_1->setPosition(ccp(store_coins_1->getPositionX()+store_coins_1->getContentSize().width/2,store_coins_1->getPositionY()-store_coins_1->getContentSize().height/2));
        pLabel_1->setAnchorPoint(ccp(0,0.5));
        storebj->addChild(pLabel_1,2);
        
        CCLabelTTF* pLabel_1_1 = CCLabelTTF::create(store_1_1, "Arial", 24/bigsmall_factor);
        //pLabel_1_1->setScale(0.8);
        pLabel_1_1->setPosition(ccp(store_coins_1->getPositionX()-store_coins_1->getContentSize().width/2,store_coins_1->getPositionY()-store_coins_1->getContentSize().height));
        pLabel_1_1->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_1_1,2);
        
        CCLabelTTF* pLabel_1_2 = CCLabelTTF::create(store_1_2, "Arial", 24/bigsmall_factor);
        //pLabel_1_2->setScale(0.8);
        pLabel_1_2->setPosition(ccp(pLabel_1_1->getPositionX()+pLabel_1_1->getContentSize().width,pLabel_1_1->getPositionY()));
        pLabel_1_2->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_1_2,2);
        
        const char *Str_free_1 = ((CCString*)(loacalstrings->objectForKey("free")))->m_sString.c_str();
        CCLabelTTF *pLabelfree_1 = CCLabelTTF::create(Str_free_1, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabelfree_1->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabelfree_1->setPosition(ccp(pLabel_1_2->getPositionX()+pLabel_1_2->getContentSize().width,pLabel_1_2->getPositionY()));
        storebj->addChild(pLabelfree_1,2);
        
        const char *Str_9999 = ((CCString*)(loacalstrings->objectForKey("99.99")))->m_sString.c_str();
        CCLabelTTF *pLabel9999 = CCLabelTTF::create(Str_9999, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabel9999->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabel9999->setPosition(ccp(storebj->getTextureRect().getMaxX()*7/10,pLabel_1_1->getPositionY()));
        storebj->addChild(pLabel9999,2);
        
        CCSprite* store_zuijia= CCSprite::create("store/zuijia.png");
        //store_zuijia->setScale(0.9f);
        store_zuijia->setPosition(ccp(storebj->getTextureRect().getMaxX()*7/10,storebj->getTextureRect().getMidY()+3*jiange-store_zuijia->getContentSize().height*4/7));
        store_zuijia->setAnchorPoint(ccp(0,0.5));
        storebj->addChild(store_zuijia,2);
        
        const char *Str_zuijia = ((CCString*)(loacalstrings->objectForKey("bestvalue")))->m_sString.c_str();
        CCLabelTTF *pLabelzuijia = CCLabelTTF::create(Str_zuijia, "Helvetica-Bold", 23/bigsmall_factor);//Helvetica 25 Arial
        //pLabelzuijia->setAnchorPoint(ccp(0.5,0.5));
        pLabelzuijia->setAnchorPoint(ccp(0,0.5));
        //pLabelzuijia->setRotation(36.0f);
        //pLabel9999->setColor(ccc3(26,69,74));
        //pLabelzuijia->setPosition(ccp(store_zuijia->getTextureRect().getMaxX()/2,store_zuijia->getTextureRect().getMaxY()/2));
        pLabelzuijia->setPosition(ccp(storebj->getTextureRect().getMaxX()*7/10,storebj->getTextureRect().getMidY()+3*jiange-store_zuijia->getContentSize().height*4/7));
        storebj->addChild(pLabelzuijia,2);
        float lachang=(float)pLabelzuijia->getContentSize().width/store_zuijia->getContentSize().width;
        CCLOG("lachang=%f",lachang);
        store_zuijia->setScaleX(lachang);
        //store_zuijia->addChild(pLabelzuijia,2);
        
        CCSprite* store_coins_2= CCSprite::create("coins.png");
        store_coins_2->setScale(0.9f);
        store_coins_2->setPosition(ccp(storebj->getTextureRect().getMaxX()/5,storebj->getTextureRect().getMidY()+2*jiange));
        store_coins_2->setAnchorPoint(ccp(0.5,1));
        storebj->addChild(store_coins_2,2);
        
        CCLabelTTF* pLabel_2 = CCLabelTTF::create(store_2, "Arial", 45/bigsmall_factor);
        pLabel_2->setScale(0.8);
        pLabel_2->setPosition(ccp(store_coins_2->getPositionX()+store_coins_2->getContentSize().width/2,store_coins_2->getPositionY()-store_coins_2->getContentSize().height/2));
        pLabel_2->setAnchorPoint(ccp(0,0.5));
        storebj->addChild(pLabel_2,2);
        
        CCLabelTTF* pLabel_2_1 = CCLabelTTF::create(store_2_1, "Arial", 24/bigsmall_factor);
        //pLabel_1_1->setScale(0.8);
        pLabel_2_1->setPosition(ccp(store_coins_2->getPositionX()-store_coins_2->getContentSize().width/2,store_coins_2->getPositionY()-store_coins_2->getContentSize().height));
        pLabel_2_1->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_2_1,2);
        
        CCLabelTTF* pLabel_2_2 = CCLabelTTF::create(store_2_2, "Arial", 24/bigsmall_factor);
        //pLabel_1_2->setScale(0.8);
        pLabel_2_2->setPosition(ccp(pLabel_1_2->getPositionX(),pLabel_2_1->getPositionY()));
        pLabel_2_2->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_2_2,2);
        
        const char *Str_free_2 = ((CCString*)(loacalstrings->objectForKey("free")))->m_sString.c_str();
        CCLabelTTF *pLabelfree_2 = CCLabelTTF::create(Str_free_2, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabelfree_2->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabelfree_2->setPosition(ccp(pLabel_2_2->getPositionX()+pLabel_2_2->getContentSize().width,pLabel_2_2->getPositionY()));
        storebj->addChild(pLabelfree_2,2);
        
        const char *Str_4999 = ((CCString*)(loacalstrings->objectForKey("49.99")))->m_sString.c_str();
        CCLabelTTF *pLabel4999 = CCLabelTTF::create(Str_4999, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabel4999->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabel4999->setPosition(ccp(storebj->getTextureRect().getMaxX()*7/10,pLabel_2_1->getPositionY()));
        storebj->addChild(pLabel4999,2);
        
        CCSprite* store_coins_3= CCSprite::create("coins.png");
        store_coins_3->setScale(0.9f);
        store_coins_3->setPosition(ccp(storebj->getTextureRect().getMaxX()/5,storebj->getTextureRect().getMidY()+jiange));
        store_coins_3->setAnchorPoint(ccp(0.5,1));
        storebj->addChild(store_coins_3,2);
        
        
        CCLabelTTF* pLabel_3 = CCLabelTTF::create(store_3, "Arial", 45/bigsmall_factor);
        pLabel_3->setScale(0.8);
        pLabel_3->setPosition(ccp(store_coins_3->getPositionX()+store_coins_3->getContentSize().width/2,store_coins_3->getPositionY()-store_coins_3->getContentSize().height/2));
        pLabel_3->setAnchorPoint(ccp(0,0.5));
        storebj->addChild(pLabel_3,2);
        
        CCLabelTTF* pLabel_3_1 = CCLabelTTF::create(store_3_1, "Arial", 24/bigsmall_factor);
        //pLabel_1_1->setScale(0.8);
        pLabel_3_1->setPosition(ccp(store_coins_3->getPositionX()-store_coins_3->getContentSize().width/2,store_coins_3->getPositionY()-store_coins_3->getContentSize().height));
        pLabel_3_1->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_3_1,2);
        
        CCLabelTTF* pLabel_3_2 = CCLabelTTF::create(store_3_2, "Arial", 24/bigsmall_factor);
        //pLabel_1_2->setScale(0.8);
        pLabel_3_2->setPosition(ccp(pLabel_1_2->getPositionX(),pLabel_3_1->getPositionY()));
        pLabel_3_2->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_3_2,2);
        
        const char *Str_free_3 = ((CCString*)(loacalstrings->objectForKey("free")))->m_sString.c_str();
        CCLabelTTF *pLabelfree_3 = CCLabelTTF::create(Str_free_3, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabelfree_3->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabelfree_3->setPosition(ccp(pLabel_3_2->getPositionX()+pLabel_3_2->getContentSize().width,pLabel_3_2->getPositionY()));
        storebj->addChild(pLabelfree_3,2);
        
        const char *Str_1999 = ((CCString*)(loacalstrings->objectForKey("19.99")))->m_sString.c_str();
        CCLabelTTF *pLabel1999 = CCLabelTTF::create(Str_1999, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabel1999->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabel1999->setPosition(ccp(storebj->getTextureRect().getMaxX()*7/10,pLabel_3_1->getPositionY()));
        storebj->addChild(pLabel1999,2);
        
        CCSprite* store_coins_4= CCSprite::create("coins.png");
        store_coins_4->setScale(0.9f);
        store_coins_4->setPosition(ccp(storebj->getTextureRect().getMaxX()/5,storebj->getTextureRect().getMidY()));
        store_coins_4->setAnchorPoint(ccp(0.5,1));
        storebj->addChild(store_coins_4,2);
        
        CCLabelTTF* pLabel_4 = CCLabelTTF::create(store_4, "Arial", 45/bigsmall_factor);
        pLabel_4->setScale(0.8);
        pLabel_4->setPosition(ccp(store_coins_4->getPositionX()+store_coins_4->getContentSize().width/2,store_coins_4->getPositionY()-store_coins_4->getContentSize().height/2));
        pLabel_4->setAnchorPoint(ccp(0,0.5));
        storebj->addChild(pLabel_4,2);
        
        CCLabelTTF* pLabel_4_1 = CCLabelTTF::create(store_4_1, "Arial", 24/bigsmall_factor);
        //pLabel_1_1->setScale(0.8);
        pLabel_4_1->setPosition(ccp(store_coins_4->getPositionX()-store_coins_4->getContentSize().width/2,store_coins_4->getPositionY()-store_coins_4->getContentSize().height));
        pLabel_4_1->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_4_1,2);
        
        CCLabelTTF* pLabel_4_2 = CCLabelTTF::create(store_4_2, "Arial", 24/bigsmall_factor);
        //pLabel_1_2->setScale(0.8);
        pLabel_4_2->setPosition(ccp(pLabel_1_2->getPositionX(),pLabel_4_1->getPositionY()));
        pLabel_4_2->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_4_2,2);
        
        const char *Str_free_4 = ((CCString*)(loacalstrings->objectForKey("free")))->m_sString.c_str();
        CCLabelTTF *pLabelfree_4 = CCLabelTTF::create(Str_free_4, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabelfree_4->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabelfree_4->setPosition(ccp(pLabel_4_2->getPositionX()+pLabel_4_2->getContentSize().width,pLabel_4_2->getPositionY()));
        storebj->addChild(pLabelfree_4,2);
        
        const char *Str_999 = ((CCString*)(loacalstrings->objectForKey("9.99")))->m_sString.c_str();
        CCLabelTTF *pLabel999 = CCLabelTTF::create(Str_999, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabel999->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabel999->setPosition(ccp(storebj->getTextureRect().getMaxX()*7/10,pLabel_4_1->getPositionY()));
        storebj->addChild(pLabel999,2);
        
        
        CCSprite* store_coins_5= CCSprite::create("coins.png");
        store_coins_5->setScale(0.9f);
        store_coins_5->setPosition(ccp(storebj->getTextureRect().getMaxX()/5,storebj->getTextureRect().getMidY()-jiange));
        store_coins_5->setAnchorPoint(ccp(0.5,1));
        storebj->addChild(store_coins_5,2);
        
        CCLabelTTF* pLabel_5 = CCLabelTTF::create(store_5, "Arial", 45/bigsmall_factor);
        pLabel_5->setScale(0.8);
        pLabel_5->setPosition(ccp(store_coins_5->getPositionX()+store_coins_5->getContentSize().width/2,store_coins_5->getPositionY()-store_coins_5->getContentSize().height/2));
        pLabel_5->setAnchorPoint(ccp(0,0.5));
        storebj->addChild(pLabel_5,2);
        
        CCLabelTTF* pLabel_5_1 = CCLabelTTF::create(store_5_1, "Arial", 24/bigsmall_factor);
        //pLabel_1_1->setScale(0.8);
        pLabel_5_1->setPosition(ccp(store_coins_5->getPositionX()-store_coins_5->getContentSize().width/2,store_coins_5->getPositionY()-store_coins_5->getContentSize().height));
        pLabel_5_1->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_5_1,2);
        
        CCLabelTTF* pLabel_5_2 = CCLabelTTF::create(store_4_2, "Arial", 24/bigsmall_factor);
        //pLabel_1_2->setScale(0.8);
        pLabel_5_2->setPosition(ccp(pLabel_1_2->getPositionX(),pLabel_5_1->getPositionY()));
        pLabel_5_2->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_5_2,2);
        
        const char *Str_free_5 = ((CCString*)(loacalstrings->objectForKey("free")))->m_sString.c_str();
        CCLabelTTF *pLabelfree_5 = CCLabelTTF::create(Str_free_5, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabelfree_5->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabelfree_5->setPosition(ccp(pLabel_5_2->getPositionX()+pLabel_5_2->getContentSize().width,pLabel_5_2->getPositionY()));
        storebj->addChild(pLabelfree_5,2);
        
        const char *Str_499 = ((CCString*)(loacalstrings->objectForKey("4.99")))->m_sString.c_str();
        CCLabelTTF *pLabel499 = CCLabelTTF::create(Str_499, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabel499->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabel499->setPosition(ccp(storebj->getTextureRect().getMaxX()*7/10,pLabel_5_1->getPositionY()));
        storebj->addChild(pLabel499,2);
        
        CCSprite* store_coins_6= CCSprite::create("coins.png");
        store_coins_6->setScale(0.9f);
        store_coins_6->setPosition(ccp(storebj->getTextureRect().getMaxX()/5,storebj->getTextureRect().getMidY()-2*jiange));
        store_coins_6->setAnchorPoint(ccp(0.5,1));
        storebj->addChild(store_coins_6,2);
        
        CCLabelTTF* pLabel_6 = CCLabelTTF::create(store_6, "Arial", 45/bigsmall_factor);
        pLabel_6->setScale(0.8);
        pLabel_6->setPosition(ccp(store_coins_6->getPositionX()+store_coins_6->getContentSize().width/2,store_coins_6->getPositionY()-store_coins_6->getContentSize().height/2));
        pLabel_6->setAnchorPoint(ccp(0,0.5));
        storebj->addChild(pLabel_6,2);
        
        CCLabelTTF* pLabel_6_1 = CCLabelTTF::create(store_6_1, "Arial", 24/bigsmall_factor);
        //pLabel_1_1->setScale(0.8);
        pLabel_6_1->setPosition(ccp(store_coins_6->getPositionX()-store_coins_6->getContentSize().width/2,store_coins_6->getPositionY()-store_coins_6->getContentSize().height));
        pLabel_6_1->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_6_1,2);
        
        CCLabelTTF* pLabel_6_2 = CCLabelTTF::create(store_6_2, "Arial", 24/bigsmall_factor);
        //pLabel_1_2->setScale(0.8);
        pLabel_6_2->setPosition(ccp(pLabel_1_2->getPositionX(),pLabel_6_1->getPositionY()));
        pLabel_6_2->setAnchorPoint(ccp(0,0.8));
        storebj->addChild(pLabel_6_2,2);
        
        const char *Str_free_6 = ((CCString*)(loacalstrings->objectForKey("free")))->m_sString.c_str();
        CCLabelTTF *pLabelfree_6 = CCLabelTTF::create(Str_free_6, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabelfree_6->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabelfree_6->setPosition(ccp(pLabel_6_2->getPositionX()+pLabel_6_2->getContentSize().width,pLabel_6_2->getPositionY()));
        storebj->addChild(pLabelfree_6,2);
        
        const char *Str_199 = ((CCString*)(loacalstrings->objectForKey("1.99")))->m_sString.c_str();
        CCLabelTTF *pLabel199 = CCLabelTTF::create(Str_199, "Arial", 24/bigsmall_factor);//Helvetica 25
        pLabel199->setAnchorPoint(ccp(0,0.8));
        //pLabel9999->setColor(ccc3(26,69,74));
        pLabel199->setPosition(ccp(storebj->getTextureRect().getMaxX()*7/10,pLabel_6_1->getPositionY()));
        storebj->addChild(pLabel199,2);

//         CCLabelTTF* pLabel = CCLabelTTF::create("STORE", "Arial", 45/bigsmall_factor);
//         pLabel->setPosition(ccp(storebj->getTextureRect().getMidX(),storebj->getTextureRect().getMaxY()*15/16));
//         pLabel->setAnchorPoint(ccp(0.5,0.65));
//         storebj->addChild(pLabel,2);
        storebj->runAction(CCFadeIn::create(1));
        //store_jiage->runAction(CCFadeIn::create(1));
        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
            "store/btnclose.png",
            "store/btnclose.png",
            this,
            menu_selector(StoreDialogLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        pCloseItem->setPosition(ccp(storebj->getTextureRect().getMaxX(),storebj->getTextureRect().getMaxY()));
        pCloseItem->setAnchorPoint(ccp(1,1));
        CCMenuItemImage *pGoItem = CCMenuItemImage::create(
            "store/go.png",
            "store/go-select.png",
            this,
            menu_selector(StoreDialogLayer::menuGoCallback));
        CC_BREAK_IF(! pGoItem);
        pGoItem->setPosition(ccp(storebj->getTextureRect().getMidX(),storebj->getTextureRect().getMidY()/10));
        pGoItem->setAnchorPoint(ccp(0.5,0));
        
        const char *ok_Str = ((CCString*)(loacalstrings->objectForKey("ok")))->m_sString.c_str();
        CCLabelTTF *pLabelok = CCLabelTTF::create(ok_Str, "Arial", 32/bigsmall_factor);//Helvetica 25
        pLabelok->setColor(ccc3(26,69,74));
        pLabelok->setPosition(ccp(pGoItem->getContentSize().width/2,pGoItem->getContentSize().height/2));
        pGoItem->addChild(pLabelok,2);
        /*
		


		m_pMenu = CCMenu::create(phome, presume,prerety, NULL);*/
        m_pMenu=CCMenu::create(pCloseItem,pGoItem,NULL);
		CC_BREAK_IF(!m_pMenu);
		m_pMenu->setPosition(CCPointZero);
		storebj->addChild(m_pMenu);
       
        CCMenuItemImage *bu01 = CCMenuItemImage::create("store/store_unselected.png", "store/store_selected.png", this, menu_selector(StoreDialogLayer::buttonCallBack));  
       // bu01->setScale(0.2);  
        bu01->setTag(201);  
        

        CCMenuItemImage *bu02 = CCMenuItemImage::create("store/store_unselected.png", "store/store_selected.png", this, menu_selector(StoreDialogLayer::buttonCallBack));  
        //bu02->setScale(0.2);  
        bu02->setTag(202);  

        CCMenuItemImage *bu03 = CCMenuItemImage::create("store/store_unselected.png", "store/store_selected.png", this, menu_selector(StoreDialogLayer::buttonCallBack));  
        //bu03->setScale(0.2);  
        bu03->setTag(203);  

        CCMenuItemImage *bu04 = CCMenuItemImage::create("store/store_unselected.png", "store/store_selected.png", this, menu_selector(StoreDialogLayer::buttonCallBack));  
        //bu03->setScale(0.2);  
        bu04->setTag(204);
        
        CCMenuItemImage *bu05 = CCMenuItemImage::create("store/store_unselected.png", "store/store_selected.png", this, menu_selector(StoreDialogLayer::buttonCallBack));  
        //bu03->setScale(0.2);  
        bu05->setTag(205); 

        CCMenuItemImage *bu06 = CCMenuItemImage::create("store/store_unselected.png", "store/store_selected.png", this, menu_selector(StoreDialogLayer::buttonCallBack));  
        //bu03->setScale(0.2);  
        bu06->setTag(206); 
        CCRadioMenu *radioMenu = CCRadioMenu::create(bu01,bu02,bu03,bu04,bu05,bu06,NULL);  
        radioMenu->alignItemsVerticallyWithPadding(3.0f); //竖直对其，设定间隔值 
        radioMenu->setSelectedItem_(bu01); 
        radioMenu->setTouchPriority(-129); 
        bu01->selected();  
        radioMenu->setPosition(ccp(storebj->getTextureRect().getMidX(),storebj->getTextureRect().getMidY()));
        storebj->addChild(radioMenu, 1);  


		isRet=true;
	} while (0);
	return isRet;

}

void StoreDialogLayer::menuGoCallback(cocos2d::CCObject *pSender)
{
//goto shop
//yaomaiD
   Playyinxiao::play_anjian();
    IOSiAP_Bridge *newiap=new IOSiAP_Bridge();
    
    newiap->requestProducts();
    
    CCSprite* pbg =(CCSprite*)(this->getParent()->getChildByTag(zhegaitag));
    CCSprite* pSprite_zhuan = CCSprite::create("loading_quan.png");//
    pSprite_zhuan->setPosition(ccp(pbg->getContentSize().width/2,pbg->getContentSize().height/2));
    pSprite_zhuan->setAnchorPoint(ccp(0.48,0.535));
    pbg->addChild(pSprite_zhuan);
    CCRotateBy * zhuanquan=CCRotateBy::create(1,-360);
    pSprite_zhuan->runAction(CCRepeatForever::create(zhuanquan));
    
    const char *pLabelStr = ((CCString*)(loacalstrings->objectForKey("connect")))->m_sString.c_str();
    CCLabelTTF *lable_connect=CCLabelTTF::create(pLabelStr,"Arial",25/bigsmall_factor);
    lable_connect->setPosition(ccp(pbg->getContentSize().width/2,pbg->getContentSize().height/2-pSprite_zhuan->getContentSize().height));
    pbg->addChild(lable_connect);
    
    //(this->getParent()->getChildByTag(zhegaitag))->removeFromParentAndCleanup(true);
    if(changjing==0)
    {
        ((MapChoose *)nowobject)->menu->setEnabled(false);
       ((MapChoose *)nowobject)->pmenu->setEnabled(false);
    }
    else
    {
        ((HelloWorld *)nowobject)->pMenu->setEnabled(false);;

    }
    
    
    this->removeFromParentAndCleanup(true);
}
void StoreDialogLayer::buttonCallBack(cocos2d::CCObject *pSender)
{
CCRadioMenu *dianzhong=(CCRadioMenu *)pSender;
switch(dianzhong->getTag()-200)
{
case 1: yaomaiID=6;
        break;
case 2: yaomaiID=5;
        break;
case 3: yaomaiID=4;
        break;
case 4: yaomaiID=3;
        break;
case 5: yaomaiID=2;
        break;
case 6: yaomaiID=1;
        break;
default:break;

        
}

}

void StoreDialogLayer::onEnter()
{
	BaseLayer::onEnter();
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
		this,//在那个类中实现触屏回调函数  
		-128, //优先级  
		true);//触摸时间是否被该目标截获  
}

void StoreDialogLayer::onExit()
{
	BaseLayer::onExit();
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool StoreDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

	m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

	return true;
}

void StoreDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchMoved(pTouch, pEvent);
	}
}

void StoreDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}

void StoreDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}

/*
void StoreDialogLayer::homeMenuItemCallback(cocos2d::CCObject *pSender){
	
	CCScene* se=MapChoose::scene();
	CCDirector::sharedDirector()->replaceScene(CCTransitionMoveInL::create(0.5,se));
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
	

}
void StoreDialogLayer::retyMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
}
void StoreDialogLayer::resumeMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
	this->removeFromParentAndCleanup(true);
}
*/

void StoreDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    //CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);
    Playyinxiao::play_anjian();
    
    (this->getParent()->getChildByTag(zhegaitag))->removeFromParentAndCleanup(true);
    this->removeFromParentAndCleanup(true);
 
}