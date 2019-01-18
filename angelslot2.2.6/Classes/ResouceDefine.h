
#ifndef __ResouceDefine_H__
#define __ResouceDefine_H__

#include "cocos2d.h"
#include "SimpleAudioEngine.h"
#import  "KTPlayC.h"
using namespace cocos2d;
class GlobalTime;


//15end
#define userDefault CCUserDefault::sharedUserDefault()
#define bigsmall_factor 1  //Àı∑≈“Ú◊”]
//µ»º∂÷µ ˝◊È
#define daojishitime 600   //600
#define maxdengji 20 //◊Ó¥Ûµ»º∂,±»’Ê’˝◊Ó¥Ûµƒid–°1£®¥”0À„∆£©10 //πÿø®µ»º∂‘ˆº”–Ë∏¸∏ƒ
#define zhegaitag 606
#define freeconistag 101
#define GuankaNum 4 //πÿø®µ»º∂‘ˆº”–Ë∏¸∏ƒ
#define fishcoinstag 123 //fishicoins tag
#define fishdaojutag 124//ºıÀŸµ¿æﬂ
#define menutag 301

#define menu_pstart_tag 3011
#define menu_psub_tag 3012
#define menu_padd_tag 3013
#define menu_pguess_tag 3014
#define menu_pjiansu_tag 3015
#define menu_ptable_tag 3016

#define jiansutag 302
#define stoptag 303
#define starstag 304
#define leadboard "applefly2014"
//Àÿ≤ƒ‘≠÷µ
#define bjheght 1136//±≥æ∞Àÿ≤ƒ∏ﬂ∂»
#define bjwidth 640//±≥æ∞Àÿ≤ƒøÌ∂»

//store
#define storetag1 201
#define storetag2 202
#define storetag3 203
#define storetag4 204
#define storetag5 205
#define storetag6 206
#define guanka1_tag 1001
#define guanka2_tag 1002
//audio and pic resource
//audio
//πÿø®—°‘Ò≥°æ∞

#define mapmusic_m     "yinxiao/guankamusic.mp3"//wav
#define jinbi_m     "yinxiao/jinbi.wav"
//

//÷˜”Œœ∑≥°æ∞
#define anjianall_m  "yinxiao/anjian.wav"//普通按键¨
#define ruchang_gk1_m  "yinxiao/ruchang_gk1.mp3"//»Î≥° wav
#define ruchang_gk2_m  "yinxiao/ruchang_gk2.mp3"//»Î≥°
#define ruchang_gk3_m  "yinxiao/ruchang_gk3.mp3"//»Î≥°
#define ruchang_gk4_m  "yinxiao/ruchang_gk4.mp3"
#define zhuan_start_gk1_m  "yinxiao/gundongmusic.wav" //start effect1.wav 3469
#define dajiangtip_m_1   "yinxiao/dajiang_tip_1.wav" //start effect1.wav
#define dajiangtip_m_2   "yinxiao/dajiang_tip_2.wav" //start effect1.wav
#define start_m        "yinxiao/start_m.wav"//
#define slidend_m      "yinxiao/kayisheng.wav" //Õ£÷πª¨∂Ø ±diyisheng.wav
#define anjian_m      "yinxiao/kayisheng.wav" 
#define shengji_m      "yinxiao/shengji.wav"//…˝º∂
#define gudian_m       "yinxiao/gudian.wav"//πƒµ„
#define bonustip_m     "yinxiao/bonustip.wav"//bonus
#define scattertip_m   "yinxiao/scarttertip.wav"//…¢…‰
#define dajiangli_m    "yinxiao/dajiangjiangli.wav" //start effect1.wav
#define xiaojiangli_m_1   "yinxiao/xiaojiangli_1.wav"//–°Ω±¿¯
#define xiaojiangli_m_2   "yinxiao/xiaojiangli_2.wav"//–°Ω±¿¯
#define jiangsu_m        "yinxiao/mansu.wav"//ºıÀŸ
#define jiangsu_quxiao_m        "yinxiao/mansu_dis.wav"//ºıÀŸ
#define yushieat_m        "yinxiao/yushieat.wav"//Õº±ÍΩ±“


