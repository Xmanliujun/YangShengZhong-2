//
//  NaoZhongViewController.m
//  YangShengArc
//
//  Created by 刘军 on 13-8-5.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "NaoZhongViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"

@interface NaoZhongViewController ()

@end

@implementation NaoZhongViewController
@synthesize dict,strTime,key;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        app.naoZhongViewController = self;
        
        
        
    }
    return self;
}
-(id)initWithEvery:(EveryDayViewController *)every
{
    if (self = [super init]) {
        
        e = every;
        
        
    }
    return self;
    
}

//返回上一界面
-(void)btnFanHui:(UIButton * )btn
{
    RootViewController * ra = [[RootViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ra];
    [self presentViewController:nav animated:YES completion:NULL];

    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    dict = [[NSMutableDictionary alloc] initWithCapacity:0];

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
    btn.frame = CGRectMake(10, 5, 42.5, 22.5);
    [btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bkbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bkbtn;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString * sTime = [defaults objectForKey:@"time"];
      
    
    NSLog(@"time  is  %@",sTime);
    if (sTime != nil) {
        self.strTime = sTime;
        [e.eView.quxiaoBtn setImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
        
    }else{
        self.strTime = @"设置时间!";
    }

    
    dataTimeView = [[DataTimeView alloc] initWithFloat:self.view.bounds.size.height];
    dataTimeView.frame = self.view.bounds;
    dataTimeView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];

    
    //设置datepickerView
    NSDateFormatter * dateForm = [[NSDateFormatter alloc] init];
	[dateForm setDateFormat:@"HH:mm"];
    [dateForm setTimeZone:[NSTimeZone timeZoneWithName:@"Chinese"]];
    
    NSDate *curDate = [NSDate date];
    NSString * curTime = [dateForm stringFromDate:curDate];
    
    NSDate * tempDate = [dateForm dateFromString:curTime];
    
    // 初始化UIDatePicker
    datePicker = [[UIDatePicker alloc] init];
    if (self.view.bounds.size.height > 480 ) {
        datePicker.frame = CGRectMake(0, 100, 320, 216);
    }if (self.view.bounds.size.height <= 480) {
        datePicker.frame = CGRectMake(0, 120, 320, 200);
    }
    
    // 设置时区
    [datePicker setTimeZone:[NSTimeZone timeZoneWithName:@"Chinese"]];
    // 设置当前显示时间
    [datePicker setDate:tempDate animated:YES];
    // 设置显示最大时间（此处为当前时间）
    [datePicker setMaximumDate:[NSDate date]];
    // 设置UIDatePicker的显示模式
    [datePicker setDatePickerMode:UIDatePickerModeTime];
    // 当值发生改变的时候调用的方法
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    [dataTimeView addSubview:datePicker];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (self.view.bounds.size.height > 480 ) {
        button.frame = CGRectMake(80, 360, 160, 30);
        
    }if (self.view.bounds.size.height <= 480) {
        button.frame = CGRectMake(80, 320, 160, 30);
    }
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dataButtona:) forControlEvents:UIControlEventTouchUpInside];
    [dataTimeView addSubview:button];
    
    
    
    [self.view addSubview:dataTimeView];
    
    [self deleteLocalNotification];
}

