
//
//  Created by yangyang on 14-7-23.
//
//
#include "CCmenuNew.h"
#include "ResouceDefine.h"

// CCmenuNew::CCmenuNew()
// {
// 
// }
// 
// CCmenuNew::~CCmenuNew()
// {
// 
// }
// 
// 
CCMenuItemImage * CCmenuNew::CCMenucreateWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
    CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector)

    {

        CCmenuNew *pRet = new CCmenuNew();
        if (pRet && pRet->CCMenuinitWithTexture(normalImageTexture, selectedImageTexture, disabledImageTexture, target, selector))
        {
            pRet->autorelease();
            return (CCMenuItemImage*)pRet;
        }
        CC_SAFE_DELETE(pRet);
        return NULL;

    



    }

bool CCmenuNew::CCMenuinitWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
    CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector)

    {

        CCNode *normalSprite = NULL;
        CCNode *selectedSprite = NULL;
        CCNode *disabledSprite = NULL;

        if (normalImageTexture)
        {
            normalSprite = CCSprite::createWithTexture(normalImageTexture);
        }

        if (selectedImageTexture)
        {
            selectedSprite = CCSprite::createWithTexture(selectedImageTexture);
        }

        if(disabledImageTexture)
        {
            disabledSprite = CCSprite::createWithTexture(disabledImageTexture);
        }
        return initWithNormalSprite(normalSprite, selectedSprite, disabledSprite, target, selector);

    }


    //new
    ///2

CCmenuNew * CCmenuNew::CCMenucreateWithTexturenew(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
    CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector)

{

    CCmenuNew *pRet = new CCmenuNew();
    if (pRet && pRet->CCMenuinitWithTexture(normalImageTexture, selectedImageTexture, disabledImageTexture, target, selector))
    {
        pRet->autorelease();
        return pRet;
    }
    CC_SAFE_DELETE(pRet);
    return NULL;





}

bool CCmenuNew::CCMenuinitWithTexturenew(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
    CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector)

{

    CCNode *normalSprite = NULL;
    CCNode *selectedSprite = NULL;
    CCNode *disabledSprite = NULL;

    if (normalImageTexture)
    {
        normalSprite = CCSprite::createWithTexture(normalImageTexture);
    }

    if (selectedImageTexture)
    {
        selectedSprite = CCSprite::createWithTexture(selectedImageTexture);
    }

    if(disabledImageTexture)
    {
        disabledSprite = CCSprite::createWithTexture(disabledImageTexture);
    }
    return initWithNormalSprite(normalSprite, selectedSprite, disabledSprite, target, selector);

}

    //2end
CCmenuNew* CCmenuNew::create()
{
    CCmenuNew *pRet = new CCmenuNew();
    if (pRet && pRet->init())
    {
        pRet->autorelease();
        return pRet;
    }
    CC_SAFE_DELETE(pRet);
    return NULL;
}

bool CCmenuNew::init(void)
{
    return initWithNormalImage(NULL, NULL, NULL, NULL, NULL);
}

CCmenuNew * CCmenuNew::create(const char *normalImage, const char *selectedImage)
{
    return CCmenuNew::create(normalImage, selectedImage, NULL, NULL, NULL);
}

CCmenuNew * CCmenuNew::create(const char *normalImage, const char *selectedImage, CCObject* target, SEL_MenuHandler selector)
{
    return CCmenuNew::create(normalImage, selectedImage, NULL, target, selector);
}

CCmenuNew * CCmenuNew::create(const char *normalImage, const char *selectedImage, const char *disabledImage, CCObject* target, SEL_MenuHandler selector)
{
    CCmenuNew *pRet = new CCmenuNew();
    if (pRet && pRet->initWithNormalImage(normalImage, selectedImage, disabledImage, target, selector))
    {
        pRet->autorelease();
        return pRet;
    }
    CC_SAFE_DELETE(pRet);
    return NULL;
}

CCmenuNew * CCmenuNew::create(const char *normalImage, const char *selectedImage, const char *disabledImage)
{
    CCmenuNew *pRet = new CCmenuNew();
    if (pRet && pRet->initWithNormalImage(normalImage, selectedImage, disabledImage, NULL, NULL))
    {
        pRet->autorelease();
        return pRet;
    }
    CC_SAFE_DELETE(pRet);
    return NULL;
}

bool CCmenuNew::initWithNormalImage(const char *normalImage, const char *selectedImage, const char *disabledImage, CCObject* target, SEL_MenuHandler selector)
{
    CCNode *normalSprite = NULL;
    CCNode *selectedSprite = NULL;
    CCNode *disabledSprite = NULL;

    if (normalImage)
    {
        normalSprite = CCSprite::create(normalImage);
    }

    if (selectedImage)
    {
        selectedSprite = CCSprite::create(selectedImage);
    }

    if(disabledImage)
    {
        disabledSprite = CCSprite::create(disabledImage);
    }
    return initWithNormalSprite(normalSprite, selectedSprite, disabledSprite, target, selector);
}


//
// Setter of sprite frames
//
void CCmenuNew::setNormalSpriteFrame(CCSpriteFrame * frame)
{
    setNormalImage(CCSprite::createWithSpriteFrame(frame));
}

void CCmenuNew::setSelectedSpriteFrame(CCSpriteFrame * frame)
{
    setSelectedImage(CCSprite::createWithSpriteFrame(frame));
}

void CCmenuNew::setDisabledSpriteFrame(CCSpriteFrame * frame)
{
    setDisabledImage(CCSprite::createWithSpriteFrame(frame));
}