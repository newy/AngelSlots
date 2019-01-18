#ifndef __MONSTER_SYSTEM_H__
#define __MONSTER_SYSTEM_H__
#include "cocos2d.h"
#include "MonsterSprite.h"

//#include "BulletsSprite.h"
typedef struct MonsterUtils{
    float initBlood;// ��ʼ����Ѫ
    float initSpeed;// ��ʼ���ٶ�
    float defend;// ����ķ�����
    float hurt;// ������˺�ֵ
    char* monsName;// �����ù����ʱ���ͨ������
    char* picName;// �����ͼƬ
    char* fileName;// ��������Ӧ��plist �ļ�������
    int   type;// ��������
    int   runCount;// ���ܶ�������
    int   actCount;// ������������
    int   detCount;// ������������
    float maxRun;// ����ƶ�����	
    char* attackRangeRec;//���ڹ������ϻ���һ���ܵ��Ĺ�����Χ ���������ò������ ͼƬ �������ܵ�������ʱ�������һ�� �ַ����� ��ʽ��������{{x,y},{w, h}}
} Monster;
//class DefenderGameLayer;
// ����������������ϵͳ
class MonsterSystem{
public:
    MonsterSystem();
    MonsterSystem(cocos2d::CCRect GoSize);
    
    ~MonsterSystem();
    cocos2d::CCArray* getIdleMonsterArry();// ����������еĹ���
    cocos2d::CCArray* getRunMonsterArray();// �����������ڱ����еĹ���
    void addMonster(int type,int count);// �������̵߳�����ԴԴ���ϵĲ�����������ͺ�������
    void setDefenderGameLayer(cocos2d::CCLayer* GameLayer);
//    bool collisionDetection(BulletsSprite* bulletsSprite);// ���빭�� ����Ƿ�͹��﷢����ײ
    void recoverMonster(MonsterSprite* monsterSprite);// ���չ���
    //void raisefishijingyan(int jingyan);
   void raisefishijingyan(int jingyan); 
    void raisefishijingyannew(cocos2d::CCNode* sender, void* data);
    //cocos2d::CCRect MonsterGoSize;//���Χ
    //�Ķ�
    //void updateFishMovement();    //������������ζ�·��
    void setFishRoute(MonsterSprite* monsterSprite,bool direction);    //����趨һ�����·��
    void linerRoute(MonsterSprite* monsterSprite, cocos2d::CCPoint to,float dt,bool direction);//����һ������ֱ���ζ�
    void bezierRoute(MonsterSprite* monsterSprite,cocos2d::CCPoint to,float dt,bool direction);//����һ�����������ζ�
    void moveActionEnd(cocos2d::CCNode* sender, void* data);  //�ص��������������ζ�����������������
    cocos2d::CCPoint getposition();
   //�Ķ�end
private:
    cocos2d::CCArray* idleMonsterArry;// ����������еĹ���
    cocos2d::CCArray* runMonsterArray;// �����������ڱ����еĹ���
    MonsterSprite*    productMonster(int type);//����������������Ӧ�Ĺ���
    cocos2d::CCLayer* GameLayer;// ��Ϸ����
    

    void addDefenderGameLayer(MonsterSprite* monsterSprite);// �ѱ����еĹ�����ӵ� ����������
    Monster dutu;// ÿ������µĹ��ﶼ��Ҫ���������һ�� �����ڹ��췽�������ʼ��
};
#endif