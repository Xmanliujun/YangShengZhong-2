//
//  FrootView.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "FrootView.h"

@implementation FrootView

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
            UIImageView * imagmeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
            imagmeView.image = [UIImage imageNamed:@"1.png"];
            [self addSubview:imagmeView];
            
            
            
            
            
            
            self.meiTianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.meiTianbtn.frame = CGRectMake(120, 170, 100, 80);
            self.meiTianbtn.tag = 101;
            [self.meiTianbtn setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
            [self addSubview:self.meiTianbtn];
            
            self.miFangbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.miFangbtn.frame = CGRectMake(20, 330, 80, 80);
            self.miFangbtn.tag = 102;
            [self.miFangbtn setImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
            [self addSubview:self.miFangbtn];
            
            self.liLunbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.liLunbtn.frame = CGRectMake(120, 330, 80, 80);
            self.liLunbtn.tag = 103;
            [self.liLunbtn setImage:[UIImage imageNamed:@"4.png"] forState:UIControlStateNormal];
            [self addSubview:self.liLunbtn];
            
            self.fangFabtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.fangFabtn.frame = CGRectMake(220, 330, 80, 80);
            self.fangFabtn.tag = 104;
            [self.fangFabtn setImage:[UIImage imageNamed:@"5.png"] forState:UIControlStateNormal];
            [self addSubview:self.fangFabtn];
            
//            self.sheZhibtn = [MyButton buttonWithType:UIButtonTypeRoundedRect];
//            self.sheZhibtn.frame = CGRectMake(230, 2, 80, 40);
//            self.sheZhibtn.tag = 105;
//            [self.sheZhibtn setImage:nil forState:UIControlStateNormal];
//            [self addSubview:self.sheZhibtn];
            
            
            
        }if (mfloat <= 480) {
            
            UIImageView * imagmeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
            imagmeView.image = [UIImage imageNamed:@"1.png"];
            [self addSubview:imagmeView];
            
            self.meiTianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.meiTianbtn.frame = CGRectMake(120, 170, 100, 80);
            self.meiTianbtn.tag = 101;
            [self.meiTianbtn setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
            [self addSubview:self.meiTianbtn];
            
            self.miFangbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.miFangbtn.frame = CGRectMake(20, 300, 80, 80);
            self.miFangbtn.tag = 102;
            [self.miFangbtn setImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
            [self addSubview:self.miFangbtn];
            
            self.liLunbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.liLunbtn.frame = CGRectMake(120, 300, 80, 80);
            self.liLunbtn.tag = 103;
            [self.liLunbtn setImage:[UIImage imageNamed:@"4.png"] forState:UIControlStateNormal];
            [self addSubview:self.liLunbtn];
            
            self.fangFabtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.fangFabtn.frame = CGRectMake(220, 300, 80, 80);
            self.fangFabtn.tag = 104;
            [self.fangFabtn setImage:[UIImage imageNamed:@"5.png"] forState:UIControlStateNormal];
            [self addSubview:self.fangFabtn];
            
//            self.sheZhibtn = [MyButton buttonWithType:UIButtonTypeRoundedRect];
//            self.sheZhibtn.frame = CGRectMake(230, 2, 80, 40);
//            self.sheZhibtn.tag = 105;
//            [self.sheZhibtn setImage:nil forState:UIControlStateNormal];
//            [self addSubview:self.sheZhibtn];

            
            
            
        }
        /*
        if (mfloat > 1000) {
            
            UIImageView * imagmeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 1004)];
            imagmeView.image = [UIImage imageNamed:@"1.png"];
            [self addSubview:imagmeView];
            
            self.meiTianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.meiTianbtn.frame = CGRectMake(310, 390, 200, 160);
            self.meiTianbtn.tag = 101;
            [self.meiTianbtn setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
            [self addSubview:self.meiTianbtn];
            
            self.miFangbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.miFangbtn.frame = CGRectMake(100, 730, 180, 180);
            self.miFangbtn.tag = 102;
            [self.miFangbtn setImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
            [self addSubview:self.miFangbtn];
            
            self.liLunbtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.liLunbtn.frame = CGRectMake(310, 730, 180, 180);
            self.liLunbtn.tag = 103;
            [self.liLunbtn setImage:[UIImage imageNamed:@"4.png"] forState:UIControlStateNormal];
            [self addSubview:self.liLunbtn];
            
            self.fangFabtn = [MyButton buttonWithType:UIButtonTypeCustom];
            self.fangFabtn.frame = CGRectMake(530, 730, 180, 180);
            self.fangFabtn.tag = 104;
            [self.fangFabtn setImage:[UIImage imageNamed:@"5.png"] forState:UIControlStateNormal];
            [self addSubview:self.fangFabtn];

            
            
        }
*/
        
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
