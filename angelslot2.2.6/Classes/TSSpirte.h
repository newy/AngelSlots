//
//  TSSpirte.h
//  TSSpiriteTouch
//
//  Created by TSEnel on 13-2-23.
//
//

#ifndef __TSSpiriteTouch__TSSpirte__
#define __TSSpiriteTouch__TSSpirte__

#include <iostream>
#include "cocos2d.h"

using namespace cocos2d;

class TSSprite : public CCSprite ,public CCTouchDelegate
{
public:    
    static TSSprite*  create(const char *pszFileName);
    static TSSprite*  createWithSpriteFrameName(const char *pszSpriteFrameName);
    static TSSprite*  createWithSpriteFrame(CCSpriteFrame *pSpriteFrame);
public:
    virtual void onEnter();
    virtual void onExit();
    virtual bool ccTouchBegan(CCTouch* touch, CCEvent* event);
    virtual void ccTouchMoved(CCTouch* touch, CCEvent* event);
    virtual void ccTouchEnded(CCTouch* touch, CCEvent* event);
};


#endif /* defined(__TSSpiriteTouch__TSSpirte__) */
