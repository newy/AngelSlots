#include "BaseLayer.h"
USING_NS_CC;
CCScene* BaseLayer::scene(){
    CCScene* scene=CCScene::create();
    BaseLayer* layer= BaseLayer::create();
    scene->addChild(scene);
    return scene;
}
bool BaseLayer::init(){
    bool isRet=false;
    do 
    {
        CC_BREAK_IF(!CCLayer::init());
        isRet=true;
    } while (0);
    return isRet;
}
CCSize BaseLayer::getWinSize(){
    return	CCDirector::sharedDirector()->getVisibleSize();
}
CCPoint BaseLayer::getWinOrigin(){
    return CCDirector::sharedDirector()->getVisibleOrigin();
}

CCPoint BaseLayer::getWinCenter(){
    return	ccp(getWinSize().width/2+getWinOrigin().x,getWinSize().height/2+getWinOrigin().y);
}

CCPoint BaseLayer::converSpritRel(float x, float y){
    return ccp(x+getWinOrigin().x,y+getWinOrigin().y);
}