-(void)datePickerValueChanged:(UIDatePicker *)picker
{
    
    // 获得当前UIPickerDate所在的时间
    //  NSDate *selected = [datePicker date];
    //    NSString * str = [ NSString stringWithFormat:@"%@",datePicker.date];
    //
    //    NSLog(@"选定时间  %@",str);
    
    
    NSDate *select = [datePicker date];
    
    NSDateFormatter *dateFormatte = [[NSDateFormatter alloc] init];
    
    [dateFormatte setDateFormat:@"HH:mm"];
    
    NSString *dateAndTime =  [dateFormatte stringFromDate:select];
    
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"时间提示" message:dateAndTime delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    //[alert show];
    
    NSLog(@"选定时间  %@",dateAndTime);
    e.eView.lgTimeLab.text = [NSString stringWithFormat:@"闹钟时间:%@",dateAndTime];
    
    //闹钟设置
    
    [self.dict setObject:@"练功时间到啦!" forKey:@"content"];
    [self.dict setObject:@"梦幻" forKey:@"music"];
    [self.dict setObject:dateAndTime forKey:@"time"];
    [self.dict setObject:@"C" forKey:@"timeTem"];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:dateAndTime forKey:@"time"];
    
    //   [self addClockstringTimeTmp:self.dict];
    
    
    
}
//闹钟确定
-(void)dataButtona:(MyButton * )btn
{
    NSLog(@"dataButtona");
    [e.eView.quxiaoBtn setImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
    //  eView.tag= 991;
    [e.eView.quxiaoBtn removeTarget:e action:@selector(sheTimebtna:) forControlEvents:UIControlEventTouchUpInside];
    [e.eView.quxiaoBtn addTarget:e action:@selector(deleteLocalNotification:) forControlEvents:UIControlEventTouchUpInside];
    [self addClockstringTimeTmp:self.dict];
    //  dataTimeView.hidden = YES;
    [self dismissViewControllerAnimated:YES completion:NULL];

    
}



//闹钟方法
- (void)addClockstringTimeTmp:(NSDictionary * )dic
{
    
    
    NSString * stringEvent = [dic objectForKey:@"content"];
    NSString * stringMusic = [dic objectForKey:@"music"];
    NSString * stringTime = [dic objectForKey:@"time"];
    NSString * stringTimeTem = [dic objectForKey:@"timeTem"];
    
    
    NSLog(@"stringEvent %@", stringEvent);
    NSLog(@"stringMusic  %@", stringMusic);
    NSLog(@"stringTime  %@", stringTime);
    NSLog(@"stringTimeTem  %@", stringTimeTem);
    
    
    
    
    
    
    
    
    //组建本地通知的fireDate
    NSArray *clockTimeArray = [stringTime componentsSeparatedByString:@":"];
	NSDate *dateNow = [NSDate date];
    
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
	NSDateComponents *comps = [[NSDateComponents alloc] init] ;
	NSInteger unitFlags = NSEraCalendarUnit |
	NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit |
	NSWeekCalendarUnit |
	NSWeekdayCalendarUnit |
	NSWeekdayOrdinalCalendarUnit |
	NSQuarterCalendarUnit;
    
    // [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"Chinese"]];
    // [comps setTimeZone:[NSTimeZone timeZoneWithName:@"CMT"]];
    
    //时分秒
    comps = [calendar components:unitFlags fromDate:dateNow];
	[comps setHour:[[clockTimeArray objectAtIndex:0] intValue]];
	[comps setMinute:[[clockTimeArray objectAtIndex:1] intValue]];
	[comps setSecond:0];
    
    for (int i = 0; i < 30; i++) {
        
        
       // NSDate *datea = [NSDate dateWithTimeIntervalSinceNow:5];
        NSDate * date = [[calendar dateFromComponents:comps] dateByAddingTimeInterval:3600 * 24 * i];
        NSLog(@"aa %@",date);
        
        //chuagjian一个本地推送
        UILocalNotification *noti = [[UILocalNotification alloc] init] ;
        if (noti) {
            //设置推送时间
            noti.fireDate = date;
            //设置时区
            noti.timeZone = [NSTimeZone defaultTimeZone];
            //设置重复间隔 NSWeekCalendarUnit
            noti.repeatInterval = NSMonthCalendarUnit;
            //推送声音
            //  noti.soundName = UILocalNotificationDefaultSoundName;
            noti.soundName = @"梦幻.caf";
            //内容
            noti.alertBody = @"准备好! 要开始啦!";
            //显示在icon上的红色圈中的数子
            noti.applicationIconBadgeNumber = 1;
            //设置userinfo 方便在之后需要撤销的时候使用
            key = @"name" ;
            NSDictionary *infoDic = [NSDictionary dictionaryWithObject:key forKey:@"key"];
            noti.userInfo = infoDic;
            //添加推送到uiapplication
            UIApplication *app = [UIApplication sharedApplication];
            [app scheduleLocalNotification:noti];
        }
    }
    
    
    
}

//取消闹钟 (已使用)
-(void)deleteLocalNotification
{
    NSLog(@"闹钟n取消");
    
    NSLog(@"nn99nn");
    

    
    
    NSArray * allLocalNotification=[[UIApplication sharedApplication] scheduledLocalNotifications];
    
    for (UILocalNotification * localNotification in allLocalNotification) {
        NSString * alarmValue=[localNotification.userInfo objectForKey:@"key"];
        if ([key isEqualToString:alarmValue]) {
            
            [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
            NSLog(@"取消");
        }else{
            
            [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
            NSLog(@"取消1");
            
        }
        
        
    }
    
    
    
    
    
    
    
    
}


- (void)removeLocalNotification
{
    
    UIApplication *app = [UIApplication sharedApplication];
    //获取本地推送数组
    NSArray *localArr = [app scheduledLocalNotifications];
    
    //声明本地通知对象
    UILocalNotification *localNoti;
    
    if (localArr) {
        for (UILocalNotification *noti in localArr) {
            NSDictionary *dictt = noti.userInfo;
            if (dictt) {
                NSString *inKey = [dictt objectForKey:@"key"];
                if ([inKey isEqualToString:key]) {
                    if (localNoti){
                        localNoti = nil;
                    }
                    localNoti = noti;
                    break;
                }
            }
        }
        
        //判断是否找到已经存在的相同key的推送
        if (!localNoti) {
            //不存在 初始化
            localNoti = [[UILocalNotification alloc] init];
        }
        
        if (localNoti) {
            //不推送 取消推送
            [app cancelLocalNotification:localNoti];
            return;
        }
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
