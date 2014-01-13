//
//  EveryView.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "EveryView.h"

@implementation EveryView

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
        
        
        
        if (mfloat > 480 ) {
            
            NSLog(@"dantian");
            
            self.quxiaoBtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.quxiaoBtn.frame = CGRectMake(250, 0, 60, 40);
            self.quxiaoBtn.tag = 201;
            // [self.quxiaoBtn setTitle:@"取消" forState:UIControlStateNormal];
            [self.quxiaoBtn setImage:[UIImage imageNamed:@"8.png"] forState:UIControlStateNormal];
            [self addSubview:self.quxiaoBtn];
            
            
            
            
            self.sheTimebtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.sheTimebtn.frame = CGRectMake(40, 5, 190, 30);
            self.sheTimebtn.tag = 201;
            [self.sheTimebtn setImage:[UIImage imageNamed:@"时间背景.png"] forState:UIControlStateNormal];
            [self addSubview:self.sheTimebtn];
            
            
            self.lgTimeLab = [[UILabel alloc] init];
            self.lgTimeLab.frame = CGRectMake(0, 0, 190, 30);
            self.lgTimeLab.textAlignment = NSTextAlignmentCenter;
            self.lgTimeLab.textColor = [UIColor blackColor];
            self.lgTimeLab.font = [UIFont fontWithName:@"Arial" size:13];
            self.lgTimeLab.backgroundColor = [UIColor clearColor];
            [self.sheTimebtn addSubview:self.lgTimeLab];
            
            self.diTuimageView = [[UIImageView alloc] init];
            self.diTuimageView.frame = CGRectMake(5, 35, 310, 330);
            self.diTuimageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
            [self addSubview:self.diTuimageView];
            
            self.biaoTiimageView = [[UIImageView alloc] init];
            self.biaoTiimageView.frame = CGRectMake(0, 0, 310, 30);
            self.biaoTiimageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
            [self.diTuimageView addSubview:self.biaoTiimageView];
            
            self.tiMuLab = [[UILabel alloc] init];
            self.tiMuLab.frame = CGRectMake(5, 30, 200, 30);
            self.tiMuLab.textAlignment = NSTextAlignmentLeft;
            self.tiMuLab.textColor = [UIColor blackColor];
            self.tiMuLab.font = [UIFont fontWithName:@"Arial" size:20];
            self.tiMuLab.backgroundColor = [UIColor clearColor];
            [self.biaoTiimageView addSubview:self.tiMuLab];
            
            self.liBiaobtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.liBiaobtn.frame = CGRectMake(255, 55, 60, 35);
            //[self.liBiaobtn setTitle:@"列表" forState:UIControlStateNormal];
            [self.liBiaobtn setImage:[UIImage imageNamed:@"当前.png"] forState:UIControlStateNormal];
            [self addSubview:self.liBiaobtn];
            
            self.jieShLab = [[UILabel alloc] init];
            self.jieShLab.frame =CGRectMake(5, 62, 300, 60);
            self.jieShLab.textAlignment = NSTextAlignmentLeft;
            self.jieShLab.numberOfLines = 0;
            self.jieShLab.font = [UIFont fontWithName:@"Arial" size:12];
            self.jieShLab.textColor = [UIColor blackColor];
            self.jieShLab.backgroundColor = [UIColor clearColor];
            [self.diTuimageView addSubview:self.jieShLab];
            
            self.nameLabel = [[UILabel alloc] init];
            self.nameLabel.frame =CGRectMake(10, 170, 150, 20);
            self.nameLabel.textAlignment = NSTextAlignmentLeft;
            self.nameLabel.font = [UIFont fontWithName:@"Arial" size:15];
            self.nameLabel.textColor = [UIColor blackColor];
            self.nameLabel.backgroundColor = [UIColor grayColor];
            [self addSubview:self.nameLabel];
            
            self.fenLabel = [[UILabel alloc] init];
            self.fenLabel.frame =CGRectMake(165, 170, 150, 20);
            self.fenLabel.textAlignment = NSTextAlignmentLeft;
            self.fenLabel.font = [UIFont fontWithName:@"Arial" size:15];
            self.fenLabel.textColor = [UIColor blackColor];
            self.fenLabel.backgroundColor = [UIColor grayColor];
            [self addSubview:self.fenLabel];
            
            
            
            self.boFangbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.boFangbtn.frame = CGRectMake(10, 200, 300, 200);
            [self.boFangbtn setImage:[UIImage imageNamed:@"当天大图.png"] forState:UIControlStateNormal];
            
            // [self.boFangbtn setTitle:@"播放" forState:UIControlStateNormal];
            [self addSubview:self.boFangbtn];
            
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 455, 320, 50)];
            imageView.image = [UIImage imageNamed:@"12.png"];
            [self addSubview:imageView];
            
            self.zaiXianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.zaiXianbtn.frame = CGRectMake(0, 455, 110, 50);
            // [self.zaiXianbtn setTitle:@"在线练功" forState:UIControlStateNormal];
            [self.zaiXianbtn setImage:[UIImage imageNamed:@"底部按钮1.png"] forState:UIControlStateNormal];
            [self addSubview:self.zaiXianbtn];
            
            self.benDibtn = [MyButton buttonWithType:UIButtonTypeCustom];;
            self.benDibtn.frame = CGRectMake(110, 455, 110, 50);
            // [self.benDibtn setTitle:@"本地播放" forState:UIControlStateNormal];
            [self.benDibtn setImage:[UIImage imageNamed:@"底部按钮2-.png"] forState:UIControlStateNormal];
            
            [self addSubview:self.benDibtn];
            
            self.gengDuobtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.gengDuobtn.frame = CGRectMake(222, 455, 98, 50);
            // [self.gengDuobtn setTitle:@"更多方法" forState:UIControlStateNormal];
            [self.gengDuobtn setImage:[UIImage imageNamed:@"底部按钮3-.png"] forState:UIControlStateNormal];
            
            [self addSubview:self.gengDuobtn];

            
             
            
            
            
            
        }if (mfloat <= 480) {
           
            
              NSLog(@"dantian2");
            self.quxiaoBtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.quxiaoBtn.frame = CGRectMake(240, 0, 60, 40);
            self.quxiaoBtn.tag = 201;
           // [self.quxiaoBtn setTitle:@"取消" forState:UIControlStateNormal];
            [self.quxiaoBtn setImage:[UIImage imageNamed:@"8.png"] forState:UIControlStateNormal];
            [self addSubview:self.quxiaoBtn];
            
            
           
            
            self.sheTimebtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.sheTimebtn.frame = CGRectMake(40, 0, 190, 30);
            self.sheTimebtn.tag = 201;
            [self.sheTimebtn setImage:[UIImage imageNamed:@"时间背景.png"] forState:UIControlStateNormal];
            [self addSubview:self.sheTimebtn];
            
            
            self.lgTimeLab = [[UILabel alloc] init];
            self.lgTimeLab.frame = CGRectMake(0, 0, 190, 30);
            self.lgTimeLab.textAlignment = NSTextAlignmentCenter;
            self.lgTimeLab.textColor = [UIColor blackColor];
            self.lgTimeLab.font = [UIFont fontWithName:@"Arial" size:13];
            self.lgTimeLab.backgroundColor = [UIColor clearColor];
            [self.sheTimebtn addSubview:self.lgTimeLab];
            
            self.diTuimageView = [[UIImageView alloc] init];
            self.diTuimageView.frame = CGRectMake(5, 35, 310, 330);
            self.diTuimageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
            [self addSubview:self.diTuimageView];
            
            self.biaoTiimageView = [[UIImageView alloc] init];
            self.biaoTiimageView.frame = CGRectMake(0, 0, 310, 30);
            self.biaoTiimageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
            [self.diTuimageView addSubview:self.biaoTiimageView];
            
            self.tiMuLab = [[UILabel alloc] init];
            self.tiMuLab.frame = CGRectMake(5, 0, 220, 30);
            self.tiMuLab.textAlignment = NSTextAlignmentLeft;
            self.tiMuLab.textColor = [UIColor blackColor];
            self.tiMuLab.font = [UIFont fontWithName:@"Arial" size:20];
            self.tiMuLab.backgroundColor = [UIColor clearColor];
            [self.biaoTiimageView addSubview:self.tiMuLab];
            
            self.liBiaobtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.liBiaobtn.frame = CGRectMake(265, 45, 50, 30);
            //[self.liBiaobtn setTitle:@"列表" forState:UIControlStateNormal];
            [self.liBiaobtn setImage:[UIImage imageNamed:@"当前.png"] forState:UIControlStateNormal];
            [self addSubview:self.liBiaobtn];
            
            self.jieShLab = [[UILabel alloc] init];
            self.jieShLab.frame =CGRectMake(5, 42, 300, 60);
            self.jieShLab.textAlignment = NSTextAlignmentLeft;
            self.jieShLab.numberOfLines = 0;
            self.jieShLab.font = [UIFont fontWithName:@"Arial" size:12];
            self.jieShLab.textColor = [UIColor blackColor];
            self.jieShLab.backgroundColor = [UIColor clearColor];
            [self.diTuimageView addSubview:self.jieShLab];
            
            self.nameLabel = [[UILabel alloc] init];
            self.nameLabel.frame =CGRectMake(10, 150, 150, 20);
            self.nameLabel.textAlignment = NSTextAlignmentLeft;
            self.nameLabel.font = [UIFont fontWithName:@"Arial" size:15];
            self.nameLabel.textColor = [UIColor blackColor];
            self.nameLabel.backgroundColor = [UIColor grayColor];
            [self addSubview:self.nameLabel];
            
            self.fenLabel = [[UILabel alloc] init];
            self.fenLabel.frame =CGRectMake(165, 150, 150, 20);
            self.fenLabel.textAlignment = NSTextAlignmentLeft;
            self.fenLabel.font = [UIFont fontWithName:@"Arial" size:15];
            self.fenLabel.textColor = [UIColor blackColor];
            self.fenLabel.backgroundColor = [UIColor grayColor];
            [self addSubview:self.fenLabel];
            
            self.boFangbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.boFangbtn.frame = CGRectMake(10, 180, 300, 180);
            [self.boFangbtn setImage:[UIImage imageNamed:@"当天大图.png"] forState:UIControlStateNormal];

           // [self.boFangbtn setTitle:@"播放" forState:UIControlStateNormal];
            [self addSubview:self.boFangbtn];
            
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 370, 320, 50)];
            imageView.image = [UIImage imageNamed:@"12.png"];
            [self addSubview:imageView];
            
            self.zaiXianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.zaiXianbtn.frame = CGRectMake(0, 370, 110, 50);
           // [self.zaiXianbtn setTitle:@"在线练功" forState:UIControlStateNormal];
            [self.zaiXianbtn setImage:[UIImage imageNamed:@"底部按钮1.png"] forState:UIControlStateNormal];
            [self addSubview:self.zaiXianbtn];
            
            self.benDibtn = [MyButton buttonWithType:UIButtonTypeCustom];;
            self.benDibtn.frame = CGRectMake(110, 370, 110, 50);
           // [self.benDibtn setTitle:@"本地播放" forState:UIControlStateNormal];
              [self.benDibtn setImage:[UIImage imageNamed:@"底部按钮2-.png"] forState:UIControlStateNormal];

            [self addSubview:self.benDibtn];
            
            self.gengDuobtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.gengDuobtn.frame = CGRectMake(222, 370, 98, 50);
           // [self.gengDuobtn setTitle:@"更多方法" forState:UIControlStateNormal];
             [self.gengDuobtn setImage:[UIImage imageNamed:@"底部按钮3-.png"] forState:UIControlStateNormal];

            [self addSubview:self.gengDuobtn];

            
            
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
