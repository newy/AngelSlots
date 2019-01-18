#ifndef __GUESS_SCENE_H__
#define __GUESS_SCENE_H__

#include "cocos2d.h"
#include "CardSprite.h"
class Guess : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  
    Guess();
    ~Guess();
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::CCScene* scene();
    int num;
    bool guesstag;
    CCMenu* pMenu;
    // a selector callback
    void menuCloseCallback(CCObject* pSender);
    void removelastcard();
    void setmenuenable();
    void newsendcard();
    void GuessRightAndcardmove(int fanNum);
    void guessrightmusic();
    void guesswrong();
    void guesswrongmusic();
    void setGuessqian();
    int getrandomcardID();
    void getback();
    void menuStartCallback(CCObject* pSender);
    cocos2d::CCSize getWinSize();// 得到当前可视窗口的大小
     cocos2d::CCPoint getWinOrigin();// 得到当前可视窗口的起始点
    cocos2d::CCPoint getWinCenter();// 得到屏幕正中间的点
    // implement the "static node()" method manually
    CREATE_FUNC(Guess);
    CardSprite* nowcard;
    CardSprite* oldcard;
    cocos2d::CCArray *cardArray; 
    cocos2d::CCLabelTTF* pLabel;//first lable
    cocos2d::CCLabelTTF* pLabeldouble;//double lable
    cocos2d::CCLabelTTF* pLabelquadruple;//quadruble lable

};

#endif // __GUESS_SCENE_H__
