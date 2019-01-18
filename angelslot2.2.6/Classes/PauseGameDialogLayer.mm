#include "PauseGameDialogLayer.h"
#include "mapchoose.h"
#include "storelayer.h"
#include "shezhi.h"
#include "playyinxiao.h"
#include "load.h"
#include "table.h"
#import "GameKitHelper.h"//GameCenter
using namespace cocos2d;
/*****
http://blog.csdn.net/onerain88/article/details/7608496
≤Œøº◊ ¡œ
*****/
PauseGameDialogLayer::PauseGameDialogLayer(void)
{
}


PauseGameDialogLayer::~PauseGameDialogLayer(void)
{
    CCTextureCache::sharedTextureCache()->removeTextureForKey("zhegaibj.png");
    CCTextureCache::sharedTextureCache()->removeTextureForKey("gmme/shezhi_1.png");
   // CCTextureCache::sharedTextureCache()->removeTextureForKey("gmme/xuanxiang-icon.png");
     CCTextureCache::sharedTextureCache()->removeTextureForKey("gmme/menu_buyconis.png");
     CCTextureCache::sharedTextureCache()->removeTextureForKey("gmme/menu_options.png");
     CCTextureCache::sharedTextureCache()->removeTextureForKey("gmme/menu_gamecnter.png");
     CCTextureCache::sharedTextureCache()->removeTextureForKey("gmme/menu_back.png");
    CCTextureCache::sharedTextureCache()->removeTextureForKey("gmme/shezhi_an.png");
    CCTextureCache::sharedTextureCache()->removeTextureForKey("gmme/shezhi_an_select.png");

}
bool PauseGameDialogLayer::init()
{
	bool bRet = false;

	do {
		CC_BREAK_IF(!BaseLayer::init());
        CCTextureCache::sharedTextureCache()->addImage("zhegaibj.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/shezhi_1.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/menu_buyconis.png");
         CCTextureCache::sharedTextureCache()->addImage("gmme/menu_options.png");
           CCTextureCache::sharedTextureCache()->addImage("gmme/menu_gamecnter.png");
         CCTextureCache::sharedTextureCache()->addImage("gmme/menu_back.png");
//         CCTextureCache::sharedTextureCache()->addImage("gmme/btn_retry_down.png");
//         CCTextureCache::sharedTextureCache()->addImage("gmme/btn_rety_up.png");
 //       CCTextureCache::sharedTextureCache()->addImage("gmme/xuanxiang-icon.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/shezhi_an.png");
        CCTextureCache::sharedTextureCache()->addImage("gmme/shezhi_an_select.png");
		CC_BREAK_IF(!this->setUpdateView());		

		bRet = true;
	} while (0);

	return bRet;
}


