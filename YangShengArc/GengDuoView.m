//
//  GengDuoView.m
//  YangShengArc
//
//  Created by 刘军 on 13-8-28.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "GengDuoView.h"

@implementation GengDuoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithFloat:(CGFloat )mfloat
{
    self = [super init];
    if (self) {
        
        if (mfloat > 480  ) {
            
            self.diTuimageViewd = [[UIImageView alloc] init];
            self.diTuimageViewd.frame = CGRectMake(0, 0, 320, 505);
            self.diTuimageViewd.image = [UIImage imageNamed:@"全背景.png"];
            [self addSubview:self.diTuimageViewd];
            
            self.labBiaoti = [[UILabel alloc] init];
            self.labBiaoti.frame = CGRectMake(80, 5, 160, 38);
            self.labBiaoti.textAlignment = NSTextAlignmentCenter;
            self.labBiaoti.textColor = [UIColor blackColor];
            self.labBiaoti.font = [UIFont fontWithName:@"Arial" size:15];
            self.labBiaoti.backgroundColor = [UIColor clearColor];
            [self addSubview:self.labBiaoti];
            
            self.ntextView = [[UITextView alloc] init];
            self.ntextView.frame = CGRectMake(20, 50, 280, 380);
            self.ntextView.font = [UIFont fontWithName:@"Arial" size:13];
            self.ntextView.backgroundColor = [UIColor clearColor];
            self.ntextView.textColor = [UIColor grayColor];
            self.ntextView.editable = NO;
            [self addSubview:self.ntextView];
            
            
        }
        if (mfloat <= 480) {
            
            self.diTuimageViewd = [[UIImageView alloc] init];
            self.diTuimageViewd.frame = CGRectMake(0, 0, 320, 420);
            self.diTuimageViewd.image = [UIImage imageNamed:@"全背景.png"];
            [self addSubview:self.diTuimageViewd];

            
            self.labBiaoti = [[UILabel alloc] init];
            self.labBiaoti.frame = CGRectMake(80, 5, 160, 38);
            self.labBiaoti.textAlignment = NSTextAlignmentCenter;
            self.labBiaoti.textColor = [UIColor blackColor];
            self.labBiaoti.font = [UIFont fontWithName:@"Arial" size:15];
            self.labBiaoti.backgroundColor = [UIColor clearColor];
            [self addSubview:self.labBiaoti];
            
            self.ntextView = [[UITextView alloc] init];
            self.ntextView.frame = CGRectMake(20, 50, 280, 350);
            self.ntextView.font = [UIFont fontWithName:@"Arial" size:13];
            self.ntextView.backgroundColor = [UIColor clearColor];
            self.ntextView.textColor = [UIColor grayColor];
            self.ntextView.editable = NO;
            [self addSubview:self.ntextView];
            
                
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
