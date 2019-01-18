#include "table.h"
 #include "playyinxiao.h"
using namespace cocos2d;
/*****
http://blog.csdn.net/onerain88/article/details/7608496
≤Œøº◊ ¡œ
*****/



TableDialogLayer::TableDialogLayer(void)
{
}
TableDialogLayer::~TableDialogLayer(void)
{
    CCTextureCache::sharedTextureCache()->removeTextureForKey("table/table_bj.png");

}
bool TableDialogLayer::init()
{
	bool bRet = false;

	do {
		CC_BREAK_IF(!CCLayer::init());
        //CCTextureCache::sharedTextureCache()->addImage("zhegaibj.png");
         //CCTextureCache::sharedTextureCache()->addImage("freexuanzhuan.png");
         CCTextureCache::sharedTextureCache()->addImage("table/table_bj.png");
         //CCTextureCache::sharedTextureCache()->addImage("table/btnclose.png");
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


bool TableDialogLayer::setUpdateView()
{
	bool isRet=false;
	do 
	{

		/* CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
		
        CC_BREAK_IF(!pbg);
		pbg->setAnchorPoint(ccp(0.5,0.5));
		pbg->setPosition(getWinCenter());
		this->addChild(pbg);*/
        table_bj= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("table/table_bj.png"));
        bj_x=table_bj->getTextureRect().getMaxX();
        bj_y=table_bj->getTextureRect().getMaxY();
        CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
        table_bj->setPosition(ccp(visibleSize.width/2,visibleSize.height/2));
        table_bj->setAnchorPoint(ccp(0.5,0.5));
        this->addChild(table_bj);
       
//         CCLabelTTF* pLabel = CCLabelTTF::create("STORE", "Arial", 45/bigsmall_factor);
//         pLabel->setPosition(ccp(storebj->getTextureRect().getMidX(),storebj->getTextureRect().getMaxY()*15/16));
//         pLabel->setAnchorPoint(ccp(0.5,0.65));
//         storebj->addChild(pLabel,2);
        table_bj->runAction(CCFadeIn::create(1));
    
        const char *menu_paytableStr = ((CCString*)(loacalstrings->objectForKey("menu_paytable")))->m_sString.c_str();
        CCLabelTTF *pLabelmenu_paytable = CCLabelTTF::create(menu_paytableStr, "Arial", 38/bigsmall_factor);//Helvetica 25
        //pLabelbet->setColor(ccc3(248,213,118));
        pLabelmenu_paytable->setAnchorPoint(ccp(0.5,1.6));
        pLabelmenu_paytable->setPosition(ccp(bj_x/2,bj_y));
        table_bj->addChild(pLabelmenu_paytable,2);
        
        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
            "table/btnclose.png",
            "table/btnclose.png",
            this,
            menu_selector(TableDialogLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
       // pCloseItem->setPosition(ccp(visibleSize.width/2+bj_x/2,visibleSize.height/2+bj_y/2));
        pCloseItem->setPosition(ccp(bj_x,bj_y));
        pCloseItem->setAnchorPoint(ccp(1,1));

        //ª¨∂Ø«¯”Ú.≤Œøºmapchoose

        layer = CCLayer::create();
        scrolloffset=10;
        scroll_bj_x=bj_x-scrolloffset*2;//±£≥÷‘⁄bjƒ⁄
        scroll_bj_y=bj_y;
        for(int i=0;i<3;i++)
        {
            CCSprite *sprite_zuo;
            sprite_zuo = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("laohu_%d.png", 7+i)->getCString());
            sprite_zuo->setAnchorPoint(ccp(0.5,0.5));
            
            //CCSprite *sprite_you;
            //sprite_you = CCSprite::create(CCString::createWithFormat("table/table_%d.png", i)->getCString());
          
            
            const char *menu_tableyou_1 = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("table_1_%d", i)->getCString())))->m_sString.c_str();
            CCLabelTTF *sprite_you_1 = CCLabelTTF::create(menu_tableyou_1, "Arial", 30/bigsmall_factor);//Helvetica 25
            
            const char *menu_tableyou = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("table_%d", i)->getCString())))->m_sString.c_str();
            CCLabelTTF *sprite_you = CCLabelTTF::create(menu_tableyou, "Arial", 24/bigsmall_factor);//Helvetica 25
            
            sprite_you_1->setAnchorPoint(ccp(0,0));
            sprite_you->setAnchorPoint(ccp(0,1));//0.5
         
            
            sprite_zuo->setPosition(ccp(scroll_bj_x/5,scroll_bj_y-scroll_bj_y/4-scroll_bj_y/4*i));
            sprite_you_1->setPosition(ccp(scroll_bj_x*7/20,scroll_bj_y-scroll_bj_y/5-scroll_bj_y/4*i));
            sprite_you->setPosition(ccp(scroll_bj_x*7/20,scroll_bj_y-scroll_bj_y/5-scroll_bj_y/4*i));
           
            layer->addChild(sprite_zuo);
            layer->addChild(sprite_you);
            layer->addChild(sprite_you_1);
        }
        
        for (int i=0;i<=7;i++)
        {
            if (i!=7)
            {
                CCSprite *sprite_zuo;
                //CCSprite *sprite_you;
                sprite_zuo = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("laohu_%d.png", i)->getCString());
                //sprite_you = CCSprite::create(CCString::createWithFormat("table/table_laohu_%d.png", i)->getCString());
                const char *menu_tableyou = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("table_%d", i+3)->getCString())))->m_sString.c_str();
                CCLabelTTF *sprite_you = CCLabelTTF::create(menu_tableyou, "Arial", 24/bigsmall_factor);//Helvetica 25
                sprite_you->setAnchorPoint(ccp(0,0.75));
                if (!(i%2))//偶?数oy,左á¨?边à?
                {
                    sprite_zuo->setPosition(ccp(scroll_bj_x+scrolloffset*2+scroll_bj_x/8,scroll_bj_y-bj_y/5-bj_y/5*(i/2)));
                    sprite_you->setPosition(ccp(scroll_bj_x+10+scrolloffset*2+scroll_bj_x*2/8,scroll_bj_y-bj_y/5-bj_y/5*(i/2)));//scroll_bj_y-scroll_bj_y/8-scroll_bj_y/8*i
                }
                else//奇?数oy
                {
                    sprite_zuo->setPosition(ccp(scroll_bj_x+scrolloffset*2+scroll_bj_x*5/8,scroll_bj_y-bj_y/5-bj_y/5*((i-1)/2)));
                    sprite_you->setPosition(ccp(scroll_bj_x+10+scrolloffset*2+scroll_bj_x*6/8,scroll_bj_y-bj_y/5-bj_y/5*((i-1)/2)));//scroll_bj_y-scroll_bj_y/8-scroll_bj_y/8*(i-1)
                }
                
                layer->addChild(sprite_zuo);
                layer->addChild(sprite_you);
                
            }
            else
            {
                //CCSprite *sprite_you;
                //sprite_you = CCSprite::create("table/table_putongsymbols.png");
                const char *menu_tableyou = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("table_%d", i+3)->getCString())))->m_sString.c_str();
                CCLabelTTF *sprite_you = CCLabelTTF::create(menu_tableyou, "Arial", 24/bigsmall_factor);//Helvetica 25
                
                sprite_you->setAnchorPoint(ccp(0.5,0.75));
                sprite_you->setPosition(ccp(scroll_bj_x+scrolloffset*2+scroll_bj_x*3/4,scroll_bj_y-bj_y/5-bj_y/5*((i-1)/2)));
                layer->addChild(sprite_you);
            }
        }

        //test±ﬂΩÁ
        
        //         CCSprite *sprite_test_zuoxia;
        //         sprite_test_zuoxia = CCSprite::create("switch-thumb2.png");
        //         sprite_test_zuoxia->setAnchorPoint(ccp(0.5,0.5));
        //         sprite_test_zuoxia->setPosition(ccp(0,0));
        //         layer->addChild(sprite_test_zuoxia);
        //
        //         CCSprite *sprite_test_zuoshang;
        //         sprite_test_zuoshang = CCSprite::create("switch-thumb2.png");
        //         sprite_test_zuoshang->setAnchorPoint(ccp(0.5,0.5));
        //         sprite_test_zuoshang->setPosition(ccp(0,bj_y));
        //         layer->addChild(sprite_test_zuoshang);
        
        
        //
        //ºÃ–¯£°£°£°£°£°temp
        layer->setAnchorPoint(CCPointZero);
        layer->setPosition(ccp(scrolloffset,0));//CCPointZero
        scrollView = CCScrollView::create(CCSizeMake((scroll_bj_x+scrolloffset)*2,bj_y),layer);//two pages
        scrollView->setPosition(ccp(scrolloffset,0));//CCPointZero
        scrollView->setContentOffset(CCPointZero);
        layer->setContentSize(CCSizeMake((scroll_bj_x+scrolloffset)*2,bj_y));
        scrollView->setViewSize(CCSizeMake(scroll_bj_x,bj_y));
        //scrollView->setContentSize(CCSizeMake(640*6, 960));
        //scrollView->setContentSize(CCSizeMake(size.width, size.height*(GuankaNum+2)));
        scrollView->setContentSize(CCSizeMake((scroll_bj_x+scrolloffset)*2,bj_y));
        // scrollView->setContainer(layer);
        scrollView->setTouchEnabled(false);
        scrollView->setDelegate(this);
        //scrollView->setDirection(kCCScrollViewDirectionHorizontal);
        scrollView->setDirection(kCCScrollViewDirectionHorizontal);//kCCScrollViewDirectionHorizontal∫·œÚ kCCScrollViewDirectionVertical ◊›œÚ

        table_bj->addChild(scrollView);
