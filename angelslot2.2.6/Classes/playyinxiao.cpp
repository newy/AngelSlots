#include "playyinxiao.h"
#include "SimpleAudioEngine.h"
#include "ResouceDefine.h"



CCScene* Playyinxiao::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();

    // 'layer' is an autorelease object
    Playyinxiao *layer = Playyinxiao::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;

}

// on "init" you need to initialize your instance
bool Playyinxiao::init()
{
    bool bRet = false;
    do 
    {
        if(!CCLayer::init())
        {
            return false;
        };
        CCDirector::sharedDirector()->setNotificationNode(NULL);
        CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();

        bRet = true;


    } while (0);

    return bRet;
}







// void Playyinxiao::scrollViewDidScroll(cocos2d::extension::CCScrollView *view)
// {
// 
// }
// 
// void Playyinxiao::scrollViewDidZoom(cocos2d::extension::CCScrollView *view)
// {
// }

void Playyinxiao::onEnter()
{
    CCLayer::onEnter();
    CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(this, -128, false);
}
void Playyinxiao::onExit()
{
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
    CCLayer::onExit();
}
void Playyinxiao::preload()
{
    if(changjing==0)
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadBackgroundMusic(mapmusic_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(jinbi_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(anjianall_m);
     
    }
    else if(changjing==1)
    {
    //CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(zhuan_start_m);//start
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(anjianall_m);
     CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadBackgroundMusic(zhuan_start_gk1_m);//移植移到yinxiao；类处理
    //CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(zhuan_start_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangtip_m_1);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangtip_m_2);
        
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangli_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(xiaojiangli_m_1);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(xiaojiangli_m_2);
        
     CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(start_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(slidend_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(shengji_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(gudian_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonustip_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(scattertip_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(ruchang_gk1_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(jiangsu_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(jiangsu_quxiao_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(yushieat_m); 
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_ruchang_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_start_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_anjian_m); 
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_start_m); 
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_caidui_m);
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_caicuo_m);  
     
    
    }
    else if(changjing==2)
    {
        //CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(zhuan_start_m);//start
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(anjianall_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadBackgroundMusic(zhuan_start_gk1_m);//移植移到yinxiao；类处理
        //CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(zhuan_start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangtip_m_1);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangtip_m_2);
        
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangli_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(xiaojiangli_m_1);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(xiaojiangli_m_2);
         CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(slidend_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(shengji_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(gudian_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonustip_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(scattertip_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(ruchang_gk2_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(jiangsu_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(jiangsu_quxiao_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(yushieat_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_dejiang);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_ruchang_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_anjian_m); 
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_start_m); 
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_caidui_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_caicuo_m);  
    }
    else if(changjing==3)
    {
        //CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(zhuan_start_m);//start
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(anjianall_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadBackgroundMusic(zhuan_start_gk1_m);//移植移到yinxiao；类处理
        //CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(zhuan_start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangtip_m_1);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangtip_m_2);
        
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangli_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(xiaojiangli_m_1);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(xiaojiangli_m_2);
         CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(slidend_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(shengji_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(gudian_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonustip_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(scattertip_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_dejiang);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(ruchang_gk3_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(jiangsu_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(jiangsu_quxiao_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(yushieat_m); 
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_dejiang);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_start_gk3_m);
        
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_anjian_m); 
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_start_m); 
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_caidui_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_caicuo_m); 
        
    }
    else if(changjing==4)
    {
        //CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(zhuan_start_m);//start
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(anjianall_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadBackgroundMusic(zhuan_start_gk1_m);//移植移到yinxiao；类处理
        //CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(zhuan_start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangtip_m_1);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangtip_m_2);
        
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(dajiangli_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(xiaojiangli_m_1);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(xiaojiangli_m_2);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(slidend_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(shengji_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(gudian_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonustip_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(scattertip_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_dejiang);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(ruchang_gk4_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(jiangsu_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(jiangsu_quxiao_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(yushieat_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_dejiang);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_start_gk3_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(bonus_pa_gk4_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_anjian_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_start_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_caidui_m);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(guess_caicuo_m);
        
    }

}

void Playyinxiao::stopeffect()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
    CocosDenshion::SimpleAudioEngine::sharedEngine()->stopAllEffects();
    }
}
void Playyinxiao::resumeEffect()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->resumeAllEffects();
    }
}
void Playyinxiao::stopmusic()
{
CocosDenshion::SimpleAudioEngine::sharedEngine()->stopBackgroundMusic();
}

// void  Playyinxiao::preload_mapmusic()
// {
//      CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadBackgroundMusic(mapmusic_m);
// }

// void Playyinxiao::playmapmusic()
// {
// CCLOG("backmusic=%d",CocosDenshion::SimpleAudioEngine::sharedEngine()->isBackgroundMusicPlaying());
//     if ((userDefault->getIntegerForKey("usrgcMUSICSTATE")==0)&&!CocosDenshion::SimpleAudioEngine::sharedEngine()->isBackgroundMusicPlaying())
//     {
//       CCLOG("playmusic!!!!!!!!!!");
//         CocosDenshion::SimpleAudioEngine::sharedEngine()->playBackgroundMusic(mapmusic_m,true);
//         //CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(zhuan_start_m,false);
//     }
//    
// }
void Playyinxiao::play_anjian()
{
    
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(anjianall_m,false);
    }
    
}
void Playyinxiao::play_gudian()
{
    Playyinxiao::stopmusic();
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(gudian_m,true);
    }

}

void Playyinxiao::playmusic()
{
    Playyinxiao::stopmusic();
    if ((userDefault->getIntegerForKey("usrgcMUSICSTATE")==0)&&!CocosDenshion::SimpleAudioEngine::sharedEngine()->isBackgroundMusicPlaying())
    {
        if (changjing==0)
         {
             CocosDenshion::SimpleAudioEngine::sharedEngine()->playBackgroundMusic(mapmusic_m,true);
         } 
        else if(changjing==1)
         {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playBackgroundMusic(zhuan_start_gk1_m,false);
         }
         //guesee
        else if(changjing==10)
         {
           // CCLOG("isBackgroundMusicPlaying()=%d" ,CocosDenshion::SimpleAudioEngine::sharedEngine()->isBackgroundMusicPlaying());
            CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadBackgroundMusic(guess_start_m);
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playBackgroundMusic(guess_start_m,true);
         }
        else
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playBackgroundMusic(zhuan_start_gk1_m,false);
        }
    }
}
// void Playyinxiao::playmusic_gk1()
// {
//     if (userDefault->getIntegerForKey("usrgcMUSICSTATE"))
//     {
//        CocosDenshion::SimpleAudioEngine::sharedEngine()->playBackgroundMusic(zhuan_start_m,false);
//        //CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(zhuan_start_m,false);
//     }
// }

void Playyinxiao::play_ruchangeffect()
{
    //1,2,3,11,21,31
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        if (changjing==1)
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(ruchang_gk1_m,false);
        } 
        else if(changjing==2)
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(ruchang_gk2_m,false);
        }
        else if(changjing==3)
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(ruchang_gk3_m,false);
        }
        else
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(ruchang_gk4_m,false);
        }
    }
}
void Playyinxiao::play_starteffect()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(start_m,false);
    }
}

//列结束遇到特殊图标


    void Playyinxiao::play_dajiangli()
    {
     if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
        {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(dajiangli_m,false);
        }
    }
//小奖励
void Playyinxiao::play_xiaojiangli_1()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(xiaojiangli_m_1,false);
    }
}
void Playyinxiao::play_xiaojiangli_2()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(xiaojiangli_m_2,false);
    }
}
void Playyinxiao::play_dajiangtip_1()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
       CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(dajiangtip_m_1,false);
    }
}