bool PauseGameDialogLayer::setUpdateView()
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
		this->addChild(pbg,1000);
        CCNode *layer = CCNode::create();
        layer->setPosition(CCPointZero);
        this->addChild(layer,1001);
        CCSprite* shezhipic= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhi_1.png"));
        shezhipic->setAnchorPoint(ccp(0.5,0.5));
        shezhipic->setPosition(getWinCenter());
        layer->addChild(shezhipic);
        
        const char *menu_Str = ((CCString*)(loacalstrings->objectForKey("menu")))->m_sString.c_str();
        CCLabelTTF *pLabelmenu = CCLabelTTF::create(menu_Str, "Arial", 34/bigsmall_factor);//Helvetica 25
        pLabelmenu->setColor(ccc3(26,69,74));
        //pLabelmenu->setAnchorPoint(ccp(0.5,0.5));
        pLabelmenu->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2,shezhipic->getTextureRect().getMaxY()*0.91));
        shezhipic->addChild(pLabelmenu,2);

        //int shezhibiankuangheight=60;//8
        //int shezhikuangheight=shezhipic->getTextureRect().size.height-shezhibiankuangheight*2;
        //int shezhikuangheight=shezhipic->getTextureRect().size.height-shezhibiankuangheight;
       
        /*CCSprite* shezhiIcon= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/xuanxiang-icon.png"));
         int shezhiIconheight=shezhiIcon->getTextureRect().size.height;
        shezhiIcon->setAnchorPoint(ccp(0.5,0.5));
        //shezhiIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2,shezhikuangheight*2/5+shezhibiankuangheight));
        shezhiIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2,shezhikuangheight/2));
        
        shezhipic->addChild(shezhiIcon,2);
         */
        //int shezhikuangheight=shezhipic->getTextureRect().size.height-shezhibiankuangheight*2;
        //int shezhikuangheight=shezhiIcon->getTextureRect().size.height-shezhibiankuangheight*2;

        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
            "gmme/chuangkou_guanbi.png",
            "gmme/chuangkou_guanbi.png",
            this,
            menu_selector(PauseGameDialogLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        pCloseItem->setAnchorPoint(ccp(0.85,0.85));
        pCloseItem->setPosition(ccp(shezhipic->getTextureRect().getMaxX(),shezhipic->getTextureRect().getMaxY()));

		//创建 回到开始界面 菜单按钮
        CCSprite* menu_backIcon= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/menu_back.png"));
        int shezhiIconheight=shezhipic->getTextureRect().size.height/5;
        int jiangejuli=menu_backIcon->getContentSize().width*3/2;
        int shujuli=shezhiIconheight*2/3;
        menu_backIcon->setAnchorPoint(ccp(0.5,0.5));
        //shezhiIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2,shezhikuangheight*2/5+shezhibiankuangheight));
        menu_backIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/4,shujuli));
        shezhipic->addChild(menu_backIcon,2);
        const char *menu_backStr = ((CCString*)(loacalstrings->objectForKey("menu_back")))->m_sString.c_str();
        CCLabelTTF *pLabelmenu_back = CCLabelTTF::create(menu_backStr, "Arial", 34/bigsmall_factor);//Helvetica 25
        //pLabelbet->setColor(ccc3(248,213,118));
        pLabelmenu_back->setAnchorPoint(ccp(0,0.5));
        pLabelmenu_back->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/4+jiangejuli,shujuli));
        shezhipic->addChild(pLabelmenu_back,2);
        
		CCTexture2D* texturehome_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhi_an.png");
		CCTexture2D* texturehome_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhi_an_select.png");
		CCMenuItemSprite* phome=CCMenuItemSprite::create(CCSprite::createWithTexture(texturehome_up),CCSprite::createWithTexture(texturehome_down),this,menu_selector(PauseGameDialogLayer::homeMenuItemCallback));
		CC_BREAK_IF(!phome);
		phome->setAnchorPoint(ccp(0.5,0.5));
        phome->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shujuli));
		//phome->setPosition(ccp(shezhipic->getTextureRect().getMidX(),(shezhikuangheight-shezhiIconheight)/2+shezhiIconheight/10));
        //phome->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shezhikuangheight/10+shezhibiankuangheight));
        //phome->setPosition(ccp(shezhipic->getTextureRect().getMidX(),(shezhikuangquanheight-50-shezhikuangheight)/2+shezhikuangheight/8+shezhibiankuangheight));
		//phome->setPositionY(phome->getPositionY()*2/3);

        // 创建 预留游戏菜单按钮,预留paytable
        CCSprite* menu_paytableIcon= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/menu_gamecnter.png"));
        menu_paytableIcon->setAnchorPoint(ccp(0.5,0.5));
        //shezhiIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2,shezhikuangheight*2/5+shezhibiankuangheight));
        menu_paytableIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/4,shezhiIconheight+shujuli));
        shezhipic->addChild(menu_paytableIcon,2);
        
        const char *menu_paytableStr = ((CCString*)(loacalstrings->objectForKey("menu_paihangbang")))->m_sString.c_str();
        CCLabelTTF *pLabelmenu_paytable = CCLabelTTF::create(menu_paytableStr, "Arial", 34/bigsmall_factor);//Helvetica 25
        //pLabelbet->setColor(ccc3(248,213,118));
        pLabelmenu_paytable->setAnchorPoint(ccp(0,0.5));
        pLabelmenu_paytable->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/4+jiangejuli,shezhiIconheight+shujuli));
        shezhipic->addChild(pLabelmenu_paytable,2);
        CCTexture2D* textureyuliu_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhi_an.png");
        CCTexture2D* textureyuliu_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhi_an_select.png");
        CCMenuItemSprite* preryuliu=CCMenuItemSprite::create(CCSprite::createWithTexture(textureyuliu_up),CCSprite::createWithTexture(textureyuliu_down),this,menu_selector(PauseGameDialogLayer::yuliuMenuItemCallback));
        CC_BREAK_IF(!preryuliu);
        preryuliu->setAnchorPoint(ccp(0.5,0.5));
        preryuliu->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shezhiIconheight+shujuli));
        //preryuliu->setPosition(ccp(shezhipic->getTextureRect().getMidX(),(shezhikuangheight-shezhiIconheight)/2+shezhiIconheight/4+shezhiIconheight/8));
        //preryuliu->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shezhikuangheight/10+shezhikuangheight/5+shezhibiankuangheight));
        //preryuliu->setPosition(ccp(shezhipic->getTextureRect().getMidX(),(shezhikuangquanheight-50-shezhikuangheight)/2+shezhikuangheight/8+shezhikuangheight/4+shezhibiankuangheight));
        // 创建 设定游戏菜单按钮,设定
        CCSprite* menu_optionsIcon= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/menu_options.png"));
        menu_optionsIcon->setAnchorPoint(ccp(0.5,0.5));
        //shezhiIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2,shezhikuangheight*2/5+shezhibiankuangheight));
        menu_optionsIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/4,shezhiIconheight*2+shujuli));
        shezhipic->addChild(menu_optionsIcon,2);
        
        const char *menu_optionsStr = ((CCString*)(loacalstrings->objectForKey("menu_options")))->m_sString.c_str();
        CCLabelTTF *pLabelmenu_options = CCLabelTTF::create(menu_optionsStr, "Arial", 34/bigsmall_factor);//Helvetica 25
        //pLabelbet->setColor(ccc3(248,213,118));
        pLabelmenu_options->setAnchorPoint(ccp(0,0.5));
        pLabelmenu_options->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/4+jiangejuli,shezhiIconheight*2+shujuli));
        shezhipic->addChild(pLabelmenu_options,2);
        
        CCTexture2D* textureshezhi_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhi_an.png");
        CCTexture2D* textureshezhi_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhi_an_select.png");
        CCMenuItemSprite* prershezhi=CCMenuItemSprite::create(CCSprite::createWithTexture(textureshezhi_up),CCSprite::createWithTexture(textureshezhi_down),this,menu_selector(PauseGameDialogLayer::shezhiMenuItemCallback));
        CC_BREAK_IF(!prershezhi);
        prershezhi->setAnchorPoint(ccp(0.5,0.5));
        prershezhi->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shezhiIconheight*2+shujuli));
        // prershezhi->setPosition(ccp(shezhipic->getTextureRect().getMidX(),(shezhikuangheight-shezhiIconheight)/2+shezhiIconheight/2+shezhiIconheight/8));
        //prershezhi->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shezhikuangheight/10+shezhikuangheight*2/5+shezhibiankuangheight));
        // prershezhi->setPosition(ccp(shezhipic->getTextureRect().getMidX(),(shezhikuangquanheight-50-shezhikuangheight)/2+shezhikuangheight/8+shezhikuangheight/2+shezhibiankuangheight));
        //prershezhi->setPositionY(prerety->getPositionY()*4/3);

		// 创建 store菜单按钮
        CCSprite* menu_buyconisIcon= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("gmme/menu_buyconis.png"));
        menu_buyconisIcon->setAnchorPoint(ccp(0.5,0.5));
        //shezhiIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/2,shezhikuangheight*2/5+shezhibiankuangheight));
        menu_buyconisIcon->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/4,shezhiIconheight*3+shujuli));
        shezhipic->addChild(menu_buyconisIcon,2);
        
        const char *menu_buyconisStr = ((CCString*)(loacalstrings->objectForKey("menu_buycoins")))->m_sString.c_str();
        CCLabelTTF *pLabelmenu_buyconis = CCLabelTTF::create(menu_buyconisStr, "Arial", 34/bigsmall_factor);//Helvetica 25
        //pLabelbet->setColor(ccc3(248,213,118));
        pLabelmenu_buyconis->setAnchorPoint(ccp(0,0.5));
        pLabelmenu_buyconis->setPosition(ccp(shezhipic->getTextureRect().getMaxX()/4+jiangejuli,shezhiIconheight*3+shujuli));
        shezhipic->addChild(pLabelmenu_buyconis,2);
        
		CCTexture2D* texturegostore_up = CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhi_an.png");
		CCTexture2D* texturegostore_down = CCTextureCache::sharedTextureCache()->textureForKey("gmme/shezhi_an_select.png");
		CCMenuItemSprite* presume=CCMenuItemSprite::create(CCSprite::createWithTexture(texturegostore_up),CCSprite::createWithTexture(texturegostore_down),this,menu_selector(PauseGameDialogLayer::gostoreMenuItemCallback));
		CC_BREAK_IF(!presume);
        presume->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shezhiIconheight*3+shujuli));
        //presume->setPosition(ccp(shezhipic->getTextureRect().getMidX(),(shezhikuangheight-shezhiIconheight)/2+shezhiIconheight*3/4+shezhiIconheight/6));
        //presume->setPosition(ccp(shezhipic->getTextureRect().getMidX(),(shezhikuangheight-shezhiIconheight)/2+shezhiIconheight*3/4+shezhiIconheight/8));
		//presume->setPosition(ccp(shezhipic->getTextureRect().getMidX(),shezhikuangheight/10+shezhikuangheight*3/5+shezhibiankuangheight));
		//presume->setPosition(ccp(shezhipic->getTextureRect().getMidX(),(shezhikuangquanheight-50-shezhikuangheight)/2+shezhikuangheight/8+shezhikuangheight*3/4+shezhibiankuangheight));
		m_pMenu = CCMenu::create(phome, presume,prershezhi,preryuliu, pCloseItem,NULL);
		CC_BREAK_IF(!m_pMenu);
		m_pMenu->setPosition(CCPointZero);
		shezhipic->addChild(m_pMenu,1);
		isRet=true;
	} while (0);
	return isRet;

}

