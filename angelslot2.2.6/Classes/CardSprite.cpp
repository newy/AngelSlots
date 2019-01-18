
    //  CardSprite.cpp
    //  Cocos2dev.com
    //
    //  Created by LiuYanghui on 13-6-17.
    //
    //

#include "CardSprite.h"
#include "ResouceDefine.h"
#define kInAngleZ        90//270 //里面卡牌的起始Z轴角度
#define kInDeltaZ        -90  //里面卡牌旋转的Z轴角度差

#define kOutAngleZ       0   //封面卡牌的起始Z轴角度
#define kOutDeltaZ       -90  //封面卡牌旋转的Z轴角度差

    enum {
        tag_inCard = 1,
        tag_outCard
};

CardSprite::CardSprite()
{

}

CardSprite::~CardSprite()
{
    m_openAnimIn->release();
    m_openAnimOut->release();
}

CardSprite* CardSprite::create(const char* inCardImageName, const char* outCardImageName, float duration)
{
    CardSprite *pSprite = new CardSprite();
    if (pSprite && pSprite->init(inCardImageName, outCardImageName, duration))
    {
        pSprite->autorelease();
        return pSprite;
    }
    CC_SAFE_DELETE(pSprite);
    return NULL;
}

CardSprite* CardSprite::createWithTexture(CCTexture2D * inCardImagepTexture,  CCTexture2D * outCardImagepTexture, float duration,int i)//self add
{
    CardSprite *pSprite = new CardSprite();
    if (pSprite && pSprite->initWithTexture(inCardImagepTexture, outCardImagepTexture, duration,i))
    {
        pSprite->autorelease();
        return pSprite;
    }
    CC_SAFE_DELETE(pSprite);
    return NULL;
}


bool CardSprite::init(const char* inCardImageName, const char* outCardImageName, float duration)
{
    if (!CCSprite::init())
    {
        return false;
    }
    initData(inCardImageName, outCardImageName, duration);
    return true;
}


bool CardSprite::initWithTexture( CCTexture2D * inCardImagepTexture,CCTexture2D * outCardImagepTexture, float duration,int i)
{
    if (!CCSprite::init())
    {
        return false;
    }
    initDataWithTexture(inCardImagepTexture, outCardImagepTexture, duration,i);
    return true;
}
void CardSprite::initData(const char* inCardImageName, const char* outCardImageName, float duration)
{
    m_isOpened = false;

    CCSprite* inCard = CCSprite::create(inCardImageName);
    //inCard->setScale(1.38);
    inCard->setPosition(CCPointZero);
    inCard->setVisible(false);
    inCard->setTag(tag_inCard);
    addChild(inCard);

    CCSprite* outCard = CCSprite::create(outCardImageName);
    outCard->setPosition(CCPointZero);
    outCard->setTag(tag_outCard);
    addChild(outCard);

    m_openAnimIn = (CCActionInterval*)CCSequence::create(CCDelayTime::create(duration * .5),
        CCShow::create(),
        CCOrbitCamera::create(duration * .5, 1, 0, kInAngleZ, kInDeltaZ, 0, 0),
        NULL);
    m_openAnimIn->retain();
    m_openAnimInAndMove = (CCActionInterval*)CCSequence::create(CCDelayTime::create(duration * .5),
        CCShow::create(),
        CCOrbitCamera::create(duration * .5, 1, 0, kInAngleZ, kInDeltaZ, 0, 0),
        CCDelayTime::create(1),
        //CCEaseSineOut::create(CCSpawn::create(CCMoveBy::create(0.6,ccp(0,200)),CCScaleBy::create(0.6,0.6),NULL)),
        CCEaseSineOut::create(CCSpawn::create(CCMoveBy::create(0.6,ccp(260,250)),CCScaleBy::create(0.6,0.8),NULL)),

        NULL);
    m_openAnimInAndMove->retain();
   

    m_openAnimOut = (CCActionInterval *)CCSequence::create(CCOrbitCamera::create(duration * .5, 1, 0, kOutAngleZ, kOutDeltaZ, 0, 0),
        CCHide::create(),
        CCDelayTime::create(duration * .5),
        NULL);
    m_openAnimOut->retain();

    m_openAnimOutAndMove = (CCActionInterval *)CCSequence::create(CCOrbitCamera::create(duration * .5, 1, 0, kOutAngleZ, kOutDeltaZ, 0, 0),
        CCHide::create(),
        CCDelayTime::create(duration * .5),
        CCDelayTime::create(1),
        //CCEaseSineOut::create(CCSpawn::create(CCMoveBy::create(0.6,ccp(0,200)),CCScaleBy::create(0.6,0.6),NULL)),
        CCEaseSineOut::create(CCSpawn::create(CCMoveBy::create(0.6,ccp(260,250)),CCScaleBy::create(0.6,0.8),NULL)),

        NULL);
    m_openAnimOutAndMove->retain();
}

