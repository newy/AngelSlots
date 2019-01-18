#include "HelloWorldScene.h"
#include "ResouceDefine.h"
#include "mapchoose.h"
#include "PauseGameDialogLayer.h"
#include "Guess.h"
#include "shengji.h"
#include "table.h"
#include "storelayer.h"
#include "freexuanzhuan.h"
#include "bonus.h"
#include "playyinxiao.h"
#include "SimpleAudioEngine.h"
#include "load.h"
#include "CCShake.h"
#include "CardSprite.h"
#include "CCmenuNew.h"
#import "KTPlayC.h"
#include "MobClickCpp.h"//youmeng
#import "GameKitHelper.h"//GameCenter
using namespace cocos2d;
USING_NS_CC;


//extern int backqian;
//extern int yajinshuzu[15];//押金变化数
//extern int BonusNumtemp;


//封闭
// #define changjingid 1
// #define unitheight 414/3/bigsmall_factor
// #define shangtugao 260//slot上面的height
// #define kminturn 5//3
// #define iconscount 3 //测试用4，9，几个图标进入 3
// #define iconscountminID 6//图标最小值，从第几个图标开始7
// #define sudu 0.1//等于0.15的话第五列就移动了18个而不是15个，大于小于都正常.奇怪！0.12 0.1
// #define viewwidth 640/bigsmall_factor
// #define viewheight 960/bigsmall_factor
// //#define shangheight 270/bigsmall_factor //上部分 依次270 85 414 191（190可以）
// //改动14
// 
// #define shangheight_yuan 270/bigsmall_factor //上部分 依次270 85 414 191（190可以）
// 
// 
// #define shangwidth 640/bigsmall_factor
// #define jingyanheight 85/bigsmall_factor //上部分到中间的夹层（总经验）
// #define jingyanwidth 300/bigsmall_factor
// #define kuangheight 414/bigsmall_factor
// #define kuangwidth 640/bigsmall_factor
// #define slotheight 120/bigsmall_factor  //原来90
// #define slotwidth 120/bigsmall_factor //128（列的宽度）比较合适//原来90
// #define qizhiwidth 30/bigsmall_factor
// #define layercount 5 //多少列
// #define layerwidth kuangwidth/layercount
// #define qiantag 101
// #define Xiannum 3//25
// #define fishsprite_tag 6
// #define fisheat_tag 600
// #define fishieat_jingyan 1
// #define qizhi_zuo_tag 603
// #define qizhi_you_tag 604
// #define xiantag  601
// #define kuangtag 602
// #define bonustiptag 605
// #define freespintag 789
// #define AgainFreeDialogLayerTag 788
//封闭
//改动14
int shangheight;
//
static bool isSliding=false;
static bool activetag=false;
static bool activeRewardAnimationtag=false;
static bool hangxunhuan=false;
static bool QizhiIsActive=true;
static bool activeqiantag=false;
static bool activeqianDan=false;
static bool activeqianZong=false;
bool freexuanzhuaning;//free旋转标示，使得在中得此免费奖励的那一次单次奖励在下一次自动转时候清零
int jinzhangtag[2];//移植，bonus scatter提示over
int freexuanzhuan;//free旋转
//double currqian;//all money
double dancurrqian;//单次
double dancurrqianjia;//缓存
bool gcMUSICSTATE;
bool gcEFFECTSTATE;
//double qian;
int jingyan;// 经验值
//int jingyandengji;//经验等级
int jiaqian;
int maxxian;//最大reward线
int yajin;//yajin
int yajinID;//yajinshuzu id

//int resulttag[][]=new int[3,layercount];//结果tag，一切的结果操作都要通过它

int* resulttag[3];
//resulttag[0]=new int[3*layercount];
//resulttag[1]=new int[layercount];
//resulttag[2]=new int[layercount];

int nowrewardhangnum;//
CCLabelAtlas * label1;//money啊
//cocos2d::CCLabelBMFont *labelbm;//money
//cocos2d::CCLabelTTF* labelbm;

cocos2d::CCLabelTTF* pLabeldengji;//等级值标签 //移植5 over
//  cocos2d::CCLabelAtlas* pLabeldengji;
cocos2d::CCProgressTimer* jingyanpt;//经验
cocos2d::CCClippingNode *back;//背景遮盖层
cocos2d::CCLabelTTF *labelbmdan;//单钱 
cocos2d::CCLabelTTF *labelbmyajin;//yajin CCLabelBMFont //移植5 over
//cocos2d::CCLabelTTF *lableDaojuNum;
//cocos2d::CCMenu* pMenu;// 点击菜单
//  cocos2d::CCMenuItemImage *pGuessItem;
//  //cocos2d::CCMenuItemImage *pStartItem;//开始
// cocos2d::CCMenuItemImage *pADDItem;
// cocos2d::CCMenuItemImage *pSUBItem;
// cocos2d::CCMenuItemImage *pSTOREItem;
// //CCmenuNew *pGuessItem;
// CCmenuNew *pStartItem;//开始
// CCmenuNew *pADDItem;
// CCmenuNew *pSUBItem;
//CCmenuNew *pSTOREItem;

 cocos2d::CCMenuItemSprite *pGuessItem;
 cocos2d::CCMenuItemSprite *pStartItem;//开始
cocos2d::CCMenuItemSprite *pADDItem;
cocos2d::CCMenuItemSprite *pSUBItem;
cocos2d::CCMenuItemSprite *pSTOREItem;
//CCmenuNew *pGuessItem;
cocos2d::CCSpeed *actionMoveBy2;//滑动action 改动11
CCPointArray *LayerPositionResultArray; //结果数组
cocos2d::CCArray *slotScrollLayerArray; //滚动列的数组,保存每个列所在层指针
cocos2d::CCArray *kuangArray; //rewardslot kuang
cocos2d::CCArray *xianArray; //rewardslot xian
cocos2d::CCArray * daojuArray; //改动11
cocos2d::CCArray *ZhongHangNumShuzu;//哪些行reward
cocos2d::CCArray *slotResultArray; //Ω·π˚ ˝◊È

// int *tobedeletecount=new  int[layercount];
// int *deletecount=new int[layercount];
// int *spritecount=new int[layercount];
// bool *layerstate=new bool[layercount];

static bool stopbtn=false;//手动停止
static bool quit=false;//跳出循环

//押金变化数组
// int yajinshuzu[15]=
// {1,2,5,10,15,25,30,50,75,100,150,250,400,500,600,
// };

// 每条奖励线的图标位置 从下往上0-2 从左往右0-4//行列实际有24个线
int Xian25[25][5][2]={
    {{1,0},{1,1},{1,2},{1,3},{1,4}},//1
    {{2,0},{2,1},{2,2},{2,3},{2,4}},//2
    {{0,0},{0,1},{0,2},{0,3},{0,4}},//3
    {{2,0},{1,1},{0,2},{1,3},{2,4}},//4
    {{0,0},{1,1},{2,2},{1,3},{0,4}},//5
    {{1,0},{2,1},{2,2},{2,3},{1,4}},//6
    {{1,0},{0,1},{0,2},{0,3},{1,4}},//7
    {{2,0},{2,1},{1,2},{0,3},{0,4}},//8
    {{0,0},{0,1},{1,2},{2,3},{2,4}},//9
    {{1,0},{0,1},{1,2},{2,3},{1,4}},//10
    {{1,0},{2,1},{1,2},{0,3},{1,4}},//11
    {{2,0},{1,1},{1,2},{1,3},{2,4}},//12
    {{0,0},{1,1},{1,2},{1,3},{0,4}},//13
    {{2,0},{1,1},{2,2},{1,3},{2,4}},//14
    {{0,0},{1,1},{0,2},{1,3},{0,4}},//15
    {{1,0},{1,1},{2,2},{1,3},{1,4}},//16
    {{1,0},{1,1},{0,2},{1,3},{1,4}},//17
    {{2,0},{2,1},{0,2},{2,3},{2,4}},//18
    {{0,0},{0,1},{2,2},{0,3},{0,4}},//19
    {{2,0},{0,1},{0,2},{0,3},{2,4}},//20
    {{0,0},{2,1},{2,2},{2,3},{0,4}},//21
    {{1,0},{0,1},{2,2},{0,3},{1,4}},//22
    {{1,0},{2,1},{0,2},{2,3},{1,4}},//23
    {{0,0},{2,1},{0,2},{2,3},{0,4}},//24
    {{2,0},{0,1},{2,2},{0,3},{2,4}},//25
};

//tagreward 3+7(somewhere use 3+9)
//same3,4,5 reward
int tagjiang[11][3]={

    {30,150,300},  //tag=0 中3,4,5时候reward
    {25,100,200},  //tag=1
    {20,75,150},  //tag=2
    {15,50,100},  //tag=3
    {10,30,80},    //tag=4
    {5,20,60},    //tag=5
    {5,15,50},    //tag=6   
    {1,2,3},      //tag=7   Bonus
    {5,10,15},    //tag=8   散射 SCATTER
    {5,10,30},      //tag=9   通配 wild
    {5,10,30},    //tag=10   fish
};
// 奖励线的位置
// int XianPosition25[25][2]={
//     {0,134/2},
//     {0,134+134/2},
//     {0,2*134+134/2},
//   };


// int tobedeletecount[layercount];
// int deletecount[layercount];
// int spritecount[layercount];
// bool layerstate[layercount];
// int resulttag[3][layercount];//结果tag

// cocos2d::CCPointArray *LayerPositionResultArray;
// 每条奖励线的图标位置


