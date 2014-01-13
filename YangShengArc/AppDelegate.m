//
//  AppDelegate.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"

#import "EveryDayViewController.h"
#import "HelpViewController.h"


@implementation AppDelegate




@synthesize viewController;

- (id)init
{
    if(self = [super init])
    {
        
       
    }
    return self;
}


- (void)initializePlat
{
    //添加新浪微博应用  a 3201194191  0334252914651e8f76bad63337b3b78f  http://appgo.cn
    
    [ShareSDK connectSinaWeiboWithAppKey:@"3206544636"
                               appSecret:@"741d2df0b1c3c6138782fdf7a2fa4e44"
                             redirectUri:@"http://www.tripg.com"];
    
    //添加腾讯微博应用  a 801394489 6e220d4df798e7b424e107868250102c http://t.qq.com/liujunxx 801307650  ae36f4ee3946e1cbb98d6965b0b2ff5c  http://www.sharesdk.cn
    [ShareSDK connectTencentWeiboWithAppKey:@"801394879"
                                  appSecret:@"b02e636ed09d3edc9a086dca641ea3d8"
                                redirectUri:@"http://www.tripg.com"];
    
    /*
    //添加Facebook应用
    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
     
    //添加QQ空间应用
    [ShareSDK connectQZoneWithAppKey:@"100371282"
                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"];
    
    //添加网易微博应用
    [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
                              appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
                            redirectUri:@"http://www.shareSDK.cn"];
    
     //添加搜狐微博应用
     [ShareSDK connectSohuWeiboWithConsumerKey:@"SAfmTG1blxZY3HztESWx"
     consumerSecret:@"yfTZf)!rVwh*3dqQuVJVsUL37!F)!yS9S!Orcsij"
     redirectUri:@"http://www.sharesdk.cn"];
     
     
    //添加豆瓣应用
    [ShareSDK connectDoubanWithAppKey:@"07d08fbfc1210e931771af3f43632bb9"
                            appSecret:@"e32896161e72be91"
                          redirectUri:@"http://dev.kumoway.com/braininference/infos.php"];
    
    //添加人人网应用
    [ShareSDK connectRenRenWithAppKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                            appSecret:@"f29df781abdd4f49beca5a2194676ca4"];
    
    //添加开心网应用
    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
                            appSecret:@"da32179d859c016169f66d90b6db2a23"
                          redirectUri:@"http://www.sharesdk.cn/"];
    
    //添加Instapaper应用
    [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
                                appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
    
    //添加有道云笔记应用
    [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
                                consumerSecret:@"d98217b4020e7f1874263795f44838fe"
                                   redirectUri:@"http://www.sharesdk.cn/"];
    
    //添加Facebook应用
    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    
    //添加Twitter应用
    [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
                             consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
                                redirectUri:@"http://www.sharesdk.cn"];
    
   
     //添加搜狐随身看应用
     [ShareSDK connectSohuKanWithAppKey:@"e16680a815134504b746c86e08a19db0"
     appSecret:@"b8eec53707c3976efc91614dd16ef81c"
     redirectUri:@"http://sharesdk.cn"];
     
     //添加Pocket应用
     [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
     redirectUri:@"pocketapp1234"];
     
     //添加印象笔记应用
     [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
     consumerKey:@"sharesdk-7807"
     consumerSecret:@"d05bf86993836004"];
     
     */
    
}



-(void)ShowHelpNavigation
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *firstUseApp = [userDefaults objectForKey:@"FirstUseApp"] ;
    
    if(firstUseApp == nil)
    {
        [userDefaults setValue:@"1" forKey:@"FirstUseApp"];
        [userDefaults synchronize];
        
        HelpViewController* guide = [[HelpViewController alloc] init];
        
        self.window.rootViewController = guide;
        
        
    }
    
    
    
    
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *firstUseApp = [userDefaults objectForKey:@"FirstUseApp"] ;
    
    if (firstUseApp == nil) {
        
        [self ShowHelpNavigation];
        
    }else{


    RootViewController * rvc = [[RootViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:rvc];
    self.window.rootViewController = nav;
    application.applicationIconBadgeNumber = 0;
      
        
        
        
    [ShareSDK registerApp:@"520520test"];
    [self initializePlat];
    
    [ShareSDK connectWeChatWithAppId:@"wx6dd7a9b94f3dd72a"
                           wechatCls:[WXApi class]];

    }
    
    [self.window makeKeyAndVisible];
    return YES;
}




- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString  *)sourceApplication
         annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    //点击提示框的打开
   // application.applicationIconBadgeNumber = 0;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"练功时间到啦!"
                                                    message:notification.alertBody
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:@"重置",nil];
    [alert show];
    //这里，你就可以通过notification的useinfo，干一些你想做的事情了
    application.applicationIconBadgeNumber -= 1;

    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 0) {
        NSLog(@"0");
    }else{
        NSLog(@"1重置");
     
        //  [self.everyDayViewController sheTimebtna:nil];
       
        
        
        NaoZhongViewController * n = [[NaoZhongViewController alloc] init];
        UINavigationController * nav  = [[UINavigationController alloc] initWithRootViewController:n];
        n.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [viewController presentViewController:nav animated:YES completion:NULL];
   
    
    }

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    //当程序还在后台运行
    application.applicationIconBadgeNumber = 0;
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
