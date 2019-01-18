#include "ResouceDefine.h"
#include "mapchoose.h"
#include "HelloWorldScene.h"
#include "playyinxiao.h"
#include "MobClickCpp.h"//youmeng
//#include "string.h"
using namespace std;
//int dengjishuzu[100];
//using namespace cocos2d;


int tobedeletecount[layercount_1];
int deletecount[layercount_1];
int spritecount[layercount_1];
bool layerstate[layercount_1];
cocos2d::CCRect MonsterGoSize;
int dengjishuzu[maxdengji+2]={0,1000,2800,6300,11100,20100,35100,57100,81100,107100,135100,195100,259100,327100,435100,549100,709100,877100,1097100,1327100,1615100,1915100};

int yajinshuzu[maxdengji+1]={1,2,5,10,15,25,30,50,75,100,150,250,400,500,600,700,800,900,1000,1100,1200};//押o金e变à?化?￥数oy组á¨|
int freecoinsmax[maxdengji+1]={100,125,150,175,200,225,250,275,300,325,350,375,400,425,450,475,500,525,550,575,600};//,475,500
//float freecoinsgrow[15]={0.01,0.01,0.02,0.02,0.03,0.03,0.04,0.04,0.05,0.05,0.06,0.06,0.07,0.07,0.08};//每?秒?增?长?è
int  freecoinsgrow[maxdengji+1]={1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11};//每?秒?增?长?è
int fishmaxblood[maxdengji+1]={40,58,95,111,180,262,340,495,800,1240,1500,1740,1960,2160,2340,2500,2640,2760,2860,2940,3000};
int fishiproduct[maxdengji+1]={2,3,4,5,9,13,17,25,40,62,75,87,98,108,117,125,132,138,143,147,150};//fish drop conis value
int backqian=0;
double qian=0;
double maxscore;
double currqian=0;
int jingyandengji;
double gundongsudu=1.0f;
int daojunum;
int JiansuNum=0;
int changjing=0;//“‘¥À◊˜Œ™µ±«∞≥°æ∞±Íº«£¨∂¯«“◊˜Œ™≥ı»Îπÿø®∫Õ÷˜≥°æ∞ªÿπÿø®¿¥ ±∫Ú∂®∏ÒŒ™ƒ«∏ˆπÿø®µƒ±Íº«£ªø……Ë÷√Œ™∏˘æ›º∂±
int oldchangjing=0;                //mapchoose 0,÷˜game≥°æ∞1,2,3°£°£°££¨guess 10£¨bonus_gk1 11,bonus_gk2 12,..
int BonusNumtemp=0;
//∏ƒ∂Ø14
bool ifsetgailv=false;
int daoju_jiansu=0;//未捡起来的道具
int daoju_jinbi=0;//未捡起来的道具
float pingmubili=1.5;
 float backdixian=0;
//∏ƒ∂Ø15

int changjingid;
float unitheight;
int shangtugao;//slot…œ√Êµƒheight
int kminturn;//3
int iconscount; //≤‚ ‘”√4£¨9£¨º∏∏ˆÕº±ÍΩ¯»Î 3
int iconscountminID;//Õº±Í◊Ó–°÷µ£¨¥”µ⁄º∏∏ˆÕº±Íø™ º7
float sudu;//µ»”⁄0.15µƒª∞µ⁄ŒÂ¡–æÕ“∆∂Ø¡À18∏ˆ∂¯≤ª «15∏ˆ£¨¥Û”⁄–°”⁄∂º’˝≥£.∆Êπ÷£°0.12 0.1
float viewwidth;
float viewheight;
//#define shangheight 270/bigsmall_factor //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©
//∏ƒ∂Ø14
float shangheight_yuan; //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©
float shangwidth;
float jingyanheight; //…œ≤ø∑÷µΩ÷–º‰µƒº–≤„£®◊‹æ≠—È£©
float jingyanwidth;
float kuangheight;
float PaysY;
float kuanghoudu;
float kuanghoudu_xia;
float kuangwidth;
float slotheight;  //‘≠¿¥90
float slotwidth; //128£®¡–µƒøÌ∂»£©±»Ωœ∫œ  //‘≠¿¥90
float qizhiwidth;
int layercount; //∂‡…Ÿ¡–
float layerwidth;
int qiantag;
int Xiannum;//25