//         CCMenuItemImage *pGoItem = CCMenuItemImage::create(
//             "store/go.png",
//             "store/go-select.png",
//             this,
//             menu_selector(TableDialogLayer::menuGoCallback));
//         CC_BREAK_IF(! pGoItem);
//         pGoItem->setPosition(ccp(storebj->getTextureRect().getMidX(),storebj->getTextureRect().getMidY()/10));
//         pGoItem->setAnchorPoint(ccp(0.5,0));
        /*
		




		m_pMenu = CCMenu::create(phome, presume,prerety, NULL);*/
        m_pMenu=CCMenu::create(pCloseItem,NULL);
		CC_BREAK_IF(!m_pMenu);
		m_pMenu->setPosition(CCPointZero);
		//table_bj->getParent()->addChild(m_pMenu);
        table_bj->addChild(m_pMenu);
        CCSpriteFrameCache *cache =  CCSpriteFrameCache::sharedSpriteFrameCache();

        //cache->addSpriteFrame(CCSpriteFrame::create("Help_Point01.png",CCRectMake(0,0,20,20)),"Help_Point01.png");
        //cache->addSpriteFrame(CCSpriteFrame::create("Help_Point02.png",CCRectMake(0,0,20,20)),"Help_Point02.png");
        for (int i=1;i<=2;i++)
        {
            CCSprite *point = CCSprite::createWithSpriteFrameName("Help_Point01.png");
            //CCSprite *point =CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("Help_Point01.png"));
            point->setTag(100+i);
            point->setAnchorPoint(ccp(0.5,0.5));
            //point->setPosition(ccp(size.width/2-40*3+40*i,40));
            // point->setPosition(ccp(20,size.height/2-40*3+40*i));
            point->setPosition(ccp(bj_x/2-60+40*i,40));
            table_bj->addChild(point);
        }
         pageNum = 1;
        int pointnum=100+pageNum;
        CCSprite *point = (CCSprite *)table_bj->getChildByTag(pointnum);
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point02.png"));

        huadongtag=false;
		isRet=true;
	} while (0);
	return isRet;

}


 void TableDialogLayer::sethuadong(bool huadong)
 {
     huadongtag=huadong;
 }

