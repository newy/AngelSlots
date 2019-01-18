//
    //  CardSprite.h
    //  Cocos2dev.com
    //
    //  Created by LiuYanghui on 13-6-17.
    //
    //

#ifndef __Test__CardSprite__
#define __Test__CardSprite__

#include "cocos2d.h"
    USING_NS_CC;

class CardSprite : public CCSprite
{
public:
    CardSprite();
    ~CardSprite();
    static CardSprite* create(const char* inCardImageName, const char* outCardImageName, float duration);
    virtual bool init(const char* inCardImageName, const char* outCardImageName, float duration);
    
    static CardSprite* createWithTexture( CCTexture2D * inCardImagepTexture, CCTexture2D * outCardImagepTexture, float duration,int i);//self add1 ��ʾ�����ڱ���
    virtual bool initWithTexture( CCTexture2D * inCardImagepTexture,CCTexture2D * outCardImagepTexture, float duration,int i);//self add1
    
//     //��д��ť����Ϊ�������������·��
//     static CCMenuItemImage * CCMenucreateWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
//         CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector);
//     bool CCMenuinitWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
//         CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector);
 
private:
    bool m_isOpened;
    CCActionInterval* m_openAnimIn;
    CCActionInterval* m_openAnimOut;
    CCActionInterval* m_openAnimInAndMove;
    CCActionInterval* m_openAnimOutAndMove;

    void initData(const char* inCardImageName, const char* outCardImageName, float duration);
    void initDataWithTexture( CCTexture2D * inCardImagepTexture,  CCTexture2D * outCardImagepTexture, float duration,int i);//self add1 

public:
     void openCard();
    void openCardAndMove();
};

#endif /* defined(__Test__CardSprite__) */