int fisheat_tag;
int fishieat_jingyan;
int qizhi_zuo_tag;
int qizhi_you_tag;
int xiantag;
int kuangtag;
int bonustiptag;
int freespintag;
int AgainFreeDialogLayerTag;
float start_maodianY=0;
float pLabelwin_maodian_x=-0.5;
float yajin_maodian=0.5;//0.5
float Add_maodianX=1;
float pLabelbet_maodianY=0.5;
bool NowTimeIsGet=false;
bool freeconisReady=false;
int GotconisTime;
int NowcoinsTime;
std::string lujing;
std::vector<std::string> searchPath;
int tubiao_bonustip;
int tubiao_scaterrtip;
int tubiao_wildtip;
int fishsprite_tag;
int *tubiaogailv_shuzu;
int tubiaogailv_jishu;
int yaomaiID=6;
GlobalTime *jishiqi;
cocos2d::CCLabelTTF* labelbm;//zongqian*
cocos2d::CCMenuItemImage* pShijianItem;//º∆ ±∆˜∞¥≈•£¨∏˘æ›◊¥Ã¨setable
cocos2d::CCSprite *pfreeconistishi; //可以收集了
cocos2d::CCLabelTTF *lable_freeconistishi;
cocos2d::CCLabelTTF *lable_daojishi;//º∆ ±∆˜œ‘ æ
cocos2d::CCMenuItemSprite *pJiansuItem;//Œ™fish≥ˆ¿¥µƒµ¿æﬂ’“√™µ„
cocos2d::CCLabelTTF *lableDaojuNum;
ccLanguageType mylanguage;
CCDictionary *loacalstrings;
float freecoinsvalue;
void loadchangjingdata()
{
    //CCLOG("chang=%d",changjing);
    //CCDirector::sharedDirector()->stopAnimation();
if (changjing==1)
{
changjingid=changjing;

shangtugao=260;//slot…œ√Êµƒheight
kminturn=5;//3
//Ã˘Õº¥”2-9 π≤8∏ˆÕº±Í
iconscount=11; //≤‚ ‘”√4£¨9£¨º∏∏ˆÕº±ÍΩ¯»Î 3 // 8   11
iconscountminID=0;//Õº±Í◊Ó–°÷µ£¨¥”µ⁄º∏∏ˆÕº±Íø™ º7   //2  0
    if(!ifsetgailv)
    {
    setgailv();
    }
    
sudu=0.1;//µ»”⁄0.15µƒª∞µ⁄ŒÂ¡–æÕ“∆∂Ø¡À18∏ˆ∂¯≤ª «15∏ˆ£¨¥Û”⁄–°”⁄∂º’˝≥£.∆Êπ÷£°0.12 0.1
viewwidth=640/bigsmall_factor;
viewheight=960/bigsmall_factor;
    //#define shangheight 270/bigsmall_factor //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©
    //∏ƒ∂Ø14
shangheight_yuan=228/bigsmall_factor; //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘   £© 228 70 402£®30+30£© 010
shangwidth=640/bigsmall_factor;
jingyanheight=70/bigsmall_factor; //…œ≤ø∑÷µΩ÷–º‰µƒº–≤„£®◊‹æ≠—È£©
jingyanwidth=300/bigsmall_factor;

kuangheight=402/bigsmall_factor;//‘≠¿¥414
unitheight=kuangheight/3/bigsmall_factor;
kuangwidth=640/bigsmall_factor;
PaysY=10;
kuanghoudu=30/bigsmall_factor;
kuanghoudu_xia=80/bigsmall_factor;
slotheight=120/bigsmall_factor;  //‘≠¿¥90
slotwidth=120/bigsmall_factor; //128£®¡–µƒøÌ∂»£©±»Ωœ∫œ  //‘≠¿¥90
qizhiwidth=40/bigsmall_factor;
layercount=5; //∂‡…Ÿ¡–
layerwidth=(kuangwidth-kuanghoudu*2)/layercount;//116
qiantag=101;
Xiannum=25;//25 now 24
tubiao_bonustip=7;
tubiao_scaterrtip=8;
tubiao_wildtip=9;
fishsprite_tag=10;
fisheat_tag=600;
fishieat_jingyan=1;
qizhi_zuo_tag=603;
qizhi_you_tag=604;
xiantag=601;
kuangtag=602;
bonustiptag=605;
freespintag=789;
AgainFreeDialogLayerTag=788;
 pLabelwin_maodian_x=-0.5;
start_maodianY=0;
yajin_maodian=0.5;//0.5
Add_maodianX=1;
pLabelbet_maodianY=0.4;
//Ω±¿¯œﬂµƒŒª÷√
//   int XianPosition25[25][2]={
//      {0,unitheight/2},
//      {0,unitheight+unitheight/2},
//      {0,2*unitheight+unitheight/2},
// 
//  };

}
else if(changjing==2)
 {
     changjingid=changjing;
     //unitheight=414/3/bigsmall_factor;
     shangtugao=260;//slot…œ√Êµƒheight
     kminturn=5;//3
     iconscount=11; //≤‚ ‘”√4£¨9£¨º∏∏ˆÕº±ÍΩ¯»Î 3
     iconscountminID=0;//Õº±Í◊Ó–°÷µ£¨¥”µ⁄º∏∏ˆÕº±Íø™ º7
     if(!ifsetgailv)
     {
         setgailv();
     }
     sudu=0.1;//µ»”⁄0.15µƒª∞µ⁄ŒÂ¡–æÕ“∆∂Ø¡À18∏ˆ∂¯≤ª «15∏ˆ£¨¥Û”⁄–°”⁄∂º’˝≥£.∆Êπ÷£°0.12 0.1
     viewwidth=640/bigsmall_factor;
     viewheight=960/bigsmall_factor;
     //#define shangheight 270/bigsmall_factor //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©
     //∏ƒ∂Ø14
     shangheight_yuan=228/bigsmall_factor; //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘   £© 228 70 396£®30+30£© 206
     shangwidth=640/bigsmall_factor;
     jingyanheight=70/bigsmall_factor; //…œ≤ø∑÷µΩ÷–º‰µƒº–≤„£®◊‹æ≠—È£©85
     jingyanwidth=300/bigsmall_factor;

     kuangheight=396/bigsmall_factor;//‘≠¿¥414 402
     unitheight=kuangheight/3/bigsmall_factor;
     kuangwidth=640/bigsmall_factor;
     PaysY=0;
     kuanghoudu=30/bigsmall_factor;
     kuanghoudu_xia=40/bigsmall_factor;
     slotheight=120/bigsmall_factor;  //‘≠¿¥90
     slotwidth=120/bigsmall_factor; //128£®¡–µƒøÌ∂»£©±»Ωœ∫œ  //‘≠¿¥90
     qizhiwidth=40/bigsmall_factor;
     layercount=5; //∂‡…Ÿ¡–
     layerwidth=(kuangwidth-kuanghoudu*2)/layercount;
     qiantag=101;
     Xiannum=25;//25
     tubiao_bonustip=7;
     tubiao_scaterrtip=8;
     tubiao_wildtip=9;
     fishsprite_tag=10;
     fisheat_tag=600;
     fishieat_jingyan=1;
     qizhi_zuo_tag=603;
     qizhi_you_tag=604;
     xiantag=601;
     kuangtag=602;
     bonustiptag=605;
     freespintag=789;
     AgainFreeDialogLayerTag=788;
      pLabelwin_maodian_x=-0.5;
     start_maodianY=0.15;
     yajin_maodian=0.45;//0.45
     Add_maodianX=1.8;
     pLabelbet_maodianY=0.8;

//      //Ω±¿¯œﬂµƒŒª÷√
//      int XianPosition25[25][2]={
//          {0,unitheight/2},
//          {0,unitheight+unitheight/2},
//          {0,2*unitheight+unitheight/2},
 //};

}
else if(changjing==3)
{
    changjingid=changjing;
    //unitheight=414/3/bigsmall_factor;
    shangtugao=260;//slot…œ√Êµƒheight
    kminturn=5;//3
    iconscount=11; //≤‚ ‘”√4£¨9£¨º∏∏ˆÕº±ÍΩ¯»Î 3
    iconscountminID=0;//Õº±Í◊Ó–°÷µ£¨¥”µ⁄º∏∏ˆÕº±Íø™ º7
    if(!ifsetgailv)
    {
        setgailv();
    }
 
    sudu=0.1;//µ»”⁄0.15µƒª∞µ⁄ŒÂ¡–æÕ“∆∂Ø¡À18∏ˆ∂¯≤ª «15∏ˆ£¨¥Û”⁄–°”⁄∂º’˝≥£.∆Êπ÷£°0.12 0.1
    viewwidth=640/bigsmall_factor;
    viewheight=960/bigsmall_factor;
    //#define shangheight 270/bigsmall_factor //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©
    //∏ƒ∂Ø14
    shangheight_yuan=194/bigsmall_factor; //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘   £© 228 70 396£®20+60£© 220
    shangwidth=640/bigsmall_factor;
    jingyanheight=70/bigsmall_factor; //…œ≤ø∑÷µΩ÷–º‰µƒº–≤„£®◊‹æ≠—È£©85
    jingyanwidth=300/bigsmall_factor;

    kuangheight=396/bigsmall_factor;//‘≠¿¥414 402
    unitheight=kuangheight/3/bigsmall_factor;
    kuangwidth=640/bigsmall_factor;
    PaysY=5;
    kuanghoudu=30/bigsmall_factor;
    kuanghoudu_xia=60/bigsmall_factor;
    slotheight=120/bigsmall_factor;  //‘≠¿¥90
    slotwidth=120/bigsmall_factor; //128£®¡–µƒøÌ∂»£©±»Ωœ∫œ  //‘≠¿¥90
    qizhiwidth=40/bigsmall_factor;
    layercount=5; //∂‡…Ÿ¡–
    layerwidth=(kuangwidth-kuanghoudu*2)/layercount;
    qiantag=101;
    Xiannum=25;//25 24
    tubiao_bonustip=7;
    tubiao_scaterrtip=8;
    tubiao_wildtip=9;
    fishsprite_tag=10;
    fisheat_tag=600;
    fishieat_jingyan=1;
    qizhi_zuo_tag=603;
    qizhi_you_tag=604;
    xiantag=601;
    kuangtag=602;
    bonustiptag=605;
    freespintag=789;
    AgainFreeDialogLayerTag=788;
    start_maodianY=-0.2;
    pLabelwin_maodian_x=-0.6;
    yajin_maodian=0.5;//0.5
    Add_maodianX=1;
    pLabelbet_maodianY=0.6;

}
    else if (changjing==4)
    {
        changjingid=changjing;
        
        shangtugao=260;//slot…œ√Êµƒheight
        kminturn=5;//3
        //Ã˘Õº¥”2-9 π≤8∏ˆÕº±Í
        iconscount=11; //≤‚ ‘”√4£¨9£¨º∏∏ˆÕº±ÍΩ¯»Î 3 // 8   11
        iconscountminID=0;//Õº±Í◊Ó–°÷µ£¨¥”µ⁄º∏∏ˆÕº±Íø™ º7   //2  0
        if(!ifsetgailv)
        {
            setgailv();
        }
        
        sudu=0.1;//µ»”⁄0.15µƒª∞µ⁄ŒÂ¡–æÕ“∆∂Ø¡À18∏ˆ∂¯≤ª «15∏ˆ£¨¥Û”⁄–°”⁄∂º’˝≥£.∆Êπ÷£°0.12 0.1
        viewwidth=640/bigsmall_factor;
        viewheight=960/bigsmall_factor;
        //#define shangheight 270/bigsmall_factor //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©
        //∏ƒ∂Ø14
        shangheight_yuan=228/bigsmall_factor; //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘   £© 228 70 402£®30+30£© 010
        shangwidth=640/bigsmall_factor;
        jingyanheight=70/bigsmall_factor; //…œ≤ø∑÷µΩ÷–º‰µƒº–≤„£®◊‹æ≠—È£©
        jingyanwidth=300/bigsmall_factor;
        
        kuangheight=402/bigsmall_factor;//‘≠¿¥414
        unitheight=kuangheight/3/bigsmall_factor;
        kuangwidth=640/bigsmall_factor;
        PaysY=10;
        kuanghoudu=34/bigsmall_factor;
        kuanghoudu_xia=80/bigsmall_factor;
        slotheight=120/bigsmall_factor;  //‘≠¿¥90
        slotwidth=120/bigsmall_factor; //128£®¡–µƒøÌ∂»£©±»Ωœ∫œ  //‘≠¿¥90
        qizhiwidth=40/bigsmall_factor;
        layercount=5; //∂‡…Ÿ¡–
        layerwidth=(kuangwidth-kuanghoudu*2)/layercount;//116
        qiantag=101;
        Xiannum=25;//25 now 24
        tubiao_bonustip=7;
        tubiao_scaterrtip=8;
        tubiao_wildtip=9;
        fishsprite_tag=10;
        fisheat_tag=600;
        fishieat_jingyan=1;
        qizhi_zuo_tag=603;
        qizhi_you_tag=604;
        xiantag=601;
        kuangtag=602;
        bonustiptag=605;
        freespintag=789;
        AgainFreeDialogLayerTag=788;
        pLabelwin_maodian_x=-1;
        start_maodianY=0;
        yajin_maodian=0.5;//0.5
        Add_maodianX=1;
        pLabelbet_maodianY=0.59;
        //Ω±¿¯œﬂµƒŒª÷√
        //   int XianPosition25[25][2]={
        //      {0,unitheight/2},
        //      {0,unitheight+unitheight/2},/Users/newy/Documents/cocos2dx_v2.1.4e/projects/list2-2140404/Classes/ResouceDefine.cpp
        //      {0,2*unitheight+unitheight/2},
        // 
        //  };
        
    }
}
//等级上升，概率调整
void setgailv()
{
    ifsetgailv=true;
    delete []tubiaogailv_shuzu;//newadd
    int jibennum=70;
    tubiaogailv_jishu=jibennum+jingyandengji;
    tubiaogailv_shuzu=new int[tubiaogailv_jishu];
    int gailv[70]={0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,8,8,9,9,10,10,10,10};
    //int gailv[20]={0,7,7,7,7,7,2,7,7,7,4,8,5,7,8,7,7,8,9,10};
  
    for (int i=0;i<tubiaogailv_jishu;i++)
    {
        if(i<jibennum)
        {
       //     CCLOG("i=%d",i);
            *(tubiaogailv_shuzu+i)=gailv[i];
        }
        
        else
        {
           // CCLOG("i=%d",i);
            *(tubiaogailv_shuzu+i)=((i-jibennum)%5+2);//图标2.3.4.5.6
        }
    }
    /*
    if(jingyandengji<=5)
    {
        tubiaogailv_jishu=70;//20
        tubiaogailv_shuzu=new int[tubiaogailv_jishu];
        int gailv[70]={0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,8,8,9,9,10,10,10,10};
        //int gailv[20]={0,7,7,7,7,7,2,7,7,7,4,8,5,7,8,7,7,8,9,10};
        for (int i=0;i<tubiaogailv_jishu;i++)
        {
            *(tubiaogailv_shuzu+i)=gailv[i];
        }
    }
    //newadd 141230//递增概率数组
    else
    {
        tubiaogailv_jishu=70+jingyandengji-5;
        tubiaogailv_shuzu=new int[tubiaogailv_jishu];
        int gailv[70]={0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,8,8,9,9,10,10,10,10};
        //int gailv[70]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,8,8,9,9,10,10,10,10};
        for (int i=0;i<tubiaogailv_jishu;i++)
        {
            if(i<70)
            {
               *(tubiaogailv_shuzu+i)=gailv[i];
            }
            
            else
            {
                *(tubiaogailv_shuzu+i)=((i-70)%5+2);//图标2.3.4.5.6
            }
        }
    }*/
    
    /*
    else if(jingyandengji>5 &&jingyandengji<=10)
    {
        tubiaogailv_jishu=74;//20
        tubiaogailv_shuzu=new int[tubiaogailv_jishu];
        int gailv[74]={0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,8,8,9,9,10,10,10,10};
        
        for (int i=0;i<tubiaogailv_jishu;i++)
        {
            *(tubiaogailv_shuzu+i)=gailv[i];
        }
    }
    else if(jingyandengji>10 &&jingyandengji<=15)
    {
        tubiaogailv_jishu=20;//20 78
        tubiaogailv_shuzu=new int[tubiaogailv_jishu];
        
        //int gailv[78]={0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,8,8,9,9,10,10,10,10};
        //int gailv[20]={0,6,6,6,6,6,2,6,6,6,4,8,5,7,8,6,7,8,9,10};
        int gailv[20]={0,7,7,7,7,7,2,7,7,7,4,8,5,7,8,7,7,8,9,10};
        for (int i=0;i<tubiaogailv_jishu;i++)
        {
            *(tubiaogailv_shuzu+i)=gailv[i];
        }
    }
    else if(jingyandengji>15 &&jingyandengji<=20)
    {
        tubiaogailv_jishu=20;//20 78 82
        tubiaogailv_shuzu=new int[tubiaogailv_jishu];
        //int gailv[82]={0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,8,8,9,9,10,10,10,10};
        //int gailv[20]={0,6,6,6,6,6,2,6,6,6,4,8,5,7,8,6,7,8,9,10};
        int gailv[20]={0,7,7,7,7,7,2,7,7,7,4,8,5,7,8,6,7,8,9,10};
        for (int i=0;i<tubiaogailv_jishu;i++)
        {
            *(tubiaogailv_shuzu+i)=gailv[i];
        }
    }
    */
    for(int i=0;i<tubiaogailv_jishu;i++)
    {
        int r=CCRANDOM_0_1()*tubiaogailv_jishu;
        std::swap(*(tubiaogailv_shuzu+i),*(tubiaogailv_shuzu+r));
    }
}

