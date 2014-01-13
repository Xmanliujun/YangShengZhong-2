//
//  MyRootViewController.m
//  YangShengArc
//
//  Created by 刘军 on 13-8-6.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "MyRootViewController.h"

#import "AppDelegate.h"

@interface MyRootViewController ()

@end

@implementation MyRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
        
        AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        app.viewController = self;
        

        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
