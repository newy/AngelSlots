//
//  CCmenuNew.h

//
//  Created by yangyang on 14-7-23.
//
//

#ifndef __Test__CCmenuNew__
#define __Test__CCmenuNew__

#include "cocos2d.h"
USING_NS_CC;
// class CCmenuNew : public cocos2d::CCMenuItemImage
// {
//     public:
//         CCmenuNew();
//         ~CCmenuNew();
//         //改写按钮函数为了能用纹理替代路径
//          static CCmenuNew * CCMenucreateWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
//          CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector);
//          bool CCMenuinitWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
//          CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector);
// 
// 
// };

//使用纹理缓存建立的menu
//最好不要用plist大图，因为算一个纹理
class  CCmenuNew : public CCMenuItemSprite
{
public:
    CCmenuNew(){}
    virtual ~CCmenuNew(){}
    
    /** creates a menu item with a normal and selected image*/
    static CCmenuNew* create(const char *normalImage, const char *selectedImage);
    /** creates a menu item with a normal,selected  and disabled image*/
    static CCmenuNew* create(const char *normalImage, const char *selectedImage, const char *disabledImage);
    /** creates a menu item with a normal and selected image with target/selector */
    static CCmenuNew* create(const char *normalImage, const char *selectedImage, CCObject* target, SEL_MenuHandler selector);
    /** creates a menu item with a normal,selected  and disabled image with target/selector */
    static CCmenuNew* create(const char *normalImage, const char *selectedImage, const char *disabledImage, CCObject* target, SEL_MenuHandler selector);
    
    static CCMenuItemImage * CCMenucreateWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
        CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector);
    bool CCMenuinitWithTexture(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
        CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector);

    static CCmenuNew * CCMenucreateWithTexturenew(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
        CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector);
    bool CCMenuinitWithTexturenew(CCTexture2D *normalImageTexture, CCTexture2D *selectedImageTexture, 
        CCTexture2D *disabledImageTexture, CCObject* target, SEL_MenuHandler selector);


    bool init();
    /** initializes a menu item with a normal, selected  and disabled image with target/selector */
    bool initWithNormalImage(const char *normalImage, const char *selectedImage, const char *disabledImage, CCObject* target, SEL_MenuHandler selector);
    /** sets the sprite frame for the normal image */
    void setNormalSpriteFrame(CCSpriteFrame* frame);
    /** sets the sprite frame for the selected image */
    void setSelectedSpriteFrame(CCSpriteFrame* frame);
    /** sets the sprite frame for the disabled image */
    void setDisabledSpriteFrame(CCSpriteFrame* frame);

    /** Creates an CCMenuItemImage.
     */
    static CCmenuNew* create();
};


#endif /* defined(__Test__CCmenuNew__) */