//
// int changjingid=1;
// float unitheight=414/3/bigsmall_factor;
// int shangtugao=260;//slot…œ√Êµƒheight
// int kminturn=5;//3
// int iconscount=3; //≤‚ ‘”√4£¨9£¨º∏∏ˆÕº±ÍΩ¯»Î 3
// int iconscountminID=6;//Õº±Í◊Ó–°÷µ£¨¥”µ⁄º∏∏ˆÕº±Íø™ º7
// float sudu=0.1;//µ»”⁄0.15µƒª∞µ⁄ŒÂ¡–æÕ“∆∂Ø¡À18∏ˆ∂¯≤ª «15∏ˆ£¨¥Û”⁄–°”⁄∂º’˝≥£.∆Êπ÷£°0.12 0.1
// float viewwidth=640/bigsmall_factor;
// float viewheight=960/bigsmall_factor;
// //#define shangheight 270/bigsmall_factor //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©
// //∏ƒ∂Ø14
// float shangheight_yuan=270/bigsmall_factor; //…œ≤ø∑÷ “¿¥Œ270 85 414 191£®190ø…“‘£©
// float shangwidth=640/bigsmall_factor;
// float jingyanheight=85/bigsmall_factor; //…œ≤ø∑÷µΩ÷–º‰µƒº–≤„£®◊‹æ≠—È£©
// float jingyanwidth=300/bigsmall_factor;
// float kuangheight=414/bigsmall_factor;
// float kuangwidth=640/bigsmall_factor;
// float slotheight=120/bigsmall_factor;  //‘≠¿¥90
// float slotwidth=120/bigsmall_factor; //128£®¡–µƒøÌ∂»£©±»Ωœ∫œ  //‘≠¿¥90
// float qizhiwidth=30/bigsmall_factor;
// int layercount=5; //∂‡…Ÿ¡–
// float layerwidth=kuangwidth/layercount;
// int qiantag=101;
// int Xiannum=3;//25
// int fishsprite_tag=6;
// int fisheat_tag=600;
// int fishieat_jingyan=1;
// int qizhi_zuo_tag=603;
// int qizhi_you_tag=604;
// int xiantag=601;
// int kuangtag=602;
// int bonustiptag=605;
// int freespintag=789;
// int AgainFreeDialogLayerTag=788;
//

