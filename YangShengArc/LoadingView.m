//
//  LoadingView.m
//  YangShengArc
//
//  Created by 刘军 on 13-8-7.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "LoadingView.h"
#import "EveryDayViewController.h"
#import "AmainPlustLoading.h"
@implementation LoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
    }
    return self;
}


-(id)initWithFloat:(CGFloat)mfloat
{
    
    if (self =  [super init]) {
        
        if (mfloat > 480 ){
        
            self.backgroundColor = [UIColor clearColor];
            self.lView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
            self.lView.backgroundColor = [UIColor blackColor];
            self.lView.alpha = 0.7f;
            [self addSubview:self.lView];
            
            self.loadImageView = [[UIImageView alloc] init];
            self.loadImageView.frame = CGRectMake(47.5, 60, 225, 275);
            self.loadImageView.animationImages = [AmainPlustLoading lodingImages];
            self.loadImageView.animationDuration = 0.8f;
            [self addSubview:self.loadImageView];
            
        
        }if (mfloat <= 480){
        
            
            self.backgroundColor = [UIColor clearColor];
            self.lView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
            self.lView.backgroundColor = [UIColor blackColor];
            self.lView.alpha = 0.7f;
            [self addSubview:self.lView];
            
            self.loadImageView = [[UIImageView alloc] init];
            self.loadImageView.frame = CGRectMake(47.5, 60, 225, 275);
            self.loadImageView.animationImages = [AmainPlustLoading lodingImages];
            self.loadImageView.animationDuration = 0.8f;
            [self addSubview:self.loadImageView];
        
            
            
        }
        
    }
    
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