void TableDialogLayer::adjustScrollView(float offset)
{
    if (offset<10&&offset>-10)
    {

    }
    else
    {

        CCSpriteFrameCache *cache =  CCSpriteFrameCache::sharedSpriteFrameCache();
        CCSprite *point = (CCSprite *)table_bj->getChildByTag(100+pageNum);
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point01.png"));
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
            
        }
        else if(pageNum >= 2)
        {
            pageNum =2;
            
        }
        
        point = (CCSprite *)table_bj->getChildByTag(100+pageNum);
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point02.png"));
    }
  //  CCSize size =CCDirector::sharedDirector()->getVisibleSize();
    //CCPoint  adjustPos = ccp(-size.width*(pageNum-1),0);
    CCPoint  adjustPos = ccp(-(scroll_bj_x+scrolloffset)*(pageNum-1),0);
    //CCLOG("size.width= %f ,pagenum= %d, djustPos.x=%f",size.width,pageNum,adjustPos.x);
    scrollView->setContentOffset(adjustPos, true);////////
    //kaimen(pageNum);
    sethuadong(false);


}


void TableDialogLayer::gensui(float offset)
{

    //scrollView->setContentOffset(ccp(offset,0), true);
    //scrollView->setContentOffset(ccpAdd(ccp(offset,0),scrollPoint));

    if (offset<10&&offset>-10)
    {

    } 
    else
    {
        scrollView->setContentOffset(ccpAdd(ccp(offset,0),scrollPoint));
    }

}

