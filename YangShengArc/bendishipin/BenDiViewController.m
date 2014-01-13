//
//  BenDiViewController.m
//  YangShengArc
//
//  Created by XmL on 13-6-27.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "BenDiViewController.h"
#import "MovieViewCon.h"
#import "MyButton.h"
#import "EveryDayViewController.h"
#import "GengDViewController.h"
#import "RootViewController.h"
#import "BenDiViewCell.h"
#import "UIImageView+WebCache.h"



@interface BenDiViewController ()

@end

@implementation BenDiViewController

@synthesize lodingTimer,timer;

@synthesize pvc,mp4array,nameMp4ary;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)btnFanHui:(UIButton * )btn
{
    NSLog(@"btnFanHui");
    RootViewController * ra = [[RootViewController alloc] init];
    ra.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ra];
    [self presentViewController:nav animated:YES completion:NULL];

    

}

//在线练功
-(void)zaiXianbtna:(MyButton *)btn
{
    
    NSLog(@"zaiXianbtna");
    EveryDayViewController * b = [[EveryDayViewController alloc] init];
    UINavigationController *  nav = [[UINavigationController alloc] initWithRootViewController:b];
    b.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];

    
}

//本地
-(void)benDibtna:(MyButton *)btn
{
    
    NSLog(@"benDibtna");

    
    
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
-(void)viewWillAppear:(BOOL)animated{
    
    
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

	// Do any additional setup after loading the view.
    animb = 0;
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"6.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 30, 40);
    [btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bkbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bkbtn;

    
    CGRect rect = self.view.bounds;
    
    benDiTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, rect.size.height - 90) style:UITableViewStylePlain];
    benDiTableView.tag= 1500;
    benDiTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"全背景.png"]];
    benDiTableView.delegate = self;
    benDiTableView.dataSource = self;
    [self.view addSubview:benDiTableView];
   
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
     mp4array = [NSBundle pathsForResourcesOfType:@"mp4" inDirectory:path];
   
    NSLog(@"%@",mp4array);
    NSFileManager * fm = [NSFileManager defaultManager];
   // nameMp4ary = [fm directoryContentsAtPath:path];
    
    
    //获取指定文件后缀方法 可用
