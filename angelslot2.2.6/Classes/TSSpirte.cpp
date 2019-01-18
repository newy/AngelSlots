//
//  TSSpirte.cpp
//  TSSpiriteTouch
//
//  Created by TSEnel on 13-2-23.
//
//

#include "TSSpirte.h"

TSSprite* TSSprite::create(const char *pszFileName)
{
    TSSprite *pobSprite = new TSSprite();
    if (pobSprite && pobSprite->initWithFile(pszFileName))
    {
        pobSprite->autorelease();
        return pobSprite;
    }
    CC_SAFE_DELETE(pobSprite);
    return NULL;
    
}

TSSprite* TSSprite::createWithSpriteFrame(CCSpriteFrame *pSpriteFrame)
{
    TSSprite *pobSprite = new TSSprite();
    if (pSpriteFrame && pobSprite && pobSprite->initWithSpriteFrame(pSpriteFrame))
    {
        pobSprite->autorelease();
        return pobSprite;
    }
    CC_SAFE_DELETE(pobSprite);
    return NULL;
}
TSSprite* TSSprite::createWithSpriteFrameName(const char *pszSpriteFrameName)
{
    CCSpriteFrame *pFrame = CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(pszSpriteFrameName);

#if COCOS2D_DEBUG > 0
    char msg[256] = {0};
    sprintf(msg, "Invalid spriteFrameName: %s", pszSpriteFrameName);
    CCAssert(pFrame != NULL, msg);
#endif

    return createWithSpriteFrame(pFrame);
}

void TSSprite::onEnter()
{
    CCDirector* pDirector = CCDirector::sharedDirector();
    pDirector->getTouchDispatcher()->addTargetedDelegate(this, 0, false);
    CCSprite::onEnter();
}

void TSSprite::onExit()
{
    CCDirector* pDirector = CCDirector::sharedDirector();
    pDirector->getTouchDispatcher()->removeDelegate(this);
    CCSprite::onExit();
}

bool TSSprite::ccTouchBegan(CCTouch* touch, CCEvent* event)
{
    CCPoint sLocalPos = convertToNodeSpace(touch->getLocation());
    CCRect sRC = CCRect(getPositionX() - getContentSize().width * getAnchorPoint().x,
                           getPositionY() - getContentSize().height * getAnchorPoint().y,
                           getContentSize().width, getContentSize().height);
    
    
    sRC.origin = CCPointZero;
    bool isTouched = sRC.containsPoint(sLocalPos);
    if(isTouched)
    {
       // CCLog("点中了!! x:%d y:%d", (int)sLocalPos.x, (int)sLocalPos.y);
        return true;
    }
    else
    {
        //CCLog("没点中了!! x:%d y:%d", (int)sLocalPos.x, (int)sLocalPos.y);
        return false;
    }
}

void TSSprite::ccTouchMoved(CCTouch* touch, CCEvent* event)
{
    
}

void TSSprite::ccTouchEnded(CCTouch* pTouch, CCEvent* event)
{
    
}