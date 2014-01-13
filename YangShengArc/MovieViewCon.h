//
//  MovieViewCon.h
//  ArcDemo
//
//  Created by XmL on 13-6-13.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "MyRootViewController.h"


@interface MovieViewCon : MyRootViewController

{
    MPMoviePlayerViewController *pvc;
    NSString * strUrl;

}
@property (nonatomic,retain) MPMoviePlayerViewController *pvc;
@property (nonatomic,retain) NSString * strUrl;

@end 