GlobalTime::GlobalTime(){}
GlobalTime::~GlobalTime(){}
//倒计时模块
void GlobalTime::daojishi(float fDelta)
{
    
    NowcoinsTime++;
    //CCLOG("daojishi new1");
    //÷ª‘⁄πÿø®—°‘Ò≥°æ∞∏¸∏ƒµπº∆ ±
    if (changjing==0)
    {
        if(lable_daojishi->getFontSize()!=30)
        {
            lable_daojishi->setFontSize(30);
        }
    int difftime_miao=NowcoinsTime-GotconisTime;
    if (difftime_miao<0)
    {
        do 
        {
         difftime_miao+=(24*3600);
        } while (difftime_miao<0);
    }
   
    if (difftime_miao>=0&&difftime_miao<=daojishitime)
    {
    int daojishi_xianshi=daojishitime-difftime_miao;
    int min=daojishi_xianshi/60;
    int sec=daojishi_xianshi%60;
    //string daojishistring;
  
    char buff1[2];
    sprintf(buff1, "%02d", min);
        string strbuffer1=buff1;
        //daojishistring=daojishistring+strbuffer1;
       // daojishistring.operator+=(string(buff1));
    //daojishistring+=buff1;
       // daojishistring.operator+=(":");
        strbuffer1+=":";
    //daojishistring=daojishistring+":";
    char buff2[2];
    sprintf(buff2, "%02d", sec);
         string strbuffer2=buff2;
        //CCLOG("daojishi new2");
        strbuffer1+=strbuffer2;
        //CCLOG("daojishi new3");
         //daojishistring.operator+=(strbuffer2);
        string daojishistring=strbuffer1;
        //CCLOG("daojishi new4");
        //daojishistring=daojishistring+strbuffer2;
    //daojishistring+=buff2;
       
    
    lable_daojishi->setString(daojishistring.c_str());//daojishistring.c_str()
        CCLOG("daojishi new5");
       // CCLOG("daojishistring.c_str()=%s",daojishistring.c_str());
    lable_daojishi->setColor(ccc3(255,255,255));
    pShijianItem->setEnabled(false);
    } 
    else if(difftime_miao>daojishitime)
     {//
        
        //string freecoinsstring;
 
        
         //freecoinsvalue=(difftime_miao-600)*freecoinsgrow[jingyandengji]+50;
          freecoinsvalue=((difftime_miao-daojishitime)*(float)freecoinsgrow[jingyandengji]/100+50)*100;
        lable_daojishi->setColor(ccc3(199,246,94));
   
        if (!freeconisReady)
        {
            freeconisReady=true;
         
           pShijianItem->setEnabled(true);
            pfreeconistishi->setVisible(true);
            float jiantouX=pShijianItem->getPositionX()+pShijianItem->getContentSize().width/2;
            float jiantouY=pShijianItem->getPositionY()+pShijianItem->getContentSize().height;
            CCActionInterval* actionMoveto1= CCMoveTo::create(0.4,ccp(jiantouX,jiantouY+20));
            CCActionInterval* actionMoveto2= CCMoveTo::create(0.4,ccp(jiantouX,jiantouY));
            CCActionInterval *shangxia =CCRepeatForever::create(CCSequence::create(actionMoveto1,actionMoveto2,actionMoveto1,actionMoveto2,NULL));
            pfreeconistishi->runAction(shangxia);
        }
       else if (freeconisReady)
       {
       
        if (freecoinsvalue<(freecoinsmax[jingyandengji]*100))
        {
             char buff[6];
             sprintf(buff, "%.2f", freecoinsvalue/100);
            lable_daojishi->setString(buff);
        }
        else
        {
         char buff[6];
         freecoinsvalue=freecoinsmax[jingyandengji]*100;
         sprintf(buff, "%.2f", freecoinsvalue/100);
         lable_daojishi->setString(buff);
         inactiveDaojishiTime();
        }
       }
     }   
    }
}

