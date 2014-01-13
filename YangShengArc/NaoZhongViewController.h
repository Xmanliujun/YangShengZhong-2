//
//  NaoZhongViewController.h
//  YangShengArc
//
//  Created by 刘军 on 13-8-5.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataTimeView.h"
#import "EveryView.h"
#import "EveryDayViewController.h"
#import "MyRootViewController.h"

@interface NaoZhongViewController : UIViewController

{
    DataTimeView * dataTimeView;
    EveryView * eView;
    EveryDayViewController * e;
    NSString *key;
    UIDatePicker * datePicker;
    NSMutableDictionary * dict;
    NSString * strTime;

}
@property (nonatomic,retain)NSString *key;
@property (nonatomic,retain)NSString * strTime;
@property (nonatomic,retain)NSMutableDictionary * dict;

-(id)initWithEvery:(EveryDayViewController *)every;

@end
