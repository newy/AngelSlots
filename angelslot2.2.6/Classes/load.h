//初始界面（加载完成进入关卡选择）
#ifndef __LOADSCENE_H__
#define __LOADSCENE_H__

#include "cocos2d.h"

class LoadScene : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  

    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::CCScene* scene();

    // a selector callback
    void menuCloseCallback(CCObject* pSender);
     void guankaCallback();

    // implement the "static node()" method manually
    CREATE_FUNC(LoadScene);
};

class LoadingScene : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  

    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::CCScene* scene();

    // a selector callback
    void menuCloseCallback(CCObject* pSender);
    //void zhuanquanCallback();
    void static LoadAndeRemove();
    // implement the "static node()" method manually
    CREATE_FUNC(LoadingScene);
};


#endif // __HE_H__