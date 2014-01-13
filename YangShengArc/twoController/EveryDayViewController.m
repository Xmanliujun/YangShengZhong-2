//
//  EveryDayViewController.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "EveryDayViewController.h"
#import "DayTableviewCell.h"
#import "BenDiViewController.h"
#import "GengDViewController.h"
#import "MovieViewCon.h"
#import "DownLoadHttpAsi.h"
#import "RootViewController.h"
#import "UIImageView+WebCache.h"

#import "NaoZhongViewController.h"

#import "AppDelegate.h"

#import <StoreKit/StoreKit.h>

#define  AppShare [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];

@interface EveryDayViewController ()

@end

@implementation EveryDayViewController


@synthesize strTime,dict,key,pvc,arrayJson,lieArrayJson,timer,lodingTimer,neiGouString;

@synthesize alStr,eView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        app.everyDayViewController = self;
        
    }
    return self;
}

-(id)initWithString:(NSString *)str
{
    if (self = [super init]) {
        self.alStr = str;
    }
    
    return self;

}





//设置时间
-(void)sheTimebtna:(MyButton *)btn
{

    NSLog(@"sheTimebtna");
  //  dataTimeView.hidden = NO;
    
    NaoZhongViewController * n = [[NaoZhongViewController alloc] initWithEvery:self];
    UINavigationController * nav  = [[UINavigationController alloc] initWithRootViewController:n];
    n.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
    
}

//当天
-(void)deliBiaobtn:(MyButton *)btn
{
    NSLog(@"deliBiaobtn");
    deView.hidden = YES;

}
//列表
-(void)liBiaobtna:(MyButton * )btn
{
    
    NSLog(@"liBiaobtna");
    
    [self httpLieBiao];
    deView.hidden = NO;
    
    
}
//当天播放
-(void)boFangbtna:(MyButton *)btn
{

    NSLog(@"boFangbtna");
    if (self.arrayJson.count != 0) {
        MiFangShuJvJson * mf = [self.arrayJson objectAtIndex:0];
        
      //  NSURL * url = [NSURL URLWithString:@"http://www.nsr8.com/hs.mp4"];
       
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/health/%@",mf.mNewVideo];
        NSLog(@"url  is  %@",strUrl);
        NSURL * url = [NSURL URLWithString:strUrl];
        
        //获取视频播放时间长度
        NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                         forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
        AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
        second = 0;
        y = 1;
        second = urlAsset.duration.value/urlAsset.duration.timescale;
        NSLog(@"movie duration : %d", second);
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateMeters) userInfo:nil repeats:YES];
        /*
         从获取时间长度开始到设定 定时器所以代码都在这里，进入定时器绑定函数updateMeters：在进一个根据需要进行设置。
         
         
         */
        
        
        self.pvc = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
        
        
        
        [self presentViewController:self.pvc animated:YES completion:nil];
        
        
        // 注册事件：播放结束
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(moviePlayBackDidFinish:)
                                                     name:MPMoviePlayerPlaybackDidFinishNotification
                                                   object:nil];
        
      
        
    }
     
    
    
    
}

-(void)lodingTimerAnimating
{

    if (anim == 5) {
        [lodingView.loadImageView stopAnimating];
        lodingView.hidden = YES;
        [self.lodingTimer invalidate];
        self.lodingTimer = nil;
        
        anim = 0;
    }
    NSLog(@"aaa %d",anim);
    anim++;
    
    
}

