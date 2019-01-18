#ifndef __STORE_LAYER_H__
#define __STORE_LAYER_H__
#include "BaseLayer.h"
#include "ResouceDefine.h"
//��ʾSTORE times

class StoreDialogLayer : public BaseLayer
{
public:
    StoreDialogLayer();
    ~StoreDialogLayer();    
    virtual bool init();
    // ��ʼ���Ի�������
    bool setUpdateView();    
    CREATE_FUNC(StoreDialogLayer);    
    void onEnter();
    void onExit();    
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject *pSender);  
    void buttonCallBack(cocos2d::CCObject *pSender);
    void menuGoCallback(cocos2d::CCObject *pSender);  
    /*void homeMenuItemCallback(cocos2d::CCObject *pSender); //����Ұ�ť�ص�����
    void retyMenuItemCallback(cocos2d::CCObject *pSender); //������¿�ʼ��Ϸ�ص�����
    void resumeMenuItemCallback(cocos2d::CCObject *pSender);//���������Ϸ��ť �ص�����
    */
    cocos2d::CCMenu *m_pMenu; // ģ̬�Ի���˵�    
    //int yaomaiID;
    bool m_bTouchedMenu;// ��¼�˵����
};
#endif