void TableDialogLayer::scrollViewDidScroll(cocos2d::extension::CCScrollView *view)
{

}

void TableDialogLayer::scrollViewDidZoom(cocos2d::extension::CCScrollView *view)
{
}
void TableDialogLayer::onEnter()
{
	CCLayer::onEnter();
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(  
		this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝  
		-128, //”≈œ»º∂  
		true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ  
}

void TableDialogLayer::onExit()
{
	CCLayer::onExit();
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool TableDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{

    
    CCRect rect=table_bj->boundingBox();
    rect.setRect((rect.origin).x, (rect.origin).y, rect.size.width, rect.size.height-100);
    if (rect.containsPoint(pTouch->getLocation()))
    {
        sethuadong(true);
        touchPoint = pTouch->getLocation();
        scrollPoint=scrollView->getContentOffset();
        
    }
   m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);

	return true;
}

void TableDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchMoved(pTouch, pEvent);
    }
    if (huadongtag)
    {
    //CCRect rect=table_bj->boundingBox();
    //if (rect.containsPoint(pTouch->getLocation()))
    //{
      CCPoint nowPoint = pTouch->getLocation();
        gensui(nowPoint.x-touchPoint.x);
    //}
    }
}


void TableDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchEnded(pTouch, pEvent);
        m_bTouchedMenu = false;
    }
    if (huadongtag)
    {
        //CCRect rect=table_bj->boundingBox();
        //if (rect.containsPoint(pTouch->getLocation()))
        //{
            CCPoint endPoint = pTouch->getLocation();
            offsetjuli=endPoint.x-touchPoint.x;

        //}
        adjustScrollView(offsetjuli);
    }

}

void TableDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchEnded(pTouch, pEvent);
        m_bTouchedMenu = false;
    }
    CCPoint endPoint = pTouch->getLocation();
    offsetjuli=endPoint.x-touchPoint.x;
    adjustScrollView(offsetjuli);

}



void TableDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
   // CCLOG("this->getTag()=%d,(this->getParent()->getChildByTag(99999))->retainCount()=%d",this->getTag(),(this->getParent()->getChildByTag(99999))->retainCount());
    //this->release();
    //CCLOG("this->getTag()=%d,this->retainCount()=%d",this->getTag(),this->retainCount());
      Playyinxiao::play_anjian();
    (this->getParent()->getChildByTag(99999))->removeFromParentAndCleanup(true);
    //CCLOG("this->retainCount()=%d",this->retainCount());
    //this->removeFromParentAndCleanup(true);
 
}
//
//newhand 新手