-(void)updateMeters{

    /*
     定时器绑定函数，根据定时器的时间判断视频是否播放完成只要是定时器时间等于视频时间就判断为播放完成，
     这里不考虑在播放时候网速卡顿等现象，如果人为推出视频将会在退出绑定函数里对定时器进行释放。
     y  这块应该考虑是>= 视频时间 如果出现网速问题 定时器不会停下来 导致Y值大于视频时间*/
    if (y >= second) {
        NSLog(@"视频播放完成");
        /*
         一下代码是在本地将分数提取出来进行计算，并且将结果在存到本地，通过分数对称号进行判断.
         */
        NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
        NSString * sFen = [defaults objectForKey:@"fen"];
        int f = [sFen intValue];
        NSLog(@"ff %d",f);
        int ff = f + 10;
        
        NSString * fd = [NSString stringWithFormat:@"%d",ff];
        [defaults setObject:fd forKey:@"fen"];
        
        eView.fenLabel.text = [NSString stringWithFormat:@"心得:%@",fd];
        if ([fd isEqualToString:@"100"]) {
            eView.nameLabel.text = @"称号:初窥门径";
            [defaults setObject:@"初窥门径" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

            
        }if ([fd isEqualToString:@"200"]) {
            eView.nameLabel.text = @"称号:略有小成";
            [defaults setObject:@"略有小成" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;


        }if ([fd isEqualToString:@"300"]) {
            eView.nameLabel.text = @"称号:驾轻就熟";
            [defaults setObject:@"驾轻就熟" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;


        }if ([fd isEqualToString:@"400"]) {
            eView.nameLabel.text = @"称号:炉火纯青";
            [defaults setObject:@"炉火纯青" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;


        }if ([fd isEqualToString:@"500"]) {
            eView.nameLabel.text = @"称号:出类拔萃";
            [defaults setObject:@"出类拔萃" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;


        }if ([fd isEqualToString:@"600"]) {
            eView.nameLabel.text = @"称号:神乎其技";
            [defaults setObject:@"神乎其技" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;


        }if ([fd isEqualToString:@"700"]) {
            eView.nameLabel.text = @"称号:傲视群雄";
            [defaults setObject:@"傲视群雄" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;


        }if ([fd isEqualToString:@"800"]) {
            eView.nameLabel.text = @"称号:登峰造极";
            [defaults setObject:@"登峰造极" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }if ([fd isEqualToString:@"900"]) {
            eView.nameLabel.text = @"称号:所向披靡";
            [defaults setObject:@"所向披靡" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;


        }if ([fd isEqualToString:@"1000"]) {
            eView.nameLabel.text = @"称号:一代宗师";
            [defaults setObject:@"一代宗师" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;


        }if ([fd isEqualToString:@"2000"]) {
            eView.nameLabel.text = @"称号:神功盖世";
            [defaults setObject:@"神功盖世" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;


        }

        
    }
    
    NSLog(@"y is %d",y);
    NSLog(@"s is %d",second);
    y++;
    
    
}


//在线练功
-(void)zaiXianbtna:(MyButton *)btn
{
    
    NSLog(@"zaiXianbtna");
    
}
//本地
-(void)benDibtna:(MyButton *)btn
{
    
    NSLog(@"benDibtna");
    BenDiViewController * b = [[BenDiViewController alloc] init];
    UINavigationController *  nav = [[UINavigationController alloc] initWithRootViewController:b];
    b.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
    
}
//更多方法
-(void)gengDuobtna:(MyButton *)btn
{
    
    NSLog(@"gengDuobtna");
    GengDViewController * g = [[GengDViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:g];
    g.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
    
    
}

/*
*/

//返回上一界面
-(void)btnFanHui:(UIButton * )btn
{
       
    if (rOnebool == YES) {
        [r clearDelegatesAndCancel];
        rOnebool = NO;

        RootViewController * ra = [[RootViewController alloc] init];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ra];
        [self presentViewController:nav animated:YES completion:NULL];

    }else if (mTwobool == YES){
        [mRequest clearDelegatesAndCancel];
        mTwobool = NO;
        
        RootViewController * ra = [[RootViewController alloc] init];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ra];
        [self presentViewController:nav animated:YES completion:NULL];


    }else if (lThreebool == YES){
        [lRequest clearDelegatesAndCancel];
        lThreebool = NO;
        
        RootViewController * ra = [[RootViewController alloc] init];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ra];
        [self presentViewController:nav animated:YES completion:NULL];

    }else{
    
        RootViewController * ra = [[RootViewController alloc] init];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ra];
        [self presentViewController:nav animated:YES completion:NULL];


    
    }
    
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    
    
    
    
//    if ([self.alStr isEqualToString:@"str"]) {
//        dataTimeView.hidden = NO;
//
//    }
    //----监听购买结果
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
	// Do any additional setup after loading the view.
    dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    arrayJson = [[NSMutableArray alloc] initWithCapacity:0];
    lieArrayJson = [[NSMutableArray alloc] initWithCapacity:0];
    anim = 0 ;
    
    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"6.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 42.5, 22.5);
    [btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bkbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bkbtn;
    
    
    
    
    [self httpDangtian];
   
    
  
    
    
    eView = [[EveryView alloc] initWithFloat:self.view.bounds.size.height];
    eView.frame = self.view.bounds;
    eView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
   
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString * sTime = [defaults objectForKey:@"time"];
    NSString * sName = [defaults objectForKey:@"name"];
    NSString * sFen = [defaults objectForKey:@"fen"];
    
    
    NSLog(@"time  is  %@",sTime);
    if (sTime != nil) {
        self.strTime = sTime;
        [eView.quxiaoBtn setImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
        
    }else{
        self.strTime = @"设置时间!";
    }
    
    if (sName != nil) {
        eView.nameLabel.text = [NSString stringWithFormat:@"称号:%@",sName];
    }else{
        eView.nameLabel.text = @"称号:初学乍练";
    }
    if (sFen != nil) {
        eView.fenLabel.text = [NSString stringWithFormat:@"心得:%@",sFen];
    }else{
    
        eView.fenLabel.text = @"心得:无";
    }
    
    
    
    eView.lgTimeLab.text = [NSString stringWithFormat:@"闹钟时间:%@",self.strTime];
   
    //eView.tiMuLab.text = @"养生大道之补肾补肾!";
  //  eView.jieShLab.text =@"拉萨的控件佛网噢诶人哦我很烦小才俊恐惧啊欧文哦看见我合法可使肌肤看见啊束带结发哈史蒂夫是";
    
    [eView.quxiaoBtn addTarget:self action:@selector(deleteLocalNotification:) forControlEvents:UIControlEventTouchUpInside];
    
    [eView.sheTimebtn addTarget:self action:@selector(sheTimebtna:) forControlEvents:UIControlEventTouchUpInside];
    [eView.liBiaobtn addTarget:self action:@selector(liBiaobtna:) forControlEvents:UIControlEventTouchUpInside];
    [eView.boFangbtn addTarget:self action:@selector(boFangbtna:) forControlEvents:UIControlEventTouchUpInside];
    
    [eView.zaiXianbtn addTarget:self action:@selector(zaiXianbtna:) forControlEvents:UIControlEventTouchUpInside];
    [eView.benDibtn addTarget:self action:@selector(benDibtna:) forControlEvents:UIControlEventTouchUpInside];
    [eView.gengDuobtn addTarget:self action:@selector(gengDuobtna:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:eView];
    
    
       
    
    //当天view  DayEveryView
    deView = [[DayEveryView alloc] initWithFloat:self.view.bounds.size.height];
    deView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
    if (self.view.bounds.size.height > 480 ) {
       
        deView.frame = CGRectMake(5, 35, 310, 420);
    }if (self.view.bounds.size.height <= 480) {

        deView.frame = CGRectMake(5, 35, 310, 330);
    }
    NSString * names = @"强肾护腰功";
    NSString * jieNais = @"强肾护腰功：集少林八段锦、五禽戏、太极等传统养生功法之精华，配合内气鼓荡，增丹田之气，疏脏腑气血，固要补虚损，补肾精不足者有显著功效!";
    eView.tiMuLab.text = names;
    eView.jieShLab.text = jieNais;
    
    deView.tiMuLabd.text = names;
    deView.jieShLabd.text = jieNais;
    
    UIImageView * imageTable = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"全背景.png"]];
    
    [deView.liBiaobtnd addTarget:self action:@selector(deliBiaobtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [deView.huiFuBtn addTarget:self action:@selector(huifuNeigou:) forControlEvents:UIControlEventTouchUpInside];
    
    
    deView.myTableView.delegate = self;
    deView.myTableView.dataSource = self;
    deView.myTableView.backgroundView = imageTable;
    deView.hidden = YES;
    [eView addSubview:deView];
    
   

    
    
    /*
    
       */
    
    pv=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    
    //CGFloat height=pv.frame.size.height-5;
    
    if (self.view.bounds.size.height > 480 ) {
         pv.frame=CGRectMake(30, 160, 260, 5);
        
    }if (self.view.bounds.size.height < 480) {
        pv.frame=CGRectMake(30, 135, 260, 5);
        
    }
   
    //设定进度条的大小
    pv.progress=0;
    //设置进度条开始的位置  范围0--1 就是对进度条副初始值
    //  _pv=pv;//强引用和弱引用 都可以
     pv.hidden = YES;
    [self.view addSubview:pv];
    
    
    //动画VIew
    lodingView = [[LoadingView alloc] initWithFloat:self.view.bounds.size.height];
    lodingView.frame = self.view.bounds;
    lodingView.hidden = YES;
    [self.view addSubview:lodingView];
    
    neiGouView = [[UIView alloc] initWithFrame:self.view.bounds];
    neiGouView.backgroundColor = [UIColor clearColor];
    neiGouView.hidden = YES;
    [self.view addSubview:neiGouView];
    
    neiGouViewBlack = [[UIView alloc] initWithFrame:self.view.bounds];
    neiGouViewBlack.backgroundColor = [UIColor blackColor];
    neiGouViewBlack.alpha = 0.7f;
    [neiGouView addSubview:neiGouViewBlack];
    
    neiLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 280, 40)];
    neiLabel.textAlignment = NSTextAlignmentCenter;
    neiLabel.backgroundColor = [UIColor clearColor];
    neiLabel.textColor = [UIColor whiteColor];
    neiLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    neiLabel.text = @"正在购买全套视频，请您耐心等候!";
    [neiGouView addSubview:neiLabel];
    
    
    
    
    
}

-(NSMutableArray *)jsonLeiBiaoStringDict:(NSDictionary *)responseDict
{
     NSMutableArray * ary = [[NSMutableArray alloc] initWithCapacity:0];

    NSArray * a = [responseDict objectForKey:@"NewsAll"];
    NSLog(@"a  is  %d",a.count);
    for (NSDictionary *d in a ) {
        
        mLjsonShuJv = [[MiFangShuJvJson alloc] init];
        mLjsonShuJv.mNewTitle = [d objectForKey:@"NewsTitle"];
        mLjsonShuJv.mNewContent = [d objectForKey:@"NewsContent"];
        mLjsonShuJv.mNewImg = [d objectForKey:@"NewsImg"];
        mLjsonShuJv.mNewVideo = [d objectForKey:@"NewsVideo"];
        mLjsonShuJv.mNewAdd = [d objectForKey:@"NewsAddtime"];
        mLjsonShuJv.mNewClassID = [d objectForKey:@"NewsClassid"];
        mLjsonShuJv.mNewClassName = [d objectForKey:@"NewsClassname"];
        
        [ary addObject:mLjsonShuJv];
        mLjsonShuJv = nil;
        
        
        
    }
    
    
    
    return ary;
}

-(void)httpLieBiao
{
    NSString * stringUrl =  @"http://139.210.99.29:83/health/index.php/admin/y_yangsheng/search_news_list/7";
    NSURL * url = [NSURL URLWithString:stringUrl];
    
    lRequest = [ASIHTTPRequest requestWithURL:url];
    lRequest.tag = 1001;
    [lRequest setTimeOutSeconds:60];
    lRequest.delegate = self;
    [lRequest startAsynchronous];
    
    lThreebool = YES;
}


-(void)httpDangtian
{
    
    //图片 http://139.210.99.29:83/health/./uploads/0710092417-23.jpg
    NSString * stringUrl = @"http://139.210.99.29:83/health/index.php/admin/y_yangsheng/search_news_list/7/1";
    NSLog(@"1 %@",stringUrl);
    NSURL * url = [NSURL URLWithString:stringUrl];
    
    mRequest = [ASIHTTPRequest requestWithURL:url];
    mRequest.tag = 1000;
    [mRequest setTimeOutSeconds:60];
    mRequest.delegate = self;
    [mRequest startAsynchronous];
    
    mTwobool = YES;
    
}

-(NSMutableArray *)jsonStringDict:(NSDictionary *)responseDict
{
    NSDictionary * d = [responseDict objectForKey:@"NewsAll"];
    NSMutableArray * ary = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    mJsonShuJv = [[MiFangShuJvJson alloc] init];
    mJsonShuJv.mNewTitle = [d objectForKey:@"NewsTitle"];
    mJsonShuJv.mNewContent = [d objectForKey:@"NewsContent"];
    mJsonShuJv.mNewImg = [d objectForKey:@"NewsImg"];
    mJsonShuJv.mNewVideo = [d objectForKey:@"NewsVideo"];
    mJsonShuJv.mNewAdd = [d objectForKey:@"NewsAddtime"];
    mJsonShuJv.mNewClassID = [d objectForKey:@"NewsClassid"];
    mJsonShuJv.mNewClassName = [d objectForKey:@"NewsClassname"];
    
    [ary addObject:mJsonShuJv];
    mJsonShuJv = nil;
    
    
    
    
    
    
    return ary;
    
}


-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"下载内容 : %@",[request responseString]);
    if (request.tag == 1111) {
        rOnebool = NO;
        pv.hidden = YES;
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"成功"
														 message:@"视频下载完成"
														delegate:nil
											   cancelButtonTitle:@"确定"
											   otherButtonTitles:nil];
		[alertView show];
    }
    if (request.tag == 1000) {
        
        mTwobool = NO;
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        
        self.arrayJson = [self jsonStringDict:dic];
        
        if (self.arrayJson.count != 0) {
            NSLog(@"json 解析数组长度 %d",[self.arrayJson count]);
            MiFangShuJvJson * mf = [self.arrayJson objectAtIndex:0];
            NSLog(@"title is  %@",mf.mNewTitle);
            NSLog(@"image is  %@",mf.mNewImg);
            NSLog(@"cocent is  %@",mf.mNewContent);
            NSLog(@"vodio is  %@",mf.mNewVideo);
            
//            mg.labBiaoti.text = mf.mNewTitle;
//            mg.labNeirong.text = mf.mNewContent;
//            //异步加载图片
//            [mg.mgimageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.tripg.com/health/%@",mf.mNewImg]] placeholderImage:nil];
            
            //    [imageNew setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",num.snOUrl]] placeholderImage:nil];
            
            
            
        }
        
        
    }if (request.tag == 1001) {
        
        lThreebool = NO;
        
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        self.lieArrayJson = [self jsonLeiBiaoStringDict:dic];
        
        if (self.lieArrayJson.count != 0) {
            
            NSLog(@"json 解析数组长度 %d",[self.lieArrayJson count]);
            MiFangShuJvJson * mf = [self.lieArrayJson objectAtIndex:0];
            NSLog(@"title is  %@",mf.mNewTitle);
            NSLog(@"image is  %@",mf.mNewImg);
            NSLog(@"cocent is  %@",mf.mNewContent);
            NSLog(@"vodio is  %@",mf.mNewVideo);
            [deView.myTableView reloadData];
            
        }
        
    }
    
    
//    NSData * data = [request responseData];
//    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/xx.mp4"];
//    [data writeToFile:filePath atomically:YES];

}
-(void)requestFailed:(ASIHTTPRequest *)request
{

    NSLog(@"error");
   
    rOnebool = NO;
    mTwobool = NO;
    lThreebool = NO;
 
        pv.hidden = YES;
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"错误1"
														 message:@"网络异常!请稍后下载!"
														delegate:nil
											   cancelButtonTitle:@"确定"
											   otherButtonTitles:nil];
		[alertView show];
    

}
//下载并且存本地
-(void)xiazaiBtn:(MyButton * )btn
{
    NSLog(@"xiazaiBtn  tag %d",btn.tag);
    
    self.neiGouString = [NSString stringWithFormat:@"%d",btn.tag];
    if (self.lieArrayJson.count != 0) {
        
        

        NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
      //  NSString * nd = [NSString stringWithFormat:@"%d",btn.tag];
        NSString * nIndex = [defaults objectForKey:@"neigou"];
        
        
        if (nIndex != nil || btn.tag < 4) {

        pv.hidden = NO;
            
        MiFangShuJvJson * mx = [self.lieArrayJson objectAtIndex:btn.tag];
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/health/%@",mx.mNewVideo];
        NSLog(@"url  is  %@",strUrl);
        
        NSURL * url = [NSURL URLWithString:strUrl];
        r = [[ASIHTTPRequest alloc] initWithURL:url];
        r.tag = 1111;
        [r setTimeOutSeconds:600];
        r.delegate= self;
        //这个1.MP4文件名要更改要存的文件名
        [r setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4",mx.mNewTitle]]];
        [r setDownloadProgressDelegate:pv];
    
    //设置临时文件路径
    //NSString *tempPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"temp/%@mp4.zip.temp",mx.mNewTitle]];
    //  [r setTemporaryFileDownloadPath:tempPath];
    //设置是是否支持断点下载
    //  [r setAllowResumeForFileDownloads:YES]
            
        [r setShowAccurateProgress:YES];
        [r startAsynchronous];
        
            rOnebool = YES;
            
            
        }else{
            self.neiGouString = [NSString stringWithFormat:@"%d",btn.tag];
            NSLog(@"xia zai  neigoustring is  %@",self.neiGouString);

            [self buy:10];
            
        }
        
    }
    
    
    
    

}
//晒一下窗口关闭事件
- (void)shareMoreCloseButtonAction
{
   
    s.hidden = YES;
    
}
//分享函数 直接推出分享界面
-(void)fenxiangBtn:(MyButton *)btn
{
    
    NSLog(@"fenxiangBtn tag %d",btn.tag);
    s  = [[ShareMoreView alloc] initWithFrame:self.view.bounds andScore:@"aaa" andShareImage:nil andAccount:@"ccc"];
    
    [s.closeButton addTarget:self action:@selector(shareMoreCloseButtonAction) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:s];
    

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * cellID  = [NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row];
    
    DayTableviewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell== nil) {
        cell = [[DayTableviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        
    }
   
//    if (indexPath.row + 1 == self.lieArrayJson.count  ) {
//        NSLog(@"cell is here  %d",indexPath.row);
//        NSLog(@"cell is self.lieArrayJson.count  %d",self.lieArrayJson.count);
//
//        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        btn.frame = CGRectMake( 80, 5, 80, 40);
//        [cell.contentView addSubview:btn];
//    }
    
  // else {
        cell.cellXiabtn.tag =  indexPath.row;
        [cell.cellXiabtn addTarget:self action:@selector(xiazaiBtn:) forControlEvents:UIControlEventTouchUpInside];
        cell.cellFenbtn.tag = 600 + indexPath.row;
        [cell.cellFenbtn addTarget:self action:@selector(fenxiangBtn:) forControlEvents:UIControlEventTouchUpInside];
        if (self.lieArrayJson.count != 0 && self.lieArrayJson.count > indexPath.row) {
            
            MiFangShuJvJson * m = [self.lieArrayJson objectAtIndex:indexPath.row];
            cell.cellLabel.text = m.mNewTitle;
            NSLog(@"cell label %@",m.mNewTitle);
            
            
            
        }
   // }
    
    
    cell.selectionStyle = UITableViewCellAccessoryNone;
    
    
    //异步加载图片
    //    UIImageView * imageNew = (UIImageView *)[cell viewWithTag:800];
    //    NSLog(@"图片 %@",num.snOUrl);
    //
    //    [imageNew setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",num.snOUrl]] placeholderImage:nil];
    
    
    
    return cell;

}


//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;

}
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.lieArrayJson.count != 0 ) {
       
        return self.lieArrayJson.count ;
        
    }else{
        return 10;
    }
    

}
//cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell is here  %d",indexPath.row);
    NSLog(@"cell is self.lieArrayJson.count  %d",self.lieArrayJson.count);

   // MovieViewCon * mov = [[MovieViewCon alloc] init];
   // [self presentViewController:mov animated:YES completion:NULL];
   //http://192.168.2.16:8080/hs.mp4

    anim= 0;

    if (self.lieArrayJson.count != 0) {
        
        if (indexPath.row < 8) {
            
       
        MiFangShuJvJson * m = [self.lieArrayJson objectAtIndex:indexPath.row];
        
            NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/health/%@",m.mNewVideo];
        
         NSURL * url = [NSURL URLWithString:strUrl];
        
       //获取视频播放时间长度 
        NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                         forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
        AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
        second = 0;
         y = 1;
        second = urlAsset.duration.value/urlAsset.duration.timescale;
        NSLog(@"movie duration : %d", second);
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateMeters) userInfo:nil repeats:YES];
        /*
         从获取时间长度开始到设定 定时器所以代码都在这里，进入定时器绑定函数updateMeters：在进一个根据需要进行设置。
             
             
        */

        
        
        self.pvc = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
        
       // [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
        [self presentViewController:self.pvc animated:YES completion:nil];
        
        
        // 注册事件：播放结束
    	[[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(moviePlayBackDidFinish:)
                                                     name:MPMoviePlayerPlaybackDidFinishNotification
                                                   object:nil];

       
        }else{
        
            NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
         //   NSString * nd = [NSString stringWithFormat:@"%d",indexPath.row];
            NSString * nIndex = [defaults objectForKey:@"neigou"];
            
            
            if (nIndex !=nil) {
                
                
                
                MiFangShuJvJson * m = [self.lieArrayJson objectAtIndex:indexPath.row];
                
                NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/health/%@",m.mNewVideo];
                
                NSURL * url = [NSURL URLWithString:strUrl];
                
                //获取视频播放时间长度
                NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                                 forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
                AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
                second = 0;
                  y = 1;
                second = urlAsset.duration.value/urlAsset.duration.timescale;
                NSLog(@"movie duration : %d", second);
                
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateMeters) userInfo:nil repeats:YES];
                /*
                 从获取时间长度开始到设定 定时器所以代码都在这里，进入定时器绑定函数updateMeters：在进一个根据需要进行设置。
                 
                 
                 */
                
                
                self.pvc = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
                
                // [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
                [self presentViewController:self.pvc animated:YES completion:nil];
                
                
                // 注册事件：播放结束
                [[NSNotificationCenter defaultCenter] addObserver:self
                                                         selector:@selector(moviePlayBackDidFinish:)
                                                             name:MPMoviePlayerPlaybackDidFinishNotification
                                                           object:nil];

            }else{
                self.neiGouString = [NSString stringWithFormat:@"%d",indexPath.row];
                NSLog(@" neigousring is  %@",self.neiGouString);

                [self buy:10];
                
            }
            
          
            
        
        }
        
        
        
    }
   
       
   

}


