//
//  MiView.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "MiView.h"

@implementation MiView

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
        if (mfloat > 480 ) {
            self.diTuimageViewd = [[UIImageView alloc] init];
            self.diTuimageViewd.frame = CGRectMake(0, 0, 320, 505);
            self.diTuimageViewd.image = [UIImage imageNamed:@"千古一方背景.png"];
            [self addSubview:self.diTuimageViewd];
            
            self.ningBtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.ningBtn.frame = CGRectMake(150, 280, 60, 60);
            [self.ningBtn setImage:[UIImage imageNamed:@"宁气.png"] forState:UIControlStateNormal];
            [self addSubview:self.ningBtn];
            
            self.btnOne = [MyButton buttonWithType:UIButtonTypeCustom];
            self.btnOne.frame = CGRectMake(80, 100, 60, 60);
            [self.btnOne setImage:[UIImage imageNamed:@"食补.png"] forState:UIControlStateNormal];
            [self addSubview:self.btnOne];
            
            self.btnTwo = [MyButton buttonWithType:UIButtonTypeCustom];
            self.btnTwo.frame = CGRectMake(210, 100, 60, 60);
            [self.btnTwo setImage:[UIImage imageNamed:@"药补.png"] forState:UIControlStateNormal];
            [self addSubview:self.btnTwo];
            
            self.btnThr = [MyButton buttonWithType:UIButtonTypeCustom];
            self.btnThr.frame = CGRectMake(45, 225, 60, 60);
            [self.btnThr setImage:[UIImage imageNamed:@"养心.png"] forState:UIControlStateNormal];
            [self addSubview:self.btnThr];
            
            self.btnFou = [MyButton buttonWithType:UIButtonTypeCustom];
            self.btnFou.frame = CGRectMake(220, 210, 60, 60);
            [self.btnFou setImage:[UIImage imageNamed:@"运动.png"] forState:UIControlStateNormal];
            [self addSubview:self.btnFou];
            
            
        }if (mfloat <= 480) {
            
          
            
            self.diTuimageViewd = [[UIImageView alloc] init];
            self.diTuimageViewd.frame = CGRectMake(0, 0, 320, 420);
            self.diTuimageViewd.image = [UIImage imageNamed:@"千古一方背景.png"];
            [self addSubview:self.diTuimageViewd];
            
            self.ningBtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.ningBtn.frame = CGRectMake(150, 260, 60, 60);
            [self.ningBtn setImage:[UIImage imageNamed:@"宁气.png"] forState:UIControlStateNormal];
            [self addSubview:self.ningBtn];
            
            self.btnOne = [MyButton buttonWithType:UIButtonTypeCustom];
            self.btnOne.frame = CGRectMake(80, 80, 60, 60);
            [self.btnOne setImage:[UIImage imageNamed:@"食补.png"] forState:UIControlStateNormal];
            [self addSubview:self.btnOne];
            
            self.btnTwo = [MyButton buttonWithType:UIButtonTypeCustom];
            self.btnTwo.frame = CGRectMake(210, 80, 60, 60);
            [self.btnTwo setImage:[UIImage imageNamed:@"药补.png"] forState:UIControlStateNormal];
            [self addSubview:self.btnTwo];
            
            self.btnThr = [MyButton buttonWithType:UIButtonTypeCustom];
            self.btnThr.frame = CGRectMake(45, 205, 60, 60);
            [self.btnThr setImage:[UIImage imageNamed:@"养心.png"] forState:UIControlStateNormal];
            [self addSubview:self.btnThr];
            
            self.btnFou = [MyButton buttonWithType:UIButtonTypeCustom];
            self.btnFou.frame = CGRectMake(220, 190, 60, 60);
            [self.btnFou setImage:[UIImage imageNamed:@"运动.png"] forState:UIControlStateNormal];
            [self addSubview:self.btnFou];
            
            
            
            
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
