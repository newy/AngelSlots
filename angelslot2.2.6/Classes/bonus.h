#ifndef __BONUS_SCENE_H__
#define __BONUS_SCENE_H__

#include "cocos2d.h"
#include "BaseLayer.h"
using namespace cocos2d;
//
cocos2d::CCLayer *ChooseBonusGame(int BonusNumtemp);

//change backqian back to the main window
//zhuanlun
class Bonus : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  
    Bonus();
    Bonus(int num):bonusnum(num){};
    ~Bonus();
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::CCScene* scene();
    
    cocos2d::CCMenu* pMenu;
    // a selector callback
    void menuCloseCallback(CCObject* pSender);
    //void setzhuanpanfuyuan();
    //void setzhongaction();
    void setmenuenable();
    void setbonusqian();
    void backtomain();
    int getrandomBonusID();
    void menuStartCallback(CCObject* pSender);
    cocos2d::CCSize getWinSize();// µ√µΩµ±«∞ø… ”¥∞ø⁄µƒ¥Û–°
    cocos2d::CCPoint getWinOrigin();// µ√µΩµ±«∞ø… ”¥∞ø⁄µƒ∆ ºµ„
    cocos2d::CCPoint getWinCenter();// µ√µΩ∆¡ƒª’˝÷–º‰µƒµ„
    // implement the "static node()" method manually
    CREATE_FUNC(Bonus);
    cocos2d::CCSprite* pSpritezhuanlun ;
    cocos2d::CCLabelTTF* pLabel;
    int bonusnum;//bonus times
    float zhuansu;
    int yajinnum;
    int zhongidtemp;
};
//bonus πÿø®2 find same
class Bonus_gk2 : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  
    Bonus_gk2();
    Bonus_gk2(int num):bonusnum(num){};
    ~Bonus_gk2();
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::CCScene* scene();

    cocos2d::CCMenu* pMenu;
    // a selector callback
    void menuCloseCallback(CCObject* pSender);
    //void setzhuanpanfuyuan();
    void setmenuenable();
    void setbonusqian();
    void backtomain();
    int getrandomBonusID(int start,int end);
    void menuStartCallback(CCObject* pSender);
    void opencard(CCNode* sender, void* data);
    void cardfangdaandsuoxiao(CCNode* sender, void* data);
    cocos2d::CCSize getWinSize();// µ√µΩµ±«∞ø… ”¥∞ø⁄µƒ¥Û–°
    cocos2d::CCPoint getWinOrigin();// µ√µΩµ±«∞ø… ”¥∞ø⁄µƒ∆ ºµ„
    cocos2d::CCPoint getWinCenter();// µ√µΩ∆¡ƒª’˝÷–º‰µƒµ„
    // implement the "static node()" method manually
    CREATE_FUNC(Bonus_gk2);
    cocos2d::CCSprite* pSpritezhenhuan ;
    cocos2d::CCLabelTTF* pLabel;
    int bonusnum;//bonus times
     int yajinnum;
    float zhuansu;
    int CardIsOpen[16];//±Íº«”√£¨≥ı ºªØ0£¨¥Úø™∫Û±Íº«Œ™œ‘ æ ˝◊÷£¨“‚Àº“—¥Úø™
    int num[16];//¥Ê∑≈ÀÊª˙≤ª÷ÿ∏¥ ˝◊÷
};

//bonus πÿø®3