-(void)viewWillAppear:(BOOL)animated{

    //[self viewDidLoad];
}

- (void)moviePlayBackDidFinish:(NSNotification*)notification {
   
    
    NSLog(@"notify %@", notification);
    

       
    [self.pvc dismissViewControllerAnimated:YES completion:nil];
    
    [self.timer invalidate];
    self.timer = nil;

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString* f = [defaults objectForKey:@"fen"];
    NSString* cShu = [defaults objectForKey:@"cShu"];
    NSLog(@"cs  is  %@",cShu);
    /*
    int iif = [f intValue];
    if (iif % 100 == 0) {
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
    }
    */
    
    if ([f isEqualToString:@"100"] && ![cShu isEqualToString:@"1"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"1" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"200"] && ![cShu isEqualToString:@"2"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"2" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"300"] && ![cShu isEqualToString:@"3"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"3" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"400"] && ![cShu isEqualToString:@"4"]) {
        
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"4" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"500"]&& ![cShu isEqualToString:@"5"] ) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"5" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"600"] && ![cShu isEqualToString:@"6"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"6" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"700"] && ![cShu isEqualToString:@"7"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"7" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"800"] && ![cShu isEqualToString:@"8"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"8" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"900"] && ![cShu isEqualToString:@"9"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"9" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"1000"] && ![cShu isEqualToString:@"10"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"10" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"2000"] && ![cShu isEqualToString:@"11"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimating) userInfo:nil repeats:YES];
        [defaults setObject:@"11" forKey:@"cShu"];
        
    }
   
    
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
     [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
}