NewhandDialogLayer::NewhandDialogLayer(void)
{
}
NewhandDialogLayer::~NewhandDialogLayer(void)
{
    CCTextureCache::sharedTextureCache()->removeTextureForKey("table/table_bj.png");
    CCTextureCache::sharedTextureCache()->removeTextureForKey("zhegaibj.png");
}
bool NewhandDialogLayer::init()
{
    bool bRet = false;
    
    do {
        CC_BREAK_IF(!CCLayer::init());
        CCTextureCache::sharedTextureCache()->addImage("zhegaibj.png");
        //CCTextureCache::sharedTextureCache()->addImage("freexuanzhuan.png");
        CCTextureCache::sharedTextureCache()->addImage("table/table_bj.png");
        
        //CCTextureCache::sharedTextureCache()->addImage("table/btnclose.png");
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


bool NewhandDialogLayer::setUpdateView()
{
    bool isRet=false;
    do
    {
        
        MaxpageNum=2;
        CCSprite* pbg= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("zhegaibj.png"));
         
         CC_BREAK_IF(!pbg);
        CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
         pbg->setAnchorPoint(ccp(0.5,0.5));
         pbg->setPosition(ccp(visibleSize.width/2,visibleSize.height/2));
         this->addChild(pbg);
        table_bj= CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("table/table_bj.png"));
        bj_x=table_bj->getTextureRect().getMaxX();
        bj_y=table_bj->getTextureRect().getMaxY();
        
        table_bj->setPosition(ccp(visibleSize.width/2,visibleSize.height/2));
        table_bj->setAnchorPoint(ccp(0.5,0.5));
        this->addChild(table_bj);
        
        //         CCLabelTTF* pLabel = CCLabelTTF::create("STORE", "Arial", 45/bigsmall_factor);
        //         pLabel->setPosition(ccp(storebj->getTextureRect().getMidX(),storebj->getTextureRect().getMaxY()*15/16));
        //         pLabel->setAnchorPoint(ccp(0.5,0.65));
        //         storebj->addChild(pLabel,2);
        table_bj->runAction(CCFadeIn::create(1));
        
        const char *menu_paytableStr = ((CCString*)(loacalstrings->objectForKey("menu_paytable")))->m_sString.c_str();
        CCLabelTTF *pLabelmenu_paytable = CCLabelTTF::create(menu_paytableStr, "Arial", 38/bigsmall_factor);//Helvetica 25
        //pLabelbet->setColor(ccc3(248,213,118));
        pLabelmenu_paytable->setAnchorPoint(ccp(0.5,1.6));
        pLabelmenu_paytable->setPosition(ccp(bj_x/2,bj_y));
        table_bj->addChild(pLabelmenu_paytable,2);
        
        CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
                                                              "table/btnclose.png",
                                                              "table/btnclose.png",
                                                              this,
                                                              menu_selector(TableDialogLayer::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        // pCloseItem->setPosition(ccp(visibleSize.width/2+bj_x/2,visibleSize.height/2+bj_y/2));
        pCloseItem->setPosition(ccp(bj_x,bj_y));
        pCloseItem->setAnchorPoint(ccp(1,1));
        
        //ª¨∂Ø«¯”Ú.≤Œøºmapchoose
        
        layer = CCLayer::create();
        scrolloffset=10;
        scroll_bj_x=bj_x-scrolloffset*2;//±£≥÷‘⁄bjƒ⁄
        scroll_bj_y=bj_y;
        for(int i=0;i<3;i++)
        {
            CCSprite *sprite_zuo;
            sprite_zuo = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("laohu_%d.png", 7+i)->getCString());
            sprite_zuo->setAnchorPoint(ccp(0.5,0.5));
            
            //CCSprite *sprite_you;
            //sprite_you = CCSprite::create(CCString::createWithFormat("table/table_%d.png", i)->getCString());
            
            
            const char *menu_tableyou_1 = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("table_1_%d", i)->getCString())))->m_sString.c_str();
            CCLabelTTF *sprite_you_1 = CCLabelTTF::create(menu_tableyou_1, "Arial", 30/bigsmall_factor);//Helvetica 25
            
            const char *menu_tableyou = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("table_%d", i)->getCString())))->m_sString.c_str();
            CCLabelTTF *sprite_you = CCLabelTTF::create(menu_tableyou, "Arial", 24/bigsmall_factor);//Helvetica 25
            
            sprite_you_1->setAnchorPoint(ccp(0,0));
            sprite_you->setAnchorPoint(ccp(0,1));//0.5
            
            
            sprite_zuo->setPosition(ccp(scroll_bj_x/5,scroll_bj_y-scroll_bj_y/4-scroll_bj_y/4*i));
            sprite_you_1->setPosition(ccp(scroll_bj_x*7/20,scroll_bj_y-scroll_bj_y/5-scroll_bj_y/4*i));
            sprite_you->setPosition(ccp(scroll_bj_x*7/20,scroll_bj_y-scroll_bj_y/5-scroll_bj_y/4*i));
            
            layer->addChild(sprite_zuo);
            layer->addChild(sprite_you);
            layer->addChild(sprite_you_1);
        }
        
        for (int i=0;i<=7;i++)
        {
            if (i!=7)
            {
                CCSprite *sprite_zuo;
                //CCSprite *sprite_you;
                sprite_zuo = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("laohu_%d.png", i)->getCString());
                //sprite_you = CCSprite::create(CCString::createWithFormat("table/table_laohu_%d.png", i)->getCString());
                const char *menu_tableyou = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("table_%d", i+3)->getCString())))->m_sString.c_str();
                CCLabelTTF *sprite_you = CCLabelTTF::create(menu_tableyou, "Arial", 24/bigsmall_factor);//Helvetica 25
                sprite_you->setAnchorPoint(ccp(0,0.75));
                if (!(i%2))//偶?数oy,左á¨?边à?
                {
                    sprite_zuo->setPosition(ccp(scroll_bj_x+scrolloffset*2+scroll_bj_x/8,scroll_bj_y-bj_y/5-bj_y/5*(i/2)));
                    sprite_you->setPosition(ccp(scroll_bj_x+10+scrolloffset*2+scroll_bj_x*2/8,scroll_bj_y-bj_y/5-bj_y/5*(i/2)));//scroll_bj_y-scroll_bj_y/8-scroll_bj_y/8*i
                }
                else//奇?数oy
                {
                    sprite_zuo->setPosition(ccp(scroll_bj_x+scrolloffset*2+scroll_bj_x*5/8,scroll_bj_y-bj_y/5-bj_y/5*((i-1)/2)));
                    sprite_you->setPosition(ccp(scroll_bj_x+10+scrolloffset*2+scroll_bj_x*6/8,scroll_bj_y-bj_y/5-bj_y/5*((i-1)/2)));//scroll_bj_y-scroll_bj_y/8-scroll_bj_y/8*(i-1)
                }
                
                layer->addChild(sprite_zuo);
                layer->addChild(sprite_you);
                
            }
            else
            {
                //CCSprite *sprite_you;
                //sprite_you = CCSprite::create("table/table_putongsymbols.png");
                const char *menu_tableyou = ((CCString*)(loacalstrings->objectForKey(CCString::createWithFormat("table_%d", i+3)->getCString())))->m_sString.c_str();
                CCLabelTTF *sprite_you = CCLabelTTF::create(menu_tableyou, "Arial", 24/bigsmall_factor);//Helvetica 25
                
                sprite_you->setAnchorPoint(ccp(0.5,0.75));
                sprite_you->setPosition(ccp(scroll_bj_x+scrolloffset*2+scroll_bj_x*3/4,scroll_bj_y-bj_y/5-bj_y/5*((i-1)/2)));
                layer->addChild(sprite_you);
            }
        }
        
        //test±ﬂΩÁ
        
        //         CCSprite *sprite_test_zuoxia;
        //         sprite_test_zuoxia = CCSprite::create("switch-thumb2.png");
        //         sprite_test_zuoxia->setAnchorPoint(ccp(0.5,0.5));
        //         sprite_test_zuoxia->setPosition(ccp(0,0));
        //         layer->addChild(sprite_test_zuoxia);
        //
        //         CCSprite *sprite_test_zuoshang;
        //         sprite_test_zuoshang = CCSprite::create("switch-thumb2.png");
        //         sprite_test_zuoshang->setAnchorPoint(ccp(0.5,0.5));
        //         sprite_test_zuoshang->setPosition(ccp(0,bj_y));
        //         layer->addChild(sprite_test_zuoshang);
        
        
        //
        //ºÃ–¯£°£°£°£°£°temp
        layer->setAnchorPoint(CCPointZero);
        layer->setPosition(ccp(scrolloffset,0));//CCPointZero
        scrollView = CCScrollView::create(CCSizeMake((scroll_bj_x+scrolloffset)*2,bj_y),layer);//two pages
        scrollView->setPosition(ccp(scrolloffset,0));//CCPointZero
        scrollView->setContentOffset(CCPointZero);
        layer->setContentSize(CCSizeMake((scroll_bj_x+scrolloffset)*2,bj_y));
        scrollView->setViewSize(CCSizeMake(scroll_bj_x,bj_y));
        //scrollView->setContentSize(CCSizeMake(640*6, 960));
        //scrollView->setContentSize(CCSizeMake(size.width, size.height*(GuankaNum+2)));
        scrollView->setContentSize(CCSizeMake((scroll_bj_x+scrolloffset)*2,bj_y));
        // scrollView->setContainer(layer);
        scrollView->setTouchEnabled(false);
        scrollView->setDelegate(this);
        //scrollView->setDirection(kCCScrollViewDirectionHorizontal);
        scrollView->setDirection(kCCScrollViewDirectionHorizontal);//kCCScrollViewDirectionHorizontal∫·œÚ kCCScrollViewDirectionVertical ◊›œÚ
        
        table_bj->addChild(scrollView);
        //         CCMenuItemImage *pGoItem = CCMenuItemImage::create(
        //             "store/go.png",
        //             "store/go-select.png",
        //             this,
        //             menu_selector(TableDialogLayer::menuGoCallback));
        //         CC_BREAK_IF(! pGoItem);
        //         pGoItem->setPosition(ccp(storebj->getTextureRect().getMidX(),storebj->getTextureRect().getMidY()/10));
        //         pGoItem->setAnchorPoint(ccp(0.5,0));
        /*
         
         
         
         
         
         m_pMenu = CCMenu::create(phome, presume,prerety, NULL);*/
        m_pMenu=CCMenu::create(pCloseItem,NULL);
        CC_BREAK_IF(!m_pMenu);
        m_pMenu->setPosition(CCPointZero);
        //table_bj->getParent()->addChild(m_pMenu);
        table_bj->addChild(m_pMenu);
        CCSpriteFrameCache *cache =  CCSpriteFrameCache::sharedSpriteFrameCache();
        
        //cache->addSpriteFrame(CCSpriteFrame::create("Help_Point01.png",CCRectMake(0,0,20,20)),"Help_Point01.png");
        //cache->addSpriteFrame(CCSpriteFrame::create("Help_Point02.png",CCRectMake(0,0,20,20)),"Help_Point02.png");
        for (int i=1;i<=MaxpageNum;i++)
        {
            CCSprite *point = CCSprite::createWithSpriteFrameName("Help_Point01.png");
            //CCSprite *point =CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("Help_Point01.png"));
            point->setTag(100+i);
            point->setAnchorPoint(ccp(0.5,0.5));
            //point->setPosition(ccp(size.width/2-40*3+40*i,40));
            // point->setPosition(ccp(20,size.height/2-40*3+40*i));
            point->setPosition(ccp(bj_x/2-60+40*i,40));
            table_bj->addChild(point);
        }
        pageNum = 1;
        int pointnum=100+pageNum;
        CCSprite *point = (CCSprite *)table_bj->getChildByTag(pointnum);
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point02.png"));
        
        huadongtag=false;
        isRet=true;
    } while (0);
    return isRet;
    
}