class Bonus_gk3 : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  
    Bonus_gk3();
    Bonus_gk3(int num):bonusnum(num){};
    ~Bonus_gk3();
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::CCScene* scene();

    cocos2d::CCMenu* pMenu;
    // a selector callback
    void menuCloseCallback(CCObject* pSender);
    
    void setmenuenable();
    void setbonusqian();
    void backtomain();
    int  getrandomBonusID();
    void menuStartCallback(CCObject* pSender);
    void GuessRight();
    void guesswrong();
    cocos2d::CCSize  getWinSize();// µ√µΩµ±«∞ø… ”¥∞ø⁄µƒ¥Û–°
    cocos2d::CCPoint getWinOrigin();// µ√µΩµ±«∞ø… ”¥∞ø⁄µƒ∆ ºµ„
    cocos2d::CCPoint getWinCenter();// µ√µΩ∆¡ƒª’˝÷–º‰µƒµ„
    // implement the "static node()" method manually
    CREATE_FUNC(Bonus_gk3);
    cocos2d::CCSprite* pSpritezhuanlun ;
    cocos2d::CCLabelTTF* pLabel;
    cocos2d::CCLabelBMFont* pLabeNum_gk3;
    cocos2d::CCSprite* kuang;
    cocos2d::CCMenuItemImage *pStartUpItem;//—°‘Ò¥Û–°µƒ∞¥º¸
    cocos2d::CCMenuItemImage *pStartDownItem;
    int bonusnum;//bonus times
     int yajinnum;
    float zhuansu;
    int oldnum;//±£¥Ê–¬æ…∂‘±»¥Û–°µƒ ˝◊÷
    int newnum;
    int bonusJiangLiNow_gk3;//º«¬ºµ±«∞Ω±¿¯µ»º∂
    float hanggao;//––∏ﬂ
};

//bonus_gk4
//bonus 关?卡¡§4 find same
class Bonus_gk4 : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();
    Bonus_gk4();
    Bonus_gk4(int num):bonusnum(num){};
    ~Bonus_gk4();
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::CCScene* scene();
    
    cocos2d::CCMenu* pMenu;
    // a selector callback
    void menuCloseCallback(CCObject* pSender);
    //void setzhuanpanfuyuan();
    void setmenuenable();
    void setbonusqian();
    void backtomain();
    int getrandomBonusID(int start,int end);
    void menuStartCallback(CCObject* pSender);
    void opencard(CCNode* sender, void* data);
    void cardfangdaandsuoxiao(CCNode* sender, void* data);
    cocos2d::CCSize getWinSize();// 得Ì?到Ì?当Ì¡À前¡ã可¨¦视º¨®窗ä¡ã口¨²的Ì?大ä¨®小?
    cocos2d::CCPoint getWinOrigin();// 得Ì?到Ì?当Ì¡À前¡ã可¨¦视º¨®窗ä¡ã口¨²的Ì?起e始º?点Ì?
    cocos2d::CCPoint getWinCenter();// 得Ì?到Ì?屏¨¢幕?正y中D间?的Ì?点Ì?
    // implement the "static node()" method manually
    CREATE_FUNC(Bonus_gk2);
    cocos2d::CCSprite* pSpritezhenhuan ;
    cocos2d::CCLabelTTF* pLabel;
    int bonusnum;//bonus times
    int yajinnum;
    float zhuansu;
    int CardIsOpen[16];//标À¨º记?用®?，ê?初?始º?化¡¥0，ê?打ä¨°开a后¨®标À¨º记?为a显?示º?数ºy字Á?，ê?意°a思?已°?打ä¨°开a
    int num[16];//存ä?放¤?随?机¨²不?重?复¡ä数ºy字Á?
};

class BonusTishiDialogLayer : public BaseLayer
{
public:
    BonusTishiDialogLayer();
    BonusTishiDialogLayer(int num):bonusnum(num){};
    ~BonusTishiDialogLayer();
    virtual bool init();
    // ≥ı ºªØ∂‘ª∞øÚƒ⁄»›
    bool setUpdateView();
    CREATE_FUNC(BonusTishiDialogLayer);
    void onEnter();
    void onExit();
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent);
    void menuCloseCallback(cocos2d::CCObject *pSender);
    /*void homeMenuItemCallback(cocos2d::CCObject *pSender); //µ„ª˜º“∞¥≈•ªÿµ˜∫Ø ˝
     void retyMenuItemCallback(cocos2d::CCObject *pSender); //µ„ª˜÷ÿ–¬ø™ º”Œœ∑ªÿµ˜∫Ø ˝
     void resumeMenuItemCallback(cocos2d::CCObject *pSender);//µ„ª˜ºÃ–¯”Œœ∑∞¥≈• ªÿµ˜∫Ø ˝
     */
    cocos2d::CCMenu *m_pMenu; // ƒ£Ã¨∂‘ª∞øÚ≤Àµ•
    int bonusnum;//bonus times
    bool m_bTouchedMenu;// º«¬º≤Àµ•µ„ª˜
};
#endif // __BONUS_SCENE_H__
