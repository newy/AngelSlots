#ifndef __SHEZHI_H__
#define __SHEZHI_H__

#include "BaseLayer.h"
#include "cocos-ext.h"
USING_NS_CC;
USING_NS_CC_EXT;
class ShezhiLayer: public BaseLayer
{
public:
    ShezhiLayer();
    ~ShezhiLayer();    
    virtual bool init();
    // ≥ı ºªØ∂‘ª∞øÚƒ⁄»›
    bool setUpdateView();    
    CREATE_FUNC(ShezhiLayer);    
    void onEnter();
    void onExit();    
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent); 
    void menuCloseCallback(cocos2d::CCObject* pSender);
    void callbackMusicSwitch(CCObject* pSender,CCControlEvent controlEvent);
    void callbackEffectSwitch(CCObject* pSender,CCControlEvent controlEvent);     
    void homeMenuItemCallback(cocos2d::CCObject *pSender); //µ„ª˜º“∞¥≈•ªÿµ˜∫Ø ˝
    void retyMenuItemCallback(cocos2d::CCObject *pSender); //µ„ª˜÷ÿ–¬ø™ º”Œœ∑ªÿµ˜∫Ø ˝
    void resumeMenuItemCallback(cocos2d::CCObject *pSender);//µ„ª˜ºÃ–¯”Œœ∑∞¥≈• ªÿµ˜∫Ø ˝
    cocos2d::CCMenu *m_pMenu; // ƒ£Ã¨∂‘ª∞øÚ≤Àµ•    
    bool m_bTouchedMenu;// º«¬º≤Àµ•µ„ª˜
    int gcMUSICSTATE;
    bool gcEFFECTSTATE;
};

class tishiLayer: public BaseLayer
{
public:
    tishiLayer();
    ~tishiLayer();    
    virtual bool init();
    // ≥ı ºªØ∂‘ª∞øÚƒ⁄»›
    bool setUpdateView();    
    CREATE_FUNC(tishiLayer);    
    void onEnter();
    void onExit();    
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent); 
    void menuCloseCallback(cocos2d::CCObject* pSender);
    void menuGoCallback(cocos2d::CCObject *pSender);  
    cocos2d::CCMenu *m_pMenu; // ƒ£Ã¨∂‘ª∞øÚ≤Àµ•  
    bool m_bTouchedMenu;// º«¬º≤Àµ•µ„ª˜  
};
/*
class NewhandtishiLayer: public BaseLayer
{
public:
    NewhandtishiLayer();
    //NewhandtishiLayer(const char *);
    ~NewhandtishiLayer();
    virtual bool init();
    // ≥ı ºªØ∂‘ª∞øÚƒ⁄»›
    bool setUpdateView();
    CREATE_FUNC(NewhandtishiLayer);
    void onEnter();
    void onExit();
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject* pSender);
    cocos2d::CCLabelTTF* pLabelNewhand;
    void menuGoCallback(cocos2d::CCObject *pSender);
    cocos2d::CCMenu *m_pMenu; // ƒ£Ã¨∂‘ª∞øÚ≤Àµ•
    bool m_bTouchedMenu;// º«¬º≤Àµ•µ„ª˜
};*/
class NewhandtishiLayer: public BaseLayer
{
public:
    NewhandtishiLayer();
    //NewhandtishiLayer(const char *);
    ~NewhandtishiLayer();
    virtual bool init();
    // 初?始o?化?￥对?话??框¨°内¨2容¨Y
    bool setUpdateView();
    CREATE_FUNC(NewhandtishiLayer);
    void onEnter();
    void onExit();
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject* pSender);
    void menuGoCallback(cocos2d::CCObject *pSender);
    void setNowItem();
    cocos2d::CCMenu *m_pMenu; // 模?ê态??对?话??框¨°菜?单ì￡¤
    bool m_bTouchedMenu;// 记?录?菜?单ì￡¤点ì?击??
    cocos2d::CCLabelTTF* pLabeNewhand;
    int MaxNewhandNum;
    int NowNewhandNum;
    cocos2d::CCSprite *NowItem;
    cocos2d::CCNode *layer;//底ì?á层?
    cocos2d::CCSize visibleSize;
};

#endif