void NewhandDialogLayer::sethuadong(bool huadong)
{
    huadongtag=huadong;
}

void NewhandDialogLayer::adjustScrollView(float offset)
{
    if (offset<10&&offset>-10)
    {
        
    }
    else
    {
        
        CCSpriteFrameCache *cache =  CCSpriteFrameCache::sharedSpriteFrameCache();
        CCSprite *point = (CCSprite *)table_bj->getChildByTag(100+pageNum);
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point01.png"));
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
            
        }
        else if(pageNum >= MaxpageNum)
        {
            pageNum =MaxpageNum;
            
        }
        
        point = (CCSprite *)table_bj->getChildByTag(100+pageNum);
        point->setDisplayFrame(cache->spriteFrameByName("Help_Point02.png"));
    }
    //  CCSize size =CCDirector::sharedDirector()->getVisibleSize();
    //CCPoint  adjustPos = ccp(-size.width*(pageNum-1),0);
    CCPoint  adjustPos = ccp(-(scroll_bj_x+scrolloffset)*(pageNum-1),0);
    //CCLOG("size.width= %f ,pagenum= %d, djustPos.x=%f",size.width,pageNum,adjustPos.x);
    scrollView->setContentOffset(adjustPos, true);////////
    //kaimen(pageNum);
    sethuadong(false);
    
    
}