CCScene* HelloWorld::scene()
{
    CCScene * scene = NULL;
    do 
    {
        // 'scene' is an autorelease object
        CCScene *scene = CCScene::create();

        // 'layer' is an autorelease object
        HelloWorld *layer = HelloWorld::create();

        // add layer as a child to scene
        scene->addChild(layer);

        // return the scene
        return scene;

    } while (0);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    bool bRet = false;
    do 
    {
        //////////////////////////////////////////////////////////////////////////
        // super init first
        //////////////////////////////////////////////////////////////////////////

        CC_BREAK_IF(! CCLayer::init());

        //////////////////////////////////////////////////////////////////////////
        // add your codes below...
        //////////////////////////////////////////////////////////////////////////
        //
//         shangtugao=260;//slot上面的height
//         //unitheight=414/3/bigsmall_factor;
//         kminturn=3;
//         //iconscount=3; //测试用4，9，几个图标进入
//         //iconscountminID=7;//图标最小值，从第几个图标开始
//         sudu=0.12;//等于0.15的话第五列就移动了18个而不是15个，大于小于都正常.奇怪！
//         viewwidth=640/bigsmall_factor;
//         viewheight=960/bigsmall_factor;
//         shangheight=270/bigsmall_factor; //上部分 依次270 85 414 191（190可以）
//         shangwidth=640/bigsmall_factor;
//         jingyanheight=85/bigsmall_factor; //上部分到中间的夹层（总经验）
//         jingyanwidth=300/bigsmall_factor;
//         kuangheight=414/bigsmall_factor;
//         kuangwidth=640/bigsmall_factor;
//         slotheight=120/bigsmall_factor;  //原来90
//         slotwidth=120/bigsmall_factor; //128（列的宽度）比较合适//原来90
//         qizhiwidth=30/bigsmall_factor;
//         //layercount=5; //多少列
//         layerwidth=kuangwidth/layercount;
//         qiantag=101;
//         //Xiannum=3;//25
// 
//         qizhi_zuo_tag=603;
//         qizhi_you_tag=604;
//         xiantag=601;
//         kuangtag=602;
//         bonustiptag=605;
//         isSliding=false;
//         activetag=false;
//         activeRewardAnimationtag=false;
//         hangxunhuan=false;
//         QizhiIsActive=true;
//         activeqiantag=false;
//         activeqianDan=false;
//         activeqianZong=false;
//         freexuanzhuaning=false;//free旋转标示，使得在中得此免费奖励的那一次单次奖励在下一次自动转时候清零
        //stopbtn=false;//手动停止
        //quit=false;//跳出循环
        //改动14
        shangheight=bjwidth*pingmubili-960+shangheight_yuan;//
        resulttag[0]=new int[layercount];
        resulttag[1]=new int[layercount];
        resulttag[2]=new int[layercount];



        //
        CCDirector::sharedDirector()->setNotificationNode(NULL);
        //无声音
 
        //初始加载资源
        /*//plist预留
        CCSpriteFrameCache* cache = CCSpriteFrameCache::sharedSpriteFrameCache(); 
        cache->addSpriteFramesWithFile("animations/grossini.plist", "animations/grossini.png"); 
        m_pSprite1 = CCSprite::spriteWithSpriteFrameName("grossini_dance_01.png"); 
        m_pSprite1->setPosition( ccp( s.width/2-80, s.height/2) ); 
        只要plist文件跟对应的png图片在同一目录下，且名字相同，则addSpriteFramesWithFile(“animations/grossini.plist”, “animations/grossini.png”)可以改成addSpriteFramesWithFile(“animations/grossini.plist”);
        //
        或者
        CCTexture2D* cache = CCTextureCache::sharedTextureCache()->addImage("hero.png"); 
        CCSprite* sprite = CCSprite::spriteWithTexture(cache);
        */
        //CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(zhuan_start_m);//start
       // CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadBackgroundMusic(zhuan_start_m);//移植移到yinxiao；类处理
       //加载图片
        //oldchangjing=changjing;    
        //changjing=changjingid; //放到onenter里
        LoadingScene::LoadAndeRemove();
         
      

        //初始加载资源end
        // 1. Add a menu item with "X" image, which is clicked to quit the program.

        // Create a "close" menu item with close icon, it's an auto release object.
        CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
        CCSprite *CloseNormal=CCSprite::createWithSpriteFrameName("CloseNormal.png");
       // CCSprite *button_start_selected=CCSprite::createWithSpriteFrameName("button_start_selected.png");
        //CCSprite *button_start_disable=CCSprite::createWithSpriteFrameName("button_start_disable.png");
        CCMenuItemSprite *pCloseItem = CCMenuItemSprite::create(
            CloseNormal,
            CloseNormal,
            this,
            menu_selector(HelloWorld::menuCloseCallback));
        CC_BREAK_IF(! pCloseItem);
        
        // Place the menu item bottom-right conner.


        
        //pCloseItem->setPosition(ccp(CCDirector::sharedDirector()->getWinSize().width - 20, 20));
       //pCloseItem->setAnchorPoint(ccp(0,1));
       //pCloseItem->setPosition(ccp(pCloseItem->getContentSize().width/2 ,
         //  visibleSize.height-pCloseItem->getContentSize().height/2));
       //pCloseItem->setPosition(ccp(10,
        //   visibleSize.height-10));
       //pCloseItem->setAnchorPoint(ccp(0.4,0.6));
       pCloseItem->setAnchorPoint(ccp(0,1));
       pCloseItem->setPosition(ccp(0,visibleSize.height));
      // pCloseItem->setPosition(ccp(pCloseItem->getContentSize().width/2 ,
        //   visibleSize.height-pCloseItem->getContentSize().height/2));
        
        
     
        
         //table按钮
          CCSprite *TableNormal=CCSprite::createWithSpriteFrameName("table.png");
       CCMenuItemSprite *pTableItem = CCMenuItemSprite::create(
           TableNormal,
           TableNormal,
           this,
           menu_selector(HelloWorld::menuTableCallback));
       CC_BREAK_IF(! pTableItem);  
       pTableItem->setAnchorPoint(ccp(1,1));
       pTableItem->setPosition(ccp(visibleSize.width,visibleSize.height));
        pTableItem->setTag(menu_ptable_tag);
        
        
         CCSprite *pGamecenterItemNormal=CCSprite::createWithSpriteFrameName("gamecenter.png");
        CCMenuItemSprite* pGamecenterItem = CCMenuItemSprite::create(
                                           pGamecenterItemNormal,
                                            pGamecenterItemNormal,
                                             this,
                                           menu_selector(HelloWorld::menuGamecenterCallback));
        CC_BREAK_IF(!pGamecenterItem);
        pGamecenterItem->setAnchorPoint(ccp(1,1));
        pGamecenterItem->setPosition(ccp(pTableItem->getPositionX()-pTableItem->getContentSize().width,visibleSize.height));
        
        //ktplay!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@@@@@@@
        nowobject=this;
        //pGamecenterItem->setEnabled(false);
        pGamecenterItem->setVisible(false);
        if(KTPlayC::isEnabled())
        {
            pGamecenterItem->setVisible(true);
        }
        
        

           CCSprite *bgimg =CCSprite::createWithSpriteFrameName("bj.png");
         //CCSprite *bgimg = CCSprite::create("bj.png");//bj_gk1
        CC_BREAK_IF(! bgimg);
        bgimg->setPosition(ccp(visibleSize.width/2,visibleSize.height/2));
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        bgimg->setScaleY(shanglashen);//背景图拉伸
         CCLog("shanglashen=%f",shanglashen);
        this->addChild(bgimg);
        

        /*
        //上部分背景
        CCSprite *backshangimg = CCSprite::create("bg_01_640_270.png");
        CC_BREAK_IF(! backshangimg);
        //改动14
        //float shanglashen=max((float)shangheight/shangheight_yuan,1);//backshangimg->setScale();
        float shanglashen=(float)shangheight/shangheight_yuan;
        backshangimg->setScaleY(shanglashen);//or setScale
        //
        backshangimg->setPosition(ccp(shangwidth/2,visibleSize.height-shangheight/2));
        this->addChild(backshangimg);
        //
        */
        //---------------temp-1//start!!!!!!
        //CCFileUtils::sharedFileUtils()->set
//         std::string tishi("/button_start_normal.png");
//         char tishistring[30] = {0};
// 
//         sprintf(tishistring, "%s",tishi.c_str());
//         char tishistring[100] = {0};
//         sprintf(tishistring, "%s",lujing.c_str());

        CCSprite *button_start_normal=CCSprite::createWithSpriteFrameName("button_start_normal.png");
        CCSprite *button_start_selected=CCSprite::createWithSpriteFrameName("button_start_selected.png");
        CCSprite *button_start_disable=CCSprite::createWithSpriteFrameName("button_start_disable.png");
        pStartItem = CCMenuItemSprite::create(
            button_start_normal,
            button_start_selected,
            button_start_disable,
            this,
            menu_selector(HelloWorld::menuStartCallback));

//         CCSprite *button_start_normal=CCSprite::createWithSpriteFrameName("laohu_6.png");//button_start_normal
//         CCSprite *button_start_selected=CCSprite::createWithSpriteFrameName("laohu_7.png");
//         CCSprite *button_start_disable=CCSprite::createWithSpriteFrameName("laohu_8.png");
        //CCLOG("button_start_normal->getTexture()->getContentSize().width=%f,button_start_normal->getTexture()->getContentSize().height=%f", button_start_normal->getContentSize().width, button_start_normal->getContentSize().height);
       
        //CCLOG("button_start_normal->getTexture()->getContentSize().width=%f,button_start_normal->getTexture()->getContentSize().height=%f",button_start_normal->getTexture()->getContentSize().width,button_start_normal->getTexture()->getContentSize().height);
       //CCSprite *test=CCSprite::createWithTexture(button_start_normal->getTexture());
       //CCLOG("test->getTexture()->getContentSize().width=%f,test->getTexture()->getContentSize().height=%f",test->getTexture()->getContentSize().width,test->getTexture()->getContentSize().height);
  //CCSpriteFrame *pFrame = CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName("laohu_5.png");
  //CCSprite *test2= new CCSprite();
  //test2->initWithTexture(pFrame->getTexture(), pFrame->getRect());
  //test2->setDisplayFrame(pFrame);
//         CCLOG("button_start_normal111->getTexture()->getContentSize().width=%f,button_start_normal111->getTexture()->getContentSize().height=%f", button_start_normal->getTexture()->getContentSize().width, button_start_normal->getTexture()->getContentSize().height);
//     button_start_normal->setTextureRect(button_start_normal->getTextureRect());
//         CCLOG("button_start_normal111->getTexture()->getContentSize().width=%f,button_start_normal111->getTexture()->getContentSize().height=%f", button_start_normal->getTexture()->getContentSize().width, button_start_normal->getTexture()->getContentSize().height);
//         button_start_normal->get
//     button_start_normal->getTexture()->drawInRect(button_start_normal->getTextureRect());
//     button_start_selected->getTexture()->drawInRect(button_start_selected->getTextureRect());
//     button_start_disable->getTexture()->drawInRect(button_start_disable->getTextureRect());
//     CCLOG("button_start_normal111->getTexture()->getContentSize().width=%f,button_start_normal111->getTexture()->getContentSize().height=%f", button_start_normal->getTexture()->getContentSize().width, button_start_normal->getTexture()->getContentSize().height);
//     CCLOG("%f,%f,%f,%f",button_start_normal->getTextureRect().getMinX(), button_start_normal->getTextureRect().getMaxX(),button_start_normal->getTextureRect().getMinY(),button_start_normal->getTextureRect().getMaxY());

     //CCLOG("test2 %f,%f,%f,%f,%f,%f", test2->getTextureRect().getMinX(), test2->getTextureRect().getMaxX(), test2->getTextureRect().getMinY(),test2->getTextureRect().getMaxY(),test2->getTexture()->getContentSize().width,test2->getTexture()->getContentSize().height);
        //CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_normal.png",lujing)->getCString());
        //std::string tishi;
      
        
        ///std::string tishi1("/button_start_normal.png");
         //*lujing*/+=tishi1;
        //tishi+=tishi1;

//           CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("%s/button_start_normal.png", tishistring)->getCString());
//           CCSprite *button_start_normal=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_start_normal.png", tishistring)->getCString()));
//           CCSprite *button_start_selected=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_start_selected.png", tishistring)->getCString()));
//           CCSprite *button_start_disable=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_start_disable.png", tishistring)->getCString()));
// 
//         pStartItem =  CCmenuNew::CCMenucreateWithTexturenew(
//             button_start_normal->getTexture(),
//             button_start_selected->getTexture(),//button_start_selected
//             button_start_disable->getTexture(),//button_start_disable
//             this,
//             menu_selector(HelloWorld::menuStartCallback));
           
        CC_BREAK_IF(! pStartItem);
        //pStartItem->release();
        //pStartItem->autorelease();
        //guess //639
//         CCSprite *button_Guess_normal=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_Guess_normal.png", tishistring)->getCString()));
// 
//         CCSprite *button_Guess_selected=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_Guess_selected.png", tishistring)->getCString()));
// ///button_Guess_selected
//         CCSprite *button_Guess_disablel=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_Guess_disable.png", tishistring)->getCString()));

        //CCSprite *button_Guess_disablel=CCSprite::createWithSpriteFrameName("button_Guess_disablel.png");

//         pGuessItem =  CCMenuItemSprite::CCMenucreateWithTexture(
//             button_Guess_normal->getTexture(),
//             button_Guess_selected->getTexture(),
//             button_Guess_disablel->getTexture(),
//             this,
//             menu_selector(HelloWorld::menuGuessCallback));


        CCSprite *button_Guess_normal=CCSprite::createWithSpriteFrameName("button_Guess_normal.png");
        CCSprite *button_Guess_selected=CCSprite::createWithSpriteFrameName("button_Guess_selected.png");
        CCSprite *button_Guess_disable=CCSprite::createWithSpriteFrameName("button_Guess_disable.png");
        pGuessItem = CCMenuItemSprite::create(
            button_Guess_normal,
            button_Guess_selected,
            button_Guess_disable,
            this,
            menu_selector(HelloWorld::menuGuessCallback));
        CC_BREAK_IF(! pGuessItem);
        pGuessItem->setEnabled(false);
       // pGuessItem->setAnchorPoint(ccp(0,0.5));
        //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
        //pGuessItem->setPosition(ccp(visibleSize.width-layerwidth/2, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
        //pGuessItem->setPosition(ccp(visibleSize.width/2+pStartItem->getContentSize().width/2, (visibleSize.height-shangheight-jingyanheight-kuangheight-kuanghoudu*2)*3/4));
        //CCLOG("visibleSize.width= %f",visibleSize.width);

        pGuessItem->setAnchorPoint(ccp(1,0.5));
        pGuessItem->setPosition(ccp(visibleSize.width, (visibleSize.height-shangheight-jingyanheight-kuangheight-kuanghoudu*2)*3/4));

        pGuessItem->setTag(menu_pguess_tag);
        //改动11

                CCSprite *jiansu_anniu=CCSprite::createWithSpriteFrameName("jiansu_anniu.png");//button_start_normal
                CCSprite *jiansut_selected=CCSprite::createWithSpriteFrameName("jiansut_selected.png");
                CCSprite *jiansu_disable=CCSprite::createWithSpriteFrameName("jiansu_disable.png");
                pJiansuItem =  CCMenuItemSprite::create(
                     jiansu_anniu,
                     jiansut_selected,
                     jiansu_disable,
                     this,
                     menu_selector(HelloWorld::menujiansuCallback));


//         CCSprite *jiansu_anniu=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/jiansu_anniu.png", tishistring)->getCString()));
//         CCSprite *jiansut_selected=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/jiansut_selected.png", tishistring)->getCString()));
//         CCSprite *jiansu_disable=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/jiansu_disable.png", tishistring)->getCString()));
//         CCMenuItemImage *pJiansuItem =  CCmenuNew::CCMenucreateWithTexture(
//             jiansu_anniu->getTexture(),
//             jiansut_selected->getTexture(),
//             jiansu_disable->getTexture(),
//             this,
//             menu_selector(HelloWorld::menujiansuCallback));

//         CCMenuItemImage *pJiansuItem = CCMenuItemImage::create(
//             "jiansu_anniu.png",
//             "jiansu_anniu.png",
//             "jiansu_anniu.png",
//             this,
//             menu_selector(HelloWorld::menujiansuCallback));
        CC_BREAK_IF(! pJiansuItem);
        //pJiansuItem->setAnchorPoint(ccp(0,0.5));
        //pJiansuItem->setPosition(ccp(visibleSize.width/2+pStartItem->getContentSize().width/2, (visibleSize.height-shangheight-jingyanheight-kuanghoudu*2-kuangheight)/4));
        pJiansuItem->setAnchorPoint(ccp(1,0.5));
        pJiansuItem->setPosition(ccp(visibleSize.width, (visibleSize.height-shangheight-jingyanheight-kuanghoudu*2-kuangheight)/4));
        pJiansuItem->setTag(menu_pjiansu_tag);
        //道具数量

        CCSprite* daojusprite=CCSprite::createWithSpriteFrameName("daoju_num.png");
        daojusprite->setAnchorPoint(ccp(1.2,1));
        daojusprite->setPosition(ccp(pJiansuItem->getContentSize().width,pJiansuItem->getContentSize().height));
        pJiansuItem->addChild(daojusprite);
        char daojunumstring[5]={0};
        daojunum=userDefault->getIntegerForKey("usrDaojuNum");
        sprintf(daojunumstring, "%d",daojunum);
        lableDaojuNum=CCLabelTTF::create(daojunumstring,"Arial",35/bigsmall_factor);
        lableDaojuNum->setAnchorPoint(ccp(0.5,0.5));
        lableDaojuNum->setPosition(ccp(daojusprite->getContentSize().width/2,daojusprite->getContentSize().height/2));
        daojusprite->addChild(lableDaojuNum);

        // Place the menu item bottom-right conner.
       
        //pStartItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(50+80+65)*2/bigsmall_factor, (visibleSize.height-shangheight-jingyanheight-kuangheight)/2));
         //pStartItem->setAnchorPoint(ccp(0.5,0.5));
        //pStartItem->setPosition(ccp(visibleSize.width/2, (visibleSize.height-shangheight-jingyanheight-kuangheight-kuanghoudu*2)/2));
        pStartItem->setAnchorPoint(ccp(0.5,start_maodianY));
        pStartItem->setPosition(ccp(visibleSize.width/2, 0));

        pStartItem->setTag(menu_pstart_tag);

    


        //---------------temp-1
        //+++++++++++++++++++++++++++++yajin
       
        
        // Create a menu with the "close" menu item, it's an auto release object.
       

        // 2. Add a label shows "Hello World".

        // Create a label and initialize with string "Hello World".
//         CCLabelTTF* pLabel = CCLabelTTF::create("Hello World", "Arial", 48/bigsmall_factor);
//         CC_BREAK_IF(! pLabel);
// 
//         // Get window size and place the label upper. 
//         CCSize size = CCDirector::sharedDirector()->getWinSize();
//        
//         pLabel->setPosition(ccp(size.width / 2, size.height - 50/bigsmall_factor));
// 
//         // Add the label to HelloWorld layer as a child layer.
//         this->addChild(pLabel, 1);

        //monster here！
        // 初始化怪物系统 //改动11
        CCTextureCache::sharedTextureCache()->addImage("monster/dutu.png");
        CCTextureCache::sharedTextureCache()->addImage("monster/monster_blood_frame.png");
        CCTextureCache::sharedTextureCache()->addImage("monster/monster_blood.png");
        //改动14
        this->monsterSystem=new MonsterSystem(CCRectMake(0,visibleSize.height-shangheight,visibleSize.width,shangheight));
        //
        
        this->setTag(guanka1_tag);
        monsterSystem->setDefenderGameLayer(this);
        //monsterSystem->MonsterGoSize=CCRectMake(0,size.height-shangtugao,size.width,shangtugao);
        
        //此处应加判断,上一次放了几个monster，从usrdefalt读取
        //
        this->monsterSystem->addMonster(1,1);
        monsterSystem->raisefishijingyan(-1);//0
        //monster here！end

        // 3. Add add a splash screen, show the cocos2d splash image.
       // CCSprite* pSprite = CCSprite::create("HelloWorld.png");
       // CC_BREAK_IF(! pSprite);

        // Place the sprite on the center of the screen
      
       // pSprite->setPosition(ccp(size.width/2, size.height/2));

        // Add the sprite to HelloWorld layer as a child layer.
       // this->addChild(pSprite, 0);
        //--------------------------------
      
        // 'layer' is an autorelease object
        
        slotResultArray=CCArray::create();
        slotResultArray->retain();
       
       
        //CCLOG("11slotResultArray-count=%d,slotResultArray->retaincount=%d",slotResultArray->count(),slotResultArray->retainCount());
        kuangArray=CCArray::create();
        kuangArray->retain();
        xianArray=CCArray::create();
        xianArray->retain();
        ZhongHangNumShuzu=CCArray::create();
        ZhongHangNumShuzu->retain();
        daojuArray=CCArray::create();//改动11
        daojuArray->retain();//改动11
        nowrewardhangnum=0;
         LayerPositionResultArray=CCPointArray::create(layercount);
         LayerPositionResultArray->retain();
         slotScrollLayerArray= CCArray::create();
         back= CCClippingNode::create();
         //CCLayerColor* back =CCLayerColor::create(ccc4(255, 255, 0, 0),582 ,386);
         back->setContentSize(CCSize(kuangwidth,kuangheight));
         
         //test xian use
//          CCSprite *testxianbj = CCSprite::create("jietu.png");
//          testxianbj->setPosition(ccp(visibleSize.width/2,visibleSize.height-shangheight-jingyanheight-kuanghoudu-kuangheight/2));
//          CCLOG("jietuymin= %f,jietumax=%f",visibleSize.height-shangheight-jingyanheight-kuanghoudu-kuangheight,visibleSize.height-shangheight-jingyanheight-kuanghoudu);
//          //test xian use end
         
         //back->setPosition(visibleSize.width/2,visibleSize.height/2);
         back->setPosition(visibleSize.width/2,visibleSize.height-shangheight-jingyanheight-kuanghoudu-kuangheight/2);
         back->ignoreAnchorPointForPosition(false);//cclayer默认AnchorPoint为（0，0）
         back->setAnchorPoint(ccp(0.5,0.5));
         CCSprite *backimg_bj=CCSprite::createWithSpriteFrameName("slot_zhegai_bj.png");
         //CCSprite *backimg_bj = CCSprite::create("slot_zhegai_bj.png");
         backimg_bj->setPosition(back->getPosition());
         this->addChild(backimg_bj);
         //CCSprite *back_gexianimg =CCSprite::createWithSpriteFrameName("slot_gexian.png");
         CCSprite *back_gexianimg = CCSprite::create("slot_gexian.png");
         //back_gexianimg->setPosition(ccp(kuangwidth/2,kuangheight/2));
         back_gexianimg->setPosition(ccp(kuangwidth/2,kuangheight/2));
         //back_gexianimg->setPosition(back_gk2->getPosition());
         back->addChild(back_gexianimg);


         this->addChild(back);
         //this->addChild(testxianbj,10000);//test xian use

        //实现遮盖效果
         CCDrawNode*stencil = CCDrawNode::create();
         CCPoint rectangle[4];
         rectangle[0]= ccp(0, 0);
         rectangle[1]= ccp(back->getContentSize().width,0);
         rectangle[2]= ccp(back->getContentSize().width,back->getContentSize().height);
        // rectangle[2]= ccp(kuangwidth-kuanghoudu*2,kuangheight);
         rectangle[3]= ccp(0, back->getContentSize().height);


         //绘制一个矩形
         ccColor4F white = {1, 1, 1, 1};
         stencil->drawPolygon(rectangle,4, white, 1, white);
         back->setStencil(stencil);
         srand(time(NULL));//随机数设置种子，随机数真正随机
        for(int t=0;t<layercount;t++)
        {
        CCLayerColor* layer1 =CCLayerColor::create(ccc4(255, 255, 255, 0),layerwidth ,kuangheight); 
        spritecount[t]=(t+kminturn+1)*3;
        
        
        for(int i=0;i<spritecount[t];i++)
        { 
            
            //有时候会出错的
            
            int result_ingailvshuzu=CCRANDOM_0_1()*tubiaogailv_jishu;
            //CCLOG("result_ingailvshuzu=%d",result_ingailvshuzu);
            int result=*(tubiaogailv_shuzu+result_ingailvshuzu);
            //CCLOG("result=%d",result);
            //int result = CCRANDOM_0_1()*iconscount+iconscountminID;//+1
            //if(result>iconscount||result<0)
//            //减少bonus scatter wild 概率
//            if (result==tubiao_bonustip || result==tubiao_scaterrtip || result==tubiao_wildtip )
//            {
//                result = CCRANDOM_0_1()*iconscount+iconscountminID;
//            }
            
            
            
            if (result>=iconscount+iconscountminID||result<iconscountminID)
            {
                do 
                {
                    result = CCRANDOM_0_1()*iconscount+iconscountminID;//+1
                } while (result>=iconscount+iconscountminID||result<iconscountminID);

            }
            //CCLOG("1result:%d",result);
            
            CCSprite *pSprite2=CCSprite::createWithSpriteFrameName(CCString::createWithFormat("laohu_%d.png", result)->getCString());
            //CCSprite *pSprite2 = CCSprite::create(CCString::createWithFormat("laohu_%d.png", result)->getCString());
            //pSprite2->setAnchorPoint(CCPointZero);
            //pSprite2->setPosition(ccp(50,i*unitheight-(kminturn*(t+1)+1)*unitheight-193+45));
           
            //pSprite2->setPosition(ccp(layerwidth/2,i*unitheight-kuangheight/2+unitheight/2));//position：193-》相对layer，45-》图标自身一半高度，20调整
          
            pSprite2->setPosition(ccp(layerwidth/2,i*unitheight+unitheight/2));//好用
            //pSprite2->setPosition(ccp(layerwidth/2,(i+1)*kuangheight/4));
            pSprite2->setTag(result);//方法1：方便后续数组序列中提取object再提取tag分辨那个图标
           
           //pSprite2->setPosition(ccp(50,i*90));
            //CCLOG("105pSprite2->retaincount=%d",pSprite2->retainCount());
            layer1->addChild(pSprite2);
                //CCLOG("105pSprite2->retaincount=%d",pSprite2->retainCount());
            
        }   
         //CCSprite *pSprite1 = CCSprite::create("laohu_1.png");
         //pSprite1->setPosition(ccp(50,150));
         //layer1->addChild(pSprite1,2,19);
         //layer1->setPosition(ccp(t*layerwidth,kuangheight/2));
        
         layer1->setPosition(ccp(kuanghoudu+t*layerwidth,0));
         layer1->setTag(18+t);
         //this->addChild(layer1,1);
      
         LayerPositionResultArray->addControlPoint(layer1->getPosition());
         back->addChild(layer1,1);
         slotScrollLayerArray->addObject(layer1);
            //layer1->release();
        //CCLOG("layer position %d",layer1->getPositionY());
        }
        slotScrollLayerArray->retain();

        CCSprite *backimg_kuang = CCSprite::createWithSpriteFrameName("slot_zhegai_kuang.png");
        //backimg_kuang->setPosition(ccp(back->getContentSize().width/2,back->getContentSize().height/2));
        //back->addChild(backimg_kuang);
        backimg_kuang->setAnchorPoint(ccp(0.5,0));
        backimg_kuang->setPosition(ccp(back->getPositionX(),back->getPositionY()-kuangheight/2-kuanghoudu_xia));
        this->addChild(backimg_kuang);

        //旗帜
        CCSprite *qizhi_zuo = CCSprite::create("qizhi_zuo.png");
        qizhi_zuo->setVisible(true);
       // qizhi_zuo->setPosition(ccp(qizhiwidth/2,kuangheight/2));
        qizhi_zuo->setPosition(ccp(qizhiwidth/2,back->getPositionY()-5)); //需要上移7个
        //back->addChild(qizhi_zuo,4,qizhi_zuo_tag);
        this->addChild(qizhi_zuo,4,qizhi_zuo_tag);

        CCSprite *qizhi_you = CCSprite::create("qizhi_you.png");
        qizhi_you->setVisible(true);
        //qizhi_you->setPosition(ccp(kuangwidth-qizhiwidth/2,kuangheight/2));
        
         qizhi_you->setPosition(ccp(kuangwidth-qizhiwidth/2,back->getPositionY()-4)); //需要下移7个
         //back->addChild(qizhi_you,4,qizhi_you_tag);
         this->addChild(qizhi_you,4,qizhi_you_tag);
        //线
         backdixian=back->getPositionY()-back->getContentSize().height/2;
         int xian_x=back->getPositionX();
         int xian_y=back->getPositionY();
        for (int i=0;i<Xiannum;i++)
        {
            //CCSprite *pSpriteXian = CCSprite::create(CCString::createWithFormat("xian_%d.png",i)->getCString());
            CCSprite *pSpriteXian = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("xian_%d.png",i)->getCString());

            //pSpriteXian->setAnchorPoint(ccp(XianPosition25[i][0],0.5));
            //pSpriteXian->setPosition(ccp(XianPosition25[i][0]*kuangwidth/2,backdixian+XianPosition25[i][1]));
            //CCLOG("pSpriteXianX=%f,pSpriteXiany=%f",XianPosition25[i][0],XianPosition25[i][1]);
            pSpriteXian->setPosition(ccp(xian_x,xian_y));
            pSpriteXian->setVisible(true);
            pSpriteXian->setTag(xiantag);

            this->addChild(pSpriteXian);

            //back->addChild(pSpriteXian,200);
            spriteresetvisible(pSpriteXian);
        }

        //

        //总钱和经验
        CCSprite *backqianimg =CCSprite::createWithSpriteFrameName("qiankuang_264_64.png");
        CC_BREAK_IF(! backqianimg);
        backqianimg->setAnchorPoint(ccp(0.6,0.5));
        backqianimg->setPosition(ccp(visibleSize.width/4,visibleSize.height-shangheight-jingyanheight/2));
        this->addChild(backqianimg,3);
        
       //赢得金钱
        qian=userDefault->getDoubleForKey("usrqian");//初始化从存储记录中读出，用户数据存取标示
        currqian=qian;
        char string[15] = {0};
        sprintf(string, "%.2f",qian/100);
        //labelbm=CCLabelBMFont::create(string,"diy_38.fnt"); //futura-48  diy_32new

        labelbm = CCLabelTTF::create(string, "Arial", 30/bigsmall_factor); //HiraKakuProN-W6
        labelbm->setColor(ccc3(248,213,118));

       //labelbm=CCLabelBMFont::create(CCString::createWithFormat("%.2f",qian)->getCString(),"bitmapFontChinese.fnt");
        //this->addChild(labelbm);
        if (qian/100>999999&&qian/100<=9999999)
        {
        labelbm->setScale(0.9);
        }
        else if(qian/100>9999999&&qian/100<=999999999)
        {
        labelbm->setScale(0.8);
        }
        else if(qian/100>999999999)
        {
        labelbm->setScale(0.7);        
        }
        
        //labelbm->setScale(1.5/(float)bigsmall_factor);
        labelbm->setAnchorPoint(ccp(0.5,0.6));
        //labelbm->setPosition(ccp(jingyanwidth/2,jingyanheight/2));
        labelbm->setPosition(ccp(backqianimg->getTextureRect().size.width/2,backqianimg->getTextureRect().size.height/2));
        backqianimg->addChild(labelbm);
        
        //labelbm->setAnchorPoint(ccp(0,0));
      
        //labelbm->setPosition(ccp(visibleSize.width/4,visibleSize.height-shangheight-jingyanheight/2));
       labelbm->retain();
       //商城item//移植5 over
       CCSprite *button_normal_store=CCSprite::createWithSpriteFrameName("button_normal_store.png");
       pSTOREItem = CCMenuItemSprite::create(
           button_normal_store,
           button_normal_store,
           button_normal_store,        
           this,
           menu_selector(HelloWorld::menuStoreCallback));

//        CCSprite *button_normal_store=CCSprite::create("button_normal_store.png");
//        CCSprite *button_selected_store=CCSprite::create("button_selected_store.png");
//        CCSprite *button_disable_store=CCSprite::create("button_disable_store.png");
//        pSTOREItem =  CCmenuNew::CCMenucreateWithTexturenew(
//            button_normal_store->getTexture(),
//            button_selected_store->getTexture(),
//            button_disable_store->getTexture(),
//            this,
//            menu_selector(HelloWorld::menuStoreCallback));

//        CCSprite *button_normal_store=CCSprite::create("button_normal_store.png");
//        CCSprite *button_selected_store=CCSprite::create("button_selected_store.png");
//        CCSprite *button_disable_store=CCSprite::create("button_disable_store.png");
//        pSTOREItem =  CCMenuItemSprite::create(
//            "button_normal_store.png",
//            "button_selected_store.png",
//            "button_disable_store.png",
//            this,
//            menu_selector(HelloWorld::menuStoreCallback));
       CC_BREAK_IF(! pSTOREItem);
       pSTOREItem->setAnchorPoint(ccp(1.3,0.5));
       //pSTOREItem->setPosition(ccp(visibleSize.width/4+jingyanwidth/2,visibleSize.height-shangheight-jingyanheight/2));
       pSTOREItem->setPosition(ccp(backqianimg->getPositionX()+backqianimg->getContentSize().width/2,backqianimg->getPositionY()));
       
       
       
       //经验

       //CCSprite *backjingyanimg = CCSprite::createWithSpriteFrameName("jingyankuang_new.png");//jingyankuang_300_75
       CCSprite *backjingyanimg = CCSprite::create("jingyankuang_new.png");//jingyankuang_300_75
       CC_BREAK_IF(! backjingyanimg);
       backjingyanimg->setAnchorPoint(ccp(0.48,0.5));
       backjingyanimg->setPosition(ccp(visibleSize.width*3/4,visibleSize.height-shangheight-jingyanheight/2));
       backjingyanimg->setTag(102);
       this->addChild(backjingyanimg);

       //经验进度条
       jingyan=userDefault->getIntegerForKey("usrjingyan");//经验值，初始化从存储记录中读出，用户数据存取标示

       jingyandengji=userDefault->getIntegerForKey("usrjingyandengji");//经验等级值，初始化从存储记录中读出，用户数据存取标示

     

      //进度条外边框//移植5
      /* CCSprite *jingyan_LV_new = CCSprite::createWithSpriteFrameName("jingyan_LV_new.png");//jingyankuang_300_75*/
       CCSprite *jingyan_LV_new = CCSprite::create("jingyan_LV_new.png");//jingyankuang_300_75
        CC_BREAK_IF(!jingyan_LV_new);
        jingyan_LV_new->setAnchorPoint(ccp(0.7,0.5));
        jingyan_LV_new->setPosition(ccp(0,backjingyanimg->getTextureRect().getMidY()));
        //jingyan_LV_new->setAnchorPoint(ccp(0,1));
        //jingyan_LV_new->setPosition(ccp(0,backjingyanimg->getTextureRect().getMaxY()));
        backjingyanimg->addChild(jingyan_LV_new,1);

        //经验等级显示到外框上
        char jingyanstring[12] = {0};
        sprintf(jingyanstring, "%d",jingyandengji);
        //pLabeldengji = CCLabelTTF::create(jingyanstring, "Arial", 38/bigsmall_factor);
         // pLabeldengji = CCLabelTTF::create(jingyanstring, "Arial", 38/bigsmall_factor);

          pLabeldengji = CCLabelTTF::create(jingyanstring, "Arial", 35/bigsmall_factor); //HiraKakuProN-W6
          pLabeldengji->setColor(ccc3(95,73,27));




       //pLabeldengji=CCLabelBMFont::create(jingyanstring,"futura-48.fnt");
       //pLabeldengji->setScale(0.7f);
       //pLabeldengji->setColor(ccc3(234,180,84));
        // pLabeldengji=CCLabelAtlas::create(jingyanstring, "fps_images.png", 24, 24, '.');//需缓存图片
        CC_BREAK_IF(! pLabeldengji);
        //pLabeldengji->setPosition(ccp(jingyanwidth/4+5, jingyanheight*3/4-5));
        pLabeldengji->setAnchorPoint(ccp(0.5,0.5));
       // pLabeldengji->setPosition(ccp(jingyan_LV_new->getTextureRect().getMaxX()+5, jingyan_LV_new->getTextureRect().getMidY()));
         pLabeldengji->setPosition(ccp(jingyan_LV_new->getTextureRect().getMidX(), jingyan_LV_new->getTextureRect().getMidY()));
        jingyan_LV_new->addChild(pLabeldengji, 1);
       // backjingyanimg->addChild(pLabeldengji, 1);
        //经验等级显示到外框上end

       //经验进度条
   /*    CCSprite* loadimg=CCSprite::createWithSpriteFrameName("jingyan_new.png");//jingyan_298_73*/
       CCSprite* loadimg=CCSprite::create("jingyan_new.png");//jingyan_298_73
       CC_BREAK_IF(!loadimg);	
       jingyanpt = CCProgressTimer::create(loadimg);
       jingyanpt->setType(kCCProgressTimerTypeBar);// 设置成横向的
       //可以看作是按矩形显示效果的进度条类型
       jingyanpt->setMidpoint(ccp(0,0)); 
       //  用来设定进度条横向前进的方向从左向右或是从右向左
       jingyanpt->setBarChangeRate(ccp(1,0));
       //重新设置锚点
       
       //jingyanpt->setPosition(ccp(visibleSize.width*3/4,visibleSize.height-shangheight-jingyanheight/2));
       jingyanpt->setPercentage(0);
       yajin=0;
       jingyanset();
      // this->addChild(jingyanpt,0,103);
      jingyanpt->setPosition(ccp(backjingyanimg->getTextureRect().getMidX(),backjingyanimg->getTextureRect().getMidY()));
       backjingyanimg->addChild(jingyanpt,0,103);

       //本次获得奖励
       jiaqian=0;//单次奖励
       dancurrqian=jiaqian;
       dancurrqianjia=dancurrqian+jiaqian;

       CCSprite *backjiangli = CCSprite::createWithSpriteFrameName("danci_qiankuang_new.png");
       //CCSprite *backjiangli = CCSprite::create("danci_qiankuang_new.png");
       CC_BREAK_IF(! backjiangli);
       //backjiangli->setAnchorPoint(ccp(1,0.5));
       //backjiangli->setPosition(ccp(visibleSize.width/2-pStartItem->getContentSize().width/2,(visibleSize.height-shangheight-jingyanheight-kuanghoudu*2-kuangheight)*3/4));       
       backjiangli->setAnchorPoint(ccp(0,0.5));
       backjiangli->setPosition(ccp(0,(visibleSize.height-shangheight-jingyanheight-kuanghoudu*2-kuangheight)*3/4));       
       this->addChild(backjiangli);
   
       const char *pLabelwinStr = ((CCString*)(loacalstrings->objectForKey("win")))->m_sString.c_str();
       CCLabelTTF *pLabelwin = CCLabelTTF::create(pLabelwinStr, "Arial", 18/bigsmall_factor);
       pLabelwin->setAnchorPoint(ccp(pLabelwin_maodian_x,0.6));
       //pLabelwin->setColor(ccc3(248,213,118));
       //pLabelwin->setPosition(ccp(backjiangli->getContentSize().width/6,backjiangli->getContentSize().height/2));
       pLabelwin->setPosition(ccp(0,backjiangli->getContentSize().height*4/5));
       backjiangli->addChild(pLabelwin);
       char danstring[12] = {0};
       sprintf(danstring, "%.2f",(float)jiaqian);
       //labelbmdan=CCLabelBMFont::create(danstring,"diy_38.fnt");// futura-48 
       //本次奖励
       labelbmdan=CCLabelTTF::create(danstring, "ArialRoundedMTBold", 40/bigsmall_factor);//Helvetica-Bold  HiraKakuProN-W6
       //labelbmdan->setColor(ccc3(248,213,118));//
       //labelbmdan=CCLabelBMFont::create(CCString::createWithFormat("%.2f",jiaqian)->getCString(),"bitmapFontChinese.fnt");
       //this->addChild(labelbmdan);
      
       backjiangli->addChild(labelbmdan);
       //labelbmdan->setScale(1.2);
       labelbmdan->setAnchorPoint(ccp(0.5,0.4));
     
       //labelbmdan->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(100+60)/bigsmall_factor,(visibleSize.height-shangheight-jingyanheight-kuangheight)*3/4));
       labelbmdan->setPosition(ccp(backjiangli->getContentSize().width/2,backjiangli->getContentSize().height/2));
       labelbmdan->retain();


       //押金
       //yajin num
     //升级后max value要改，随着等级值变化
//        if (qian/100>yajinshuzu[min(jingyandengji+3,maxdengji)])
//        {
//            yajin=yajinshuzu[min(jingyandengji+3,maxdengji)];
//            yajinID=min(jingyandengji+3,maxdengji);
//        } 
//        else
//        {
//            int dengjitemp=min(jingyandengji+3,maxdengji);
//            do 
//            {
//                dengjitemp--;
// 
//            } while (qian/100<yajinshuzu[dengjitemp]&&dengjitemp>0);
// 
//            yajin=yajinshuzu[dengjitemp];
//            yajinID=dengjitemp;
//        }
        yajin=yajinset();

          CCSprite *backyajin = CCSprite::createWithSpriteFrameName("yajin_qiankuang_new.png");
          // CCSprite *backyajin = CCSprite::create("yajin_qiankuang_new.png");
           CC_BREAK_IF(! backyajin);
           //backyajin->setAnchorPoint(ccp(1,0.5));
           //backyajin->setPosition(ccp(visibleSize.width/2-pStartItem->getContentSize().width/2,(visibleSize.height-shangheight-jingyanheight-kuanghoudu*2-kuangheight)/4));
           backyajin->setAnchorPoint(ccp(0,0.5));
           backyajin->setPosition(ccp(0,(visibleSize.height-shangheight-jingyanheight-kuanghoudu*2-kuangheight)/4));

           
           this->addChild(backyajin);

      //char string[12] = {0};
       sprintf(string, "%d",yajin);
       //押金
       labelbmyajin=CCLabelTTF::create(string, "ArialRoundedMTBold", 40/bigsmall_factor);//35 -Bold
       //labelbmyajin->setColor(ccc3(248,213,118));
       //labelbmyajin=CCLabelBMFont::create(string,"futura-48.fnt");//bitmapFontChinese
       //labelbm=CCLabelBMFont::create(CCString::createWithFormat("%.2f",qian)->getCString(),"bitmapFontChinese.fnt");
       //this->addChild(labelbmyajin);
       labelbmyajin->setAnchorPoint(ccp(0.5,0.45));
       backyajin->addChild(labelbmyajin);
       //CCLabelTTF *pLabelbet = CCLabelTTF::create("TOTAL BET", "Arial", 20/bigsmall_factor);
       const char *pLabelbetStr = ((CCString*)(loacalstrings->objectForKey("bet")))->m_sString.c_str();
       CCLabelTTF *pLabelbet = CCLabelTTF::create(pLabelbetStr, "Arial", 18/bigsmall_factor);//Helvetica 25
       //pLabelbet->setColor(ccc3(248,213,118));
       pLabelbet->setAnchorPoint(ccp(0.5,pLabelbet_maodianY));//-0.2
      pLabelbet->setPosition(ccp(backyajin->getContentSize().width*yajin_maodian,backyajin->getContentSize().height*4/5));//*4/5
       //pLabelbet->setPosition(ccp(0,backyajin->getContentSize().height*4/5));
       backyajin->addChild(pLabelbet);

       
       labelbmyajin->setAnchorPoint(ccp(0.5,0.7));//0.75 0.4

       //labelbmyajin->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(100+60)/bigsmall_factor,(visibleSize.height-shangheight-jingyanheight-kuangheight)/4));
       //labelbmyajin->setPosition(ccp(jingyanwidth/2,jingyanheight/2));
       labelbmyajin->setPosition(ccp(backyajin->getContentSize().width*yajin_maodian,backyajin->getContentSize().height/2));
       labelbmyajin->setScale(0.9);
       //labelbmyajin->setColor(ccc3(255,255,255));
       labelbmyajin->retain();

       //押金按钮


//        CCSprite *button_sub_normal=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_sub_normal.png", tishistring)->getCString()));
//     
//        CCSprite *button_sub_selected=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_sub_selected.png", tishistring)->getCString()));
//        CCSprite *button_sub_disable=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_sub_disable.png", tishistring)->getCString()));
//        pSUBItem =  CCmenuNew::CCMenucreateWithTexture(
//            button_sub_normal->getTexture(),
//            button_sub_selected->getTexture(),
//            button_sub_disable->getTexture(),
//            this,
//            menu_selector(HelloWorld::menuSubCallback));

       CCSprite *button_sub_normal=CCSprite::createWithSpriteFrameName("button_sub_normal.png");//button_start_normal
       CCSprite *button_sub_selected=CCSprite::createWithSpriteFrameName("button_sub_selected.png");
       CCSprite *button_sub_disable=CCSprite::createWithSpriteFrameName("button_sub_disable.png");
       pSUBItem = CCMenuItemSprite::create(
           button_sub_normal,
           button_sub_selected,//button_selected_sub
           button_sub_disable,//button_sub_disable
           this,
           menu_selector(HelloWorld::menuSubCallback));
       CC_BREAK_IF(!pSUBItem);

       // Place the menu item bottom-right conner.

       //pSUBItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(100-40)/bigsmall_factor,(visibleSize.height-shangheight-jingyanheight-kuangheight)/4));
       pSUBItem->setAnchorPoint(ccp(0,0.5));
       pSUBItem->setPosition(ccp(0,backyajin->getPositionY()));
       //pSUBItem->setPosition(ccp(backyajin->getPositionX()-backyajin->getContentSize().width,backyajin->getPositionY()));
       //pSUBItem->setPosition(ccp(0,backyajin->getPositionY()));
       pSUBItem->setTag(menu_psub_tag);

//        CCSprite *button_add_normal=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_add_normal.png", tishistring)->getCString()));
//         CCSprite *button_add_selected=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_add_selected.png", tishistring)->getCString()));
//         CCSprite *button_add_disable=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey(CCString::createWithFormat("%s/button_add_disable.png", tishistring)->getCString()));
//        pADDItem =  CCmenuNew::CCMenucreateWithTexture(
//            button_add_normal->getTexture(),
//            button_add_selected->getTexture(),
//            button_add_disable->getTexture(),
//            this,
//            menu_selector(HelloWorld::menuAddCallback));

       CCSprite *button_add_normal=CCSprite::createWithSpriteFrameName("button_add_normal.png");//button_start_normal
       CCSprite *button_add_selected=CCSprite::createWithSpriteFrameName("button_add_selected.png");
       CCSprite *button_add_disable=CCSprite::createWithSpriteFrameName("button_add_disable.png");
       pADDItem = CCMenuItemSprite::create(
          button_add_normal,
          button_add_selected,//button_selected_add
          button_add_disable,//button_add_disable
          this,
          menu_selector(HelloWorld::menuAddCallback));
       CC_BREAK_IF(!pADDItem);

       // Place the menu item bottom-right conner.

       //pADDItem->setPosition(ccp(visibleSize.width/2-kuangwidth/2+(100+160)/bigsmall_factor,(visibleSize.height-shangheight-jingyanheight-kuangheight)/4));
       pADDItem->setAnchorPoint(ccp(Add_maodianX,0.5));
       pADDItem->setPosition(ccp(backyajin->getPositionX()+backyajin->getContentSize().width,backyajin->getPositionY()));

       //pADDItem->setPosition(ccp(visibleSize.width/2,backyajin->getPositionY()));
       pADDItem->setTag(menu_padd_tag);

       //
        //pMenu = CCMenu::create(pCloseItem,pTableItem,pStartItem,pSTOREItem,pGuessItem,pJiansuItem,pSUBItem,pADDItem, NULL);
       pMenu = CCMenu::create(pCloseItem,pTableItem,pGamecenterItem,pStartItem,pSTOREItem,pGuessItem,pJiansuItem,pSUBItem,pADDItem, NULL);//ktplay
       pMenu->setTag(menutag);
       pMenu->setPosition(CCPointZero);
       CC_BREAK_IF(! pMenu);
       
       // Add the menu to HelloWorld layer as a child layer.
       this->addChild(pMenu, 3);
       
        //场?景??为a1时o?à显?示o?新?手o?帮??助¨2
        if (changjing==1)
        {
            CCMenuItemImage *pNewhandItem = CCMenuItemImage::create(
                                                                    "newhand.png",
                                                                    "newhand.png",
                                                                    this,
                                                                    menu_selector(HelloWorld::menuNewhandCallback));
            pNewhandItem->setAnchorPoint(ccp(0,1));
            pNewhandItem->setPosition(ccp(pCloseItem->getContentSize().width,visibleSize.height));
            pMenu->addChild(pNewhandItem);
        }

       //++++++++++++++++++++++++++++

       //押金end
       /*  char string[12] = {0};
       sprintf(string, "%.2f", qian);
       labelbm->setCString(string);


       label1 = CCLabelAtlas::create("0123456789", "fonts/tuffy_bold_italic-charmap.plist");
        label1->retain();
        this->addChild(label1, 0, qiantag);
        label1->setPosition(ccp(CCDirector::sharedDirector()->getWinSize().width/2-100, 80) );
        label1->setOpacity( 32 );
        sprintf(string, "%2.2f", qian);
        label1->setString(string);*/
        
       for (int j=0;j<layercount;j++)
       {
           layerstate[j]=false;
       }
        if (JiansuNum)
        {
            for (int i=0;i<layercount;i++)
            {
                //CCSprite *jiansuspriteshang=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("jiansu.png"));
                CCSprite *jiansuspriteshang=CCSprite::createWithSpriteFrameName("jiansu.png");
                jiansuspriteshang->setScale(0.725);
                jiansuspriteshang->setPosition(ccp(kuanghoudu+layerwidth/2+i*layerwidth,visibleSize.height-shangheight-jingyanheight-kuangheight-kuanghoudu));
                back->getParent()->addChild(jiansuspriteshang);
                CCBlink *shanshuo=CCBlink::create(1,3);
                jiansuspriteshang->setTag(jiansutag);
                CCActionInterval *shanshuo1Time=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,NULL);      
                daojuArray->addObject(jiansuspriteshang);
                jiansuspriteshang->runAction(shanshuo);
                CCSprite *jiansuspritexia=CCSprite::createWithSpriteFrameName("jiansu.png");
                // CCSprite *jiansuspritexia=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("jiansu.png"));
                jiansuspritexia->setScale(0.725);
                jiansuspritexia->setPosition(ccp(kuanghoudu+layerwidth/2+i*layerwidth,visibleSize.height-shangheight-jingyanheight-kuanghoudu));
                back->getParent()->addChild(jiansuspritexia);
                CCBlink *shanshuo2=CCBlink::create(1,3);
                jiansuspritexia->setTag(jiansutag);
                CCActionInterval *shanshuo1Time2=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo2,NULL);      
                daojuArray->addObject(jiansuspritexia);
                jiansuspritexia->runAction(shanshuo2);
            }
        }
        isSliding = false;
        freexuanzhuan=0;
        freexuanzhuaning=false;
        bRet = true;
        jinzhangtag[0]=0;//移植3 over
        jinzhangtag[1]=0;

        Playyinxiao::play_ruchangeffect();
        if (userDefault->getBoolForKey("firstopen"))
        {
            menuNewhandCallback(this);
        }

        
    } while (0);

    return bRet;
}


