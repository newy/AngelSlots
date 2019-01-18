#ifndef __HELLOWORLD_SCENE_H__
#define __HELLOWORLD_SCENE_H__

#include "cocos2d.h"
#include "SimpleAudioEngine.h"
#include "ResouceDefine.h"
#include "MonsterSystem.h"
using namespace cocos2d;
 
using namespace std;
USING_NS_CC;



class HelloWorld : public cocos2d::CCLayer
{
public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  
    HelloWorld();
    ~HelloWorld();
    virtual void onExit();
    virtual void onEnter();
    // there's no 'id' in cpp, so we recommand to return the exactly class pointer
    static cocos2d::CCScene* scene();
    
    // a selector callback
    void menuCloseCallback(CCObject* pSender);//∑µªÿµΩ
    void menuNewhandCallback(CCObject* pSender);//newhand
    void menuTableCallback(CCObject* pSender);
    void menuGamecenterCallback(CCObject* pSender);
    void menuStartCallback(CCObject* pSender);
    void menuGuessCallback(CCObject* pSender);//≤¬
    void menujiansuCallback(CCObject* pSender);
    void menuStoreCallback(CCObject* pSender);
    void menuAddCallback(CCObject* pSender);
    void menuSubCallback(CCObject* pSender);
    //cocos2d::CCArray *slotScrollLayerArray; //πˆ∂Ø¡–µƒ ˝◊È,±£¥Ê√ø∏ˆ¡–À˘‘⁄≤„÷∏’Î
     //cocos2d::CCArray *slotResultArray; //Ω·π˚ ˝◊È
     cocos2d::CCArray *slotCurrentArray; //Ω·π˚ ˝◊È
     //cocos2d::CCArray *kuangArray; //rewardslot kuang
     cocos2d::CCPointArray  *LayerPositionCurrentArray; //Ω·π˚ ˝◊È
     //cocos2d::CCLabelBMFont *labelbm;//«Æ∞°
      
    
      //int qian;//«Æ±“www
      void jingyanset();//…Ë÷√æ≠—ÈÃı
      int yajinset();
     void slidingend();
     void callbackslidingend(CCNode* sender, void* data);//πˆ∂ØÕÍ≥…
    
     
     void schedulestoplayer(float fDelta);//layer stop
     void schedulejiaqian(float fDelta);//qianbi ∑≠◊™
      void scheduleRewardAnimation(float fDelta);
     void active();
     void inactive();

     void activeqian();
     void inactiveqian();

     void ActiveRewardAnimation();
     void ActiveXianReward(int xiannum);
    // void ActiveXianRewardHou(int xiannum);
     void ActiveXianRewardQuan();
     void RewardHangAnimation(CCNode* sender, void* data);//
     void ClearKuangAndXian(CCNode *pSender);//temp
     void ActiveQizhi();//œ‘ æ∆Ï÷ƒ
     void InActiveQizhi();
     inline void  inactiveRewardAnimation();
     void spriteremoveFromParent(CCNode *pSender);//wildÕº±Íµ»¥”∏∏Ω⁄µ„…æ≥˝
     void spriteresetvisible(CCNode *pSender);//œ‘œ÷Ω⁄µ„
     void spriteresetInvisible(CCNode *pSender);
      void spriteresetEnable(CCNode *pSender);//“∆÷≤3over
        void spriteresetDisable(CCNode *pSender);//“∆÷≤3over
     int reward();//compu reward æ›¥À≈–∂œ «∑Ò”–∂Øª≠
    cocos2d::CCMenu* pMenu;// 点击菜单
    MonsterSystem* monsterSystem;//monster

     unsigned int m_nSoundId;//…˘“Ù±Í æ
     
