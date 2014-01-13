//
//  AppDelegate.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EveryDayViewController.h"
#import "NaoZhongViewController.h"
#define ShareApp ((AppDelegate * )[[UIApplication sharedApplication] delegate])


@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate>

{
  
    
    
}

@property (nonatomic ,retain) EveryDayViewController * everyDayViewController;
@property (nonatomic ,retain) NaoZhongViewController * naoZhongViewController;

@property (nonatomic ,retain) UIViewController * viewController;

@property (strong, nonatomic) UIWindow *window;

@end
