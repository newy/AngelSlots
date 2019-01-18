
#ifndef __playyinxiao_H__
#define __playyinxiao_H__
////////////////////////
#include "cocos2d.h"
#include "cocos-ext.h"
#include "SimpleAudioEngine.h"
#include "shezhi.h"
USING_NS_CC;
USING_NS_CC_EXT;
class Playyinxiao : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  

    // there's no 'id' in cpp, so we recommand to return the exactly class pointer
    static cocos2d::CCScene* scene();
    CREATE_FUNC(Playyinxiao);
    //static void preload_mapmusic();
     //static void preload_gk1();
     static void preload();
    //static void playmapmusic();
    static void playmusic();
    
   static void play_anjian();
    static void resumeEffect();
    static void play_gudian();
    static void stopeffect();
    static void stopmusic();
    //static void playmusic_gk1();
    static void play_ruchangeffect();
    static void play_starteffect();//start 启动
     static void play_dajiangtip_1();//big reward提示
    static void play_dajiangtip_2();//big reward提示
    static void play_slidend();//列滚动普通结束音
    static void play_jinbi();//金币
    static void play_shengji();//升级
    static void play_bonustip();//bonus
    static void play_scatter();//散射
    static void play_dajiangli();//small reward
    static void play_xiaojiangli_1();//small reward
    static void play_xiaojiangli_2();//small reward
    static void play_jiansu();
    static void play_jiansu_quxiao();
    static void play_yushieat();
    
    //bonus
    static void play_ruchangbonus();
    static void play_dejiangbonus();
    static void play_startbonus();
    static void play_bonus_gk4_pa();
    //guess
    static void play_anjianguess();
    static void play_ruchangguess();
    static void play_caiduiguess();
    static void play_caicuoguess(); 
   




public:
    //重写这两个函数，必须实现（在基类中这两个是纯虚函数）
//     void scrollViewDidScroll(CCScrollView* view);
//     void scrollViewDidZoom(CCScrollView* view);
public:
    virtual void onEnter();
    virtual void onExit();

//     virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
//     virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
//     virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
//     virtual void ccTouchCancelled(CCTouch *pTouch, CCEvent *pEvent);

};

#endif  // __playyinxiao_H__
/////