void Playyinxiao::play_dajiangtip_2()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(dajiangtip_m_2,false);
    }
}
//普通列结束
void Playyinxiao::play_slidend()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(slidend_m,false);

    }
}
void Playyinxiao::play_jinbi()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(jinbi_m,false);

    }
}


void Playyinxiao::play_shengji()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(shengji_m,false);

    }

}
void Playyinxiao::play_bonustip()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(bonustip_m,false);

    }
}
void Playyinxiao::play_scatter()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(scattertip_m,false);

    }
}


    void Playyinxiao::play_yushieat()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(yushieat_m,false);

    }
}

//bonus
void Playyinxiao::play_ruchangbonus()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        if (changjing==11)
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(bonus_ruchang_m,true);
        }
        else
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(bonus_ruchang_m,true);
        }
        

    }
}


void Playyinxiao::play_startbonus()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {   if (changjing==11)
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(bonus_start_m,false);
        } 
        else
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(bonus_start_gk3_m,false);
        }
        

    }
}
void Playyinxiao::play_bonus_gk4_pa()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(bonus_pa_gk4_m,false);
        
    }
}


void Playyinxiao::play_jiansu()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(jiangsu_m,false);

    }
}
void Playyinxiao::play_jiansu_quxiao()
{
    
        if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(jiangsu_quxiao_m,false);

        }
}

void Playyinxiao::play_dejiangbonus()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(bonus_dejiang,false);

    }
}

//guess
    void Playyinxiao::play_ruchangguess()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(guess_start_m,true);

    }
}


    void Playyinxiao::play_anjianguess()
{
    if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
    {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(guess_anjian_m,false);

    }
}
    void Playyinxiao::play_caiduiguess()
    {
        if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(guess_caidui_m,false);

        }
    }

    void Playyinxiao::play_caicuoguess()
    {
        if (userDefault->getBoolForKey("usrgcEFFECTSTATE"))
        {
            CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(guess_caicuo_m,false);

        }
    }




// bool Playyinxiao::ccTouchBegan(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
// {
//     sethuadong(true);
//     touchPoint = pTouch->getLocation();
//     scrollPoint=scrollView->getContentOffset();
//     return true;
// }

// void Playyinxiao::ccTouchMoved(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
// {
// 
//     CCPoint nowPoint = pTouch->getLocation();
//     //gensui(nowPoint.x-touchPoint.x);
//     gensui(nowPoint.y-touchPoint.y);
// 
// 
// }

// void Playyinxiao::ccTouchEnded(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
// {
// 
//     //sethuadong()
//     CCPoint endPoint = pTouch->getLocation();
//     //adjustScrollView(endPoint.x-touchPoint.x);
//     adjustScrollView(endPoint.y-touchPoint.y);
// }
// 
// void Playyinxiao::ccTouchCancelled(cocos2d::CCTouch *pTouch, cocos2d::CCEvent *pEvent)
// {
//     CCPoint endPoint = pTouch->getLocation();
//     adjustScrollView(endPoint.x-touchPoint.x);
// }

