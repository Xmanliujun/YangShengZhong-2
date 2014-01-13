//
//  RootViewController.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "RootViewController.h"
#import "MyButton.h"
#import "EveryDayViewController.h"
#import "MiFangViewController.h"
#import "LiLunCViewController.h"
#import "FangFaViewController.h"

#import "LiBiaoTableViewController.h"

#import "AppDelegate.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        

        
    }
    return self;
}

-(void)meiTian:(MyButton *)btn
{
    NSLog(@"meitian");
    EveryDayViewController * e  = [[EveryDayViewController alloc] init];
    UINavigationController * nav  = [[UINavigationController alloc] initWithRootViewController:e];
    e.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; 
    [self presentViewController:nav animated:YES completion:NULL];
    
    
    
}

-(void)mifang:(MyButton *)btn
{
     NSLog(@"mifang");
//    MiFangViewController * m = [[MiFangViewController alloc] init];
//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:m];
//    m.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:nav animated:YES completion:NULL];
    
    
    LiBiaoTableViewController * l  =[[LiBiaoTableViewController alloc] initWithNumber:@"1"];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:l];
    l.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
}

-(void)liLun:(MyButton *)btn
{
  
    
    NSLog(@"lilun");
    LiLunCViewController * l = [[LiLunCViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:l];
    l.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];

    
    
    
}

-(void)fangfa:(MyButton *)btn
{
     NSLog(@"fangfa");
//    FangFaViewController * f = [[FangFaViewController alloc] init];
//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:f];
//    f.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:nav animated:YES completion:NULL];
    
    LiBiaoTableViewController * l  =[[LiBiaoTableViewController alloc] initWithNumber:@"2"];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:l];
    l.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];


}

-(void)shezhi:(MyButton *)btn
{
     NSLog(@"shezhi");
    

    
}

- (float)getIOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

-(void)httpNumber
{

    //http://139.210.99.29:8090/query.aspx
    //http://139.210.99.29:8090/query.aspx?id=2
    NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:8090/query.aspx?id=2"];
    
    NSURL * url = [NSURL URLWithString:strUrl];
    
    numRequset = [ASIHTTPRequest requestWithURL:url];
    numRequset.delegate = self;
    numRequset.tag = 999;
    [numRequset startAsynchronous];



}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
 
    if (alertView.tag == 101) {
        if (buttonIndex==0) {
            //app 下载网址  
            
            NSString *webLink = @"https://itunes.apple.com/us/app/bu-shen-jian-shen-bao-dian/id695438455?ls=1&mt=8";
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:webLink]];
            
        }else
        {
            NSLog(@"取消");
            
        }
    }
    
}
-(void)requestFinished:(ASIHTTPRequest *)request
{

    NSLog(@"%@",[request responseString]);
    
    NSString * stringNum = [NSString stringWithFormat:@"%@",[request responseString]];
    NSLog(@"返回版本号： %@",stringNum);
    
    
    NSDictionary* infoDict =[[NSBundle mainBundle] infoDictionary];
    // 工程的版本号
    NSString* versionNum =[infoDict objectForKey:@"CFBundleVersion"];
    //工程名字
    // NSString*appName =[infoDict objectForKey:@"CFBundleDisplayName"];
    
    NSLog(@"当前工程版本号  %@",versionNum);
    
   
    
    if (![stringNum isEqualToString:versionNum]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                       message:@"检测到最新版本前去更新!"
                                                      delegate:self
                                             cancelButtonTitle:@"确认"
                                             otherButtonTitles:@"取消",nil ];
        alert.tag = 101;
        [alert show];
       
        
    }else{
        
        NSLog(@"版本没有更新!");
        
    }

        
    
    
    
    
}
-(void)requestFailed:(ASIHTTPRequest *)request
{
   
    NSLog(@"error is %@",[request responseString]);
    
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    
    
    NSLog(@" 系统版本号 ：%f",[self getIOSVersion]);
   // self.view.window.windowLevel = UIWindowLevelStatusBar+0.1;

    
    [self httpNumber];
    
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    NSLog(@"sssss   ssss  %d",__IPHONE_OS_VERSION_MAX_ALLOWED);
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
 
    //[self.navigationController.navigationBar setBackgroundImage:<#(UIImage *)#> forBarMetrics:<#(UIBarMetrics)#>]
    
    NSLog(@"%f",self.view.bounds.size.height);
    NSLog(@"%f",self.view.bounds.size.width);
    fview = [[FrootView alloc] initWithFloat:self.view.bounds.size.height];
    fview.frame = self.view.bounds;
    [fview.meiTianbtn addTarget:self action:@selector(meiTian:) forControlEvents:UIControlEventTouchUpInside];
    [fview.miFangbtn addTarget:self action:@selector(mifang:) forControlEvents:UIControlEventTouchUpInside];
    [fview.liLunbtn addTarget:self action:@selector(liLun:) forControlEvents:UIControlEventTouchUpInside];
    [fview.fangFabtn addTarget:self action:@selector(fangfa:) forControlEvents:UIControlEventTouchUpInside];
    [fview.sheZhibtn addTarget:self action:@selector(shezhi:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:fview];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
