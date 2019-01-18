#ifndef __SHENGJI_LAYER_H__
#define __SHENGJI_LAYER_H__
#include "BaseLayer.h"
class ShengjiDialogLayer : public BaseLayer
{
public:
    ShengjiDialogLayer();
    ~ShengjiDialogLayer();    
    virtual bool init();
    // 初始化对话框内容
    bool setUpdateView();    
    CREATE_FUNC(ShengjiDialogLayer);    
    void onEnter();
    void onExit();    
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject *pSender);
   
    /*void homeMenuItemCallback(cocos2d::CCObject *pSender); //点击家按钮回调函数
    void retyMenuItemCallback(cocos2d::CCObject *pSender); //点击重新开始游戏回调函数
    void resumeMenuItemCallback(cocos2d::CCObject *pSender);//点击继续游戏按钮 回调函数
    */
private:  
    cocos2d::CCMenu *m_pMenu; // 模态对话框菜单    
    
    bool m_bTouchedMenu;// 记录菜单点击
  
};
#endif