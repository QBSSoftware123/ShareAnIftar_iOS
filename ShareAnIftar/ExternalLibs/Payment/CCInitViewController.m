//
//  CCInitViewController.m
//  CCIntegrationKit
//
//  Created by test on 7/14/14.
//  Copyright (c) 2014 Avenues. All rights reserved.
//

#import "CCInitViewController.h"
#import "CCWebViewController.h"

@interface CCInitViewController ()

@end

@implementation CCInitViewController

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
    // Do any additional setup after loading the view.
    
    self.accessCode.delegate = self; self.merchantId.delegate = self;
    self.currency.delegate = self; self.amount.delegate = self;
    
//    self.accessCode = @"AVFT65DF54AD51TFDA";
//    self.merchantId = @"99763";
//    self.amount = @"100";
//    self.currency = @"INR";
//    self.redirectUrl = @"http://shareaniftar.com/ccavResponseHandler.php";
//    self.cancelUrl = @"http://shareaniftar.com/ccavResponseHandler.php";
//    self.rsaKeyUrl = @"http://www.shareaniftar.com/GetRSA.php";

    
    int randomNumber = (arc4random() % 9999999) + 1;
    [self orderId].text = [NSString stringWithFormat:@"%d",randomNumber];
    
    UIButton *nextBtn = (UIButton*)[self.view viewWithTag:1];
    [nextBtn addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)next:(id)sender {
    CCWebViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CCWebViewController"];
    
    controller.accessCode = self.accessCode.text;
    controller.merchantId = self.merchantId.text;
    controller.amount = self.amount.text;
    controller.currency = self.currency.text;
    controller.orderId = self.orderId.text;
    controller.redirectUrl = self.redirectUrl.text;
    controller.cancelUrl = self.cancelUrl.text;
    controller.rsaKeyUrl = self.rsaKeyUrl.text;
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)nextClick:(id)sender
{
    CCWebViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CCWebViewController"];
    
    controller.accessCode = self.accessCode.text;
    controller.merchantId = self.merchantId.text;
    controller.amount = self.amount.text;
    controller.currency = self.currency.text;
    controller.orderId = self.orderId.text;
    controller.redirectUrl = self.redirectUrl.text;
    controller.cancelUrl = self.cancelUrl.text;
    controller.rsaKeyUrl = self.rsaKeyUrl.text;
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:controller animated:YES completion:nil];
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)nextScreen:(id)sender {
    
    CCWebViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CCWebViewController"];
    
    controller.accessCode = self.accessCode.text;
    controller.merchantId = self.merchantId.text;
    controller.amount = self.amount.text;
    controller.currency = self.currency.text;
    controller.orderId = self.orderId.text;
    controller.redirectUrl = self.redirectUrl.text;
    controller.cancelUrl = self.cancelUrl.text;
    controller.rsaKeyUrl = self.rsaKeyUrl.text;
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:controller animated:YES completion:nil];

    
}
@end