int HelloWorld::yajinset()
{
       int yajintemp=0;
        int dengjitemp=min(jingyandengji+3,maxdengji);
       if (qian/100>yajinshuzu[min(jingyandengji+3,maxdengji)])
        {
        yajintemp=yajinshuzu[min(jingyandengji+3,maxdengji)];
        yajinID=min(jingyandengji+3,maxdengji);
        } 
        else
        {
        
        do 
         {
          dengjitemp--;
        } while (qian/100<yajinshuzu[dengjitemp]&&dengjitemp>0);

    yajintemp=yajinshuzu[dengjitemp];
    yajinID=dengjitemp;
    }
        return yajintemp;
}
//yajin add
    void HelloWorld::menuAddCallback(CCObject* pSender)
    {
        Playyinxiao::play_anjian();
        
        char string[12] = {0};
        //int dengjitemp=jingyandengji;
       if (yajinID>=0&&yajinID<min(jingyandengji+3,maxdengji))
       {
         yajinID++;
         yajin=yajinshuzu[yajinID];
       }
        else
        {
         yajinID=0;
         yajin=yajinshuzu[yajinID];
        }
        sprintf(string, "%d",yajin);
        //labelbmyajin->setCString(string);
        labelbmyajin->setString(string);
    
    }

    void HelloWorld::menuSubCallback(CCObject* pSender)
    {
        
        Playyinxiao::play_anjian();
        char string[12] = {0};
        if (yajinID>=1&&yajinID<min(jingyandengji+1+3,maxdengji+1))
        {
            yajinID--;
            yajin=yajinshuzu[yajinID];
        }
        else
        {
            yajinID=min(jingyandengji+3,maxdengji);
            yajin=yajinshuzu[yajinID];
        }
        
        sprintf(string, "%d",yajin);
       // labelbmyajin->setCString(string);
       labelbmyajin->setString(string);
    }

void HelloWorld::menuCloseCallback(CCObject* pSender)
{
    
    // "close" menu item clicked
    Playyinxiao::play_anjian();
    
    PauseGameDialogLayer* pauseGameDialogLayer=PauseGameDialogLayer::create();
     if(pauseGameDialogLayer){		
         //CCDirector::sharedDirector()->pause();// 暂停游戏
         //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
         //pauseGameDialogLayer->setPosition(getWinCenter());
         pauseGameDialogLayer->setPosition(CCPointZero);
         this->addChild(pauseGameDialogLayer,menutag+3);
     }
  
  
    
}



void HelloWorld::menuNewhandCallback(CCObject* pSender)
{
    NewhandtishiLayer *tishinewhand=NewhandtishiLayer::create();
    if (tishinewhand)
    {
        tishinewhand->setPosition(CCPointZero);
        back->getParent()->addChild(tishinewhand,4);
    }
    
}


void HelloWorld::menuTableCallback(CCObject* pSender)
{
    Playyinxiao::play_anjian();
    TableDialogLayer* GoTableDialogLayer=TableDialogLayer::create();
    if(GoTableDialogLayer)
    {		
        //CCDirector::sharedDirector()->pause();// 暂停游戏
        //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
        //pauseGameDialogLayer->setPosition(getWinCenter());
        GoTableDialogLayer->setPosition(CCPointZero);
        // CCMoveBy *layermove=CCMoveBy::create(3,ccp(50,0));
        //CCActionInterval* storeAction=CCSequence::create(layermove,NULL);

//         CCSprite* pbg= CCSprite::create("zhegaibj.png");
//         float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
//         pbg->setScaleY(shanglashen);//背景图拉伸
//         pbg->setAnchorPoint(ccp(0.5,0.5));
//         pbg->setPosition(getWinCenter());
//         back->getParent()->addChild(pbg,1000);
//         pbg->setTag(zhegaitag);
        //CCLOG("back->getParent()->getTag()=%d",back->getParent()->getTag());
        back->getParent()->addChild(GoTableDialogLayer,1001,99999);//temp99999
 //CCLOG("GoTableDialogLayer->getTag()=%d,GoTableDialogLayer->retainCount()=%d",GoTableDialogLayer->getTag(),GoTableDialogLayer->retainCount());
        //GoTableDialogLayer->release();
        //CCLOG("GoTableDialogLayer->getTag()=%d,GoTableDialogLayer->retainCount()=%d",GoTableDialogLayer->getTag(),GoTableDialogLayer->retainCount());
    }
}

void HelloWorld::menuGamecenterCallback(CCObject* pSender)
{
    //CCDirector::sharedDirector()->pause();在窗口回眺函数中实现暂停
    Playyinxiao::play_anjian();

    KTPlayC::show();
}

void HelloWorld::menuStoreCallback(CCObject* pSender)
{
    Playyinxiao::play_anjian();
    StoreDialogLayer* GoStoreDialogLayer=StoreDialogLayer::create();
    if(GoStoreDialogLayer)
    {		
        //CCDirector::sharedDirector()->pause();// 暂停游戏
        //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
        //pauseGameDialogLayer->setPosition(getWinCenter());
        GoStoreDialogLayer->setPosition(CCPointZero);
        // CCMoveBy *layermove=CCMoveBy::create(3,ccp(50,0));
         //CCActionInterval* storeAction=CCSequence::create(layermove,NULL);
        
        CCSprite* pbg= CCSprite::create("zhegaibj.png");
        float shanglashen=(float)(bjwidth*pingmubili)/bjheght;
        pbg->setScaleY(shanglashen);//背景图拉伸
        pbg->setAnchorPoint(ccp(0.5,0.5));
        pbg->setPosition(getWinCenter());
        back->getParent()->addChild(pbg,1000);
        pbg->setTag(zhegaitag);
        
    
        
        back->getParent()->addChild(GoStoreDialogLayer,1001);
       
    }

}

//定时器关闭，reward 
inline void HelloWorld::inactiveRewardAnimation() 
{
    //this->unschedule(schedule_selector(HelloWorld::scheduleRewardAnimation));
    // CCDirector::sharedDirector()->getScheduler()->unscheduleSelector(schedule_selector(HelloWorld::scheduleRewardAnimation),this);
    //CCLOG("inactiveRewardAnimation@@@@@@@@@@@@@@@@@@@@@@@@@@");
    if (activeRewardAnimationtag)
    {
     activeRewardAnimationtag=false;

    this->unschedule(schedule_selector(HelloWorld::scheduleRewardAnimation));
    }

}