void GlobalTime::activeDaojishiTime()
{
    if (NowTimeIsGet)
    {
        CCDirector::sharedDirector()->getScheduler()->scheduleSelector(schedule_selector(GlobalTime::daojishi),this,1,false);

    }

}

void GlobalTime::inactiveDaojishiTime()
{

    CCDirector::sharedDirector()->getScheduler()->unscheduleSelector(schedule_selector(GlobalTime::daojishi),this);

}

//ktplay
//领取奖励
cocos2d::CCLayer *nowobject;

void dispatchRewards(KTRewardItemC *reward ,int lenght)
{
    
    int i=0;
    for(i=0;i<lenght;i++)
    {
        umeng::MobClickCpp::bonus((float)(reward[i].value), 2);//youmeng
        qian+=(float)(reward[i].value*100);
    }

    userDefault->setDoubleForKey("usrqian",qian);
    if(changjing==0)
    {
    ((MapChoose *)nowobject)->activeqian();
    Playyinxiao::play_jinbi();
    }
    else
    {
        ((HelloWorld *)nowobject)->activeqian();
        Playyinxiao::play_jinbi();
    }
    
}

void updateKTTip(bool hasNewActivities)
{
   
    if(changjing==0)
    {
      if(hasNewActivities)
         {
            ((MapChoose *)nowobject)->showKTTip(); //显示新动态提示
         }else
         {
            ((MapChoose *)nowobject)->hideKTTip(); //隐藏新动态提示
         }
    }
}

void onKTDisappear()
{
    if(changjing)
    {
      CCDirector::sharedDirector()->resume();
    }
}
void onKTAppear()
{
    if(changjing!=0)
    {
        CCDirector::sharedDirector()->pause();
    }
}
//