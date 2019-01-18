//地图、关卡选择
#ifndef __MAPCHOOSE_H__
#define __MAPCHOOSE_H__
////////////////////////
#include "cocos2d.h"
#include "cocos-ext.h"
#include "SimpleAudioEngine.h"
#include "shezhi.h"
#import  "KTPlayC.h"
USING_NS_CC;
USING_NS_CC_EXT;
class MapChoose : public cocos2d::CCLayer ,public CCScrollViewDelegate
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  

    // there's no 'id' in cpp, so we recommand to return the exactly class pointer
    static cocos2d::CCScene* scene();
    CREATE_FUNC(MapChoose);
       void menuCallback(CCObject* pSender);
       void menuStoreCallback(CCObject* pSender);
       void menuZuoCallback(CCObject* pSender);
       void menuYouCallback(CCObject* pSender);
       void menuSetCallback(CCObject* pSender);
       void ConnectNet(float fDelta);
       void menushijianCallback(CCObject* pSender);
       void menuGamecenterCallback(CCObject* pSender);
       void menuGamecenter_appleCallback(CCObject* pSender);
       void onHttpRequestCompleted(cocos2d::CCNode *sender ,void *data);  //
       void activeConectNet();
       void inactiveConectNet();
       void spriteremoveFromParent(CCNode *pSender);
       void activeqian();
       void inactiveqian();
       void schedulejiaqian(float fDelta);
       void showKTTip(); //显示KTPLAY新动态提示
       void hideKTTip(); //隐藏KTPLAY新动态提示
       void panduanshijian();
       CCMenu *menu;
       CCMenu *pmenu;
public:
    //重写这两个函数，必须实现（在基类中这两个是纯虚函数）
    void scrollViewDidScroll(CCScrollView* view);
    void scrollViewDidZoom(CCScrollView* view);
public:
    virtual void onEnter();
    virtual void onExit();
    virtual void onEnterTransitionDidFinish();
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchCancelled(CCTouch *pTouch, CCEvent *pEvent);
    
    
private:
    void adjustScrollView(float offset);
    void gensui(float offset);
 //   void kaimen(int pageNum);
    void jingyanset();
    void sethuadong(bool huadongtag);
    CCScrollView *  scrollView;
    CCPoint touchPoint;
    CCPoint scrollPoint;
    int pageNum;
   float offsetjuli;

     CCSprite *bg;
     CCLayer *layer;
    int gcMUSICSTATE;
    bool gcEFFECTSTATE;
     bool huadongtag;
     bool CollectShijianIsReady;
     //int qian;
   // double  qian;
     int jingyan;// 经验值
     
     //int jingyandengji;//经验等级
     //string funGetDateSpider(string &strLine);
     cocos2d::CCProgressTimer* jingyanpt;//经验
     CCSprite *backqianimg;//总conis显示
     //CCLabelTTF* labelbm;
     cocos2d::CCSize getWinSize();// 得到当前可视窗口的大小
     cocos2d::CCPoint getWinOrigin();// 得到当前可视窗口的起始点
     cocos2d::CCPoint getWinCenter();// 得到屏幕正中间的点
    CCSprite *new_msg;//ktplay newsmsg
};

#endif  // __HELP_SCENE_H__
/////
