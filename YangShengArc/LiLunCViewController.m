//
//  LiLunCViewController.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "LiLunCViewController.h"
#import "MshiViewController.h"
#import "MyaoViewController.h"
#import "MyudViewController.h"
#import "MpianViewController.h"
#import "NingViewController.h"

#import "LiBiaoTableViewController.h"


@interface LiLunCViewController ()

@end

@implementation LiLunCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)ningButton:(MyButton *)btn
{

    
    LiBiaoTableViewController * l  =[[LiBiaoTableViewController alloc] initWithNumber:@"16"];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:l];
    l.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];


}

-(void)btnOneal:(MyButton *)btn
{
    NSLog(@"btnone");

    

    LiBiaoTableViewController * l  =[[LiBiaoTableViewController alloc] initWithNumber:@"17"];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:l];
    l.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];

    
    
}
-(void)btnTwoal:(MyButton *)btn
{
    NSLog(@"btntwo");

    
    
    LiBiaoTableViewController * l  =[[LiBiaoTableViewController alloc] initWithNumber:@"18"];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:l];
    l.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];

    
}
-(void)btnThral:(MyButton *)btn
{
    NSLog(@"btnthr");
    

    
    LiBiaoTableViewController * l  =[[LiBiaoTableViewController alloc] initWithNumber:@"13"];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:l];
    l.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];

    
}
-(void)btnFoual:(MyButton *)btn
{
    NSLog(@"btnfur");
    

    
    LiBiaoTableViewController * l  =[[LiBiaoTableViewController alloc] initWithNumber:@"15"];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:l];
    l.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];

    
    
    
}

-(void)btnFanHui:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
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

    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"6.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 30, 40);
    [btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bkbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bkbtn;

    
    mView = [[MiView alloc] initWithFloat:self.view.bounds.size.height];
    mView.frame = self.view.bounds;
    [mView.ningBtn addTarget:self action:@selector(ningButton:) forControlEvents:UIControlEventTouchUpInside];
    [mView.btnOne addTarget:self action:@selector(btnOneal:) forControlEvents:UIControlEventTouchUpInside];
    [mView.btnTwo addTarget:self action:@selector(btnTwoal:) forControlEvents:UIControlEventTouchUpInside];
    [mView.btnThr addTarget:self action:@selector(btnThral:) forControlEvents:UIControlEventTouchUpInside];
    [mView.btnFou addTarget:self action:@selector(btnFoual:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mView];

    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
