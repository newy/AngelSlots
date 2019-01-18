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
    void moveRun();// 移动函数
    CC_SYNTHESIZE(float,hurt,Hurt);//伤害值
    CC_SYNTHESIZE(float,defense,Defense);//防御值
    CC_SYNTHESIZE(float,speed,Speed);//移动速度
    CC_SYNTHESIZE(float,maxRemoving,maxRemoving);// 移动的最大距离
    CC_SYNTHESIZE(float,blood,Blood);// 怪物气血值
    CC_SYNTHESIZE(int,monType,MonType);// 怪物类型
    CC_SYNTHESIZE(int,monState,MonState);// 怪物状态 1 静止状态  2 行动状态 3 攻击状态 4 死亡状态
    CC_SYNTHESIZE(cocos2d::CCRect,attackRange,AttackRange);// 接受攻击的范围

    void runAnimation();// 执行奔跑动画
    void deathAnimation();// 执行死亡动画
    void attackAnimation();// 执行攻击动画
    //void RaiseBlood(float hurt);
    void RaiseBlood(CCNode* sender, void* data);
    //增加// 这个是接受攻击 主要改变 该怪物的气血值 和血条的显示//fallBlood
    // 第一个参数的意思是 加载的plist 文件的名字 第二个是 plist 对应的图片纹理 第三个是 图片的通用名字 第四个 走路动画图片张数，第五个是 攻击时候的参数  第六个是 死亡动画的张数
    // 在这里贴别说明一点为了达到动画的通用性 我们规定 plist 中的图片命名格式是这样的 pic-1编号 是跑步图片 pic-2编号是 攻击图片 pic-x编号是死亡图片
    static MonsterSprite* createWithMonsterRul(const char* filename,cocos2d::CCTexture2D* ccTexture2D,const char* pic,int runcount,int attackcount,int deathcout );
    void setMonsterSystemUtils(MonsterSystem* monsterSystem);
    cocos2d::CCRect converNowRect();// 这个方法是把最初设计的攻击范围 转化到当前 界面的坐标系中的矩形
    void gospriteremoveFromParent(CCObject *pSender);
    void spriteremoveFromParent(CCNode *pSender);
    void product(CCNode *pSender);
    int  getrandomID(int start,int end);
protected:
    cocos2d::CCArray* runArray;//奔跑动画序列帧
    cocos2d::CCArray* deathArray;//死亡动画序列帧
    cocos2d::CCArray* attackArray;//攻击动画序列帧  
    cocos2d::CCProgressTimer* bloodBwlid;// 这个是血条
    virtual void deathAnimationCallBack(cocos2d::CCNode* pSed);// 死亡动画回调函数
    virtual void attackAnimationCallBack(cocos2d::CCNode* pSed);// 攻击动画回调函数
    virtual void runAnimationCallBack(cocos2d::CCNode* pSed);//奔跑动画回调函数
    virtual bool setUpdateView();
    static MonsterSprite* createWithSpriteFrame(cocos2d::CCSpriteFrame *pSpriteFrame); 
    MonsterSystem* monsterSystem; 
    void myload(float tim);

};
#endif