//

//bonus≥°æ∞

#define  bonus_ruchang_m "yinxiao/bonus_bj.mp3"//bonus gk»Î≥°
#define  bonus_start_m   "yinxiao/bonus_start.wav"//bonus musci
#define  bonus_dejiang   "yinxiao/bonus_dejiang.wav"//bonus musci
#define bonus_pa_gk4_m     "yinxiao/pa.wav"//bonus musci
#define  bonus_start_gk3_m   "yinxiao/bonus_start_gk3.wav"//bonus musci

//
//guess ≥°æ∞
#define guess_anjian_m   "yinxiao/guess_anjian.wav"//÷˜”Œœ∑≥°æ∞µƒguess∞¥≈•…˘“Ùguess anniu
#define guess_start_m    "yinxiao/guess_bj.wav"//
#define guess_caidui_m   "yinxiao/guess_caidui.wav"//guess musci
#define guess_caicuo_m   "yinxiao/guess_caicuo.wav"//guess musci
//
//store商城
#define store_1   "1000000"
#define store_1_1 "500000"
#define store_1_2 "+100%"
#define store_1_3 "99.99"

#define store_2   "175000"
#define store_2_1 "100000"
#define store_2_2 "+75%"
#define store_2_3 "49.99"

#define store_3   "60000"
#define store_3_1 "40000"
#define store_3_2 "+50%"
#define store_3_3 "19.99"

#define store_4   "26000"
#define store_4_1 "20000"
#define store_4_2 "+30%"
#define store_4_3 "9.99"

#define store_5   "12000"
#define store_5_1 "10000"
#define store_5_2 "+20%"
#define store_5_3 "4.99"

#define store_6   "4400"
#define store_6_1 "4000"
#define store_6_2 "+10%"
#define store_6_3 "1.99"


//qianbi∑≠∂Ø
//bigreward
//ƒ≥¡–≥ˆœ÷Ãÿ ‚Õº±Í
//£®ƒ≥¡–≥ˆœ÷Ãÿ ‚Õº±Í£©◊Ó∫ÛΩÙ’≈πƒµ„

//rewardgame win
//rewrdgame lose

//pic

//#define pic_1 "pic_1.plist" //Õº∆¨1¥Ú∞¸≥…plist ‘⁄cppÃ·«∞º”‘ÿ

#define layercount_1 5

//∏ƒ∂Ø14
extern bool ifsetgailv;
extern int daoju_jiansu;//未捡起来的道具
extern int daoju_jinbi;//未捡起来的道具

extern float pingmubili;
//
extern int tobedeletecount[layercount_1];
extern int deletecount[layercount_1];
extern int spritecount[layercount_1];
extern bool layerstate[layercount_1];
extern int dengjishuzu[maxdengji+2];//πÿø®µ»º∂‘ˆº”–Ë∏¸∏ƒ
extern int fishmaxblood[maxdengji+1];
extern int fishiproduct[maxdengji+1];
extern int backqian;//orther scene back,like guess ,rewardgame
extern double qian;
extern double maxscore;
extern double currqian;//all money
extern int jingyandengji;
extern double gundongsudu;
extern int daojunum;
extern int JiansuNum;
extern int yajinshuzu[maxdengji+1];//—∫Ω±‰ªØ ˝◊È//πÿø®µ»º∂‘ˆº”–Ë∏¸∏ƒ
extern int freecoinsmax[maxdengji+1];//free coins max value//πÿø®µ»º∂‘ˆº”–Ë∏¸∏ƒ
extern int  freecoinsgrow[maxdengji+1];//free coins meimiao zengzhangde sudu//πÿø®µ»º∂‘ˆº”–Ë∏¸∏ƒ
extern int changjing;
extern int oldchangjing;
extern int BonusNumtemp;//bonus times
extern cocos2d::CCRect MonsterGoSize;
extern std::string lujing;
extern bool NowTimeIsGet;// «∑Ò“—∏¸–¬NowTime
extern bool freeconisReady;// «∑Òø…“‘collcet
extern int GotconisTime;
extern int NowcoinsTime;
extern GlobalTime *jishiqi;
extern cocos2d::CCLabelTTF* labelbm;
extern cocos2d::CCMenuItemImage* pShijianItem;
extern cocos2d::CCSprite *pfreeconistishi; //可以收集了
extern cocos2d::CCLabelTTF *lable_freeconistishi;
extern cocos2d::CCLabelTTF *lable_daojishi;
extern cocos2d::CCMenuItemSprite *pJiansuItem;
extern cocos2d::CCLabelTTF *lableDaojuNum;
extern float freecoinsvalue;//ø…À—ºØconis
//∏ƒ∂Ø15
void loadchangjingdata();
void setgailv();//等级上升，概率调整
extern int changjingid;//¥´µ›≥°æ∞num∏¯changjing
extern float unitheight;
extern int shangtugao;//slot…œ√Êµƒheight
extern int kminturn;//3
extern int iconscount; //≤‚ ‘”√4£¨9£¨º∏∏ˆÕº±ÍΩ¯»Î 3
extern int iconscountminID;//Õº±Í◊Ó–°÷µ£¨¥”µ⁄º∏∏ˆÕº±Íø™ º7
extern float sudu;//µ»”⁄0.15µƒª∞µ⁄ŒÂ¡–æÕ“∆∂Ø¡À18∏ˆ∂¯≤ª «15∏ˆ£¨¥Û”⁄–°”⁄∂º’˝≥£.∆Êπ÷£°0.12 0.1
extern float viewwidth;
extern float viewheight;
extern float shangheight_yuan; //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©


