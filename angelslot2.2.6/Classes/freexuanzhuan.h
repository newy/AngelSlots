#ifndef __FREEXUANZHUAN_LAYER_H__
#define __FREEXUANZHUAN_LAYER_H__
#include "BaseLayer.h"
//��ʾfreexuanzhuan times

class FreexuanzhuanDialogLayer : public BaseLayer
{
public:
    FreexuanzhuanDialogLayer();
    FreexuanzhuanDialogLayer(int num):freenum(num){};
    ~FreexuanzhuanDialogLayer();    
    virtual bool init();
    // ��ʼ���Ի�������
    bool setUpdateView();    
    CREATE_FUNC(FreexuanzhuanDialogLayer); 
  
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
    cocos2d::CCMenu *m_pMenu; // ģ̬�Ի���˵�    
   int freenum;
    bool m_bTouchedMenu;// ��¼�˵����
};

//xuanzhuan result
class FreexuanzhuanResultDialogLayer : public BaseLayer
{
public:
    FreexuanzhuanResultDialogLayer();
    FreexuanzhuanResultDialogLayer(int num):freenumreslut(num){};
    ~FreexuanzhuanResultDialogLayer();    
    virtual bool init();
    // ��ʼ���Ի�������
    bool setUpdateView();    
    CREATE_FUNC(FreexuanzhuanResultDialogLayer); 
  
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
    cocos2d::CCMenu *m_pMenu; // ģ̬�Ի���˵�    
   int freenumreslut;
    bool m_bTouchedMenu;// ��¼�˵����
};


class AgainFreexuanzhuanDialogLayer : public BaseLayer
{
public:
    AgainFreexuanzhuanDialogLayer();
    AgainFreexuanzhuanDialogLayer(int num):freenum(num){};
    ~AgainFreexuanzhuanDialogLayer();    
    virtual bool init();
    // ��ʼ���Ի�������
    bool setUpdateView();    
    CREATE_FUNC(AgainFreexuanzhuanDialogLayer);    
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
    cocos2d::CCMenu *m_pMenu; // ģ̬�Ի���˵�    
    int freenum;//free times
    bool m_bTouchedMenu;// ��¼�˵����
};

class BigwinDialogLayer : public BaseLayer
{
public:
    BigwinDialogLayer();
    ~BigwinDialogLayer();
    virtual bool init();
    // ��ʼ���Ի�������
    bool setUpdateView();
    CREATE_FUNC(BigwinDialogLayer);
    void onEnter();
    void onExit();
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject *pSender);

    cocos2d::CCMenu *m_pMenu; // ģ̬�Ի���˵�
    int freenum;//free times
    bool m_bTouchedMenu;// ��¼�˵����
};

#endif