/*
 */

//取消闹钟 (已使用)
-(void)deleteLocalNotification:(MyButton *)btn
{
    NSLog(@"闹钟z取消");
    
        NSLog(@"99");
    
    
        [eView.quxiaoBtn setImage:[UIImage imageNamed:@"8.png"] forState:UIControlStateNormal];
        [eView.quxiaoBtn removeTarget:self action:@selector(deleteLocalNotification:) forControlEvents:UIControlEventTouchUpInside];
        [eView.quxiaoBtn addTarget:self action:@selector(sheTimebtna:) forControlEvents:UIControlEventTouchUpInside];
        
        
        NSArray * allLocalNotification=[[UIApplication sharedApplication] scheduledLocalNotifications];
        
        for (UILocalNotification * localNotification in allLocalNotification) {
            NSString * alarmValue=[localNotification.userInfo objectForKey:@"key"];
            if ([key isEqualToString:alarmValue]) {
                [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
                NSLog(@"取消");
                NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
                [defaults removeObjectForKey:@"time"];
                eView.lgTimeLab.text = [NSString stringWithFormat:@"闹钟时间:设置闹钟!"];
            }else{
                
                [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
                NSLog(@"取消1");
                eView.lgTimeLab.text = [NSString stringWithFormat:@"闹钟时间:设置闹钟!"];
                NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
                [defaults removeObjectForKey:@"time"];
                
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
















//内购函数

 
//  neigouliujun.com    com.Quanshipin
#define ProductID_IAP0p99 @"com.Quanshipin"
//$2

-(void)huifuNeigou:(MyButton *)button
{
    
    //恢复内购
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
    
    
    
}



-(void)buy:(int)type
{
    buyType = type;
    neiGouView.hidden = NO;

    //判断购买
    if ([SKPaymentQueue canMakePayments]) {
        //恢复内购
      //  [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
       
        
        [self RequestProductData];
        NSLog(@"允许程序内付费购买");
    }
   
    
    else
    {
       
        NSLog(@"不允许程序内付费购买");
        UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:@"Alert"
                                                            message:@"不允许应用程序内购买"
                                                           delegate:nil cancelButtonTitle:NSLocalizedString(@"Close（关闭）",nil) otherButtonTitles:nil];
        
        [alerView show];
        
        
    }
}
//
-(bool)CanMakePay
{
    
    return [SKPaymentQueue canMakePayments];
   
    
}
//购买的付款请求
-(void)RequestProductData
{
    NSLog(@"---------请求对应的产品信息------------");
    NSArray *product = nil;
    switch (buyType) {
        case IAP0p99:
            product=[[NSArray alloc] initWithObjects:ProductID_IAP0p99,nil];
            break;
            
        default:
            break;
    }
    
    NSSet *nsset = [NSSet setWithArray:product];
    SKProductsRequest *request=[[SKProductsRequest alloc] initWithProductIdentifiers: nsset];
    request.delegate=self;
    [request start];
    
}
//<SKProductsRequestDelegate> 请求协议
//收到的产品信息
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    
    NSLog(@"-----------收到产品反馈信息--------------");
    NSArray *myProduct = response.products;
    
    NSLog(@"产品Product ID:%@",response.invalidProductIdentifiers);
    NSLog(@"产品付费数量: %d", [myProduct count]);
    // populate UI
    for(SKProduct *product in myProduct){
        NSLog(@"product info");
        NSLog(@"SKProduct 描述信息%@", [product description]);
        NSLog(@"产品标题 %@" , product.localizedTitle);
        NSLog(@"产品描述信息: %@" , product.localizedDescription);
        NSLog(@"价格: %@" , product.price);
        NSLog(@"Product id: %@" , product.productIdentifier);
    }
    

    
    if (response == nil) {
        return;
    }
    //购买请求监控
    for (SKProduct * product in response.products) {
        SKPayment * payment = [SKPayment paymentWithProduct:product];
        NSLog(@"---------发送购买请求------------");
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
    
    
}


- (void)requestProUpgradeProductData
{
    NSLog(@"------请求升级数据---------");
    NSSet *productIdentifiers = [NSSet setWithObject:@"com.productid"];
    SKProductsRequest* productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
    
}
//弹出错误信息
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"-------弹出错误信息----------");
    UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Alert",NULL) message:[error localizedDescription]
                                                       delegate:nil cancelButtonTitle:NSLocalizedString(@"Close",nil) otherButtonTitles:nil];
    [alerView show];
    
    neiGouView.hidden = YES;
    
}

-(void) requestDidFinish:(SKRequest *)request
{
    NSLog(@"----------反馈信息结束--------------");
    
    
    
    
}

-(void) PurchasedTransaction: (SKPaymentTransaction *)transaction{
    NSLog(@"-----PurchasedTransaction----");
    NSArray *transactions =[[NSArray alloc] initWithObjects:transaction, nil];
    [self paymentQueue:[SKPaymentQueue defaultQueue] updatedTransactions:transactions];
    
}

//<SKPaymentTransactionObserver> 千万不要忘记绑定，代码如下：
//----监听购买结果  交易完成
//[[SKPaymentQueue defaultQueue] addTransactionObserver:self];

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions//交易结果
{
    NSLog(@"--a---paymentQueue--------");
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:{//交易完成
                
                [self completeTransaction:transaction];
                neiGouView.hidden = YES;

                NSLog(@"-----交易完成 --------");
                
                NSLog(@"程序内付费购买   %@",transaction.payment.productIdentifier);
                
                UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:@"Alert"
                                                                    message:@"你购买成功啦～哈哈"
                                                                   delegate:nil cancelButtonTitle:NSLocalizedString(@"Close（关闭）",nil) otherButtonTitles:nil];
                
                [alerView show];
                
                NSLog(@"nnnnnnnn  %@",self.neiGouString);
               
                if (![self.neiGouString isEqualToString:@"(null)"] && self.neiGouString != nil) {
                    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
                    [defaults setObject:self.neiGouString forKey:@"neigou"];
                    

                }
                
                
                break;
            }
            case SKPaymentTransactionStateFailed:{//交易失败
                [self failedTransaction:transaction];
                NSLog(@"-----交易失败 --------");
                 NSLog(@"程序内付费购买   %@",transaction.payment.productIdentifier);
                neiGouView.hidden = YES;

                
                UIAlertView *alerView2 =  [[UIAlertView alloc] initWithTitle:@"Alert"
                                                                     message:@"你购买失败，请重新尝试购买～"
                                                                    delegate:nil cancelButtonTitle:NSLocalizedString(@"Close（关闭）",nil) otherButtonTitles:nil];
                
                [alerView2 show];
                
                break;
            }
           
            case SKPaymentTransactionStateRestored:{ //已经购买过该商品
                neiGouView.hidden = YES;
                
                
                [self restoreTransaction:transaction];
                NSLog(@"-----已经购买过该商品 --------");
                NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:@"neigou" forKey:@"neigou"];

                [self xiazaiBtn:NULL];
            
            break;
            }
            
            case SKPaymentTransactionStatePurchasing:      //商品添加进列表
                NSLog(@"-----商品添加进列表 --------");
                

                break;
                
            default:
                break;
        }
        
    }
    
    
    
}