void PauseGameDialogLayer::onEnter()
{
	BaseLayer::onEnter();
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
		this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝  
		-128, //”≈œ»º∂  
		true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ  
}

void PauseGameDialogLayer::onExit()
{
	BaseLayer::onExit();
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool PauseGameDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

	m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

	return true;
}

void PauseGameDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchMoved(pTouch, pEvent);
	}
}

void PauseGameDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}

void PauseGameDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
	if (m_bTouchedMenu) {
		m_pMenu->ccTouchEnded(pTouch, pEvent);
		m_bTouchedMenu = false;
	}
}


void PauseGameDialogLayer::homeMenuItemCallback(cocos2d::CCObject *pSender){
	
   //CCDirector::sharedDirector()->stopAnimation();
    //CCLayerColor *layer = CCLayerColor::create(ccc4(255,0,0,255), 640, 960);//Õ∆ºˆ π”√∆¡±Œ≤„
    Playyinxiao::play_anjian();

     LoadingScene *LOADlayer=LoadingScene::create();
    CCDirector::sharedDirector()->setNotificationNode(LOADlayer);//“™∑≈‘⁄≥°æ∞≥ı ºªØ÷Æ«∞°£≤ª»ªΩ¯»Î≥°æ∞£¨loadªπ «‘⁄
    CCDirector::sharedDirector()->drawScene();
    Playyinxiao::stopeffect();
    Playyinxiao::stopmusic();
    

    CCScene* se=MapChoose::scene();
    //CCScene *se=LoadScene::scene();
    this->removeFromParentAndCleanup(true);
    CCDirector::sharedDirector()->replaceScene(se);
	//CCDirector::sharedDirector()->replaceScene(CCTransitionMoveInL::create(0.5,se));
	//CCDirector::sharedDirector()->resume();
	
	

}
void PauseGameDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    //CCDirector::sharedDirector()->resume();
    //CCDelayTime *freexuanzhuandelay=CCDelayTime::create(2.0f);
    Playyinxiao::play_anjian();
    this->removeFromParentAndCleanup(true);
}

