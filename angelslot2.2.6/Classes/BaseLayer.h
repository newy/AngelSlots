#ifndef __BASE_LAYER_H__
#define __BASE_LAYER_H__

#include "cocos2d.h"

#define PI 3.14
class BaseLayer:public cocos2d::CCLayer{
public:
    static cocos2d::CCScene* scene();
    virtual bool init();
    CREATE_FUNC(BaseLayer);
    cocos2d::CCSize getWinSize();// 得到当前可视窗口的大小
    cocos2d::CCPoint getWinOrigin();// 得到当前可视窗口的起始点
    cocos2d::CCPoint getWinCenter();// 得到屏幕正中间的点
    cocos2d::CCPoint converSpritRel(float x, float y);//把设在屏幕中的位置转化成 可视窗口的 位置  
};
#endif