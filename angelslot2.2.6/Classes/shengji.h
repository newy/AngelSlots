#ifndef __SHENGJI_LAYER_H__
#define __SHENGJI_LAYER_H__
#include "BaseLayer.h"
class ShengjiDialogLayer : public BaseLayer
{
public:
    ShengjiDialogLayer();
    ~ShengjiDialogLayer();    
    virtual bool init();
    // ��ʼ���Ի�������
    bool setUpdateView();    
    CREATE_FUNC(ShengjiDialogLayer);    
    void onEnter();
    void onExit();    
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject *pSender);
   
    /*void homeMenuItemCallback(cocos2d::CCObject *pSender); //����Ұ�ť�ص�����
    void retyMenuItemCallback(cocos2d::CCObject *pSender); //������¿�ʼ��Ϸ�ص�����
    void resumeMenuItemCallback(cocos2d::CCObject *pSender);//���������Ϸ��ť �ص�����
    */
private:  
    cocos2d::CCMenu *m_pMenu; // ģ̬�Ի���˵�    
    
    bool m_bTouchedMenu;// ��¼�˵����
  
};
#endif