void HelloWorld::menuGuessCallback(CCObject *pSender)
{
   CCMenuItemImage *GuessMenu=(CCMenuItemImage *)pSender;
   if ( GuessMenu->isEnabled())
   {
   GuessMenu->setEnabled(false);
   }
  
   
  // GuessMenu->setDisabledSpriteFrame(CCSprite::create("button_disablel_Guess.png"));
  backqian=dancurrqianjia;
   Guess* se=Guess::create();
   CCScene *guessScene=CCScene::create();
   //se->num=dancurrqianjia;
   
   guessScene->addChild(se);
     ClearKuangAndXian(this);
   inactiveRewardAnimation();
  int xian_x=back->getPositionX();
  int xian_y=back->getPositionY();
   for (int i=0;i<Xiannum;i++)
   {
       CCSprite *pSpriteXian = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("xian_%d.png",i)->getCString());
       //CCSprite *pSpriteXian = CCSprite::create(CCString::createWithFormat("xian_%d.png",i)->getCString());
//        pSpriteXian->setAnchorPoint(ccp(XianPosition25[i][0],0.5));
//        pSpriteXian->setPosition(ccp(XianPosition25[i][0]*kuangwidth/2,backdixian+XianPosition25[i][1]));
        pSpriteXian->setPosition(ccp(xian_x,xian_y));
       pSpriteXian->setVisible(true);
       pSpriteXian->setTag(xiantag);
       back->getParent()->addChild(pSpriteXian);
       spriteresetvisible(pSpriteXian);
   }
    Playyinxiao::play_anjianguess();
   CCDirector::sharedDirector()->pushScene(guessScene);
    //CCDirector::sharedDirector()->replaceScene(CCTransitionFade::create(0.5,guessScene));
}
//改动11
void HelloWorld::menujiansuCallback(CCObject* pSender)
{

 if (!JiansuNum)
     {
         if (daojunum)
         {
             Playyinxiao::play_jiansu();
             umeng::MobClickCpp::use("daoju_jiansu", 1, 0);//youmeng
             daojunum--;
             char daojunumstring[5]={0};
             sprintf(daojunumstring, "%d",daojunum);
             lableDaojuNum->setString(daojunumstring);
             userDefault->setIntegerForKey("usrDaojuNum",daojunum);
             userDefault->flush();
     //Playyinxiao::jiansuyinxiao();
     JiansuNum=3;
     //CCTextureCache::sharedTextureCache()->addImage("jiansu.png");
     CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
     //CCSprite *jiansusprite=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("jiansu.png"));
     for (int i=0;i<layercount;i++)
     {
         //CCSprite *jiansuspriteshang=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("jiansu.png"));
         CCSprite *jiansuspriteshang=CCSprite::createWithSpriteFrameName("jiansu.png");
         jiansuspriteshang->setScale(0.725);
         jiansuspriteshang->setPosition(ccp(kuanghoudu+layerwidth/2+i*layerwidth,visibleSize.height-shangheight-jingyanheight-kuangheight-kuanghoudu));
         back->getParent()->addChild(jiansuspriteshang);
         CCBlink *shanshuo=CCBlink::create(1,3);
         jiansuspriteshang->setTag(jiansutag);
         CCActionInterval *shanshuo1Time=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,NULL);      
         daojuArray->addObject(jiansuspriteshang);
         jiansuspriteshang->runAction(shanshuo);
         CCSprite *jiansuspritexia=CCSprite::createWithSpriteFrameName("jiansu.png");
        // CCSprite *jiansuspritexia=CCSprite::createWithTexture(CCTextureCache::sharedTextureCache()->textureForKey("jiansu.png"));
         jiansuspritexia->setScale(0.725);
         jiansuspritexia->setPosition(ccp(kuanghoudu+layerwidth/2+i*layerwidth,visibleSize.height-shangheight-jingyanheight-kuanghoudu));
         back->getParent()->addChild(jiansuspritexia);
         CCBlink *shanshuo2=CCBlink::create(1,3);
         jiansuspritexia->setTag(jiansutag);
         CCActionInterval *shanshuo1Time2=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo2,NULL);      
         daojuArray->addObject(jiansuspritexia);
         jiansuspritexia->runAction(shanshuo2);
     }
     gundongsudu/=2;
     //actionMoveBy2->setSpeed(sudu/2);
    } 
 else
   {
    }
    }
}
void   HelloWorld::menuStartCallback(CCObject* pSender)
{
    //CCLOG("ISSLIDING=%d",isSliding);
    
    if (quit)
      {
        return;
      }     
    if(isSliding&&!stopbtn)  // in sliding  state ,add hand stop
    {    
          stopbtn=true;          
    }
    if(!isSliding ||(isSliding&&stopbtn))
    {
       if(isSliding==false)
       {
        isSliding=true; //first sliding       
       }
       if (isSliding&&stopbtn)
       {
           Playyinxiao::play_slidend();
           
            quit=true;////stop
            active();
            //pStartItem->setEnabled(false);
           ((HelloWorld *)nowobject)->pMenu->setEnabled(false);
           // CCLOG("hand stop");
       }
       else if(!stopbtn)//正常
        {
            //播放声音_滑动中
             //Playyinxiao::playmusic_gk1();
             Playyinxiao::stopeffect();
             //back->runAction(CCShake::create(4.0f,20));
             
             if (pGuessItem->isEnabled())
             {
             pGuessItem->setEnabled(false);
             }
            pSUBItem->setEnabled(false);
            pADDItem->setEnabled(false);
            

            if (qian<yajin*100)
            {
            //qian不够
                yajin=yajinset();
                char string[12] = {0};
                sprintf(string, "%d",yajin);
                //labelbmyajin->setCString(string);
                labelbmyajin->setString(string);
                if(qian<yajin*100) 
                {
                    isSliding=false;
                    //弹出对话框
                    tishiLayer *tishimeiqian=tishiLayer::create();
                    if (tishimeiqian)
                    {
                        tishimeiqian->setPosition(CCPointZero);
                        back->getParent()->addChild(tishimeiqian,4);
                    }

                    return;
                }

            }

            if (freexuanzhuan)
            {
                if (!freexuanzhuaning)
                {
                freexuanzhuaning=true;
                }                
                freexuanzhuan--;
                //pGuessItem->setEnabled(false);//在first freexuanzhuan后才unable
                //更改 freespin 移植7
                std::string tishi("Free  ");
                std::string tishi1;

                char buf[4]= {0};
                sprintf(buf, "%d",  freexuanzhuan);
                tishi1= buf;

                std::string tishi2("  Spins");
                tishi+=tishi1;
                tishi+=tishi2;
                char tishistring[15] = {0};

                sprintf(tishistring, "%s",tishi.c_str());
                //CCLabelBMFont* pLabetishiCon=CCLabelBMFont::create(tishistring,"diy_38_cuitihei.fnt");
               
                ((CCLabelBMFont *)(back->getParent()->getChildByTag(freespintag)))->setString(tishistring);

            }
            else
            {
                qian-=yajin*100;
                currqian=qian;
                userDefault->setDoubleForKey("usrqian",qian);
                userDefault->flush();
                char string[30] = {0};
                sprintf(string, "%.2f", qian/100);
               // CCLOG("who is bug?1010 qian=%f string=%s",qian,string);
                labelbm->setString(string);
            }
             Playyinxiao::play_starteffect();
             Playyinxiao::playmusic();
            //inactiveRewardAnimation();//停止reward anmation
           // hangxunhuan=false;
            //this->unschedule(schedule_selector(HelloWorld::scheduleRewardAnimation));
            //if (activeRewardAnimationtag)
           // {
              //  activeRewardAnimationtag=false;
           // CCLOG("inactiveRewardAnimation in start@@@@@@@@@@@@@@@@@@@@@@@@@@");
            //this->unschedule(schedule_selector(HelloWorld::scheduleRewardAnimation));
            //}
            //
            if(QizhiIsActive)
            {
            InActiveQizhi();
            }
            //
           
            if (!freexuanzhuaning)
            {
                dancurrqian=0;
                char danstring[12] = {0};//单次奖励置0
                sprintf(danstring, "%.2f",(float)dancurrqian );
                //label1->setString(string);
                labelbmdan->setString(danstring);
                
            }
            if(ZhongHangNumShuzu->count())
            {
                ZhongHangNumShuzu->removeAllObjects();
            }
            
            ClearKuangAndXian(this);
            //改动11
            if (JiansuNum)
            {
                JiansuNum--;
            }
            else
            {
                gundongsudu=1.0f;
            } 
          for(int j=0;j<layercount;j++)
          {
           tobedeletecount[j]=(j+1)*kminturn;
          // CCLOG("objectAtIndex1");
           CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex(j);     
           layerstate[j]=true;
           int gun=0;
           deletecount[j]=1;//已滚动次数3个一组
           //CCActionInterval* actionMoveBy= CCMoveBy::create(sudu*tobedeletecount[j],ccp(0,-tobedeletecount[j]*unitheight));
          //CCActionInterval * actionMoveBy1 = CCEaseExponentialIn::create(actionMoveBy);
           // CCActionInterval* actionMoveBy_start= CCEaseSineIn::create(CCSequence::create(CCMoveBy::create(0.1,ccp(0,30)),CCMoveBy::create(0.1,ccp(0,-30)),NULL));
          CCDelayTime *startdelay=CCDelayTime::create(j*0);
          CCDelayTime *starttingdelay=CCDelayTime::create(0.2);
          CCActionInterval* actionMoveBy_start;
//           if (j==0)
//           {
//           actionMoveBy_start= CCSequence::create(CCCallFuncN::create(pStartItem,callfuncN_selector(HelloWorld::spriteresetDisable)),startdelay,CCEaseExponentialInOut::create(CCMoveBy::create(0.4,ccp(0,30))),starttingdelay,CCEaseSineIn::create(CCMoveBy::create(0.1,ccp(0,-30))),NULL);
//           } 
//           else if(j==layercount-1)
//           {
//           actionMoveBy_start= CCSequence::create(startdelay,CCEaseExponentialInOut::create(CCMoveBy::create(0.4,ccp(0,30))),starttingdelay,CCEaseSineIn::create(CCMoveBy::create(0.1,ccp(0,-30))),CCCallFuncN::create(pStartItem,callfuncN_selector(HelloWorld::spriteresetEnable)),NULL);
//           }
//           else
//           {
//           actionMoveBy_start= CCSequence::create(startdelay,CCEaseExponentialInOut::create(CCMoveBy::create(0.4,ccp(0,30))),starttingdelay,CCEaseSineIn::create(CCMoveBy::create(0.1,ccp(0,-30))),NULL);
//           }
           actionMoveBy_start= CCSequence::create(startdelay,CCEaseExponentialInOut::create(CCMoveBy::create(sudu*10*0.4,ccp(0,30))),starttingdelay,CCEaseSineIn::create(CCMoveBy::create(sudu*10*0.1,ccp(0,-30))),NULL); 

           
           CCActionInterval* actionMoveBy= CCMoveBy::create(sudu*kminturn,ccp(0,-kminturn*unitheight));
           CCActionInterval* actionMoveBy1=CCRepeat::create(actionMoveBy,tobedeletecount[j]/kminturn);
           float layerhuadong=tobedeletecount[j]*unitheight;//temp
       //CCLOG("layer jiangyaoyidong:%f",layerhuadong);//temp
           actionMoveBy1->setTag(j*10);
           //CCActionInterval* actionMoveBy2_1=CCSequence::create(actionMoveBy_start,actionMoveBy1,CCCallFuncND::create(slotScrollLayer,callfuncND_selector(HelloWorld::callbackslidingend),(void *)j),NULL);
           //改动11
             // CCLOG("91slotResultArray-count=%d,slotResultArray->retaincount=%d",slotResultArray->count(),slotResultArray->retainCount());
           CCActionInterval* actionMoveBy2_1=CCSequence::create(actionMoveBy1,CCCallFuncND::create(slotScrollLayer,callfuncND_selector(HelloWorld::callbackslidingend),(void *)j),NULL);
           actionMoveBy2=CCSpeed::create(actionMoveBy2_1,gundongsudu);//改变速度
           actionMoveBy2->setTag(j);
           slotScrollLayer->runAction(actionMoveBy2);
           //((CCSpeed *)slotScrollLayer->getActionByTag(j))->setSpeed(1);
           //actionMoveBy2->setSpeed(0.5);
          }
           //CCLOG("sliding %d %d ge",j,tobedeletecount[j]);
           }

 
     }
     //CCLOG("zhi sliding end");
   }

   //定时器,stop按钮
   void HelloWorld::active()
   {
      // CCLOG("active action!!!!!!!!!!!!");
       if (!activetag)
       {
             activetag=true;
             this->scheduleOnce(schedule_selector(HelloWorld::schedulestoplayer),0);
       }
       
   }
   //定时器关闭,stop按钮
   void HelloWorld::inactive()
   {
       //CCLOG("unschedule stop");
       this->unschedule(schedule_selector(HelloWorld::schedulestoplayer));
       if (activetag)
    {
      activetag=false;
     // CCLOG("unschedule stop");//很多时候没有执行计时器停止所以直接拿到外面
      //this->unschedule(schedule_selector(HelloWorld::schedulestoplayer));
    }
   }
   //定时器，reward 翻动
   void HelloWorld::activeqian()
   {
       if (!activeqiantag&&!activeqianDan&&!activeqianZong)
       {
           activeqiantag=true;
           activeqianDan=true;
           activeqianZong=true;
           //this->schedule(schedule_selector(HelloWorld::schedulejiaqian),0.1);
            ((HelloWorld *)nowobject)->pMenu->setEnabled(false);
           //pStartItem->setEnabled(false);
           this->schedule(schedule_selector(HelloWorld::schedulejiaqian),0.1);     
       }

   }
   //定时器关闭，reward 翻动
   void HelloWorld::inactiveqian()
   {
      if(!activeqianDan&&!activeqianZong)
       {if (activeqiantag)
            {
            activeqiantag=false;
                 ((HelloWorld *)nowobject)->pMenu->setEnabled(true);
            //pStartItem->setEnabled(true);
            this->unschedule(schedule_selector(HelloWorld::schedulejiaqian));
             }
        }
   }
   //定时器，reward 翻动效果实现
   void HelloWorld::schedulejiaqian(float fDelta)
   {
       //CCLOG("schedulejiaqian");
       //currqian 翻到与qian相等为止
       char string[15] = {0};
       //int weishu=0;
       //int jiaqiantemp=jiaqian;
       long long int currqiantemp=currqian;
       int wei=1;
       long long int qiantemp=qian;
       //每一位上操作那就不允许产生进位
       do 
       {
            if((currqiantemp%10!=qiantemp%10)&&currqiantemp%10!=9)
         
            {
             currqian+=1*wei;

            }
            else if((currqiantemp%10!=qiantemp%10)&&currqiantemp%10==9)
            {
             currqian-=9*wei;
            }
       
       currqiantemp/=10;
       qiantemp/=10;
       wei*=10;
       
       } while (qiantemp!=0);
       //label1 = (CCLabelAtlas*)(this->getParent()->getChildByTag(qiantag));
      
       if(currqian!=qian)//curr本来是0.01变成0.009999，,所以看能不能变成整数处理
       {
          sprintf(string, "%.2f",currqian/100 );
           //label1->setString(string);
           labelbm->setString(string);
        // CCLOG("qian a %f %f",currqian/100 ,qian/100);
       }
       else
       {
           sprintf(string, "%.2f",currqian/100 );
           //label1->setString(string);
           labelbm->setString(string);
        // CCLOG("qian a %f %f",currqian/100 ,qian/100);
            activeqianZong=false;
       inactiveqian();
       
        }
//---------------------------单次奖励<
       //dancurrqian翻到dancurrqianjia位置
       char danstring[12] = {0};
       //int danweishu=0;
       //int jiaqiantemp=jiaqian;
       int dancurrqiantemp=dancurrqian;
       int danwei=1;
       //int danqiantemp=jiaqian;
       int danqiantemp=dancurrqianjia;
       //每一位上操作那就不允许产生进位
       do 
       {
           if((dancurrqiantemp%10!=danqiantemp%10)&&dancurrqiantemp%10!=9)
         // if(((dancurrqiantemp%10!=danqiantemp%10)&&dancurrqiantemp%10!=9)||((dancurrqiantemp%10==danqiantemp%10)&&dancurrqiantemp%10==0))
           {
               dancurrqian+=1*danwei;

           }
           else if((dancurrqiantemp%10!=danqiantemp%10)&&dancurrqiantemp%10==9)
           {
               dancurrqian-=9*danwei;
           }

           dancurrqiantemp/=10;
           danqiantemp/=10;
           danwei*=10;

       } while (danqiantemp!=0);
      

       //label1 = (CCLabelAtlas*)(this->getParent()->getChildByTag(qiantag));
       if(dancurrqian!=dancurrqianjia)//curr本来是0.01变成0.009999，,所以看能不能变成整数处理
       {
           sprintf(danstring, "%.2f",dancurrqian/100 );
           //label1->setString(string);
           labelbmdan->setString(danstring);
                 // CCLOG("dancurrqian  %f dancurrqianjia %f",(float)dancurrqian/100 ,(float)dancurrqianjia/100);
       }
       else
       {
           sprintf(danstring, "%.2f",dancurrqian/100 );
           //label1->setString(string);
           labelbmdan->setString(danstring);
           activeqianDan=false;
           inactiveqian();
       }
//---------------------------单次奖励>
}
   //定时器,stop按钮停止效果
   void HelloWorld::schedulestoplayer(float fDelta)
   {
       if(activetag)
       {
      // CCLOG("schedule schedulestoplayer");
       //CCLOG("51slotResultArray-count=%d,slotResultArray->retaincount=%d",slotResultArray->count(),slotResultArray->retainCount());
       CCLayerColor * slotScrollLayer;
        CCActionInterval* actionMoveTo;
       for (int j=0;j<layercount;j++)
       {
           //CCLOG("objectAtIndex2 layercount=%d",layercount);
           slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex(j);
         
           if (kuangArray->count()!=0)
           {

               do
               {
                 // CCLOG("kuangArray->count() stop %d",kuangArray->count());
                   //int Aindex=kuangArray->count();
                   CCSprite *S=(CCSprite *)kuangArray->lastObject();
                   S->removeFromParentAndCleanup(true);
                  // CCLOG("WRONG2");
                   //kuangArray->removeLastObject(true);
                   kuangArray->removeObject(S,true);
                   //CCLOG("NOTHTING WRONG2");
               }while(kuangArray->count()!=0);
           }
          // CCLOG("layerstate %d==%d",j,layerstate[j]);
           if (layerstate[j]==false)//已执行停止
           {
            continue;
           }
          //CCLOG("959");
           //slotScrollLayer=(CCLayerColor *)slotScrollLayerArray->objectAtIndex(j);
           cocos2d::CCPoint layerXY=LayerPositionResultArray->getControlPointAtIndex(j);
           float cha =layerXY.y-slotScrollLayer->getPositionY();
           if(cha>0)
           {
           int deletebase=kminturn-2;
           int gaodu=deletebase*unitheight;//
           //int gaodu=unitheight;
      //抖动的时候会不会有错误？抖动的时候已为layerstate=false，不到这里
           int yushu=int(cha)%gaodu;
           int yushutemp=gaodu-yushu;
            yushu=yushutemp;
          //CCLOG("968 %d yushu %d",j,yushu);
           //this->unschedule(schedule_selector(HelloWorld::schedulestoplayer));
            
          if (yushu<30&&yushu>0)
          { //CCLOG("972");
          layerstate[j]=false;
          slotScrollLayer->stopAllActions();
          CCPoint movetopo=ccp(layerXY.x,layerXY.y-(int(cha/gaodu)+1)*gaodu);
          float time=sudu/unitheight*(slotScrollLayer->getPositionY()-movetopo.y);
          actionMoveTo=CCMoveTo::create(time,movetopo);
          //slotScrollLayer->runAction(actionMoveTo);
          //tobedeletecount[j]=(int(cha/gaodu)+1)*kminturn;
          tobedeletecount[j]=(int(cha/gaodu)+1)*deletebase;
         
       //改到1019处，使得动作顺序执行  
         if (j==(layercount-1))
         {//CCLOG("1002");
            // CCLOG("71slotResultArray-count=%d,slotResultArray->retaincount=%d",slotResultArray->count(),slotResultArray->retainCount());
         slotScrollLayer->runAction(CCSequence::create(actionMoveTo,CCCallFuncND::create(slotScrollLayer,callfuncND_selector(HelloWorld::callbackslidingend),(void *)j), CCCallFunc::create(this, callfunc_selector(HelloWorld::inactive)), NULL)) ;
        
        // inactive();
         }
         else if(j!=(layercount-1))
         {//CCLOG("1008");
            // CCLOG("81slotResultArray-count=%d,slotResultArray->retaincount=%d",slotResultArray->count(),slotResultArray->retainCount());
         slotScrollLayer->runAction(CCSequence::create(actionMoveTo,CCCallFuncND::create(slotScrollLayer,callfuncND_selector(HelloWorld::callbackslidingend),(void *)j), NULL)) ;
         }
         
          }
          //经常出现上面的cha=0情况，而此时yushu==0，造成此处定时器不断运行，此处加一个判断
          //cha等于0，yushu==gaodu
        else if(yushu==0||yushu==gaodu)
          {
          if (j==(layercount-1))
          {
            
            HelloWorld::inactive();
          }
                      
          }//else if
          } 
       }
      //  CCLOG("schedule schedulestoplayer end");
       }
   }

   void HelloWorld::jingyanset()
   {
       
       if (jingyandengji<=maxdengji-1)
       {

            jingyan+=yajin;
//            if (jingyan>=dengjishuzu[maxdengji])
//            {
//                jingyan=dengjishuzu[maxdengji];
//                jingyanpt->setPercentage(100);
//            }
//            else if(jingyan<dengjishuzu[maxdengji])
//                if(jingyan<dengjishuzu[maxdengji])
 //               {    
              // //CCProgressTimer* pt=(CCProgressTimer*)this->getChildByTag(100);
               ////float now=jingyanpt->getPercentage();
               ////jingyanpt->setPercentage(100.0/jingyan+now);//这样可以使得进度条看起来一开始很快，适合加载资源的时候用

               if(jingyan>=dengjishuzu[jingyandengji+1])
               {
                   jingyandengji++;
                   jingyanpt->setPercentage((jingyan-dengjishuzu[jingyandengji])*100/(dengjishuzu[jingyandengji+1]-dengjishuzu[jingyandengji]));

                   char jingyanstring[12] = {0};
                   sprintf(jingyanstring, "%d",jingyandengji);
                   pLabeldengji->setString(jingyanstring);
                   //升级了
                   Playyinxiao::play_shengji();
                   ShengjiDialogLayer* shengjiLayer=ShengjiDialogLayer::create();
                   if(shengjiLayer){		
                       CCDirector::sharedDirector()->pause();// 暂停游戏 移植2 over
                       //shengjiLayer->setAnchorPoint(ccp(0.5,0.5));
                       //pauseGameDialogLayer->setPosition(getWinCenter());

                       shengjiLayer->setPosition(CCPointZero);
                       back->getParent()->addChild(shengjiLayer,menutag+5);
                   }
                   ifsetgailv=false;
                   CC_SAFE_DELETE_ARRAY(tubiaogailv_shuzu);
                   setgailv();
               }
               else
               {
                   //jingyanpt->setPercentage(100);
                   jingyanpt->setPercentage((jingyan-dengjishuzu[jingyandengji])*100/(dengjishuzu[jingyandengji+1]-dengjishuzu[jingyandengji]));
               } 
          // }

       }
       else
       {
           jingyan+=yajin;
           if (jingyan>=dengjishuzu[maxdengji+1])
           {
               jingyan=dengjishuzu[maxdengji+1];
               jingyanpt->setPercentage(100);
           }
           else
           {
               jingyanpt->setPercentage((jingyan-dengjishuzu[jingyandengji])*100/(dengjishuzu[jingyandengji+1]-dengjishuzu[jingyandengji]));
           }

       }
      // monsterSystem->raisefishijingyan(yajin);//改动11 fish
      // int fishjingyan=userDefault->getIntegerForKey("usrfishjingyan");//改动11 fish 放到MonsterSprite::RaiseBlood
     //  userDefault->setIntegerForKey("usrfishjingyan",fishjingyan+yajin);//改动11 fish
       char level[10]={0};//youmeng
       sprintf(level,"%d", jingyandengji);//youmeng
       
       umeng::MobClickCpp::setUserLevel(level);//youmeng
       userDefault->setIntegerForKey("usrjingyandengji",jingyandengji);
       userDefault->setIntegerForKey("usrjingyan",jingyan);
       userDefault->flush();
  }

  //滚动结束
   void HelloWorld::slidingend()
   {
   //CCLOG("61slotResultArray-count=%d,slotResultArray->retaincount=%d",slotResultArray->count(),slotResultArray->retainCount());
   //ClearKuangAndXian(this);
   jinzhangtag[0]=0;//移植3 over
   jinzhangtag[1]=0;
  // CCLOG("slidingend");
   Playyinxiao::stopeffect();//移植3 over
    inactiveRewardAnimation();
   //滚动声音停止
   //CocosDenshion::SimpleAudioEngine::sharedEngine()->stopAllEffects();//移植音效类over
   Playyinxiao::stopmusic();

    if (stopbtn)
    {
        stopbtn=false;              
    }
    //滚动列状态改变，（默认此列最后抖动开始的时候，此列即为false状态）
    for (int j=0;j<layercount;j++)
    {
        layerstate[j]=true;
    }
    jiaqian=reward();
   
    //jiaqian=123;
    dancurrqianjia=dancurrqian+jiaqian;
    if (jiaqian!=0)
    {
        umeng::MobClickCpp::bonus(jiaqian/100, 1);//youmeng

        qian+=jiaqian;
        //
        if(maxscore<qian)
        {
            int64_t shangchuanqian=(int64_t)(qian);
            [[GameKitHelper sharedGameKitHelper] reportScore:shangchuanqian forCategory:@leadboard];//GameCenter
            maxscore=qian;
            userDefault->setDoubleForKey("Maxscore",qian);
        }
        //
        userDefault->setDoubleForKey("usrqian",qian);
        userDefault->flush();
        activeqian();
    }
    int zhonghangnum=0;
    zhonghangnum=ZhongHangNumShuzu->count();
    if (zhonghangnum)
    {//CCLOG("objectAtIndex3");
        maxxian=((CCInteger *)(ZhongHangNumShuzu->objectAtIndex(zhonghangnum-1)))->getValue();
    }    
    jingyanset();
    isSliding=false;//此时为最后一列在抖动，不可做其他动作
    quit=false;
    //经验值增加
    //经验值增加endzhonghangnum
    //play animation
    if (zhonghangnum!=0)
    {
        //CCLOG("schedule_selector scheduleRewardAnimation");
       // int delaytime=2*(zhonghangnum+1);
        //HelloWorld::scheduleRewardAnimation(delaytime);
        //this->schedule(schedule_selector(HelloWorld::scheduleRewardAnimation),delaytime);
        //ActiveQizhi();
        //ActiveRewardAnimation();
//         if ( !freexuanzhuaning)
//         {
//             //pGuessItem->setEnabled(true);
// 
//         }
//         else
//         {
//             //pGuessItem->setEnabled(false);//在first freexuanzhuan后才unable
//             //更改 freespin 移植7
//             std::string tishi("Free  ");
//             std::string tishi1;
// 
//             char buf[4]= {0};
//             sprintf(buf, "%d",  freexuanzhuan);
//             tishi1= buf;
// 
//             std::string tishi2("  Spins");
//             tishi+=tishi1;
//             tishi+=tishi2;
//             char tishistring[15] = {0};
// 
//             sprintf(tishistring, "%s",tishi.c_str());
//             //CCLabelBMFont* pLabetishiCon=CCLabelBMFont::create(tishistring,"diy_38_cuitihei.fnt");
//             ((CCLabelBMFont *)(back->getParent()->getChildByTag(freespintag)))->setString(tishistring);
//         }        
        if (!freexuanzhuan)
        {
            ActiveQizhi();
            ActiveRewardAnimation();
            pSUBItem->setEnabled(true);
            pADDItem->setEnabled(true);
           // freexuanzhuaning=false;
            if (dancurrqianjia)//在单项jiang存在时caix
            {
            pGuessItem->setEnabled(true);
            }
            //freexuanzhuan 刚结束
            if (freexuanzhuaning)
            {
                freexuanzhuaning=false;
                //删除freespin 标签
                if (back->getParent()->getChildByTag(freespintag))
                {
                back->getParent()->getChildByTag(freespintag)->removeFromParentAndCleanup(true);
                }
                
                //弹出freexuanzhuan 总结
                Playyinxiao::play_scatter();
                FreexuanzhuanResultDialogLayer* FreeResultDialogLayer=new FreexuanzhuanResultDialogLayer(dancurrqian);
                FreeResultDialogLayer->init();
                FreeResultDialogLayer->autorelease();
                if(FreeResultDialogLayer)
                {		
                    CCDirector::sharedDirector()->pause();// 暂停游戏
                    //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
                    //pauseGameDialogLayer->setPosition(getWinCenter());
                    FreeResultDialogLayer->setPosition(CCPointZero);
                    //FreeDialogLayer->freenum=freexuanzhuantemp;;

                    back->getParent()->addChild(FreeResultDialogLayer,menutag+2);

                }
                

            }

        }
        else if (freexuanzhuan)
        {
            ActiveQizhi();
            //scheduleRewardAnimation(0);
            //menuStartCallback(this);//在ActiveRewardAnimation（）中动画完成执行
             ActiveRewardAnimation();
             pSUBItem->setEnabled(false);
             pADDItem->setEnabled(false);
           // CCLOG("auto free=%d",freexuanzhuan);
            
            pGuessItem->setEnabled(false);
            //显示freezhuan num

          // freexuanzhuan--;
        }
       
    }
    //没有中标
    else
    {
        //CCLOG("zhonghangnum=0");
       
    if (!freexuanzhuan)
    {
        //ActiveQizhi();
        //ActiveRewardAnimation();
        if (freexuanzhuaning)
        {
            if (dancurrqianjia)//在单项jiang存在时caix
            {
                pGuessItem->setEnabled(true);
            }
            freexuanzhuaning=false;
               //删除freespin 标签
               if (back->getParent()->getChildByTag(freespintag))
               {
                back->getParent()->getChildByTag(freespintag)->removeFromParentAndCleanup(true);
                }
            //弹出freexuanzhuan 总结
            Playyinxiao::play_scatter();
            FreexuanzhuanResultDialogLayer* FreeResultDialogLayer=new FreexuanzhuanResultDialogLayer(dancurrqian);
            FreeResultDialogLayer->init();
            FreeResultDialogLayer->autorelease();
            if(FreeResultDialogLayer)
            {		
                CCDirector::sharedDirector()->pause();// 暂停游戏
                //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
                //pauseGameDialogLayer->setPosition(getWinCenter());
                FreeResultDialogLayer->setPosition(CCPointZero);
                //FreeDialogLayer->freenum=freexuanzhuantemp;;
                back->getParent()->addChild(FreeResultDialogLayer,menutag+2);

            }
        }
        pSUBItem->setEnabled(true);
        pADDItem->setEnabled(true);
        inactiveRewardAnimation();
        
    }
    else if (freexuanzhuan)
    {
        //ActiveQizhi();
        //scheduleRewardAnimation(0);
       // menuStartCallback(this);
         //ActiveRewardAnimation();

         //显示freezhuan num
          //freexuanzhuan--;
         menuStartCallback(this);
         pSUBItem->setEnabled(false);
         pADDItem->setEnabled(false);
       // CCLOG("autofree=%d",freexuanzhuan);
       
    }
    
    if ( pGuessItem->isEnabled())
    {
        pGuessItem->setEnabled(false);
    }
    //this->unschedule(schedule_selector(HelloWorld::scheduleRewardAnimation));
        //inactiveRewardAnimation();
    //if (activeRewardAnimationtag)
    //{
       // activeRewardAnimationtag=false;
       // CCLOG("inactiveRewardAnimation in slidingend@@@@@@@@@@@@@@@@@@@@@@@@@@");
        //this->unschedule(schedule_selector(HelloWorld::scheduleRewardAnimation));
    //}
    }
  // CCLOG("END~~~~~~~~~~~~~~~~~~~~~~~~~~~");
       /*
   if ((!pStartItem->isEnabled())&&(!activeqiantag))
     {
        pStartItem->setEnabled(true);
      }
   }*/
       if ((! ((HelloWorld *)nowobject)->pMenu->isEnabled())&&(!activeqiantag))
       {
            ((HelloWorld *)nowobject)->pMenu->setEnabled(true);
       }
   }
   void HelloWorld::ActiveQizhi()
   {
   if (!QizhiIsActive)
   {
       CCSprite *qizhi_zuo=(CCSprite *)back->getParent()->getChildByTag(qizhi_zuo_tag);
       CCSprite *qizhi_you=(CCSprite *)back->getParent()->getChildByTag(qizhi_you_tag);
      // CCActionInterval* actionMoveBy_zuo= CCMoveBy::create(0.2,ccp(qizhiwidth,0));//移植over
      // CCActionInterval* actionMoveBy_you=CCMoveBy::create(0.2,ccp(-qizhiwidth,0));
       CCActionInterval* actionMoveto_zuo= CCMoveTo::create(0.2,ccp(qizhiwidth/2,qizhi_zuo->getPositionY()));
       CCActionInterval* actionMoveto_you=CCMoveTo::create(0.2,ccp(kuangwidth-qizhiwidth/2,qizhi_you->getPositionY()));
       qizhi_zuo->setVisible(true);
       qizhi_you->setVisible(true);
       qizhi_zuo->runAction(actionMoveto_zuo);
       qizhi_you->runAction(actionMoveto_you);
       QizhiIsActive=true;
       /*CCLOG("");*/
   }

   }

    void HelloWorld::InActiveQizhi()
    {
     if (QizhiIsActive)
     {
         CCSprite *qizhi_zuo=(CCSprite *)back->getParent()->getChildByTag(qizhi_zuo_tag);
         CCSprite *qizhi_you=(CCSprite *)back->getParent()->getChildByTag(qizhi_you_tag);
         //CCActionInterval* actionMoveBy_zuo= CCMoveBy::create(0.2,ccp(-qizhiwidth,0));//移植over
         CCActionInterval* actionMoveto_zuo= CCMoveTo::create(0.2,ccp(-qizhiwidth/2,qizhi_zuo->getPositionY()));
         
         CCActionInterval * actionMoveto_zuo_xiaoshi=CCSequence::create(actionMoveto_zuo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetInvisible)),NULL);
         
         //CCActionInterval* actionMoveBy_you=CCMoveBy::create(0.2,ccp(qizhiwidth,0));
         CCActionInterval* actionMoveto_you=CCMoveTo::create(0.2,ccp( kuangwidth+qizhiwidth/2,qizhi_you->getPositionY()));
        
         CCActionInterval *actionMoveto_you_xiaoshi=CCSequence::create(actionMoveto_you,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetInvisible)),NULL);
         qizhi_zuo->setVisible(true);
         qizhi_you->setVisible(true);
         qizhi_zuo->runAction(actionMoveto_zuo_xiaoshi);
         qizhi_you->runAction(actionMoveto_you_xiaoshi);
         QizhiIsActive=false;
     }

    }

   //定时器 reward animation
   void HelloWorld::ActiveRewardAnimation()
   {
       if (!activeRewardAnimationtag)
       {
          activeRewardAnimationtag=true;
          
          /*int zhonghangnum=0;
          for (int i=0;i<Xiannum;i++)
          {
              if (((JiangliLine *)(slotResultArray->objectAtIndex(i)))->zhong)
              {
                zhonghangnum++;
              }
          }*/
         // CCLOG("activeRewardAnimation@@@@@@@@@@@@@@@@@@@@@@@@@@");
          hangxunhuan=false;
          if (freexuanzhuan)
          {
              this->scheduleOnce(schedule_selector(HelloWorld::scheduleRewardAnimation),0);
          }
          else
          {
              this->schedule(schedule_selector(HelloWorld::scheduleRewardAnimation)); 
          }
           
           //this->schedule(schedule_selector(HelloWorld::scheduleRewardAnimation),(zhonghangnum+1)*2);     
       }

   }
   //inactiveRewardAnimation()定时器关闭，reward 
   /*
   inline void HelloWorld::inactiveRewardAnimation() 
   {
        //this->unschedule(schedule_selector(HelloWorld::scheduleRewardAnimation));
      // CCDirector::sharedDirector()->getScheduler()->unscheduleSelector(schedule_selector(HelloWorld::scheduleRewardAnimation),this);
        CCLOG("inactiveRewardAnimation@@@@@@@@@@@@@@@@@@@@@@@@@@");
     //if (activeRewardAnimationtag)
      //{
          // activeRewardAnimationtag=false;        
           this->unschedule(schedule_selector(HelloWorld::scheduleRewardAnimation));
       //}
       
   }
   */
   //奖励动画float fDelta
   void HelloWorld::scheduleRewardAnimation(float fDelta)
   {    
       //reward animation
      //CCLOG("scheduleRewardAnimation1");
       //if(activeRewardAnimationtag)
       //开始遍历reward行       
       if (hangxunhuan)
       {
            return;
       }
       else
       {
       hangxunhuan=true;
        //CCLOG("scheduleRewardAnimation2");
       //集体展示reward线
       int zhonghangnum=0;
       zhonghangnum=ZhongHangNumShuzu->count();
       //nowrewardhangnum=0;
      //HelloWorld::RewardHangAnimation(this,(void *)nowrewardhangnum);
      ActiveXianRewardQuan();
      /*
       for (int hangshuzunum=0;hangshuzunum<zhonghangnum;hangshuzunum++)
       {
            CCLOG("well");
             CCInteger * hangID=(CCInteger *)(ZhongHangNumShuzu->objectAtIndex(hangshuzunum));
            
            if (hangshuzunum!=zhonghangnum-1)
            {
            CCLOG("schedule1");
            
             ActiveXianReward( hangID->getValue());
            }
             else if((hangshuzunum==zhonghangnum-1))

              {  
               ActiveXianRewardHou(hangID->getValue());
  
              }
                       
       }*/
       }
      // CCLOG("scheduleRewardAnimation1_end");

   }

   void HelloWorld::ActiveXianRewardQuan()
   {
       for (int j=0;j<ZhongHangNumShuzu->count();j++)
       {
         // CCLOG("objectAtIndex4");
           CCInteger *hangID=(CCInteger *)ZhongHangNumShuzu->objectAtIndex(j);

           int i=(hangID->getValue());
           if (j<ZhongHangNumShuzu->count()-1)
           {
          //ActiveXianReward(i);     
          
        CCFadeIn *shanshuo=CCFadeIn::create(0.5);
       int XianId=i;
      // int XianId=0;
       //CCSprite *pSpriteXian = CCSprite::create(CCString::createWithFormat("xian_%d.png", XianId)->getCString());
       CCSprite *pSpriteXian = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("xian_%d.png", XianId)->getCString());
//        pSpriteXian->setAnchorPoint(ccp(XianPosition25[XianId][0],0.5));
//        pSpriteXian->setPosition(ccp(XianPosition25[XianId][0]*kuangwidth/2,backdixian+XianPosition25[XianId][1]));
        pSpriteXian->setPosition(back->getPosition());
       pSpriteXian->setVisible(false);
       pSpriteXian->setTag(xiantag);
       back->getParent()->addChild(pSpriteXian);

       //this->addChild(pSpriteXian,200000);
       //CCActionInterval *kuangshanshuo=CCSequence::create(delay,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
       CCActionInterval *shanshuo1Time=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);      
       //CCActionInterval *shanshuo1Time=CCSequence::create(shanshuo,NULL);
       /* 
      if ( shanshuo1Time->isDone())
      { shanshuo1Time->stop();
      
      }      
       shanshuo1Time->startWithTarget(pSpriteXian);*/
       pSpriteXian->runAction(shanshuo1Time);

           } 
           else
           {
           //ActiveXianRewardHou(i);
               CCFadeIn *shanshuo=CCFadeIn::create(0.5);
               int XianId=i;
               //int XianId=0;
               CCSprite *pSpriteXian = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("xian_%d.png", XianId)->getCString());
               //CCSprite *pSpriteXian = CCSprite::create(CCString::createWithFormat("xian_%d.png", XianId)->getCString());