- (void) completeTransaction: (SKPaymentTransaction *)transaction

{
    NSLog(@"-----completeTransaction--------");
    // Your application should implement these two methods.
    NSString *product = transaction.payment.productIdentifier;
    if ([product length] > 0) {
        
        NSArray *tt = [product componentsSeparatedByString:@"."];
        NSString *bookid = [tt lastObject];
        if ([bookid length] > 0) {
            [self recordTransaction:bookid];
            [self provideContent:bookid];
        }
    }
    
    // Remove the transaction from the payment queue.
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    
}

//记录交易
-(void)recordTransaction:(NSString *)product{
    NSLog(@"-----记录交易--------");
}

//处理下载内容
-(void)provideContent:(NSString *)product{
    NSLog(@"-----下载--------");
}

- (void) failedTransaction: (SKPaymentTransaction *)transaction{
    NSLog(@"失败");
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
    }
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    
    
}
-(void) paymentQueueRestoreCompletedTransactionsFinished: (SKPaymentTransaction *)transaction{
    
}

- (void) restoreTransaction: (SKPaymentTransaction *)transaction

{
    NSLog(@" 交易恢复处理");
    UIAlertView *alerViewn =  [[UIAlertView alloc] initWithTitle:@"Alert"
                                                         message:@"以恢复之前购买内容！"
                                                        delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alerViewn show];
    
    
    
}

-(void) paymentQueue:(SKPaymentQueue *) paymentQueue restoreCompletedTransactionsFailedWithError:(NSError *)error{
    NSLog(@"-------paymentQueue----");
}


#pragma mark connection delegate
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"%@",  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    switch([(NSHTTPURLResponse *)response statusCode]) {
        case 200:
        case 206:
            break;
        case 304:
            break;
        case 400:
            break;
        case 404:
            break;
        case 416:
            break;
        case 403:
            break;
        case 401:
        case 500:
            break;
        default:
            break;
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"test");
}

-(void)dealloc
{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];//解除监听
    
    [r clearDelegatesAndCancel];
    [mRequest clearDelegatesAndCancel];
    [lRequest clearDelegatesAndCancel];
    NSLog(@"dealloc");

}















- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