    // implement the "static node()" method manually
    CREATE_FUNC(HelloWorld);
    cocos2d::CCSize getWinSize();// µ√µΩµ±«∞ø… ”¥∞ø⁄µƒ¥Û–°
    cocos2d::CCPoint getWinOrigin();// µ√µΩµ±«∞ø… ”¥∞ø⁄µƒ∆ ºµ„
    cocos2d::CCPoint getWinCenter();// µ√µΩ∆¡ƒª’˝÷–º‰µƒµ„
    cocos2d::CCPoint converSpritRel(float x, float y);//∞—…Ë‘⁄∆¡ƒª÷–µƒŒª÷√◊™ªØ≥… ø… ”¥∞ø⁄µƒ Œª÷√
    
//     int shangtugao;//slot…œ√Êµƒheight
//     //float unitheight;
//     int kminturn;
//     //int iconscount; //≤‚ ‘”√4£¨9£¨º∏∏ˆÕº±ÍΩ¯»Î
//     //int iconscountminID;//Õº±Í◊Ó–°÷µ£¨¥”µ⁄º∏∏ˆÕº±Íø™ º
//     float sudu;//µ»”⁄0.15µƒª∞µ⁄ŒÂ¡–æÕ“∆∂Ø¡À18∏ˆ∂¯≤ª «15∏ˆ£¨¥Û”⁄–°”⁄∂º’˝≥£.∆Êπ÷£°
//     float viewwidth;
//     float viewheight;
//     float shangheight; //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©
//     float shangwidth;
//     float jingyanheight; //…œ≤ø∑÷µΩ÷–º‰µƒº–≤„£®◊‹æ≠—È£©
//     float jingyanwidth;
//     float kuangheight;
//     float kuangwidth;
//     float slotheight;  //‘≠¿¥90
//     float slotwidth; //128£®¡–µƒøÌ∂»£©±»Ωœ∫œ  //‘≠¿¥90
//     float qizhiwidth;
// 
//     float layerwidth;
//     int qiantag;
//     //int Xiannum;//25
// 
//     int qizhi_zuo_tag;
//     int qizhi_you_tag;
//     int xiantag;
//     int kuangtag;
//     int bonustiptag;
// 
//     bool isSliding;
//     bool activetag;
//     bool activeRewardAnimationtag;
//     bool hangxunhuan;
//     bool QizhiIsActive;
//     bool activeqiantag;
//     bool activeqianDan;
//     bool activeqianZong;
//     bool freexuanzhuaning;//free–˝◊™±Í æ£¨ πµ√‘⁄÷–µ√¥À√‚∑—Ω±¿¯µƒƒ«“ª¥Œµ•¥ŒΩ±¿¯‘⁄œ¬“ª¥Œ◊‘∂Ø◊™ ±∫Ú«Â¡„
//     int freexuanzhuan;//free–˝◊™
//     int currqian;//all money
//     int dancurrqian;//µ•¥Œ
//     int dancurrqianjia;//ª∫¥Ê
//     bool gcMUSICSTATE;
//     bool gcEFFECTSTATE;
//     int qian;
//     int jingyan;// æ≠—È÷µ
//     int jingyandengji;//æ≠—Èµ»º∂
//     int jiaqian;
//     int maxxian;//◊Ó¥Ûrewardœﬂ
//     int yajin;//yajin
//     int yajinID;//yajinshuzu id
// 
//     int nowrewardhangnum;//
//     cocos2d::CCLabelAtlas * label1;//money∞°
//     cocos2d::CCLabelBMFont *labelbm;//money
//     cocos2d::CCLabelTTF* pLabeldengji;//µ»º∂÷µ±Í«©
//     //  cocos2d::CCLabelAtlas* pLabeldengji;
//     cocos2d::CCProgressTimer* jingyanpt;//æ≠—È
//     cocos2d::CCClippingNode *back;//±≥æ∞’⁄∏«≤„
//     cocos2d::CCLabelBMFont *labelbmdan;//µ•«Æ
//     cocos2d::CCLabelBMFont *labelbmyajin;//yajin
//     cocos2d::CCMenu* pMenu;// µ„ª˜≤Àµ•
//     cocos2d::CCMenuItemImage *pGuessItem;
//     cocos2d::CCMenuItemImage *pStartItem;//ø™ º
//     cocos2d::CCMenuItemImage *pADDItem;
//     cocos2d::CCMenuItemImage *pSUBItem;
//     cocos2d::CCMenuItemImage *pSTOREItem;
    //cocos2d::CCPointArray *LayerPositionResultArray; //Ω·π˚ ˝◊È
//     cocos2d::CCArray *slotScrollLayerArray; //πˆ∂Ø¡–µƒ ˝◊È,±£¥Ê√ø∏ˆ¡–À˘‘⁄≤„÷∏’Î
//     cocos2d::CCArray *kuangArray; //rewardslot kuang
//     cocos2d::CCArray *xianArray; //rewardslot xian
//     CCArray *ZhongHangNumShuzu;//ƒƒ–©––reward
//     bool stopbtn;// ÷∂ØÕ£÷π
//     bool quit;//Ã¯≥ˆ—≠ª∑
   

};


 class JiangliLine : public cocos2d::CCObject
{
public:
    virtual bool init();
  
    JiangliLine();
    ~JiangliLine();

    int  Danjang;
    bool zhong;
    int num;
    int tag;
    cocos2d::CCArray *dansprite;


    CREATE_FUNC(JiangliLine);
};







#endif  // __HELLOWORLD_SCENE_H__