//
//  CCPOViewController.m
//  CCIntegrationKit
//
//  Created by test on 5/12/14.
//  Copyright (c) 2014 Avenues. All rights reserved.
//

#import "CCWebViewController.h"
#import "CCResultViewController.h"
#import "CCTool.h"

@interface CCWebViewController ()

@end

@implementation CCWebViewController

@synthesize rsaKeyUrl;@synthesize accessCode;@synthesize merchantId;@synthesize orderId;
@synthesize amount;@synthesize currency;@synthesize redirectUrl;@synthesize cancelUrl;
@synthesize merchant_param4;@synthesize merchant_param3;@synthesize merchant_param2;@synthesize merchant_param5;@synthesize delivery_address;@synthesize delivery_name;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewWeb.delegate = self;
   // AVDM77FD71CG80MDGC
    
  //  self.accessCode = @"AVFT65DF54AD51TFDA";
    self.accessCode = @"AVDM77FD71CG80MDGC";
    self.merchantId = @"99763";
//    self.amount = @"10";
    self.currency = @"INR";
    self.redirectUrl = @"http://shareaniftar.com/ccavResponseHandler.php";
    self.cancelUrl = @"http://shareaniftar.com/ccavResponseHandler.php";
    self.rsaKeyUrl = @"http://www.shareaniftar.com/GetRSA.php";
    self.delivery_name = @"iOS";

    
    //Getting RSA Key
    NSString *rsaKeyDataStr = [NSString stringWithFormat:@"access_code=%@&order_id=%u",accessCode,orderId];
    NSData *requestData = [NSData dataWithBytes: [rsaKeyDataStr UTF8String] length: [rsaKeyDataStr length]];
    NSMutableURLRequest *rsaRequest = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: rsaKeyUrl]];
    [rsaRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [rsaRequest setHTTPMethod: @"POST"];
    [rsaRequest setHTTPBody: requestData];
    NSData *rsaKeyData = [NSURLConnection sendSynchronousRequest: rsaRequest returningResponse: nil error: nil];
    NSString *rsaKey = [[NSString alloc] initWithData:rsaKeyData encoding:NSASCIIStringEncoding];
    rsaKey = [rsaKey stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    rsaKey = [NSString stringWithFormat:@"-----BEGIN PUBLIC KEY-----\n%@\n-----END PUBLIC KEY-----\n",rsaKey];
    NSLog(@"%@",rsaKey);
    
    //Encrypting Card Details
    NSString *myRequestString = [NSString stringWithFormat:@"amount=%@&currency=%@",amount,currency];
    CCTool *ccTool = [[CCTool alloc] init];
    NSString *encVal = [ccTool encryptRSA:myRequestString key:rsaKey];
    encVal = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                        (CFStringRef)encVal,
                                                                        NULL,
                                                                        (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                        kCFStringEncodingUTF8 ));
    
    //Preparing for a webview call
    NSString *urlAsString = [NSString stringWithFormat:@"https://secure.ccavenue.com/transaction/initTrans"];
    NSString *encryptedStr = [NSString stringWithFormat:@"merchant_id=%@&order_id=%u&redirect_url=%@&cancel_url=%@&enc_val=%@&access_code=%@&delivery_address=%@&merchant_param2=%@&merchant_param3=%@&merchant_param4=%@&merchant_param5=%ld&delivery_name=%@",merchantId,orderId,redirectUrl,cancelUrl,encVal,accessCode,delivery_address,merchant_param2,merchant_param3,merchant_param4,(long)merchant_param5,delivery_name];
    NSLog(@"-------%@",encryptedStr);
    NSData *myRequestData = [NSData dataWithBytes: [encryptedStr UTF8String] length: [encryptedStr length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: urlAsString]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [request setValue:urlAsString forHTTPHeaderField:@"Referer"];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: myRequestData];
    [_viewWeb loadRequest:request];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *string = webView.request.URL.absoluteString;
    if ([string rangeOfString:@"/ccavResponseHandler.php"].location != NSNotFound) {
        NSString *html = [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.outerHTML"];
        
        NSString *transStatus = @"Not Known";
        
        if (([html rangeOfString:@"Aborted"].location != NSNotFound) ||
            ([html rangeOfString:@"Cancel"].location != NSNotFound)) {
            transStatus = @"Transaction Cancelled";
        }else if (([html rangeOfString:@"Success"].location != NSNotFound)) {
            transStatus = @"Transaction Successful";
        }else if (([html rangeOfString:@"Fail"].location != NSNotFound)) {
            transStatus = @"Transaction Failed";
        }
            [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(dispalyHome) userInfo:nil repeats:NO];
    }
}

-(void)dispalyHome
{
    NSLog(@"GoHome");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
    [[UIApplication sharedApplication].keyWindow setRootViewController:rootViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
