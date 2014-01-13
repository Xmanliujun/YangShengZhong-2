//
//  EveryDayViewController.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EveryView.h"
#import "DayEveryView.h"
#import "DataTimeView.h"
#import "MiFangShuJvJson.h"

#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "ASIHTTPRequest.h"

#import "ShareMoreView.h"

#import "MyRootViewController.h"
#import "LoadingView.h"

#import <StoreKit/StoreKit.h>  

enum{
    IAP0p99=10,
    IAP1p99,
    IAP4p99,
    IAP9p99,
    IAP24p99,
}buyCoinsTag;



@interface EveryDayViewController : MyRootViewController
<UITableViewDelegate,UITableViewDataSource,ASIHTTPRequestDelegate,SKProductsRequestDelegate,SKPaymentTransactionObserver>
{
    EveryView * eView;
    DayEveryView * deView;
    DataTimeView * dataTimeView;
    NSString * strTime;
    NSMutableDictionary * dict;
    UIDatePicker * datePicker;
    NSString *key;
    
    MPMoviePlayerViewController *pvc;
    ASIHTTPRequest * r;
    BOOL rOnebool;
    UIProgressView* pv;
    
    UIView * v;
    
    ShareMoreView * s;
    
    //定时器
    NSTimer * timer;
    NSTimer * lodingTimer;
    
    int y;
    int anim;
    int second;
    
    NSMutableArray * arrayJson;
    NSMutableArray * lieArrayJson;
    MiFangShuJvJson * mJsonShuJv;
    MiFangShuJvJson * mLjsonShuJv;
    ASIHTTPRequest * mRequest;
    BOOL mTwobool;
    ASIHTTPRequest * lRequest;
    BOOL lThreebool;
    
    NSString * alStr;
    
    
    LoadingView * lodingView;
    
     int buyType; 
    NSString * neiGouString;
    
    UIView * neiGouView;
    UIView * neiGouViewBlack;
    UILabel * neiLabel;
    
}
@property (nonatomic, retain) NSString * neiGouString;
@property (nonatomic, retain) NSString * alStr;

@property (nonatomic, retain) NSTimer * timer;
@property (nonatomic, retain) NSTimer * lodingTimer;

@property (nonatomic,retain)NSString *key;
@property (nonatomic,retain)NSString * strTime;
@property (nonatomic,retain)NSMutableDictionary * dict;

@property (nonatomic ,retain) MPMoviePlayerViewController *pvc;

@property (nonatomic,retain)NSMutableArray * arrayJson;
@property (nonatomic,retain)NSMutableArray * lieArrayJson;

@property (nonatomic,retain)EveryView * eView;

-(id)initWithString:(NSString * )str;

-(void)sheTimebtna:(MyButton *)btn;


@end