//                pSpriteXian->setAnchorPoint(ccp(XianPosition25[XianId][0],0.5));
//                pSpriteXian->setPosition(ccp(XianPosition25[XianId][0]*kuangwidth/2,backdixian+XianPosition25[XianId][1]));
               pSpriteXian->setPosition(back->getPosition());
               pSpriteXian->setVisible(false);
               pSpriteXian->setTag(xiantag);
               back->getParent()->addChild(pSpriteXian);
               //CCActionInterval *kuangshanshuo=CCSequence::create(delay,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
               //nowrewardhangnum=0;//从下到上
               nowrewardhangnum=ZhongHangNumShuzu->count()-1;
               CCActionInterval *shanshuo1Time=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);


               //CCActionInterval *shanshuo1TimeHou=CCSequence::create(shanshuo1Time,CCCallFuncND::create(back,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
               //pSpriteXian->runAction(shanshuo1TimeHou);
              pSpriteXian->runAction(shanshuo1Time);
           }

       }
      

   }
   //reward线动画
   void HelloWorld::ActiveXianReward(int xiannum)
   {
       //CCLOG("schedule2");
       CCFadeIn *shanshuo=CCFadeIn::create(0.5);
       
       int XianId=xiannum;
      // int XianId=0;
       CCSprite *pSpriteXian = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("xian_%d.png", XianId)->getCString());
