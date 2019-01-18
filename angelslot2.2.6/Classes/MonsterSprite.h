#ifndef __MONSTER_SPRITE_H__
#define __MONSTER_SPRITE_H__
#include "cocos2d.h"
class MonsterSystem;
class HelloWorld;
class HelloWorld_gk2;
class MonsterSprite:public cocos2d::CCSprite{
public:
    MonsterSprite(void);
    ~MonsterSprite(void);
    void moveRun();// �ƶ�����
    CC_SYNTHESIZE(float,hurt,Hurt);//�˺�ֵ
    CC_SYNTHESIZE(float,defense,Defense);//����ֵ
    CC_SYNTHESIZE(float,speed,Speed);//�ƶ��ٶ�
    CC_SYNTHESIZE(float,maxRemoving,maxRemoving);// �ƶ���������
    CC_SYNTHESIZE(float,blood,Blood);// ������Ѫֵ
    CC_SYNTHESIZE(int,monType,MonType);// ��������
    CC_SYNTHESIZE(int,monState,MonState);// ����״̬ 1 ��ֹ״̬  2 �ж�״̬ 3 ����״̬ 4 ����״̬
    CC_SYNTHESIZE(cocos2d::CCRect,attackRange,AttackRange);// ���ܹ����ķ�Χ

    void runAnimation();// ִ�б��ܶ���
    void deathAnimation();// ִ����������
    void attackAnimation();// ִ�й�������
    //void RaiseBlood(float hurt);
    void RaiseBlood(CCNode* sender, void* data);
    //����// ����ǽ��ܹ��� ��Ҫ�ı� �ù������Ѫֵ ��Ѫ������ʾ//fallBlood
    // ��һ����������˼�� ���ص�plist �ļ������� �ڶ����� plist ��Ӧ��ͼƬ���� �������� ͼƬ��ͨ������ ���ĸ� ��·����ͼƬ������������� ����ʱ��Ĳ���  �������� ��������������
    // ����������˵��һ��Ϊ�˴ﵽ������ͨ���� ���ǹ涨 plist �е�ͼƬ������ʽ�������� pic-1��� ���ܲ�ͼƬ pic-2����� ����ͼƬ pic-x���������ͼƬ
    static MonsterSprite* createWithMonsterRul(const char* filename,cocos2d::CCTexture2D* ccTexture2D,const char* pic,int runcount,int attackcount,int deathcout );
    void setMonsterSystemUtils(MonsterSystem* monsterSystem);
    cocos2d::CCRect converNowRect();// ��������ǰ������ƵĹ�����Χ ת������ǰ ���������ϵ�еľ���
    void gospriteremoveFromParent(CCObject *pSender);
    void spriteremoveFromParent(CCNode *pSender);
    void product(CCNode *pSender);
    int  getrandomID(int start,int end);
protected:
    cocos2d::CCArray* runArray;//���ܶ�������֡
    cocos2d::CCArray* deathArray;//������������֡
    cocos2d::CCArray* attackArray;//������������֡  
    cocos2d::CCProgressTimer* bloodBwlid;// �����Ѫ��
    virtual void deathAnimationCallBack(cocos2d::CCNode* pSed);// ���������ص�����
    virtual void attackAnimationCallBack(cocos2d::CCNode* pSed);// ���������ص�����
    virtual void runAnimationCallBack(cocos2d::CCNode* pSed);//���ܶ����ص�����
    virtual bool setUpdateView();
    static MonsterSprite* createWithSpriteFrame(cocos2d::CCSpriteFrame *pSpriteFrame); 
    MonsterSystem* monsterSystem; 
    void myload(float tim);

};
#endif