void CardSprite::initDataWithTexture( CCTexture2D * inCardImagepTexture, CCTexture2D * outCardImagepTexture, float duration,int i)
{
    m_isOpened = false;
     
    CCSprite* inCard = CCSprite::createWithTexture(inCardImagepTexture);
    inCard->setPosition(CCPointZero);
    inCard->setVisible(false);
    inCard->setTag(tag_inCard);
    CCLabelTTF *pLabelcai = CCLabelTTF::create(CCString::createWithFormat("%d", i)->getCString(), "Arial", 50/bigsmall_factor);
    pLabelcai->setPosition(ccp(inCard->getTextureRect().getMaxX()/2,inCard->getTextureRect().getMaxY()/2));
    pLabelcai->setColor(ccc3(24, 56, 69));
    inCard->addChild(pLabelcai);
    if (changjing==41)
    {
        inCard->setAnchorPoint(ccp(0.5,0.4));
    }
    
    addChild(inCard);

    CCSprite* outCard = CCSprite::createWithTexture(outCardImagepTexture);
    outCard->setPosition(CCPointZero);
    outCard->setTag(tag_outCard);
    if (changjing==41)
    {
        outCard->setAnchorPoint(ccp(0.5,0.65));
    }

    addChild(outCard);

    m_openAnimIn = (CCActionInterval*)CCSequence::create(CCDelayTime::create(duration * .5),
        CCShow::create(),
        CCOrbitCamera::create(duration * .5, 1, 0, kInAngleZ, kInDeltaZ, 0, 0),
        NULL);
    m_openAnimIn->retain();
    m_openAnimInAndMove = (CCActionInterval*)CCSequence::create(CCDelayTime::create(duration * .5),
        CCShow::create(),
        CCOrbitCamera::create(duration * .5, 1, 0, kInAngleZ, kInDeltaZ, 0, 0),
        CCDelayTime::create(1),
        //CCEaseSineOut::create(CCSpawn::create(CCMoveBy::create(0.6,ccp(0,200)),CCScaleBy::create(0.6,0.6),NULL)),
        CCEaseSineOut::create(CCSpawn::create(CCMoveBy::create(0.6,ccp(260,250)),CCScaleBy::create(0.6,0.8),NULL)),

        NULL);
    m_openAnimInAndMove->retain();


    m_openAnimOut = (CCActionInterval *)CCSequence::create(CCOrbitCamera::create(duration * .5, 1, 0, kOutAngleZ, kOutDeltaZ, 0, 0),
        CCHide::create(),
        CCDelayTime::create(duration * .5),
        NULL);
    m_openAnimOut->retain();

    m_openAnimOutAndMove = (CCActionInterval *)CCSequence::create(CCOrbitCamera::create(duration * .5, 1, 0, kOutAngleZ, kOutDeltaZ, 0, 0),
        CCHide::create(),
        CCDelayTime::create(duration * .5),
        CCDelayTime::create(1),
        //CCEaseSineOut::create(CCSpawn::create(CCMoveBy::create(0.6,ccp(0,200)),CCScaleBy::create(0.6,0.6),NULL)),
        CCEaseSineOut::create(CCSpawn::create(CCMoveBy::create(0.6,ccp(260,250)),CCScaleBy::create(0.6,0.8),NULL)),//,CCScaleBy::create(0.6,0.8)

        NULL);
    m_openAnimOutAndMove->retain();
}

// CCMenuItemImage * CardSprite::CCMenucreateWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
//     CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector)
// 
//     {
// 
//         CCMenuItemImage *pRet = new CCMenuItemImage();
//         if (pRet && pRet->CCMenuinitWithTexture(normalImageTexture, selectedImageTexture, disabledImageTexture, target, selector))
//         {
//             pRet->autorelease();
//             return pRet;
//         }
//         CC_SAFE_DELETE(pRet);
//         return NULL;
// 
//     
// 
// 
// 
//     }
// 
// bool CardSprite::CCMenuinitWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
//     CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector)
// 
//     {
// 
//         CCNode *normalSprite = NULL;
//         CCNode *selectedSprite = NULL;
//         CCNode *disabledSprite = NULL;
// 
//         if (normalImageTexture)
//         {
//             normalSprite = CCSprite::createWithTexture(normalImageTexture);
//         }
// 
//         if (selectedImageTexture)
//         {
//             selectedSprite = CCSprite::createWithTexture(selectedImageTexture);
//         }
// 
//         if(disabledImageTexture)
//         {
//             disabledSprite = CCSprite::createWithTexture(disabledImageTexture);
//         }
//         return initWithTextureSprite(normalSprite, selectedSprite, disabledSprite, target, selector);
// 
//     }



void CardSprite::openCard()
{
    CCSprite* inCard = (CCSprite*)getChildByTag(tag_inCard);
    CCSprite* outCard = (CCSprite*)getChildByTag(tag_outCard);
    inCard->runAction(m_openAnimIn);
    outCard->runAction(m_openAnimOut);
}
void CardSprite::openCardAndMove()
{
   
    CCSprite* inCard = (CCSprite*)getChildByTag(tag_inCard);
    CCSprite* outCard = (CCSprite*)getChildByTag(tag_outCard);
    inCard->runAction(m_openAnimInAndMove);
    outCard->runAction(m_openAnimOutAndMove);
}