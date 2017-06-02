//
//  CCPOViewController.h
//  CCIntegrationKit
//
//  Created by test on 5/12/14.
//  Copyright (c) 2014 Avenues. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCWebViewController : UIViewController <UIWebViewDelegate>
    @property (strong, nonatomic) IBOutlet UIWebView *viewWeb;
    @property (strong, nonatomic) NSString *accessCode;
    @property (strong, nonatomic) NSString *merchantId;
    @property (assign, nonatomic) uint32_t orderId;
    @property (strong, nonatomic) NSString *amount;
    @property (strong, nonatomic) NSString *currency;
    @property (strong, nonatomic) NSString *redirectUrl;
    @property (strong, nonatomic) NSString *cancelUrl;
    @property (strong, nonatomic) NSString *rsaKeyUrl;
    @property (strong, nonatomic) NSString * delivery_address;
    @property (strong, nonatomic) NSString * delivery_name;
    @property (strong, nonatomic) NSString * merchant_param2;
    @property (strong, nonatomic) NSString * merchant_param3;
    @property (strong, nonatomic) NSString * merchant_param4;
    @property (nonatomic, assign) NSInteger merchant_param5;

@end