//    NSDirectoryEnumerator * myDirectory = [fm enumeratorAtPath:[[NSBundle mainBundle] bundlePath]];
    //    NSMutableArray * arrayname = [[NSMutableArray alloc] initWithCapacity:0];
    nameMp4ary = [[NSMutableArray alloc] initWithCapacity:0];
    NSDirectoryEnumerator * myDirectory = [fm enumeratorAtPath:path];
    NSString * file;
    
    while (file = [myDirectory nextObject]) {
        
        if ([[file pathExtension] isEqualToString:@"mp4"]) {
            [path stringByAppendingPathComponent:file];
          //  [nameMp4ary addObject:[path stringByAppendingPathComponent:file]];
            [nameMp4ary addObject:file];
            NSLog(@"数组 %d",nameMp4ary.count);
            NSLog(@"file is %@",file);
        }
    }
    
    
    if (self.nameMp4ary.count !=0) {
  
        [benDiTableView reloadData];

    }
    
    NSLog(@"mp4 is %d",[mp4array count]);
    if (mp4array.count == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"本地暂无视频" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        
        alert.tag=123;
        [alert show];
        


    }else{
        
        [benDiTableView reloadData];
    
    }
    
    
    

    
    if (self.view.bounds.size.height > 480  ) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 455, 320, 50)];
        imageView.image = [UIImage imageNamed:@"12.png"];
        [self.view addSubview:imageView];
        
        MyButton * zaiXianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
        zaiXianbtn.frame = CGRectMake(0, 455, 110, 50);
        [zaiXianbtn setImage:[UIImage imageNamed:@"底部按钮1-.png"] forState:UIControlStateNormal];
        [self.view addSubview:zaiXianbtn];
        
        MyButton* benDibtn = [MyButton buttonWithType:UIButtonTypeCustom];;
        benDibtn.frame = CGRectMake(110, 455, 110, 50);
        [benDibtn setImage:[UIImage imageNamed:@"底部按钮2.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:benDibtn];
        
        MyButton*gengDuobtn = [MyButton buttonWithType:UIButtonTypeCustom];
        gengDuobtn.frame = CGRectMake(222, 455, 98, 50);
        [gengDuobtn setImage:[UIImage imageNamed:@"底部按钮3-.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:gengDuobtn];
        
        [zaiXianbtn addTarget:self action:@selector(zaiXianbtna:) forControlEvents:UIControlEventTouchUpInside];
        [benDibtn addTarget:self action:@selector(benDibtna:) forControlEvents:UIControlEventTouchUpInside];
        [gengDuobtn addTarget:self action:@selector(gengDuobtna:) forControlEvents:UIControlEventTouchUpInside];
    }else if(self.view.bounds.size.height <= 480){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 370, 320, 50)];
        imageView.image = [UIImage imageNamed:@"12.png"];
        [self.view addSubview:imageView];
        
        MyButton * zaiXianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
        zaiXianbtn.frame = CGRectMake(0, 370, 110, 50);
        [zaiXianbtn setImage:[UIImage imageNamed:@"底部按钮1-.png"] forState:UIControlStateNormal];
        [self.view addSubview:zaiXianbtn];
        
        MyButton* benDibtn = [MyButton buttonWithType:UIButtonTypeCustom];;
        benDibtn.frame = CGRectMake(110, 370, 110, 50);
        [benDibtn setImage:[UIImage imageNamed:@"底部按钮2.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:benDibtn];
        
        MyButton*gengDuobtn = [MyButton buttonWithType:UIButtonTypeCustom];
        gengDuobtn.frame = CGRectMake(222, 370, 98, 50);
        [gengDuobtn setImage:[UIImage imageNamed:@"底部按钮3-.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:gengDuobtn];
        
        [zaiXianbtn addTarget:self action:@selector(zaiXianbtna:) forControlEvents:UIControlEventTouchUpInside];
        [benDibtn addTarget:self action:@selector(benDibtna:) forControlEvents:UIControlEventTouchUpInside];
        [gengDuobtn addTarget:self action:@selector(gengDuobtna:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    //动画VIew
    lodingView = [[LoadingView alloc] initWithFloat:self.view.bounds.size.height];
    lodingView.frame = self.view.bounds;
    lodingView.hidden = YES;
    [self.view addSubview:lodingView];
   

    
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellID = [NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row];
    BenDiViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[BenDiViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }

    NSLog(@"self.nameMp4ary is %d",self.nameMp4ary.count);
    if (self.nameMp4ary.count >1 ) {
        
        cell.nameLabel.text = [self.nameMp4ary objectAtIndex:indexPath.row];
        
    }else{
    
        cell.nameLabel.text = @"养生功法视频";
    }
    
    //异步加载图片
//    UIImageView * imageNew = (UIImageView *)[cell viewWithTag:800];
//    NSLog(@"图片 %@",num.snOUrl);
//    
//    [imageNew setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",num.snOUrl]] placeholderImage:nil];

    
    cell.selectionStyle = UITableViewCellAccessoryNone;

    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 80.0f;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    if (self.mp4array.count == 0) {
        return 15;
    }else{
        return self.mp4array.count;
    }
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"cell is  here");
    if (self.mp4array.count != 0) {
        NSString * str = [self.mp4array objectAtIndex:indexPath.row];
//        MovieViewCon * mov = [[MovieViewCon alloc] init];
//        mov.strUrl = str;
//       
//
//        [self presentViewController:mov animated:YES completion:NULL];
        
        
        
        NSURL * url = [NSURL fileURLWithPath:str];
        
        //获取视频播放时间长度
        NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                         forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
        AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
        second = 0;
        y = 1;
        animb = 0;
        second = urlAsset.duration.value/urlAsset.duration.timescale;
        NSLog(@"movie duration : %d", second);
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateMetersb) userInfo:nil repeats:YES];
        /*
         从获取时间长度开始到设定 定时器所以代码都在这里，进入定时器绑定函数updateMeters：在进一个根据需要进行设置。
         
         
         */

        
        
        
        
            self.pvc = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
        
        
        
            [self presentViewController:self.pvc animated:YES completion:nil];
        
        
            // 注册事件：播放结束
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(moviePlayBackDidFinishb:)
                                                         name:MPMoviePlayerPlaybackDidFinishNotification
                                                       object:nil];
        

        
    }
   
    


}



-(void)updateMetersb{
    
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
        
        if ([fd isEqualToString:@"100"]) {
            [defaults setObject:@"初窥门径" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

            
        }if ([fd isEqualToString:@"200"]) {
            [defaults setObject:@"略有小成" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;



        }if ([fd isEqualToString:@"300"]) {
            [defaults setObject:@"驾轻就熟" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }if ([fd isEqualToString:@"400"]) {
            [defaults setObject:@"炉火纯青" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }if ([fd isEqualToString:@"500"]) {
            [defaults setObject:@"出类拔萃" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }if ([fd isEqualToString:@"600"]) {
            [defaults setObject:@"神乎其技" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }if ([fd isEqualToString:@"700"]) {
            [defaults setObject:@"傲视群雄" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }if ([fd isEqualToString:@"800"]) {
            [defaults setObject:@"登峰造极" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }if ([fd isEqualToString:@"900"]) {
            [defaults setObject:@"所向披靡" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }if ([fd isEqualToString:@"1000"]) {
            [defaults setObject:@"一代宗师" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }if ([fd isEqualToString:@"2000"]) {
            [defaults setObject:@"神功盖世" forKey:@"name"];
            [self.timer invalidate];
            self.timer = nil;

        }
        
        
    }
    
    NSLog(@"y is %d",y);
    NSLog(@"s is %d",second);
    y++;
    
    
}

-(void)lodingTimerAnimatingb{
    
    if (animb == 5) {
        [lodingView.loadImageView stopAnimating];
        lodingView.hidden = YES;
        
        animb = 0;
        [self.lodingTimer invalidate];
        self.lodingTimer = nil;
    }
    NSLog(@"bbb %d",animb);
    animb++;
}



- (void)moviePlayBackDidFinishb:(NSNotification*)notification {
   
    NSLog(@"notify %@", notification);
    
    [self.pvc dismissViewControllerAnimated:YES completion:nil];
    [self.timer invalidate];
    self.timer = nil;

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString* f = [defaults objectForKey:@"fen"];
    NSString* cShu = [defaults objectForKey:@"cShu"];
    NSLog(@"cs  is  %@",cShu);
    NSLog(@"fen is  %@",f);
    
    /*
    int iif = [f intValue];
    if (iif % 100 == 0 && [f isEqualToString:cShu]) {
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        
    */
    
    if ([f isEqualToString:@"100"] && ![cShu isEqualToString:@"1"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"1" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"200"] && ![cShu isEqualToString:@"2"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"2" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"300"] && ![cShu isEqualToString:@"3"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"3" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"400"] && ![cShu isEqualToString:@"4"]) {
        
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"4" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"500"] && ![cShu isEqualToString:@"5"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"5" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"600"] && ![cShu isEqualToString:@"6"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"6" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"700"] && ![cShu isEqualToString:@"7"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"7" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"800"] && ![cShu isEqualToString:@"8"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"8" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"900"]&& ![cShu isEqualToString:@"9"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"9" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"1000"]&& ![cShu isEqualToString:@"10"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"10" forKey:@"cShu"];
        
    }if ([f isEqualToString:@"2000"]&& ![cShu isEqualToString:@"11"]) {
        //动画
        lodingView.hidden = NO;
        [lodingView.loadImageView startAnimating];
        self.lodingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lodingTimerAnimatingb) userInfo:nil repeats:YES];
        [defaults setObject:@"11" forKey:@"cShu"];
        
    }
    

    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