extern float shangwidth;
extern float jingyanheight; //…œ≤ø∑÷µΩ÷–º‰µƒº–≤„£®◊‹æ≠—È£©
extern float jingyanwidth;
extern float kuangheight;
extern float PaysY;
extern float kuanghoudu;//øÚ∫Ò∂»
extern float kuanghoudu_xia;//øÚœ¬√Êµƒ∫Ò∂»
extern float kuangwidth;//ƒ⁄øÚ
extern float slotheight;  //‘≠¿¥90
extern float slotwidth; //128£®¡–µƒøÌ∂»£©±»Ωœ∫œ  //‘≠¿¥90
extern float qizhiwidth;
extern  int layercount; //∂‡…Ÿ¡–
extern float layerwidth;
extern int qiantag;
extern int Xiannum;//25
extern int fishsprite_tag;
extern int fisheat_tag;
extern int fishieat_jingyan;
extern int qizhi_zuo_tag;
extern int qizhi_you_tag;
extern int xiantag;
extern int kuangtag;
extern int bonustiptag;
extern int freespintag;
extern int AgainFreeDialogLayerTag;
extern float pLabelwin_maodian_x;
extern float start_maodianY;
extern float yajin_maodian;
extern float Add_maodianX;//yajin add maodian
extern float pLabelbet_maodianY;//yajin bet maodian
//extern int XianPosition25[25][2];
extern float backdixian;//back±≥æ∞µƒµ◊œﬂŒª÷√£¨±æ¿¥∏¯œﬂ◊˜≤Œøº∏ﬂ∂»£¨‘› ±≤ª”√
extern std::string lujing;
extern std::vector<std::string> searchPath;
extern int tubiao_bonustip;
extern int tubiao_scaterrtip;
extern int tubiao_wildtip;
extern int *tubiaogailv_shuzu;//图标概率数组
extern int tubiaogailv_jishu;//图标 概率基数 20

extern void dispatchRewards(KTRewardItemC *reward ,int lenght);//ktplay
extern cocos2d::CCLayer *nowobject;
extern void updateKTTip(bool hasNewActivities);//ktplay
extern void onKTDisappear();//ktplay
extern void onKTAppear();//ktplay
extern int yaomaiID;
extern  ccLanguageType mylanguage;
extern CCDictionary *loacalstrings;
//»´æ÷∂® ±∆˜
class GlobalTime:public CCObject
{
public:
    GlobalTime();
    ~GlobalTime();

    void daojishi(float fDelta);
    void activeDaojishiTime();
    void inactiveDaojishiTime();
};



#endif  // __ResouceDefine_H__
