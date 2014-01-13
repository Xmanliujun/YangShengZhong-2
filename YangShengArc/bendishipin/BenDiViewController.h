//
//  BenDiViewController.h
//  YangShengArc
//
//  Created by XmL on 13-6-27.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "MyRootViewController.h"
#import "LoadingView.h"

@interface BenDiViewController : MyRootViewController
<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * benDiTableView;
    MPMoviePlayerViewController *pvc;
    NSArray *  mp4array;
    NSMutableArray * nameMp4ary;
    
    int y;
    int animb;
    int second;
    NSTimer * timer;
    NSTimer * lodingTimer;
    LoadingView * lodingView;

    
}
@property (nonatomic, retain) NSTimer * lodingTimer;

@property (nonatomic, retain) NSTimer * timer;

@property (nonatomic ,retain) MPMoviePlayerViewController *pvc;
@property (nonatomic ,retain) NSArray *  mp4array;
@property (nonatomic ,retain) NSMutableArray * nameMp4ary;



@end