void PauseGameDialogLayer::yuliuMenuItemCallback(cocos2d::CCObject *pSender)
{
    Playyinxiao::play_anjian();
    //显示排行榜
    [[GameKitHelper sharedGameKitHelper] showLeaderboard];//GameCenter
/*
    TableDialogLayer* GoTableDialogLayer=TableDialogLayer::create();
    if(GoTableDialogLayer)
    {
        GoTableDialogLayer->setPosition(CCPointZero);
        this->getParent()->addChild(GoTableDialogLayer,1001,99999);
    }*/
    this->removeFromParentAndCleanup(true);

}

void PauseGameDialogLayer::shezhiMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
    Playyinxiao::play_anjian();

    ShezhiLayer* ShezhiLayer=ShezhiLayer::create();
    if(ShezhiLayer){		
        //CCDirector::sharedDirector()->pause();// ‘›Õ£”Œœ∑
        //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
        //pauseGameDialogLayer->setPosition(getWinCenter());
        ShezhiLayer->setPosition(CCPointZero);
        this->getParent()->addChild(ShezhiLayer,7);
    }
	this->removeFromParentAndCleanup(true);
    
    
    }
    
    
  void PauseGameDialogLayer::gostoreMenuItemCallback(cocos2d::CCObject *pSender){
	//CCDirector::sharedDirector()->resume();
      Playyinxiao::play_anjian();

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
