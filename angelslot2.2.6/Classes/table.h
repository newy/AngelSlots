#ifndef __TABLE_LAYER_H__
#define __TABLE_LAYER_H__
#include "BaseLayer.h"
#include "ResouceDefine.h"
#include "cocos2d.h"
#include "cocos-ext.h"
USING_NS_CC;
USING_NS_CC_EXT;
//Ã· ætable

class TableDialogLayer : public cocos2d::CCLayer ,public CCScrollViewDelegate
{
public:
    TableDialogLayer();
    ~TableDialogLayer();    
    virtual bool init();
    // ≥ı ºªØ∂‘ª∞øÚƒ⁄»›
    bool setUpdateView();    
    CREATE_FUNC(TableDialogLayer);    
    void onEnter();
    void onExit();    
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject *pSender);  

public:
    //÷ÿ–¥’‚¡Ω∏ˆ∫Ø ˝£¨±ÿ–Î µœ÷£®‘⁄ª˘¿‡÷–’‚¡Ω∏ˆ «¥ø–È∫Ø ˝£©
    void scrollViewDidScroll(CCScrollView* view);
    void scrollViewDidZoom(CCScrollView* view);

    //void menuGoCallback(cocos2d::CCObject *pSender);  
    /*void homeMenuItemCallback(cocos2d::CCObject *pSender); //µ„ª˜º“∞¥≈•ªÿµ˜∫Ø ˝
    void retyMenuItemCallback(cocos2d::CCObject *pSender); //µ„ª˜÷ÿ–¬ø™ º”Œœ∑ªÿµ˜∫Ø ˝
    void resumeMenuItemCallback(cocos2d::CCObject *pSender);//µ„ª˜ºÃ–¯”Œœ∑∞¥≈• ªÿµ˜∫Ø ˝
    */
    CCSprite* table_bj;
     CCLayer *layer;
     CCScrollView * scrollView;
     CCPoint touchPoint;
     CCPoint scrollPoint;
     int pageNum;
     float offsetjuli;
     float bj_x;
     float bj_y;
     float scroll_bj_x;
     float scroll_bj_y;
     int scrolloffset;
    cocos2d::CCMenu *m_pMenu; // ƒ£Ã¨∂‘ª∞øÚ≤Àµ•    
     bool huadongtag;
    bool m_bTouchedMenu;// º«¬º≤Àµ•µ„ª˜
private:
    void adjustScrollView(float offset);
    void gensui(float offset);
    void sethuadong(bool huadongtag);

};
//
//newhand新手帮助
class NewhandDialogLayer : public cocos2d::CCLayer ,public CCScrollViewDelegate
{
public:
    NewhandDialogLayer();
    ~NewhandDialogLayer();
    virtual bool init();
    // ≥ı ºªØ∂‘ª∞øÚƒ⁄»›
    bool setUpdateView();
    CREATE_FUNC(NewhandDialogLayer);
    void onEnter();
    void onExit();
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject *pSender);
    
public:
    //÷ÿ–¥’‚¡Ω∏ˆ∫Ø ˝£¨±ÿ–Î µœ÷£®‘⁄ª˘¿‡÷–’‚¡Ω∏ˆ «¥ø–È∫Ø ˝£©
    void scrollViewDidScroll(CCScrollView* view);
    void scrollViewDidZoom(CCScrollView* view);
    
    //void menuGoCallback(cocos2d::CCObject *pSender);
    /*void homeMenuItemCallback(cocos2d::CCObject *pSender); //µ„ª˜º“∞¥≈•ªÿµ˜∫Ø ˝
     void retyMenuItemCallback(cocos2d::CCObject *pSender); //µ„ª˜÷ÿ–¬ø™ º”Œœ∑ªÿµ˜∫Ø ˝
     void resumeMenuItemCallback(cocos2d::CCObject *pSender);//µ„ª˜ºÃ–¯”Œœ∑∞¥≈• ªÿµ˜∫Ø ˝
     */
    CCSprite* table_bj;
    CCLayer *layer;
    CCScrollView * scrollView;
    CCPoint touchPoint;
    CCPoint scrollPoint;
    int pageNum;
    int MaxpageNum;
    float offsetjuli;
    float bj_x;
    float bj_y;
    float scroll_bj_x;
    float scroll_bj_y;
    int scrolloffset;
    cocos2d::CCMenu *m_pMenu; // ƒ£Ã¨∂‘ª∞øÚ≤Àµ•
    bool huadongtag;
    bool m_bTouchedMenu;// º«¬º≤Àµ•µ„ª˜
private:
    void adjustScrollView(float offset);
    void gensui(float offset);
    void sethuadong(bool huadongtag);
    
    
};
#endif