//        pSpriteXian->setAnchorPoint(ccp(XianPosition25[XianId][0],0.5));
//        pSpriteXian->setPosition(ccp(XianPosition25[XianId][0]*kuangwidth/2,backdixian+XianPosition25[XianId][1]));
       pSpriteXian->setPosition(back->getPosition());
       pSpriteXian->setVisible(false);
       pSpriteXian->setTag(xiantag);
       back->getParent()->addChild(pSpriteXian);
       //CCActionInterval *kuangshanshuo=CCSequence::create(delay,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
       CCActionInterval *shanshuo1Time=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);      
       //CCActionInterval *shanshuo1Time=CCSequence::create(shanshuo,NULL);
       /* 
      if ( shanshuo1Time->isDone())
      { shanshuo1Time->stop();
      
      }      
       shanshuo1Time->startWithTarget(pSpriteXian);*/
       pSpriteXian->runAction(shanshuo1Time);
    
   }
   /*
   void HelloWorld::ActiveXianRewardHou(int xiannum)
   {
       CCLOG("schedule3");
       CCFadeIn *shanshuo=CCFadeIn::create(0.5);
       CCDelayTime *yanchi=CCDelayTime::create(1);
       int XianId=xiannum;
       //int XianId=0;
       CCSprite *pSpriteXian = CCSprite::create(CCString::createWithFormat("xian_%d.png", XianId)->getCString());
       pSpriteXian->setAnchorPoint(ccp(XianPosition25[XianId][0],0.5));
       pSpriteXian->setPosition(ccp(XianPosition25[XianId][0]*kuangwidth/2,XianPosition25[XianId][1]));
       pSpriteXian->setVisible(false);
       pSpriteXian->setTag(xiantag);
       back->addChild(pSpriteXian);
       //CCActionInterval *kuangshanshuo=CCSequence::create(delay,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
       nowrewardhangnum=0;
       CCActionInterval *shanshuo1Time=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::ClearKuangAndXian)),CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);

       
       //CCActionInterval *shanshuo1TimeHou=CCSequence::create(shanshuo1Time,CCCallFuncND::create(back,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
       //pSpriteXian->runAction(shanshuo1TimeHou);
        pSpriteXian->runAction(shanshuo1Time);

   }
   */
   void HelloWorld::ClearKuangAndXian(CCNode *pSender)
   {
   
     //CCLOG("21slotResultArray-count=%d,slotResultArray->retaincount=%d",slotResultArray->count(),slotResultArray->retainCount());
       if(slotResultArray->count())
       {
           for(int i=0;i<slotResultArray->count();i++)
           {
               
               int zhongnum=((JiangliLine *)(slotResultArray->objectAtIndex(i)))->num;
               //CCLOG("zhongnum=%d",zhongnum);
               if(zhongnum)
               {
                   //CCLOG("111((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->retainCount()=%d",((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->retainCount());
                   for (int j=0;j<zhongnum;j++)
                   { CCSprite *zhongsprite=(CCSprite *)((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->objectAtIndex(j);
                       //CCLOG("11101zhongsprite->retainCount()=%d",zhongsprite->retainCount());
                   }
                     ((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->removeAllObjects();
         
                   ((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->release();
               }
           }
           slotResultArray->removeAllObjects();
       }
        //CCLOG("22slotResultArray-count=%d,slotResultArray->retaincount=%d",slotResultArray->count(),slotResultArray->retainCount());
       //CCLOG("23kuangArray->count() start %d",kuangArray->count());
       if (kuangArray->count()!=0)
       {

           do
           {
              // CCLOG("kuangArray->count() start %d",kuangArray->count());
               //int Aindex=kuangArray->count();
               CCSprite *S=(CCSprite *)kuangArray->lastObject();
              // CCLOG("24kuangArray->count() start %d,s->retainCount()=%d",kuangArray->count(),S->retainCount());
               
               S->removeFromParentAndCleanup(true);
              // CCLOG("25kuangArray->count() start %d,s->retainCount()=%d",kuangArray->count(),S->retainCount());
               //CCLOG("WRONG1");
              // kuangArray->removeLastObject(true);
               kuangArray->removeObject(S,true);
               //CCLOG("25kuangArray->count() start %d,s->retainCount()=%d",kuangArray->count(),S->retainCount());
               //CCLOG("NOTHTING WRONG1");
           }while(kuangArray->count()!=0);
       }

       if (xianArray->count()!=0)
       {

           do
           {
              //CCLOG("xianArray->count() start %d",xianArray->count());
               int Aindex=xianArray->count();
               CCSprite *S=(CCSprite *)xianArray->lastObject();
               //CCLOG("xianArray->count() start %d,s->retainCount()=%d",xianArray->count(),S->retainCount());
              
               S->removeFromParentAndCleanup(true);
                 //CCLOG("xianArray->count() start %d,s->retainCount()=%d",xianArray->count(),S->retainCount());
               //CCLOG("WRONG1");
               xianArray->removeLastObject(true);
               //CCLOG("NOTHTING WRONG1");
           }while(xianArray->count()!=0);
       }

       if (!JiansuNum)
       {
          // CCLOG("daojuArray->count()=%d",daojuArray->count());
           if (daojuArray->count()!=0)
           {
                Playyinxiao::play_jiansu_quxiao();
               do
               {
                   //CCLOG("xianArray->count() start %d",xianArray->count());
                   int Aindex=daojuArray->count();
                   CCSprite *S=(CCSprite *)daojuArray->lastObject();
                   S->removeFromParentAndCleanup(true);
                   //CCLOG("WRONG1");
                   daojuArray->removeLastObject(true);
                   //CCLOG("NOTHTING WRONG1");
               }while(daojuArray->count()!=0);
           }
       }
   }

   void HelloWorld::RewardHangAnimation(CCNode* sender, void* data)
   {                      
       if(!activeRewardAnimationtag)
       {
           hangxunhuan=false;
       }
       else if(activeRewardAnimationtag)
       {
       // CCLOG("schedule4 data =%d nowrewardhangnum=%d",(int)data,nowrewardhangnum);//出错处，back背景全部消失。。。。
        // if (nowrewardhangnum==ZhongHangNumShuzu->count())//从上到下
            if (nowrewardhangnum==-1)//
         {
           // CCLOG("return --data =%d,nowrewardhangnum=%d,ZhongHangNumShuzu->count()=%d",(int)data,nowrewardhangnum,ZhongHangNumShuzu->count());
           // if (nowrewardhangnum==ZhongHangNumShuzu->count()-1)
           //{
                if (freexuanzhuan)
                {
                    
                    if (!isSliding)//移植3over，防止 freexuanzhuan中人工start，此处执行变成自动stop
                    {
                    menuStartCallback(this);
                    }
                    
                   
                  //menuStartCallback(pMenu->getChildByTag(18));
                    //CCLOG("freexuanzhuan=%d",freexuanzhuan);
                   // freexuanzhuan--;
                }
                else
                {
                    hangxunhuan=false;
                }
                

           // }
            //return;
         }
         //if (nowrewardhangnum<ZhongHangNumShuzu->count())//从上到下
         if (nowrewardhangnum>-1&&ZhongHangNumShuzu->count())
         {
         
         //CCLOG("data =%d,nowrewardhangnum=%d,ZhongHangNumShuzu->count()=%d",(int)data,nowrewardhangnum,ZhongHangNumShuzu->count());
        //出现了在滑动时候的错误，推断是否没有终止计时器data =1,nowrewardhangnum=2,ZhongHangNumShuzu->count()=0
        //CCLOG("objectAtIndex5 error!!!!");
        //CCLOG("(int)data = %d ZhongHangNumShuzu->count=%d",(int)data,ZhongHangNumShuzu->count());
         CCInteger *hangID=(CCInteger *)ZhongHangNumShuzu->objectAtIndex((long)data);
         
          int i=(hangID->getValue());
           ActiveXianReward(i);

             //nowrewardhangnum++;//从上到下
          nowrewardhangnum--;
          //CCLOG("objectAtIndex6");
          int zhongnum=((JiangliLine *)(slotResultArray->objectAtIndex(i)))->num;
         // CCLOG("101slotResultArray-count=%d,slotResultArray->retaincount=%d",slotResultArray->count(),slotResultArray->retainCount());
          int spritenum=((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->count();
          //CCLOG("102dansprite-count=%d,dansprite->retaincount=%d",spritenum,((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->retainCount());
          for (int j=0;j<zhongnum;j++)
          {
              //取得的精灵指针是错误的，是被释放掉了么》？
              //CCLOG("objectAtIndex7");
              CCSprite *zhongsprite=(CCSprite *)((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->objectAtIndex(j);
              //1118 pays具?体??
              //CCSprite *payszhongsprite=CCSprite::createWithTexture(zhongsprite->getTexture());
              
              CCSprite *payszhongsprite=CCSprite::createWithSpriteFrameName(CCString::createWithFormat("laohu_%d.png", zhongsprite->getTag())->getCString());
              //back->setPosition(back->getPositionX(),visibleSize.height-shangheight-jingyanheight-kuanghoudu-kuangheight/2);
              payszhongsprite->setPosition(ccp(back->getPositionX()-(zhongnum-j)*(payszhongsprite->getContentSize().width*0.4),back->getPositionY()+kuangheight/2+PaysY));
              //payszhongsprite->setPosition(ccp(back->getPositionX(),back->getPositionY()+kuangheight/2));
              
              
              payszhongsprite->setScale(0.4f);
              // payszhongsprite->setPosition(ccp(visibleSize.width*3/4,visibleSize.height-shangheight-jingyanheight/2));
              //payszhongsprite->setTag(102);
              back->getParent()->addChild(payszhongsprite,2);
              CCActionInterval *pays_1=CCSequence::create(CCDelayTime::create(2.0f),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
              payszhongsprite->runAction(pays_1);
              
              const char *pLabelStrpays = ((CCString*)(loacalstrings->objectForKey("pays")))->m_sString.c_str();
              CCLabelTTF *lable_pays=CCLabelTTF::create(pLabelStrpays,"Arial",30/bigsmall_factor);
              lable_pays->setPosition(ccp(back->getPositionX(),back->getPositionY()+kuangheight/2+PaysY));
              lable_pays->setAnchorPoint(ccp(0,0.5));
              back->getParent()->addChild(lable_pays,2);
              CCActionInterval *pays_2=CCSequence::create(CCDelayTime::create(2.0f),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
              lable_pays->runAction(pays_2);
              
              int paysnum=((JiangliLine *)(slotResultArray->objectAtIndex(i)))->Danjang;
              char tishistring[50] = {0};
              sprintf(tishistring, "%.2f",(float)paysnum*yajin*0.04*0.01);
              CCLabelTTF *lable_paysnum=CCLabelTTF::create(tishistring,"Arial",30/bigsmall_factor);
              lable_paysnum->setPosition(ccp(lable_pays->getPositionX()+lable_pays->getContentSize().width,back->getPositionY()+kuangheight/2+PaysY));
              back->getParent()->addChild(lable_paysnum,2);
              lable_paysnum->setAnchorPoint(ccp(0,0.5));
              CCActionInterval *pays_3=CCSequence::create(CCDelayTime::create(2.0f),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
              lable_paysnum->runAction(pays_3);
              
              //1118end
              //第一个参数是旋转的时间，第二个参数是起始半径，第三个参数半径差，第四个参数是起始Z角，第五个参数是旋转Z角差，第六个参数是起始X角，最后一个参数旋转X角差，
              CCOrbitCamera *camera1=CCOrbitCamera::create(0.5, 1, 0, 0, -180, 0, 0);  
              CCActionInterval *fangda1 =CCScaleBy::create(1,1.1f);
              CCActionInterval *fangda =CCSequence::create(fangda1,fangda1->reverse(),NULL);
              CCActionInterval *fanzhuan1=CCSequence::create(camera1,camera1->reverse(),camera1,camera1->reverse(),NULL);
              CCActionInterval *fanzhuan=CCSpawn::create(fangda,fanzhuan1,NULL);
              CCActionInterval *fanzhuanhou=CCSequence::create(fanzhuan,CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
             // CCActionInterval *fangdasuoxiaohou=CCSequence::create(fangda,CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
              CCRotateBy *wildxuanzhuan1=CCRotateBy::create(1,360);
              CCActionInterval *wildxuanzhuan=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),wildxuanzhuan1,wildxuanzhuan1,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
              CCActionInterval *wildxuanzhuanhou=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),wildxuanzhuan1,wildxuanzhuan1,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
              CCFadeIn *shanshuo=CCFadeIn::create(0.5);
              //CCBlink  *shanshuo=CCBlink::create(1,2);
              //CCActionInterval *kuangshanshuo=CCSequence::create(delay,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
              CCActionInterval *kuangshanshuo=CCSequence::create(CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteresetvisible)),shanshuo,shanshuo->reverse(),shanshuo,shanshuo->reverse(),CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
              CCActionInterval *yaotou1 = CCRotateBy::create(0.3, 45.0f);
              CCActionInterval *yaotou2 = CCRotateBy::create(0.7, -90.0f);
              
              CCActionInterval *yaotou3=CCSequence::create(yaotou1,yaotou2,yaotou2->reverse(),yaotou1->reverse(),NULL);
              CCActionInterval *yaotou=CCSpawn::create(fangda,yaotou3,NULL);
               CCActionInterval *yaotouhou=CCSequence::create(yaotou,CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
              //改动11 fish anciton
//                CCActionInterval *fisheatgo=CCMoveTo::create(2.0f,this->monsterSystem->getposition());
//                CCActionInterval *fisheataction=CCSequence::create(fisheatgo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
//                CCActionInterval *fisheathou=CCSequence::create(fisheatgo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
               CCActionInterval *fangdasuoxiaohou=CCSequence::create(fangda,CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
              



              //最后一个精灵做完后准备再循环一次
              if (j!=zhongnum-1)
              {

                  //根据哪条线判断框颜色
                  //CCSprite *spritekuang = CCSprite::create(CCString::createWithFormat("kuang_%d.png",i)->getCString());
                  CCSprite *spritekuang = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("kuang_%d.png",i)->getCString());
                  // spritekuang->setPosition(ccp(slotwidth/2,slotheight/2));

                  float ptx=zhongsprite->getPositionX();
                  float pty=zhongsprite->getPositionY();
                  // CCLOG("ptx= %d, pty= %d",ptx,pty);
                  spritekuang->setPosition(ccp(ptx,pty));
                  spritekuang->setTag(kuangtag);
                  CC_BREAK_IF(! zhongsprite->getParent());
                  zhongsprite->getParent()->addChild(spritekuang);
                  spritekuang->setVisible(false);
                //  CCLOG("221spritekuang->retainCount()=%d",spritekuang->retainCount());
                  spritekuang->runAction(kuangshanshuo);
                  //CCLOG("222spritekuang->retainCount()=%d",spritekuang->retainCount());
                  // kuangArray->addObject(spritekuang);
                  //CCLOG("kuangArray->count() add %d",kuangArray->count());
                  if (zhongsprite->getTag()==tubiao_wildtip)
                  {

                      //CCSprite *wildimg = CCSprite::create("wild.png");
                      CCSprite *wildimg = CCSprite::createWithSpriteFrameName("wild.png");
                      wildimg->setPosition(ccp(slotwidth/2,slotheight/2));
                      zhongsprite->addChild(wildimg);
                      wildimg->setVisible(false);
                      // wildimg->runAction(wildxuanzhuanhou);
                      wildimg->runAction(wildxuanzhuan);

                  }
                  else if (zhongsprite->getTag()==tubiao_scaterrtip )//freezhuan
                  {
                      CCSprite *scatterimg = CCSprite::createWithSpriteFrameName("scatter.png");
                      scatterimg->setPosition(ccp(slotwidth/2,slotheight/2));
                      zhongsprite->addChild(scatterimg);
                      scatterimg->setVisible(false);
                      // wildimg->runAction(wildxuanzhuanhou);
                      scatterimg->runAction(wildxuanzhuan);
                  }
                  else if (zhongsprite->getTag()==tubiao_bonustip )//freezhuan
                  {
                      CCSprite *bonusimg = CCSprite::createWithSpriteFrameName("bonus.png");
                      bonusimg->setPosition(ccp(slotwidth/2,slotheight/2));
                      zhongsprite->addChild(bonusimg);
                      bonusimg->setVisible(false);
                      // wildimg->runAction(wildxuanzhuanhou);
                      bonusimg->runAction(wildxuanzhuan);
                  }
                  else if (zhongsprite->getTag()==0 ||zhongsprite->getTag()==1||zhongsprite->getTag()==2)//freezhuan
                  {
                      zhongsprite->runAction(yaotou);
                  }
//                   else if (zhongsprite->getTag()==6)//改动11 go fish//不在这里判断了HelloWorld::reward()
//                   {
//                       zhongsprite->runAction(fangda);
//                       CCSprite *fisheat = CCSprite::createWithSpriteFrameName("laohu_9.png");
//                       fisheat->setScale(0.2);
//                       float px=(zhongsprite->getParent()->convertToWorldSpace(zhongsprite->getPosition())).x;
//                       float py=(zhongsprite->getParent()->convertToWorldSpace(zhongsprite->getPosition())).y;
//                       fisheat->setPosition(ccp(px,py));
//                      fisheat->setTag(fisheat_tag);
//                       back->getParent()->addChild(fisheat);
// 
//                       ccBezierConfig b1;                      
//                       float ex=this->monsterSystem->getposition().x;
//                       float ey=this->monsterSystem->getposition().y;
//                       //b1.controlPoint_1=ccp(sx,sy);
//                       b1.controlPoint_1=ccp(px+(ex-px)*0.2,py+(ey-py)*(-0.2));
//                       b1.controlPoint_2=ccp(px+(ex-px)*0.6,py+(ey-py)*0.8);
//                       b1.endPosition=ccp(ex,ey);
//                       CCActionInterval* fisheatgo=CCBezierTo::create(1.0f,b1);
//                       //CCActionInterval *fisheatgo=CCMoveTo::create(2.0f,ccp(ex,ey));
//                       CCActionInterval *fisheataction=CCSequence::create(fisheatgo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
//                       //CCActionInterval *fisheathou=CCSequence::create(fisheatgo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
// 
//                       fisheat->runAction(fisheataction);
//                      
// 
//                       //this->monsterSystem->getposition();
// 
//                   }
//                  else if (zhongsprite->getTag()==8)//freezhuan
//                   {
//                   zhongsprite->runAction(yaotou);
//                   }
                 else 
                 {              
                      if(zhongsprite->getTag()!=fishsprite_tag)//改动11
                      //zhongsprite->runAction(fanzhuanhou);
                      {
                      zhongsprite->runAction(fanzhuan);
                      }
                      

                  }

              }
              else
              {
                  //根据哪条线判断框颜色
                  //CCSprite *spritekuang = CCSprite::create(CCString::createWithFormat("kuang_%d.png",i)->getCString());
                  CCSprite *spritekuang = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("kuang_%d.png",i)->getCString());
                  // spritekuang->setPosition(ccp(slotwidth/2,slotheight/2));

                  float ptx=zhongsprite->getPositionX();
                  float pty=zhongsprite->getPositionY();
                  // CCLOG("ptx= %d, pty= %d",ptx,pty);
                  spritekuang->setPosition(ccp(ptx,pty));
                  spritekuang->setTag(kuangtag);
                  CC_BREAK_IF(! zhongsprite->getParent());
                  zhongsprite->getParent()->addChild(spritekuang);
                  spritekuang->setVisible(false);
                  spritekuang->runAction(kuangshanshuo);
                  // kuangArray->addObject(spritekuang);
                  //CCLOG("kuangArray->count() add %d",kuangArray->count());
                  if (zhongsprite->getTag()==tubiao_wildtip)
                  {

                      //CCSprite *wildimg = CCSprite::create("wild.png");
                      CCSprite *wildimg = CCSprite::createWithSpriteFrameName("wild.png");
                      wildimg->setPosition(ccp(slotwidth/2,slotheight/2));
                      zhongsprite->addChild(wildimg);
                      wildimg->setVisible(false);
                       wildimg->runAction(wildxuanzhuanhou);//如有附件动作这里就不用回调下一行扫描动作
                      //wildimg->runAction(wildxuanzhuan);

                  }
                  else if (zhongsprite->getTag()==tubiao_scaterrtip )//freezhuan
                  {
                      CCSprite *scatterimg = CCSprite::createWithSpriteFrameName("scatter.png");
                      scatterimg->setPosition(ccp(slotwidth/2,slotheight/2));
                      zhongsprite->addChild(scatterimg);
                      scatterimg->setVisible(false);
                      // wildimg->runAction(wildxuanzhuanhou);
                      scatterimg->runAction(wildxuanzhuanhou);
                  }
                  else if (zhongsprite->getTag()==tubiao_bonustip )//freezhuan
                  {
                      CCSprite *bonusimg = CCSprite::createWithSpriteFrameName("bonus.png");
                      bonusimg->setPosition(ccp(slotwidth/2,slotheight/2));
                      zhongsprite->addChild(bonusimg);
                      bonusimg->setVisible(false);
                      // wildimg->runAction(wildxuanzhuanhou);
                      bonusimg->runAction(wildxuanzhuanhou);
                  }
                  else if (zhongsprite->getTag()==0 ||zhongsprite->getTag()==1||zhongsprite->getTag()==2)//freezhuan
                  {
                      zhongsprite->runAction(yaotouhou);
                  }
//                  else if (zhongsprite->getTag()==6)//改动11 go fishHelloWorld::reward()
//                  {
//                       zhongsprite->runAction(fangdasuoxiaohou);
//                        CCSprite *fisheat = CCSprite::createWithSpriteFrameName("laohu_9.png");
//                        fisheat->setScale(0.2);
//                        float px=(zhongsprite->getParent()->convertToWorldSpace(zhongsprite->getPosition())).x;
//                        float py=(zhongsprite->getParent()->convertToWorldSpace(zhongsprite->getPosition())).y;
//                        fisheat->setPosition(ccp(px,py));
//                        //CCLOG("world %f,%f",zhongsprite->getParent()->convertToWorldSpace(zhongsprite->getAnchorPoint()).x,zhongsprite->convertToWorldSpace(zhongsprite->getAnchorPoint()).y);
//                        fisheat->setTag(fisheat_tag);
//                        back->getParent()->addChild(fisheat);
//                        ccBezierConfig b1;                      
//                        float ex=this->monsterSystem->getposition().x;
//                        float ey=this->monsterSystem->getposition().y;
//                        //b1.controlPoint_1=ccp(sx,sy);
//                        b1.controlPoint_1=ccp(px+(ex-px)*0.2,py+(ey-py)*(-0.2));
//                        b1.controlPoint_2=ccp(px+(ex-px)*0.6,py+(ey-py)*0.8);
//                        b1.endPosition=ccp(ex,ey);
//                        CCActionInterval* fisheatgo=CCBezierTo::create(1.0f,b1);
//                        //CCActionInterval *fisheatgo=CCMoveTo::create(2.0f,ccp(ex,ey));
//                        CCActionInterval *fisheataction=CCSequence::create(fisheatgo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
//                        //CCActionInterval *fisheathou=CCSequence::create(fisheatgo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);
// 
//                        fisheat->runAction(fisheataction);


                       //this->monsterSystem->getposition();

 //                 }
//                   else if (zhongsprite->getTag()==8)//freezhuan
//                   {
//                       zhongsprite->runAction(yaotouhou);
//                   }
                  else 
                  {              
                      if(zhongsprite->getTag()!=fishsprite_tag)//改动11
                      {
                        zhongsprite->runAction(fanzhuanhou);
                        }
                      //zhongsprite->runAction(fanzhuan);
                  }
              
              }

          }
          //nowrewardhangnum++;加在这里无用        
          }
       }
   }
   void HelloWorld::spriteresetvisible(CCNode *pSender)
   {

   CCSprite *s=(CCSprite *)pSender;
   s->setVisible(true);
    if (s->getTag()==kuangtag)
    {
        //CCLOG("add kuangArray->count()  %d, s->retaincount=%d",kuangArray->count(),s->retainCount());
        kuangArray->addObject(s);
      // CCLOG("add kuangArray->count()  %d, s->retaincount=%d",kuangArray->count(),s->retainCount());
    }
    else if(s->getTag()==xiantag)
    {
       xianArray->addObject(s);
       //CCLOG("xianArray->count() add %d",xianArray->count());
    }
    //改动11
    else if(s->getTag()==jiansutag)
    {
        daojuArray->addObject(s);
        //CCLOG("xianArray->count() add %d",xianArray->count());
    }//改动11
    else if(s->getTag()==stoptag)
    {
        daojuArray->addObject(s);
        //CCLOG("xianArray->count() add %d",xianArray->count());
    }
   }
   void HelloWorld::spriteresetInvisible(CCNode *pSender)
   {

       CCSprite *s=(CCSprite *)pSender;
       s->setVisible(false);     
   }

   void HelloWorld::spriteresetEnable(CCNode *pSender)
   {

      // CCMenuItemImage *itemanniu=(CCMenuItemImage *)pSender;
       //itemanniu->setEnabled(true); 
       pStartItem->setEnabled(true);   
   }
   void HelloWorld::spriteresetDisable(CCNode *pSender)
   {

       //CCMenuItemImage *itemanniu=(CCMenuItemImage *)pSender;
       //itemanniu->setEnabled(false); 
       pStartItem->setEnabled(false);   
   }
   void HelloWorld::spriteremoveFromParent(CCNode *pSender)
   {
   CCSprite *s=(CCSprite *)pSender;
   
   //CCLOG("WRONG3");
   if (s->getTag()==kuangtag)
   {
    //((CCSprite *)kuangArray->lastObject())->stopAllActions();
    //((CCSprite *)kuangArray->lastObject())->removeFromParentAndCleanup(true);
//       CCLOG("109kuangArray->count() start %d,s->retainCount()=%d",kuangArray->count(),s->retainCount());
//    if (kuangArray->count())
//    {
//    kuangArray->removeLastObject(true);
//    }
//    CCLOG("1091kuangArray->count() start %d,s->retainCount()=%d",kuangArray->count(),s->retainCount());
//      //CCLOG("kuangArray->count() sub %d",kuangArray->count());
//    s->stopAllActions();
//    s->removeFromParentAndCleanup(true);
    
   
       
       if (kuangArray->count())
       {
       //CCSprite *S=(CCSprite *)kuangArray->lastObject();
            //CCLOG("1091kuangArray->count() start %d,s->retainCount()=%d",kuangArray->count(),s->retainCount());
            //kuangArray->removeLastObject(true);
            kuangArray->removeObject(s,true);
            //CCLOG("1092kuangArray->count() start %d,s->retainCount()=%d",kuangArray->count(),s->retainCount());
            s->stopAllActions();
            s->removeFromParentAndCleanup(true);
           // CCLOG("1093kuangArray->count() start %d,s->retainCount()=%d",kuangArray->count(),s->retainCount());
       }
      
   }
   else if(s->getTag()==xiantag)
   {
       
        //((CCSprite *)xianArray->lastObject())->stopAllActions();
       //((CCSprite *)xianArray->lastObject())->removeFromParentAndCleanup(true);
      
       if (xianArray->count())
       {
       xianArray->removeLastObject(true);
       }
      
       //CCLOG("xianArray->count() sub %d",xianArray->count());
       s->stopAllActions();
       s->removeFromParentAndCleanup(true);
       //CCLOG("1095xianArray->count() start %d,s->retainCount()=%d",xianArray->count(),s->retainCount());
   }
   else if(s->getTag()==fisheat_tag)//fish 改动11
   {
   s->setTag(fisheat_tag+1000);
   float px=s->getPositionX();
   float py=s->getPositionY();
   float ex=this->monsterSystem->getposition().x;
   float ey=this->monsterSystem->getposition().y;
    ccBezierConfig b1; 
   b1.controlPoint_1=ccp(px+(ex-px)*0.2,py+15);
   b1.controlPoint_2=ccp(px+(ex-px)*0.6,py+15);
   b1.endPosition=ccp(ex,ey);
   CCActionInterval* fisheatgo=CCBezierTo::create(0.1f,b1);
   //CCActionInterval *moveto=CCMoveTo::create(0.1,this->monsterSystem->getposition());
   CCActionInterval *movetohou=CCSequence::create(fisheatgo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
   s->runAction(movetohou);
   //monsterSystem->raisefishijingyan(fishieat_jingyan*yajin);

   }

//    else if (s->getTag()==(fisheat_tag+1000))//改动11,fishi
//    {
//     if (!pStartItem->isEnabled())
//     {
//        pStartItem->setEnabled(true);
//     }
//     s->stopAllActions();
//     s->removeFromParentAndCleanup(true);
//   }
   // CCLOG("NOTHTING WRONG3");
   else if (s->getTag()==bonustiptag)
  {

      //Bonus* se=Bonus::create();
      //CCLOG("bonusnum=%d",BonusNumtemp);
      //Playyinxiao::play_bonustip();
//       if (!freexuanzhuan)
//       {
//       pGuessItem->setEnabled(true);
//       }
      
      //Bonus_gk2* bonusLayer=new Bonus_gk2(BonusNumtemp);//多次机会
      //Bonus* bonusLayer=new Bonus(BonusNumtemp);//多次机会
      //CCLayer *bonusLayer=new Bonus(BonusNumtemp);//多次机会
      backqian=yajin;//传入押金变量
      CCLayer *bonusLayer= ChooseBonusGame(BonusNumtemp);//改动12
       //Bonus* bonusLayer=new Bonus(1);//一次机会
      bonusLayer->init();
      bonusLayer->autorelease();
      CCScene *BonusScene=CCScene::create();
      s->stopAllActions();
      s->removeFromParentAndCleanup(true);
      BonusScene->addChild(bonusLayer);
      if (back->getParent()->getChildByTag(AgainFreeDialogLayerTag))
      {
        back->getParent()->getChildByTag(AgainFreeDialogLayerTag)->removeFromParentAndCleanup(true);
      }
      
      if (!freexuanzhuan)
      {
           pGuessItem->setEnabled(true);
//           ClearKuangAndXian(this);
//           inactiveRewardAnimation();
//           int xian_x=back->getPositionX();
//           int xian_y=back->getPositionY();
//           for (int i=0;i<Xiannum;i++)
//           {
//             CCSprite *pSpriteXian = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("xian_%d.png",i)->getCString());
//             pSpriteXian->setPosition(ccp(xian_x,xian_y));
//             pSpriteXian->setVisible(true);
//             pSpriteXian->setTag(xiantag);
//             back->getParent()->addChild(pSpriteXian);
//             spriteresetvisible(pSpriteXian);
//           }
      }

      CCDirector::sharedDirector()->pushScene(BonusScene);
  }
  else
  {
      s->stopAllActions();
      s->removeFromParentAndCleanup(true);
  }

   }
   //end 抖动 精灵旧删除新增加回调函数
   void HelloWorld::callbackslidingend(CCNode* sender, void* data)
   {
       
       
        int j=(long)data;
        layerstate[j]=false;

       // CCLOG("di %d callbackshanchu",j);
        CCActionInterval* actionMoveBy3= CCSequence::create(CCEaseSineOut::create(CCMoveBy::create(sudu*10*0.2,ccp(0,-30))),CCEaseBounceOut::create(CCMoveBy::create(sudu*10*0.3,ccp(0,30))),NULL);
        //CCActionInterval* actionMoveBy3= CCEaseSineOut::create(CCSequence::create(CCMoveBy::create(0.01,ccp(0,0)),CCMoveBy::create(0.01,ccp(0,0)),NULL));

        CCLayerColor * slotScrollLayer=(CCLayerColor *)sender;
        CCArray *oldarray=CCArray::create();

        //int spritecount=(j+kminturn)*3;
        for(int i=0;i<tobedeletecount[j];i++)
        {   //CCLOG("tobedeletecount[j]=%d",tobedeletecount[j]);
            //CCLOG("objectAtIndex8 error???");
             
            CCSprite *oldsprite=(CCSprite *)slotScrollLayer->getChildren()->objectAtIndex(i);
            //CCLOG("tobedeletecount di %d lie di %d  ge",j,i);
            if ((oldsprite->getTag())!=kuangtag)
            {
             oldarray->addObject(oldsprite);
             //CCLOG("oldsprite->getTag()=%d tobedeletecount di %d lie di %d  ge",oldsprite->getTag(),j,i);
            }
            
            else
            {
                oldsprite->removeFromParentAndCleanup(true);
                i--;
               // CCLOG("  tobedeletecount di %d lie di %d  ge  =666",j,i);
            }

        }
        //CCLOG("tobedelete %d ge ",oldarray->count());
        //图标先添加后删除
        CCObject* arrayItem;
        CCARRAY_FOREACH(oldarray,arrayItem)
        {
            CCSprite* pSpriteold = (CCSprite*)(arrayItem);
            //CCSprite *pSprite2 = CCSprite::create(CCString::createWithFormat("laohu_%d.png", i+1)->getCString());
            //CCSprite *pSpritenew = CCSprite::create();//houbian remove
             
           // pSpritenew->setPosition(pSpriteold->getPosition());
          // CCLOG("oldx %f,oldy %f",pSpriteold->getPositionX(),pSpriteold->getPositionY());
            
//            int result = CCRANDOM_0_1()*iconscount+iconscountminID;//+1
//            //CCLOG("result1:%d iconscount:%d ,iconscountminID=%d",result,iconscount,iconscountminID);
//            //if (result>iconscount||result<0)
//            if (result==7 || result==8 || result==9 )
//            {
//                result = CCRANDOM_0_1()*iconscount+iconscountminID;
//            }
            
            int result_ingailvshuzu=CCRANDOM_0_1()*tubiaogailv_jishu;
            //CCLOG("result_ingailvshuzu=%d",result_ingailvshuzu);
            int result=*(tubiaogailv_shuzu+result_ingailvshuzu);
            //CCLOG("result=%d",result);
            if (result>=iconscount+iconscountminID||result<iconscountminID)
            {
                    //CCLOG("result1:%d",result);
                do 
                {
                    result = CCRANDOM_0_1()*iconscount+iconscountminID;//+1
                } while (result>=iconscount+iconscountminID||result<iconscountminID);

            }
          //  CCLOG("2result:%d",result);
           // CCSprite *pSpritehuan = CCSprite::create(CCString::createWithFormat("laohu_%d.png", result)->getCString());
            //CCSprite *pSpritehuan = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("laohu_%d.png", result)->getCString());
            //CCLOG("pSpritehuan.width=%f,pSpritehuan.height=%f",pSpritehuan->getTextureRect().size.width,pSpritehuan->getTextureRect().size.height);
            CCSprite *pSpritenew = CCSprite::createWithSpriteFrameName(CCString::createWithFormat("laohu_%d.png", result)->getCString());

           
            //pSpritenew->initWithTexture(pSpriteold->getTexture());
            
            //pSpritenew->initWithTexture(pSpritehuan->getTexture());
            //CCLOG("pSpritenew.width=%f,pSpritenew.height=%f",pSpritenew->getTextureRect().size.width,pSpritenew->getTextureRect().size.height);
            //pSpritenew->setTag(pSpriteold->getTag());
            pSpritenew->setTag(result);
            pSpritenew->setPosition(pSpriteold->getPosition());
            pSpritenew->setPositionY(pSpritenew->getPositionY()+spritecount[j]*unitheight);
            //CCLOG("spritecount[%d] :%d unitheight:%f",j,spritecount[j],unitheight);
             //CCLOG("newx %f,newy %f,yidongle %f",pSpritenew->getPositionX(),pSpritenew->getPositionY(),pSpritenew->getPositionY()-pSpriteold->getPositionY());
            slotScrollLayer->addChild(pSpritenew,1000);
           // pSpriteold->removeFromParent();
          //  CCLOG("103pSpriteold->retaincount=%d",pSpriteold->retainCount());
            pSpriteold->removeFromParentAndCleanup(true);
            // CCLOG("104pSpriteold->retaincount=%d",pSpriteold->retainCount());
            
            //CCLOG("oldarraycount: %d",oldarray->count());
        }
        //--------------
        cocos2d::CCPoint layerXY=LayerPositionResultArray->getControlPointAtIndex(j);
        float cha =layerXY.y-slotScrollLayer->getPositionY();
        //CCLOG("layer yidong :%f",cha);
        //---------------

        //结果数组，还未存到某数组中，待完成+++++++++++++++++++++++++++++++


        //三行
        for (int i=0;i<3;i++)
        {//CCLOG("objectAtIndex9 error ");//Assert failed: no objects added
            resulttag[i][j]=((CCSprite*)slotScrollLayer->getChildren()->objectAtIndex(i))->getTag();
         }
        for (int i=0;i<3;i++)//移植
        {//CCLOG("objectAtIndex9 error ");//Assert failed: no objects added
            //resulttag[i][j]=((CCSprite*)slotScrollLayer->getChildren()->objectAtIndex(i))->getTag();//方法2：通过读取当前TAG辨识图标
            //int taggewei=jinzhangtag%10;
            //CCLOG("resulttag[i][j]=%d,jinzhangtag=%d jinzhangtaggewei=%d",resulttag[i][j],jinzhangtag,taggewei);//移植,bonus or scratter tip over
            //if (  ((resulttag[i][j]==7||resulttag[i][j]==8)&&!jinzhangtag)|| resulttag[i][j]==(jinzhangtag%10) )
            if (resulttag[i][j]==tubiao_bonustip||resulttag[i][j]==tubiao_scaterrtip)
            {
               
                
                if (resulttag[i][j]==tubiao_bonustip)
                {
                    jinzhangtag[0]+=1;
                }
                if (resulttag[i][j]==tubiao_scaterrtip)
                {
                    jinzhangtag[1]+=1;
                }
                
               //  if ((layercount-j>3-jinzhangtag[0]/10)||(layercount-j>3-jinzhangtag[1]/10))
               if ((layercount-j>3-jinzhangtag[0]%10)||(layercount-j>3-jinzhangtag[1]%10))
               {//还有机会中奖再响／／h
                 
                  //手动停止不响
                   if (!stopbtn)
                   {
                       //20141228;
                       CCSprite *dejiangtubiao=(CCSprite*)slotScrollLayer->getChildren()->objectAtIndex(i);
                       CCActionInterval *fangda1 =CCScaleBy::create(0.1,1.5f);
                       CCActionInterval *fangda =CCSequence::create(fangda1,fangda1->reverse(),NULL);
                       dejiangtubiao->runAction(fangda);
                       //大ä¨®奖¡À提¬¨¢示º?图ª?标À¨º粒¢¡ê子Á¨®效¡ì果?start
                       //大奖提示
                       CCParticleSystem *particlesystem=CCParticleSystemQuad::create("Particles/ExplodingRing.plist");
                       particlesystem->setPosition(ccp(dejiangtubiao->getContentSize().width/2,dejiangtubiao->getContentSize().height/2));
                       dejiangtubiao->addChild(particlesystem);
                       /*CCParticleBatchNode *batch=  CCParticleBatchNode::createWithTexture(particlesystem->getTexture());
                       batch->setPosition(ccp(dejiangtubiao->getContentSize().width/2,dejiangtubiao->getContentSize().height/2));
                       
                       batch->addChild(particlesystem);
                       dejiangtubiao->addChild(batch);*/
                       //end

                       if( jinzhangtag[0]>1||jinzhangtag[1]>1)
                       {
                          Playyinxiao::play_dajiangtip_2();
                       }
                       else
                       {
                           Playyinxiao::play_dajiangtip_1();
                       }
                   }
                 
                if ( jinzhangtag[0]<10)//随便起的10
                {
                
                for (int t=i+1;t<3;t++)
                {
                    if (resulttag[t][j]==tubiao_bonustip)
                    {
                        jinzhangtag[0]+=1;
                    }
                    if (resulttag[t][j]==tubiao_scaterrtip)
                    {
                        jinzhangtag[1]+=1;
                    }
                    if (jinzhangtag[0]>=2||jinzhangtag[1]>=2)
                    {
                        if (!stopbtn)
                        {
                            Playyinxiao::play_gudian();
                        }
                            //Playyinxiao::stopeffect();
                        jinzhangtag[0]=10;//随便写的10
                    }

                }
                break;//一列算一次
                }
               }
               else
               {
                   if (i==2&&jinzhangtag[0]<=10)
                   {
                       if (!stopbtn)
                       {
                       Playyinxiao::play_slidend();
                       }
                   }

               }
                //播放当一声,即使出现大奖图标没希望就不响（太靠后）
                 
            }
            //CCLOG("resulttag %d*%d: %d",i+1,j+1,resulttag[i]);
            else//移植over
            {
                if (i==2&&jinzhangtag[0]<=10)
                {
                    if (!stopbtn)
                    {
                    Playyinxiao::play_slidend();
                    }
                  //break;
                }
            }
           
        }
        
       if(j==layercount-1)
       {
          // CCCallFunc::create(this, callfunc_selector(HelloWorld::inactive)), 
          //HelloWorld::inactive();  
                            
          slotScrollLayer->runAction(CCSequence::create(actionMoveBy3,CCCallFunc::create(this, callfunc_selector(HelloWorld::slidingend)),NULL));
       
       // slotScrollLayer->runAction(actionMoveBy3);
       }
       else if(j!=layercount-1)
       {
           slotScrollLayer->runAction(actionMoveBy3);  
       }
       CCPoint now;
       now.x=slotScrollLayer->getPositionX();
       now.y=slotScrollLayer->getPositionY();
      // CCLOG("now_x:%d now.y:%d",now.x,now.y);
      LayerPositionResultArray->replaceControlPoint(now,j);

      // CCActionInterval* actionMoveBy4=CCSequence::create(CCScaleBy::create(1,10),CCScaleBy::create(1,0.1),NULL);
       //((CCSprite*)slotScrollLayer->getChildren()->objectAtIndex(0))->runAction(actionMoveBy4);
       //CCLOG("oldx0 %f,oldy0 %f",((CCSprite*)slotScrollLayer->getChildren()->objectAtIndex(0))->getPositionX(),((CCSprite*)slotScrollLayer->getChildren()->objectAtIndex(0))->getPositionY()); 
   }
  //还未考虑出现多个与通配符相配的奖励（取最大的）
   int HelloWorld::reward()
   {
       int AllReward=0;
       int freexuanzhuantemp=0;
       BonusNumtemp=0;
      // slotResultArray->release();//可删除
       //slotResultArray=CCArray::create();
       //slotResultArray->retain();
       
      // for(int i=0;i<25;i++)
         //CCLOG("xiannum=%d",Xiannum);
         //判断特表图标 fisheat等
         //改动11 ,fish
       int fishieatNUM=0;
     for(int lie=0;lie<layercount;lie++)
      {
        for(int j=0;j<3;j++)
        {   
         int tagcurrent=resulttag[j][lie];
         if(tagcurrent==fishsprite_tag)
         {
//              if (pStartItem->isEnabled())//in slidend we have set pStart item true， if need ,we should change sth.
//              {
//                 pStartItem->setEnabled(false);
//              }
            fishieatNUM++;
             CCActionInterval *fangda1 =CCScaleBy::create(0.5f,1.1f);
             CCActionInterval *fangda =CCSequence::create(fangda1,fangda1->reverse(),fangda1,fangda1->reverse(),NULL);
             CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex(lie);
             CCSprite *zhongsprite=(CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(j));
           // CCLOG("zhongsprite %d",zhongsprite->getTag());
             ((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(j)))->runAction(fangda);
             int zhongsprite_width=zhongsprite->getContentSize().width;
             int zhongsprite_height=zhongsprite->getContentSize().height;
              float px=(zhongsprite->getParent()->convertToWorldSpace(zhongsprite->getPosition())).x;
              float py=(zhongsprite->getParent()->convertToWorldSpace(zhongsprite->getPosition())).y;
             for (int i=0;i<10;i++)
             {
                 CCSprite *fisheat = CCSprite::createWithSpriteFrameName("laohu_10.png");//后期用jingyan_LV_new.png
                 fisheat->setScale(0.2);

                 int result_wid = CCRANDOM_0_1()*11-5;//(0~10)-5   -5~5
                 //if(result>iconscount||result<0)
                 if (result_wid>=6||result_wid<-5)
                 {
                     do 
                     {
                         result_wid = CCRANDOM_0_1()*11-5;//+1
                     } while (result_wid>=6||result_wid<-5);

                 }
                 int result_hei = CCRANDOM_0_1()*11-5;//(0~10)-5   -5~5
                 //if(result>iconscount||result<0)
                 if (result_hei>=6||result_hei<-5)
                 {
                     do 
                     {
                         result_hei = CCRANDOM_0_1()*11-5;//+1
                     } while (result_hei>=6||result_hei<-5);

                 }

                 float fishieat_x=px+(float)result_wid/10.0*zhongsprite_width;
                 float fishieat_y=py+(float)result_hei/10.0*zhongsprite_height;
                 fisheat->setPosition(ccp(fishieat_x,fishieat_y));
                 //CCLOG("world %f,%f",zhongsprite->getParent()->convertToWorldSpace(zhongsprite->getAnchorPoint()).x,zhongsprite->convertToWorldSpace(zhongsprite->getAnchorPoint()).y);
                 fisheat->setTag(fisheat_tag);
                 back->getParent()->addChild(fisheat,menutag+1);
                 ccBezierConfig b1;                      
                 float ex=this->monsterSystem->getposition().x;
                 float ey=this->monsterSystem->getposition().y;
                 //b1.controlPoint_1=ccp(sx,sy);
                 b1.controlPoint_1=ccp(px+(ex-px)*0.2,py+(ey-py)*(-0.2));
                 b1.controlPoint_2=ccp(px+(ex-px)*0.6,py+(ey-py)*0.8);
                 b1.endPosition=ccp(ex,ey);
                 CCActionInterval* fisheatgo1=CCBezierTo::create(1.0f,b1);
                 CCActionInterval* fisheatgo=CCEaseSineOut::create(fisheatgo1);
                 //CCActionInterval *fisheatgo=CCMoveTo::create(2.0f,ccp(ex,ey));
                 CCDelayTime *bacdelay=CCDelayTime::create(0.1f*i);
                 CCActionInterval *fisheataction=CCSequence::create(bacdelay,fisheatgo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
                 //CCActionInterval *fisheathou=CCSequence::create(fisheatgo,CCCallFuncN::create(this,callfuncN_selector(HelloWorld::spriteremoveFromParent)),CCCallFuncND::create(this,callfuncND_selector(HelloWorld::RewardHangAnimation),(void *)nowrewardhangnum),NULL);

                 fisheat->runAction(fisheataction);
             }
             
         }   
        }
      }
      if (fishieatNUM)
      {
        monsterSystem->raisefishijingyan(fishieat_jingyan*yajin*fishieatNUM);
        Playyinxiao::play_yushieat();
      }
      for(int i=0;i<Xiannum;i++)   
       {     //初始化
           int numtemp;
           int temptag;
           CCArray * danspritetemp;
            int tagcur;
            JiangliLine * newline=JiangliLine::create();
           //CCLOG("newline->num=%d",newline->num);
           //newline->retain();
//            newline->dansprite=CCArray::create();
//           
//            newline->num=0;
//            newline->tag=0;
//            newline->zhong=false;
//            newline->Danjang=0;
            //单条线多个中，选取最大
            for(int start=0;start<layercount;start++)
            {//sing round

                numtemp=0;
                temptag=999;
                danspritetemp=CCArray::create();
               
            
            for(int j=start;j<layercount;j++)
            {
             tagcur=resulttag[Xian25[i][j][0]][Xian25[i][j][1]];//行（从下到上）、列
             //相同图标
             if(tagcur==temptag&&tagcur!=fishsprite_tag)//改动11
             {
               numtemp++;
               //CCLOG("xian %d,count %d",Xian25[i][j][1],slotScrollLayerArray->count());
               //CCLOG("objectAtIndex10");
               CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex((Xian25[i][j][1]));
               //newline->dansprite->addObject((CCSprite*)slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0]));
               //CCLOG("objectAtIndex11");
               //int zhongtag=((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])))->getTag();//temp
               //CCLOG("zhongspritetag %d ",zhongtag);
               //CCLOG("objectAtIndex12");
                 CCSprite *zhongsprite=(CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0]));
                 //CCLOG("hang=%d,1zhongsprite->retainCount()=%d,danspritetemp->count()=%d",i,zhongsprite->retainCount(),danspritetemp->count());
               danspritetemp->addObject(zhongsprite);
                 //zhongsprite->release();
                 //CCLOG("hang=%d,12zhongsprite->retainCount()=%d,danspritetemp->count()=%d",i,zhongsprite->retainCount(),danspritetemp->count());
               //newline->dansprite->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));
             }
             //遇上通配符
             //else if (tagcur!=temptag&&tagcur==9)
             //遇到通配符,除散射和奖励
             else if (tagcur!=temptag&&tagcur==tubiao_wildtip&&temptag!=tubiao_scaterrtip&&temptag!=tubiao_bonustip&&temptag!=fishsprite_tag)//改动11
             {
              numtemp++;
              if(temptag==999)
              {
               temptag=tubiao_wildtip;
              }
             // CCLOG("objectAtIndex12");
              CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex((Xian25[i][j][1]));
             //CCLOG("objectAtIndex13");
              //danspritetemp->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));//后续动作增加判断tag，如果是通配符不必旋转，通配符有自己的动作
                 CCSprite *zhongsprite=(CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0]));
                  //CCLOG("hang=%d,2zhongsprite->retainCount()=%d,danspritetemp->count()=%d",i,zhongsprite->retainCount(),danspritetemp->count());
                 danspritetemp->addObject(zhongsprite);
                 //zhongsprite->release();
                  //CCLOG("hang=%d,22zhongsprite->retainCount()=%d,danspritetemp->count()=%d",i,zhongsprite->retainCount(),danspritetemp->count());
              //newline->dansprite->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));//后续动作增加判断tag，如果是通配符不必旋转，通配符有自己的动作
             }
             //通配符后遇到普通图标
             else if (tagcur!=temptag&&temptag==tubiao_wildtip&&tagcur!=tubiao_bonustip&&tagcur!=tubiao_scaterrtip&&temptag!=fishsprite_tag)//改动11
             {
                 numtemp++;
                 temptag=tagcur;
                  //CCLOG("objectAtIndex14");
                 CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex((Xian25[i][j][1]));
                 //CCLOG("objectAtIndex15");
                 CCSprite *zhongsprite=(CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0]));
                 //CCLOG("hang=%d,3zhongsprite->retainCount()=%d,danspritetemp->count()=%d",i,zhongsprite->retainCount(),danspritetemp->count());
                 danspritetemp->addObject(zhongsprite);
                  //zhongsprite->release();
                 //CCLOG("hang=%d,32zhongsprite->retainCount()=%d,danspritetemp->count()=%d",i,zhongsprite->retainCount(),danspritetemp->count());
                 //danspritetemp->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));//后续动作增加判断tag，如果是通配符不必旋转，通配符有自己的动作
                 //newline->dansprite->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));//后续动作增加判断tag，如果是通配符不必旋转，通配符有自己的动作
             }
             //不同图标，（或第一个图标）
             else
             {

                 if (numtemp<=2)
                {
                    numtemp=1;
                     temptag=tagcur;
                    //if (newline->dansprite->count()!=0)
                    if (danspritetemp->count()!=0)
                    {
                        danspritetemp->removeAllObjects();
                        //newline->dansprite->removeAllObjects();
                    }
                    // CCLOG("objectAtIndex16");
                    CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex((Xian25[i][j][1]));
                  // CCLOG("objectAtIndex17");
                    CCSprite *zhongsprite=(CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0]));
                   //CCLOG("hang=%d,4zhongsprite->retainCount()=%d,danspritetemp->count()=%d",i,zhongsprite->retainCount(),danspritetemp->count());
                    danspritetemp->addObject(zhongsprite);
                    //zhongsprite->release();
                  //CCLOG("hang=%d,42zhongsprite->retainCount()=%d,danspritetemp->count()=%d",i,zhongsprite->retainCount(),danspritetemp->count());
                    //danspritetemp->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));
                    //newline->dansprite->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));
                   // 
                }
                //遇到不相同图标时，在前面至少3个相同，后面不出现通配符的话提前退出，没有这个的话会出现XXX0X，第五个也会存进去
                else if (numtemp>2)
                {
                    break;
                }

                }
             }

            //一行线循环完
            if (numtemp>2&&(tagjiang[temptag][numtemp-3]*100>(newline->Danjang)))
            {
                newline->num=numtemp;
                newline->tag=temptag;
                newline->zhong=true;
                newline->Danjang=tagjiang[(newline->tag)][(newline->num)-3]*100;
                newline->dansprite=danspritetemp;
                ZhongHangNumShuzu->addObject(CCInteger::create(i));
                //CCLOG("the %d line ,num:%d,jiang:%d",i,newline->num,newline->Danjang);
                
            }
             }//sing round
             //free 转不加入
             if (newline->tag==tubiao_scaterrtip)
             {
                 //freexuanzhuantemp=max(freexuanzhuantemp,tagjiang[8][newline->num-3]);//mac tihuan fmax 只取最大的
                 freexuanzhuantemp+=tagjiang[8][newline->num-3];//FREE NUM all
             }
             else if(newline->tag==tubiao_bonustip)
             {
                BonusNumtemp+=tagjiang[tubiao_bonustip][newline->num-3];//bonus num all
             }
             else
             {
                if (newline->tag!=fishsprite_tag)//改动11
                {
                  AllReward+=(newline->Danjang);
                 //   CCLOG("newline->Danjang=%d",newline->Danjang);
                }
                
             }            
           //newline->dansprite->retain();
           //CCArray *danspritearray=newline->dansprite;
           //CCLOG("888newline=%d danspritearray->m_uReference=%d,slotResultArray-count=%d,slotResultArray->retaincount=%d",newline->retainCount(),danspritearray->retainCount(),slotResultArray->count(),slotResultArray->retainCount());
//           for(int i=0;i<(newline->dansprite->count());i++)
//           {
//               CCSprite *tempspr=(CCSprite *)((CCArray *)(newline->dansprite))->objectAtIndex(i);
//               CCLOG("999tempspr->retainCount()=%d",tempspr->retainCount());
//           }
          newline->dansprite->retain();//必须有
            //CCLOG("8881newline=%d danspritearray->m_uReference=%d,slotResultArray-count=%d,slotResultArray->retaincount=%d",newline->retainCount(),danspritearray->retainCount(),slotResultArray->count(),slotResultArray->retainCount());
//           for(int i=0;i<(newline->dansprite->count());i++)
//           {
//               CCSprite *tempspr=(CCSprite *)((CCArray *)(newline->dansprite))->objectAtIndex(i);
//               CCLOG("9991tempspr->retainCount()=%d",tempspr->retainCount());
//           }
          slotResultArray->addObject(newline);
//           for(int i=0;i<(newline->dansprite->count());i++)
//           {
//               CCSprite *tempspr=(CCSprite *)((CCArray *)(newline->dansprite))->objectAtIndex(i);
//               CCLOG("9992tempspr->retainCount()=%d",tempspr->retainCount());
//           }
           //newline->release();
           //newline->autorelease();
       }
       if (BonusNumtemp)
       {
           //CCLOG("BonusTishiDialogLayer bonusnum=%d",BonusNumtemp);
           Playyinxiao::play_bonustip();
           BonusTishiDialogLayer* bonusTishiLayer=new BonusTishiDialogLayer(BonusNumtemp);
           bonusTishiLayer->init();
           if(bonusTishiLayer)
           {		
               //CCDirector::sharedDirector()->pause();// 暂停游戏
               //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
               //pauseGameDialogLayer->setPosition(getWinCenter());
               bonusTishiLayer->setPosition(CCPointZero);
               bonusTishiLayer->setTag(bonustiptag);
               //AgainFreeDialogLayer->freenum=freexuanzhuantemp;
               back->getParent()->addChild(bonusTishiLayer,menutag+2);
               CCDelayTime *delai2=CCDelayTime::create(4.0f);
               //CCFadeOut *yincang=CCFadeOut::create(3.0f);
               CCActionInterval *tishiaction=CCSequence::create(delai2,CCCallFuncN::create(bonusTishiLayer,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
               bonusTishiLayer->runAction(tishiaction);

               

           }
       }
       if (freexuanzhuantemp)
       {
           if (freexuanzhuaning)
           {
               //又获得旋转
               //AgainFreexuanzhuanDialogLayer* AgainFreeDialogLayer=AgainFreexuanzhuanDialogLayer::create();
               Playyinxiao::play_scatter();
               AgainFreexuanzhuanDialogLayer* AgainFreeDialogLayer=new AgainFreexuanzhuanDialogLayer(freexuanzhuantemp);
               AgainFreeDialogLayer->init();
               AgainFreeDialogLayer->autorelease();
               if(AgainFreeDialogLayer)
               {		
                   //CCDirector::sharedDirector()->pause();// 暂停游戏
                   //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
                   //pauseGameDialogLayer->setPosition(getWinCenter());
                   AgainFreeDialogLayer->setPosition(CCPointZero);
                   AgainFreeDialogLayer->setTag(AgainFreeDialogLayerTag);
                   //AgainFreeDialogLayer->freenum=freexuanzhuantemp;
                   back->getParent()->addChild(AgainFreeDialogLayer,menutag+2);
                   CCDelayTime *delai2=CCDelayTime::create(2.0f);
                  // CCFadeOut *yincang=CCFadeOut::create(3.0f);
                   CCActionInterval *tishiaction=CCSequence::create(delai2,CCCallFuncN::create(AgainFreeDialogLayer,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
                   AgainFreeDialogLayer->runAction(tishiaction);
                //更改 freespin 移植7 over
                   std::string tishi("Free  ");
                   std::string tishi1;

                   char buf[4]= {0};
                   sprintf(buf, "%d",  freexuanzhuan+freexuanzhuantemp);
                   tishi1= buf;

                   std::string tishi2("  Spins");
                   tishi+=tishi1;
                   tishi+=tishi2;
                   char tishistring[30] = {0};

                   sprintf(tishistring, "%s",tishi.c_str());
                   //CCLabelBMFont* pLabetishiCon=CCLabelBMFont::create(tishistring,"diy_38_cuitihei.fnt");
                  ((CCLabelBMFont *)(back->getParent()->getChildByTag(freespintag)))->setString(tishistring);
                 
               }
           }
           else
           {
               //!!a a a 恭喜获得免费xuanzhuan chance a 
               //FreexuanzhuanDialogLayer* FreeDialogLayer=FreexuanzhuanDialogLayer::create(freexuanzhuantemp);
               Playyinxiao::play_scatter();
               FreexuanzhuanDialogLayer* FreeDialogLayer=new FreexuanzhuanDialogLayer(freexuanzhuantemp);
               FreeDialogLayer->init();
               FreeDialogLayer->autorelease();
               if(FreeDialogLayer)
               {		
                   CCDirector::sharedDirector()->pause();// 暂停游戏
                   //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
                   //pauseGameDialogLayer->setPosition(getWinCenter());
                   FreeDialogLayer->setPosition(CCPointZero);
                   //FreeDialogLayer->freenum=freexuanzhuantemp;;
                   //free spin 标签 // 移植7

                   std::string tishi("Free  ");
                   std::string tishi1;

                   char buf[4]= {0};
                   sprintf(buf, "%d", freexuanzhuantemp);
                   tishi1= buf;

                   std::string tishi2("  Spins");
                   tishi+=tishi1;
                   tishi+=tishi2;
                   char tishistring[30] = {0};

                   sprintf(tishistring, "%s",tishi.c_str());
                   CCLabelBMFont* pLabetishiCon=CCLabelBMFont::create(tishistring,"diy_38_cuitihei.fnt");
                   pLabetishiCon->setScale(1.5);
                   pLabetishiCon->setAnchorPoint(ccp(0.5,1.4));

                   pLabetishiCon->setPosition(getWinSize().width/2,getWinSize().height-shangheight-jingyanheight-kuangheight/4);
                   back->getParent()->addChild(pLabetishiCon,menutag+1,freespintag);
                   pLabetishiCon->retain();
                   //free spin 标签end

                   back->getParent()->addChild(FreeDialogLayer,menutag+3);

                
               }
           }
           freexuanzhuan+=freexuanzhuantemp;
       }        
       //AllReward=123;//temp shanhu test
       //数值放大了100
       //d得分是押金10倍为bigwin
       if (AllReward>0&&AllReward<12500)//12500 125
       {
          Playyinxiao::play_xiaojiangli_1();//比如500，押金150，就是150/25=6,6*500/100=30;
       }
       
       else if(AllReward>=12500&&AllReward<25000)
       {
           Playyinxiao::play_xiaojiangli_2();
           
       }
       //10倍
       else if(AllReward>=25000)
       //else
       {
          Playyinxiao::play_dajiangli();
           //弹出bigwin
                     BigwinDialogLayer* newbigDialogLayer=new BigwinDialogLayer;
           newbigDialogLayer->init();
           newbigDialogLayer->autorelease();
           if(newbigDialogLayer)
           {
               //CCDirector::sharedDirector()->pause();// 暂停游戏
               //pauseGameDialogLayer->setAnchorPoint(ccp(0.5,0.5));
               //pauseGameDialogLayer->setPosition(getWinCenter());
               newbigDialogLayer->setPosition(CCPointZero);
               newbigDialogLayer->setTag(AgainFreeDialogLayerTag);
               //AgainFreeDialogLayer->freenum=freexuanzhuantemp;
               back->getParent()->addChild(newbigDialogLayer,menutag+2);
               CCDelayTime *delai2=CCDelayTime::create(4.0f);
               // CCFadeOut *yincang=CCFadeOut::create(3.0f);
               CCActionInterval *tishiaction=CCSequence::create(delai2,CCCallFuncN::create(newbigDialogLayer,callfuncN_selector(HelloWorld::spriteremoveFromParent)),NULL);
               newbigDialogLayer->runAction(tishiaction);
               //newbigDialogLayer->runAction(CCShake::create(4.0f,20));

           }

       }
       //AllReward*=((float)yajin/25);//乘以押金系数
       //CCLOG("AllReward=%d",AllReward);
       AllReward*=yajin;//乘以押金系数
       AllReward*=0.04;//乘以押金系数
        //CCLOG("AllReward2=%d",AllReward);
       return AllReward;
   }

   HelloWorld::HelloWorld()
   {
   
  
   }

   HelloWorld::~HelloWorld()
   {
    
//       if(ZhongHangNumShuzu->count())
//       {
//           ZhongHangNumShuzu->removeAllObjects();
//       }
//       ZhongHangNumShuzu->release();
//       
//     
//       labelbmyajin->release();
//       labelbmdan->release();
//       labelbm->release();
//       
//       LayerPositionResultArray->release();
//       
//        ClearKuangAndXian(this);//放下面不行，因为下面de去除引用包括kuang（附加在CCLayerColor上）
//       for(int t=0;t<layercount;t++)
//       {
//           spritecount[t]=(t+kminturn+1)*3;
//           CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex(t);
//           int tubiaoum=spritecount[t];
//           for(int i=0;i<tubiaoum;i++)
//           {
//               
//               CCSprite *zhongsprite=(CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(i));
//               if(zhongsprite->getTag()==kuangtag)
//               {
//                   tubiaoum++;
//                   continue;
//               }
//               else
//               {
//                 int temp=zhongsprite->retainCount();
//                 for(int i=0;i<temp-1;i++)
//                 {
//                    zhongsprite->release();
//                 }
//               //CCLOG("106zhongsprite->retaincount=%d",zhongsprite->retainCount());
//               }
//           }
//       }
////
////
//       if(slotResultArray->count())
//       {
//       for(int i=0;i<slotResultArray->count();i++)
//       {
//           
//           int zhongnum=((JiangliLine *)(slotResultArray->objectAtIndex(i)))->num;
//           for (int j=0;j<zhongnum;j++)
//           {
//               CCSprite *zhongsprite=(CCSprite *)((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->objectAtIndex(j);
//               CCLOG("107zhongsprite->retaincount=%d",zhongsprite->retainCount());
//           }
//           
//       }
//       }
//
//        CCLOG("slotResultArray->count()=%d",slotResultArray->count());
//      
//       if(slotResultArray->count())
//       {
//            slotResultArray->removeAllObjects();
//       }
//      
//
//       //slotScrollLayerArray->release();
       
       
       
       ZhongHangNumShuzu->release();
       labelbmyajin->release();
       labelbmdan->release();
       labelbm->release();
       // slotScrollLayerArray->release();
       LayerPositionResultArray->release();
       ClearKuangAndXian(this);
//       if(slotResultArray->count())
//       {
//           for(int i=0;i<slotResultArray->count();i++)
//           {
//               
//               int zhongnum=((JiangliLine *)(slotResultArray->objectAtIndex(i)))->num;
//               for (int j=0;j<zhongnum;j++)
//               {
//                   CCSprite *zhongsprite=(CCSprite *)((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->objectAtIndex(j);
//                   CCLOG("107zhongsprite->retaincount=%d",zhongsprite->retainCount());
//               }
//               
//           }
//       }
       //下面放入clearkuangandxianzhong
//       if(slotResultArray->count())
//       {
//           for(int i=0;i<slotResultArray->count();i++)
//           {
//               
//               int zhongnum=((JiangliLine *)(slotResultArray->objectAtIndex(i)))->num;
//               if(zhongnum)
//               {
//                   ((CCArray *)((JiangliLine *)(slotResultArray->objectAtIndex(i)))->dansprite)->release();
//               }
//           }
//       }
//       for(int t=0;t<layercount;t++)
//       {
//           spritecount[t]=(t+kminturn+1)*3;
//           CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex(t);
//           int tubiaoum=spritecount[t];
//           for(int i=0;i<tubiaoum;i++)
//           {
//               
//               CCSprite *zhongsprite=(CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(i));
//               if(zhongsprite->getTag()==kuangtag)
//               {
//                   tubiaoum++;
//                   continue;
//               }
//               else
//               {
//                   int temp=zhongsprite->retainCount();
//                  
//                   CCLOG("108zhongsprite->retaincount=%d",temp);
//               }
//           }
//       }

       daojuArray->release();//改??动?￥?￥ê?è11
//       for(int t=0;t<layercount;t++)
//       {
//           CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex(t);
//           int temp=(t+kminturn+1)*3;
//           //CCLOG("slotScrollLayer->getChildrenCount()-temp=%d,slotScrollLayer->retainCount()=%d",slotScrollLayer->getChildrenCount()-temp,slotScrollLayer->retainCount());
//           for(int j=0;j<temp;j++)
//           {
//               CCSprite *oldsprite=(CCSprite *)slotScrollLayer->getChildren()->objectAtIndex(j);
//               
//               if (oldsprite->getTag()==kuangtag)
//               {
//                   temp++;
//                   //CCLOG("tuichu xigou shi shi yudaole kuang");
//                   continue;
//               }
//               else
//               {
//                   int rcount=oldsprite->retainCount()-1;
//                   //CCLOG("rcount=%d",rcount);
//                   for(int p=0;p<rcount;p++)
//                   {
//                       oldsprite->release();
//                   }
//               }
//               
//               //CCLOG("oldsprite->retainCount()=%d",oldsprite->retainCount());
//           }
//       }
       for(int t=0;t<layercount;t++)
       {
           CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex(t);
           //int temp=(t+kminturn+1)*3;
           //CCLOG("clean_slotScrollLayer->getChildrenCount()-temp=%d,slotScrollLayer->retainCount()=%d",slotScrollLayer->getChildrenCount()-temp,slotScrollLayer->retainCount());
           slotScrollLayer->removeAllChildrenWithCleanup(true);
           //CCLOG("clean_slotScrollLayer->getChildrenCount()-temp=%d,slotScrollLayer->retainCount()=%d",slotScrollLayer->getChildrenCount()-temp,slotScrollLayer->retainCount());
       }
       slotScrollLayerArray->release();
       xianArray->release();
       kuangArray->release();
       delete this->monsterSystem;
       delete resulttag[0];
       delete resulttag[1];
       delete resulttag[2];
   
   }
                 
   CCSize HelloWorld::getWinSize(){
       return	CCDirector::sharedDirector()->getVisibleSize();
   }
   CCPoint HelloWorld::getWinOrigin(){
       return CCDirector::sharedDirector()->getVisibleOrigin();
   }

   CCPoint HelloWorld::getWinCenter(){
       return	ccp(getWinSize().width/2+getWinOrigin().x,getWinSize().height/2+getWinOrigin().y);
   }

   CCPoint HelloWorld::converSpritRel(float x, float y){
       return ccp(x+getWinOrigin().x,y+getWinOrigin().y);
   }

   void HelloWorld::onExit()
   {
//       for(int t=0;t<layercount;t++)
//       {
//           CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex(t);
//           CCLOG("exit_qian_slotScrollLayer->retainCount()=%d",slotScrollLayer->retainCount());
//           //int temp=(t+kminturn+1)*3;
//           int temp=slotScrollLayer->getChildrenCount();
//           //CCLOG("slotScrollLayer->getChildrenCount()-temp=%d",slotScrollLayer->getChildrenCount()-temp);
//           for(int j=0;j<temp;j++)
//           {
//               CCSprite *oldsprite=(CCSprite *)slotScrollLayer->getChildren()->objectAtIndex(j);
//               CCLOG("exit_qian_oldsprite->retainCount()=%d",oldsprite->retainCount());
//           }
//       }
//       CCLOG("slotScrollLayerArray->retainCount()=%d",slotScrollLayerArray->retainCount());
       CCLayer::onExit();
//       for(int t=0;t<layercount;t++)
//       {
//           CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex(t);
//           CCLOG("exit_hou_slotScrollLayer->retainCount()=%d",slotScrollLayer->retainCount());
//
//           //int temp=(t+kminturn+1)*3;
//           int temp=slotScrollLayer->getChildrenCount();
//           //CCLOG("slotScrollLayer->getChildrenCount()-temp=%d",slotScrollLayer->getChildrenCount()-temp);
//           for(int j=0;j<temp;j++)
//           {
//               CCSprite *oldsprite=(CCSprite *)slotScrollLayer->getChildren()->objectAtIndex(j);
//               CCLOG("exit_hou_oldsprite->retainCount()=%d",oldsprite->retainCount());
//           }
//       }
//       CCLOG("slotScrollLayerArray->retainCount()=%d",slotScrollLayerArray->retainCount());
//       //CocosDenshion::SimpleAudioEngine::sharedEngine()->end();
   }


   void HelloWorld::onEnter()
   {
       CCLayer::onEnter();
       CCDirector::sharedDirector()->startAnimation();
      KTPlayC::setNotificationEnabled(true);//启用通知功能//ktplay
       if (oldchangjing!=0)
       {
           oldchangjing=changjing;    
           changjing=changjingid;
       }
       CCScheduler *m_scheduler = new CCScheduler();
       setScheduler(m_scheduler);

       CCDirector::sharedDirector()->getScheduler()->scheduleUpdateForTarget(m_scheduler,1,false);

     // CCLOG("backqian=%d,qian=%f",backqian/100,qian/100);   //??????backqian为什么不是等于0？
      if (backqian!=0)     
       {    
           qian+=backqian;
           dancurrqian+=backqian;
         //  CCLOG("backqian=%d,qian=%f",backqian/100,qian/100);
          char string[15] = {0};
          sprintf(string, "%.2f", qian/100);
          labelbm->setString(string);
          userDefault->setDoubleForKey("usrqian",qian);

          dancurrqianjia+=backqian;
          char stringtemp[15] = {0};
          sprintf(stringtemp, "%.2f", dancurrqianjia/100);
          labelbmdan->setString(stringtemp);
        
          userDefault->flush();
     
      }
      backqian=0;
    
   }

   JiangliLine::JiangliLine()
   {

   }

   JiangliLine::~JiangliLine()
   {

   }
bool JiangliLine::init()
{
    bool bRet = false;
    do
    {
        dansprite=CCArray::create();
        num=0;
        tag=0;
        zhong=false;
        Danjang=0;
        bRet = true;
        
    } while (0);
    
    return bRet;
}

   /*
   for(int i=0;i<Xiannum;i++)
   {     //初始化
   int numtemp=0;
   int temptag=999;
   int tagcur;
   JiangliLine * newline=JiangliLine::create();
   newline->dansprite=CCArray::create();
   newline->num=0;
   newline->tag=0;
   newline->zhong=false;
   newline->Danjang=0;
   for(int j=0;j<layercount;j++)
   {
   tagcur=resulttag[Xian25[i][j][0]][Xian25[i][j][1]];//行（从下到上）、列

   if(tagcur==temptag)
   {
   numtemp++;
   //CCLOG("xian %d,count %d",Xian25[i][j][1],slotScrollLayerArray->count());
   CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex((Xian25[i][j][1]));
   //newline->dansprite->addObject((CCSprite*)slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0]));
   int zhongtag=((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])))->getTag();//temp
   //CCLOG("zhongspritetag %d ",zhongtag);
   newline->dansprite->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));
   }
   else if (tagcur!=temptag&&tagcur==9)
   {
   numtemp++;
   CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex((Xian25[i][j][1]));
   newline->dansprite->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));//后续动作增加判断tag，如果是通配符不必旋转，通配符有自己的动作
   }
   else
   {

   if (numtemp<=2)
   {
   numtemp=1;
   temptag=tagcur;
   if (newline->dansprite->count()!=0)
   {
   newline->dansprite->removeAllObjects();
   }
   CCLayerColor * slotScrollLayer =(CCLayerColor *)slotScrollLayerArray->objectAtIndex((Xian25[i][j][1]));
   newline->dansprite->addObject((CCSprite *)(slotScrollLayer->getChildren()->objectAtIndex(Xian25[i][j][0])));
   // 
   }
   //前面至少3个相同，后面不出现通配符的话提前退出，没有这个的话会出现XXX0X，第五个也会存进去
   else if (numtemp>2)
   {
   break;
   }

   }
   }
   //一行线循环完
   if (numtemp>2)
   {
   newline->num=numtemp;
   newline->tag=temptag;
   newline->zhong=true;
   newline->Danjang=tagjiang[(newline->tag)][(newline->num)-3]*100;
   AllReward+=(newline->Danjang);
   CCLOG("the %d line ,num:%d,jiang:%d",i,newline->num,newline->Danjang);
   newline->dansprite->retain();
   }

   slotResultArray->addObject(newline);

   }

   */