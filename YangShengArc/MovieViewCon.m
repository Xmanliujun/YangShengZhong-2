//
//  MovieViewCon.m
//  ArcDemo
//
//  Created by XmL on 13-6-13.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "MovieViewCon.h"

@interface MovieViewCon ()

@end

@implementation MovieViewCon

@synthesize pvc,strUrl;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)myMovie
{

    //系统自带的播放方式
    //http://192.168.2.16:8080/hs.mp4
    //http://192.168.2.16:8080/swlx.mp4
    //http://192.168.2.16:8080/movie.mp4
    //http://139.210.99.29:8080/movie.mp4
    //http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8
    //http://meta.video.qiyi.com/255/dfbdc129b8d18e10d6c593ed44fa6df9.m3u8
    //http://3glivehntv.doplive.com.cn/video1/index_128k.m3u8
    //http://www.nsr8.com/swlx.mp4
    //http://www.nsr8.com/hs.mp4
    //http://www.nsr8.com/movie.mp4
    
    NSLog(@"url  is  %@",self.strUrl);
     //NSString* path =[ NSString stringWithFormat:@"%@/Documents/1.mp4",NSHomeDirectory()];//本地路径
  //本地播放url获取之后 用 fileURLWithPath:这个方法
    NSURL * url = [NSURL fileURLWithPath: self.strUrl];
    
    self.pvc = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    
    self.pvc.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    
    [self.pvc.view setFrame:CGRectMake(0, 60, 320, self.view.bounds.size.height-60)];
    [self.view addSubview:self.pvc.view];
    // [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [self presentViewController:self.pvc animated:YES completion:nil];
    
	
	/* 注册事件：播放结束 */
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    
    
    
   


}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    [self myMovie];
       
    
    
    
    
}

- (void)moviePlayBackDidFinish:(NSNotification*)notification {
    
    NSLog(@"notify %@", notification);
    
    
    //MPMoviePlayerController *mp = [notification object];
	//[mp.view removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:nil];

    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
