#ifndef __SceneHello__CCRadioMenu__  
#define __SceneHello__CCRadioMenu__  

#include "cocos2d.h"  
class CCRadioMenu : public cocos2d::CCMenu{  
public:  
    CCRadioMenu():cocos2d::CCMenu(){}  
    cocos2d::CCMenuItem *_curHighlighted;  
    virtual bool ccTouchBegan(cocos2d::CCTouch *pTouch,cocos2d::CCEvent *pEvent);  
    virtual void ccTouchEnded(cocos2d::CCTouch *pTouch,cocos2d::CCEvent *pEvent);  
    virtual void ccTouchCancelled(cocos2d::CCTouch *pTouch,cocos2d::CCEvent *pEvent);  
    virtual void ccTouchMoved(cocos2d::CCTouch *pTouch,cocos2d::CCEvent *pEvent);  
    void setSelectedItem_(cocos2d::CCMenuItem *item);  
    static CCRadioMenu* create(cocos2d::CCMenuItem* item, ...);  
};  

#endif /* defined(__SceneHello__CCRadioMenu__) */ 