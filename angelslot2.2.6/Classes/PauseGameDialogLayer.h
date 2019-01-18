#ifndef __PAUSEGAMEDIALOG_LAYER_H__
#define __PAUSEGAMEDIALOG_LAYER_H__
#include "BaseLayer.h"
class PauseGameDialogLayer : public BaseLayer
{
public:
    PauseGameDialogLayer();
    ~PauseGameDialogLayer();    
    virtual bool init();
    // 初始化对话框内容
    bool setUpdateView();    
    CREATE_FUNC(PauseGameDialogLayer);    
    void onEnter();
    void onExit();    
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);    
    void homeMenuItemCallback(cocos2d::CCObject *pSender); //点击家按钮回调函数
    void shezhiMenuItemCallback(cocos2d::CCObject *pSender); //点击重新开始游戏回调函数
    void gostoreMenuItemCallback(cocos2d::CCObject *pSender);//点击继续游戏按钮 回调函数
    void yuliuMenuItemCallback(cocos2d::CCObject *pSender);//预留
    void menuCloseCallback(cocos2d::CCObject* pSender);

    cocos2d::CCMenu *m_pMenu; // 模态对话框菜单    
    bool m_bTouchedMenu;// 记录菜单点击
};
#endif