//
//  IOSIAP_Bridge.cpp
//  list1
//
//  Created by newy on 14-4-18.
//
//

#include "IOSIAP_Bridge.h"
#include "ResouceDefine.h"
#include "MobClickCpp.h"//youmeng
#include "mapchoose.h"
#include "HelloWorldScene.h"
using namespace cocos2d;
IOSiAP_Bridge::IOSiAP_Bridge()
{
    iap = new IOSiAP();
    iap->delegate = this;
}

IOSiAP_Bridge::~IOSiAP_Bridge()
{
    delete iap;
}

//void IOSiAP_Bridge:: requestProducts(std::vector <std::string> &identifiers)
void IOSiAP_Bridge:: requestProducts()
{
    if(yaomaiID==1)
    {
        std::vector <std::string> identifiers(1,"com.newy.applefly.consumable01");
         iap->requestProducts(identifiers);
    }
    else if(yaomaiID==2)
    {
         std::vector <std::string> identifiers(1,"com.newy.applefly.consumable02");
         iap->requestProducts(identifiers);
    }
    else if(yaomaiID==3)
    {
         std::vector <std::string> identifiers(1,"com.newy.applefly.consumable03");
         iap->requestProducts(identifiers);
    }
    else if(yaomaiID==4)
    {
         std::vector <std::string> identifiers(1,"com.newy.applefly.consumable04");
         iap->requestProducts(identifiers);
    }
    else if(yaomaiID==5)
    {
         std::vector <std::string> identifiers(1,"com.newy.applefly.consumable05");
         iap->requestProducts(identifiers);
    }
    else if(yaomaiID==6)
    {
         std::vector <std::string> identifiers(1,"com.newy.applefly.consumable06");
         iap->requestProducts(identifiers);
    }
    //std::vector <std::string> identifiers(1,"com.newy.applefly.consumable00");
    //productIdentifiers.push_back(<#const value_type &__x#>)    ="com.newy.applefly.consumable00";
   
}



void IOSiAP_Bridge::onRequestProductsFinish(void)
{
    //必须在onRequestProductsFinish后才能去请求iAP产品数据。
    std::string identifier;
    if(yaomaiID==1)
    {
        identifier="com.newy.applefly.consumable01";
        
    }
    else if(yaomaiID==2)
    {
       identifier="com.newy.applefly.consumable02";
    }
    else if(yaomaiID==3)
    {
        identifier="com.newy.applefly.consumable03";
    }
    else if(yaomaiID==4)
    {
         identifier="com.newy.applefly.consumable04";
    }
    else if(yaomaiID==5)
    {
        identifier="com.newy.applefly.consumable05";
    }
    else if(yaomaiID==6)
    {
       identifier="com.newy.applefly.consumable06";
    }
    //std::string identifier="com.newy.applefly.consumable00";//new add
    IOSProduct *product = iap->iOSProductByIdentifier(identifier);
    // 然后可以发起付款请求。
    quantity=1;
    iap->paymentWithProduct(product, quantity);
}

void IOSiAP_Bridge::onRequestProductsError(int code)
{
    //这里requestProducts出错了，不能进行后面的所有操作。
    //CCLOG("liancuo");
     const char *pLabelStr = ((CCString*)(loacalstrings->objectForKey("unabletoconnect")))->m_sString.c_str();
    CCMessageBox(pLabelStr,"");
    if(nowobject->getChildByTag(zhegaitag))
    {
        if(changjing==0)
        {
            ((MapChoose *)nowobject)->menu->setEnabled(true);
            ((MapChoose *)nowobject)->pmenu->setEnabled(true);
        }
        else
        {
            ((HelloWorld *)nowobject)->pMenu->setEnabled(true);
            
        }
        (nowobject->getChildByTag(zhegaitag))->removeFromParentAndCleanup(true);
    }

}

void IOSiAP_Bridge::onPaymentEvent(std::string &identifier, IOSiAPPaymentEvent event, int quantity)
{
    
    if (event == IOSIAP_PAYMENT_PURCHAED )
    {
        if(nowobject->getChildByTag(zhegaitag))
        {
            if(changjing==0)
            {
                ((MapChoose *)nowobject)->menu->setEnabled(true);
                ((MapChoose *)nowobject)->pmenu->setEnabled(true);
            }
            else
            {
                ((HelloWorld *)nowobject)->pMenu->setEnabled(true);
                
            }
            (nowobject->getChildByTag(zhegaitag))->removeFromParentAndCleanup(true);
        }
       
        if(identifier=="com.newy.applefly.consumable01")
        {
            // 充值.
             umeng::MobClickCpp::pay(12, 1, 4400);//youmeng
           
            qian+=(4400*100);
        }
        else if(identifier=="com.newy.applefly.consumable02")
        {
            umeng::MobClickCpp::pay(30, 1, 12000);//youmeng
           qian+=(12000*100);
        }
        else if(identifier=="com.newy.applefly.consumable03")
        {
            umeng::MobClickCpp::pay(68, 1, 26000);//youmeng
            qian+=(26000*100);
        }
        else if(identifier=="com.newy.applefly.consumable04")
        {
            umeng::MobClickCpp::pay(128, 1, 60000);//youmeng
            qian+=(60000*100);
        }
        else if(identifier=="com.newy.applefly.consumable05")
        {
            umeng::MobClickCpp::pay(328, 1, 175000);//youmeng
            qian+=(175000*100);
        }
        else if(identifier=="com.newy.applefly.consumable06")
        {
            umeng::MobClickCpp::pay(648, 1, 1000000);//youmeng
            qian+=(1000000*100);
        }
        //CCLog("ok zhifu");
        
        //付款成功了，可以吧金币发给玩家了。
       
      
        char string[30] = {0};
        sprintf(string, "%.2f", qian/100);
       // CCLOG("labelbm->retainCount()=%d",labelbm->retainCount());
        labelbm->setString(string);
        userDefault->setDoubleForKey("usrqian",qian);
        userDefault->flush();
    }
    //其他状态依情况处理掉。
    else
    {
        if(nowobject->getChildByTag(zhegaitag))
        {
            if(changjing==0)
            {
                ((MapChoose *)nowobject)->menu->setEnabled(true);
                ((MapChoose *)nowobject)->pmenu->setEnabled(true);
            }
            else
            {
                ((HelloWorld *)nowobject)->pMenu->setEnabled(true);
                
            }
            (nowobject->getChildByTag(zhegaitag))->removeFromParentAndCleanup(true);
        }
    }
   
}

