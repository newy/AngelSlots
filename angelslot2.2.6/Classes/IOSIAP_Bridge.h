//
//  11.h
//  list1
//
//  Created by newy on 14-4-18.
//
//


#ifndef list1__1_h
#define list1__1_h

#include"IOSiAP.h"
#include "cocos2d.h"

using namespace
cocos2d;class IOSiAP_Bridge : public IOSiAPDelegate
{
public:
    IOSiAP_Bridge();
    ~IOSiAP_Bridge();
    IOSiAP *iap;
    //void requestProducts(std::vector <std::string> &identifiers);
    void  requestProducts();
    virtual void onRequestProductsFinish(void);
    virtual void onRequestProductsError(int code);
    virtual void onPaymentEvent(std::string &identifier, IOSiAPPaymentEvent event, int quantity);
    int quantity;
};

#endif
