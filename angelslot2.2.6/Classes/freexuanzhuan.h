#ifndef __FREEXUANZHUAN_LAYER_H__
#define __FREEXUANZHUAN_LAYER_H__
#include "BaseLayer.h"
//提示freexuanzhuan times

class FreexuanzhuanDialogLayer : public BaseLayer
{
public:
    FreexuanzhuanDialogLayer();
    FreexuanzhuanDialogLayer(int num):freenum(num){};
    ~FreexuanzhuanDialogLayer();    
    virtual bool init();
    // 初始化对话框内容
    bool setUpdateView();    
    CREATE_FUNC(FreexuanzhuanDialogLayer); 
  
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
    cocos2d::CCMenu *m_pMenu; // 模态对话框菜单    
   int freenum;
    bool m_bTouchedMenu;// 记录菜单点击
};

//xuanzhuan result
class FreexuanzhuanResultDialogLayer : public BaseLayer
{
public:
    FreexuanzhuanResultDialogLayer();
    FreexuanzhuanResultDialogLayer(int num):freenumreslut(num){};
    ~FreexuanzhuanResultDialogLayer();    
    virtual bool init();
    // 初始化对话框内容
    bool setUpdateView();    
    CREATE_FUNC(FreexuanzhuanResultDialogLayer); 
  
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
    cocos2d::CCMenu *m_pMenu; // 模态对话框菜单    
   int freenumreslut;
    bool m_bTouchedMenu;// 记录菜单点击
};


class AgainFreexuanzhuanDialogLayer : public BaseLayer
{
public:
    AgainFreexuanzhuanDialogLayer();
    AgainFreexuanzhuanDialogLayer(int num):freenum(num){};
    ~AgainFreexuanzhuanDialogLayer();    
    virtual bool init();
    // 初始化对话框内容
    bool setUpdateView();    
    CREATE_FUNC(AgainFreexuanzhuanDialogLayer);    
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
    cocos2d::CCMenu *m_pMenu; // 模态对话框菜单    
    int freenum;//free times
    bool m_bTouchedMenu;// 记录菜单点击
};

class BigwinDialogLayer : public BaseLayer
{
public:
    BigwinDialogLayer();
    ~BigwinDialogLayer();
    virtual bool init();
    // 初始化对话框内容
    bool setUpdateView();
    CREATE_FUNC(BigwinDialogLayer);
    void onEnter();
    void onExit();
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject *pSender);

    cocos2d::CCMenu *m_pMenu; // 模态对话框菜单
    int freenum;//free times
    bool m_bTouchedMenu;// 记录菜单点击
};

#endif