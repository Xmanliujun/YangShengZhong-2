//
//  MGFourView.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "MGFourView.h"

@implementation MGFourView

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
    self = [super init];
    if (self) {
    
        if (mfloat >480  ) {
            

            
            self.labBiaoti = [[UILabel alloc] init];
            self.labBiaoti.frame = CGRectMake(10, 5, 300, 35);
            self.labBiaoti.textAlignment = NSTextAlignmentCenter;
            self.labBiaoti.textColor = [UIColor blackColor];
            self.labBiaoti.font = [UIFont fontWithName:@"Arial" size:18];
            // self.labBiaoti.text =@"食补";
            self.labBiaoti.backgroundColor = [UIColor clearColor];
            [self addSubview:self.labBiaoti];
            
            //            self.labJieshao = [[UILabel alloc] init];
            //            self.labJieshao.frame = CGRectMake(20, 45, 280, 100);
            //            self.labJieshao.textAlignment = NSTextAlignmentLeft;
            //            self.labJieshao.numberOfLines = 0;
            //            self.labJieshao.textColor = [UIColor grayColor];
            //            self.labJieshao.font = [UIFont fontWithName:@"Arial" size:12];
            //            self.labJieshao.backgroundColor = [UIColor redColor];
            //            [self addSubview:self.labJieshao];
            
            self.mgimageView = [[UIImageView alloc] init];
            self.mgimageView.frame = CGRectMake(20, 45, 280, 150);
            self.mgimageView.backgroundColor = [UIColor clearColor];
            
            [self addSubview:self.mgimageView];
            
            //            self.labNeirong = [[UILabel alloc]init];
            //            self.labNeirong.frame = CGRectMake(20, 200, 280, 210);
            //            self.labNeirong.textColor = [UIColor grayColor];
            //            self.labNeirong.textAlignment = NSTextAlignmentLeft;
            //            self.labNeirong.font = [UIFont fontWithName:@"Arial" size:12];
            //            self.labNeirong.backgroundColor =[UIColor clearColor];
            //            self.labNeirong.numberOfLines = 0;
            //            [self addSubview:self.labNeirong];
            
            self.ntextView = [[UITextView alloc] init];
            self.ntextView.frame = CGRectMake(20, 200, 280, 260);
            self.ntextView.font = [UIFont fontWithName:@"Arial" size:13];
            self.ntextView.backgroundColor = [UIColor clearColor];
            self.ntextView.textColor = [UIColor grayColor];
            self.ntextView.editable = NO;
            [self addSubview:self.ntextView];
            

            
            
        }
        
        if (mfloat <= 480) {
            

            
            self.labBiaoti = [[UILabel alloc] init];
            self.labBiaoti.frame = CGRectMake(10, 5, 300, 35);
            self.labBiaoti.textAlignment = NSTextAlignmentCenter;
            self.labBiaoti.textColor = [UIColor blackColor];
            self.labBiaoti.font = [UIFont fontWithName:@"Arial" size:18];
            // self.labBiaoti.text =@"食补";
            self.labBiaoti.backgroundColor = [UIColor clearColor];
            [self addSubview:self.labBiaoti];
            
//            self.labJieshao = [[UILabel alloc] init];
//            self.labJieshao.frame = CGRectMake(20, 45, 280, 100);
//            self.labJieshao.textAlignment = NSTextAlignmentLeft;
//            self.labJieshao.numberOfLines = 0;
//            self.labJieshao.textColor = [UIColor grayColor];
//            self.labJieshao.font = [UIFont fontWithName:@"Arial" size:12];
//            self.labJieshao.backgroundColor = [UIColor redColor];
//            [self addSubview:self.labJieshao];
            
            self.mgimageView = [[UIImageView alloc] init];
            self.mgimageView.frame = CGRectMake(20, 45, 280, 150);
            self.mgimageView.backgroundColor = [UIColor clearColor];

            [self addSubview:self.mgimageView];
            
//            self.labNeirong = [[UILabel alloc]init];
//            self.labNeirong.frame = CGRectMake(20, 200, 280, 210);
//            self.labNeirong.textColor = [UIColor grayColor];
//            self.labNeirong.textAlignment = NSTextAlignmentLeft;
//            self.labNeirong.font = [UIFont fontWithName:@"Arial" size:12];
//            self.labNeirong.backgroundColor =[UIColor clearColor];
//            self.labNeirong.numberOfLines = 0;
//            [self addSubview:self.labNeirong];
            
            self.ntextView = [[UITextView alloc] init];
            self.ntextView.frame = CGRectMake(20, 200, 280, 200);
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
