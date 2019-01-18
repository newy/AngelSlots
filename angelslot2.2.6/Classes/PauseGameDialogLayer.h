#ifndef __PAUSEGAMEDIALOG_LAYER_H__
#define __PAUSEGAMEDIALOG_LAYER_H__
#include "BaseLayer.h"
class PauseGameDialogLayer : public BaseLayer
{
public:
    PauseGameDialogLayer();
    ~PauseGameDialogLayer();    
    virtual bool init();
    // ��ʼ���Ի�������
    bool setUpdateView();    
    CREATE_FUNC(PauseGameDialogLayer);    
    void onEnter();
    void onExit();    
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);    
    void homeMenuItemCallback(cocos2d::CCObject *pSender); //����Ұ�ť�ص�����
    void shezhiMenuItemCallback(cocos2d::CCObject *pSender); //������¿�ʼ��Ϸ�ص�����
    void gostoreMenuItemCallback(cocos2d::CCObject *pSender);//���������Ϸ��ť �ص�����
    void yuliuMenuItemCallback(cocos2d::CCObject *pSender);//Ԥ��
    void menuCloseCallback(cocos2d::CCObject* pSender);

    cocos2d::CCMenu *m_pMenu; // ģ̬�Ի���˵�    
    bool m_bTouchedMenu;// ��¼�˵����
};
#endif