void NewhandDialogLayer::gensui(float offset)
{
    
    //scrollView->setContentOffset(ccp(offset,0), true);
    //scrollView->setContentOffset(ccpAdd(ccp(offset,0),scrollPoint));
    
    if (offset<10&&offset>-10)
    {
        
    }
    else
    {
        scrollView->setContentOffset(ccpAdd(ccp(offset,0),scrollPoint));
    }
    
}

void NewhandDialogLayer::scrollViewDidScroll(cocos2d::extension::CCScrollView *view)
{
    
}

void NewhandDialogLayer::scrollViewDidZoom(cocos2d::extension::CCScrollView *view)
{
}
void NewhandDialogLayer::onEnter()
{
    CCLayer::onEnter();
    CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(
                                                                            this,//‘⁄ƒ«∏ˆ¿‡÷– µœ÷¥•∆¡ªÿµ˜∫Ø ˝
                                                                            -128, //”≈œ»º∂
                                                                            true);//¥•√˛ ±º‰ «∑Ò±ª∏√ƒø±ÍΩÿªÒ
}

void NewhandDialogLayer::onExit()
{
    CCLayer::onExit();
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool NewhandDialogLayer::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    
    
    CCRect rect=table_bj->boundingBox();
    rect.setRect((rect.origin).x, (rect.origin).y, rect.size.width, rect.size.height-100);
    if (rect.containsPoint(pTouch->getLocation()))
    {
        sethuadong(true);
        touchPoint = pTouch->getLocation();
        scrollPoint=scrollView->getContentOffset();
        
    }
    m_bTouchedMenu = m_pMenu->ccTouchBegan(pTouch, pEvent);
    
    return true;
}

