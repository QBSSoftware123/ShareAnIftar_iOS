//
//  CCResultViewController.m
//  CCIntegrationKit
//
//  Created by test on 5/16/14.
//  Copyright (c) 2014 Avenues. All rights reserved.
//

#import "CCResultViewController.h"

@interface CCResultViewController ()

@end

@implementation CCResultViewController
@synthesize transStatus;

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
    self.resultLabel.text = transStatus;
    [self.resultLabel reloadInputViews];
  //  [self performSelector:@selector(goBackButton:) withObject:nil afterDelay:3.0];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBackButton:(id)sender
{
//    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//    self.window?.rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "TabBarVC")
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
    [[UIApplication sharedApplication].keyWindow setRootViewController:rootViewController];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