void NewhandDialogLayer::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchMoved(pTouch, pEvent);
    }
    if (huadongtag)
    {
        //CCRect rect=table_bj->boundingBox();
        //if (rect.containsPoint(pTouch->getLocation()))
        //{
        CCPoint nowPoint = pTouch->getLocation();
        gensui(nowPoint.x-touchPoint.x);
        //}
    }
}


void NewhandDialogLayer::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchEnded(pTouch, pEvent);
        m_bTouchedMenu = false;
    }
    if (huadongtag)
    {
        //CCRect rect=table_bj->boundingBox();
        //if (rect.containsPoint(pTouch->getLocation()))
        //{
        CCPoint endPoint = pTouch->getLocation();
        offsetjuli=endPoint.x-touchPoint.x;
        
        //}
        adjustScrollView(offsetjuli);
    }
    
}

void NewhandDialogLayer::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
{
    if (m_bTouchedMenu) {
        m_pMenu->ccTouchEnded(pTouch, pEvent);
        m_bTouchedMenu = false;
    }
    CCPoint endPoint = pTouch->getLocation();
    offsetjuli=endPoint.x-touchPoint.x;
    adjustScrollView(offsetjuli);
    
}



void NewhandDialogLayer::menuCloseCallback(cocos2d::CCObject *pSender){
    // CCLOG("this->getTag()=%d,(this->getParent()->getChildByTag(99999))->retainCount()=%d",this->getTag(),(this->getParent()->getChildByTag(99999))->retainCount());
    //this->release();
    //CCLOG("this->getTag()=%d,this->retainCount()=%d",this->getTag(),this->retainCount());
    Playyinxiao::play_anjian();
    (this->getParent()->getChildByTag(99999))->removeFromParentAndCleanup(true);
    //CCLOG("this->retainCount()=%d",this->retainCount());
    //this->removeFromParentAndCleanup(true);
    
}