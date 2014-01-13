//
//  DayEveryView.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "DayEveryView.h"
#import "EveryDayViewController.h"

@interface DayEveryView ()

@property (nonatomic, retain) EveryDayViewController *controller;


@end

@implementation DayEveryView

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
            
            self.backgroundColor = [UIColor yellowColor];
            
            self.diTuimageViewd = [[UIImageView alloc] init];
            self.diTuimageViewd.frame = CGRectMake(5, 35, 310, 330);
            self.diTuimageViewd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
            [self addSubview:self.diTuimageViewd];
            
            self.biaoTiimageViewd = [[UIImageView alloc] init];
            self.biaoTiimageViewd.frame = CGRectMake(0, 0, 310, 30);
            self.biaoTiimageViewd.image = [UIImage imageNamed:@"全背景.png"];
            [self.diTuimageViewd addSubview:self.biaoTiimageViewd];
            
            self.tiMuLabd = [[UILabel alloc] init];
            self.tiMuLabd.frame = CGRectMake(5, -5, 180, 30);
            self.tiMuLabd.textAlignment = NSTextAlignmentLeft;
            self.tiMuLabd.textColor = [UIColor blackColor];
            self.tiMuLabd.font = [UIFont fontWithName:@"Arial" size:20];
            self.tiMuLabd.backgroundColor = [UIColor clearColor];
            [self.biaoTiimageViewd addSubview:self.tiMuLabd];
            
            self.liBiaobtnd = [MyButton buttonWithType:UIButtonTypeCustom];
            self.liBiaobtnd.frame = CGRectMake(250, 20, 60, 35);
            [self.liBiaobtnd setImage:[UIImage imageNamed:@"列表.png"] forState:UIControlStateNormal];
            [self addSubview:self.liBiaobtnd];
            
            self.jieShLabd = [[UILabel alloc] init];
            self.jieShLabd.frame =CGRectMake(5, 25, 300, 60);
            self.jieShLabd.textAlignment = NSTextAlignmentLeft;
            self.jieShLabd.numberOfLines = 0;
            self.jieShLabd.font = [UIFont fontWithName:@"Arial" size:12];
            self.jieShLabd.textColor = [UIColor blackColor];
            self.jieShLabd.backgroundColor = [UIColor clearColor];
            [self.diTuimageViewd addSubview:self.jieShLabd];
            
            //            self.scrView = [[UIScrollView alloc] init];
            //            self.scrView.frame = CGRectMake(5, 100, 250, 220);
            //            [self addSubview:self.scrView];
            
            self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 140, 300, 240) style:UITableViewStylePlain];
            self.myTableView.tag = 1001;
            //  [self.myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            [self addSubview:self.myTableView];
            
            
            self.huiFuBtn = [MyButton buttonWithType:UIButtonTypeRoundedRect];
            self.huiFuBtn.frame = CGRectMake(240, 390, 60, 30);
            [self.huiFuBtn setTitle:@"回复内购" forState:UIControlStateNormal];
            [self addSubview:self.huiFuBtn];
            
            
            /*
            self.scrView = [[UIScrollView alloc] init];
            self.scrView.frame = CGRectMake(5, 100, 250, 220);
            [self addSubview:self.scrView];
            
            int k = 0 ;
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j <3; j++) {
                    
                    MyButton * button = [MyButton buttonWithType:UIButtonTypeRoundedRect];
                    button.frame = CGRectMake(8 + j * 90 , 5+i*70, 60 , 60);
                    button.tag = 301 + k;
                    [button setTitle:@"播放" forState:UIControlStateNormal];
                    [button addTarget:self.controller action:@selector(bofangb:) forControlEvents:UIControlEventTouchUpInside];
                    [self.scrView addSubview:button];
                    k++;
                    
                }
               
            }
            
            
            */          
            
            
            
            
            
            
        }if (mfloat <= 480) {
            
            self.backgroundColor = [UIColor yellowColor];
            
            self.diTuimageViewd = [[UIImageView alloc] init];
            self.diTuimageViewd.frame = self.bounds;
            self.diTuimageViewd.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
            [self addSubview:self.diTuimageViewd];
            
            self.biaoTiimageViewd = [[UIImageView alloc] init];
            self.biaoTiimageViewd.frame = CGRectMake(0, 0, 310, 30);
            self.biaoTiimageViewd.image = [UIImage imageNamed:@"全背景.png"];
            [self.diTuimageViewd addSubview:self.biaoTiimageViewd];
            
            self.tiMuLabd = [[UILabel alloc] init];
            self.tiMuLabd.frame = CGRectMake(5, 0, 180, 30);
            self.tiMuLabd.textAlignment = NSTextAlignmentLeft;
            self.tiMuLabd.textColor = [UIColor blackColor];
            self.tiMuLabd.font = [UIFont fontWithName:@"Arial" size:20];
            self.tiMuLabd.backgroundColor = [UIColor clearColor];
            [self.biaoTiimageViewd addSubview:self.tiMuLabd];
            
            self.liBiaobtnd = [MyButton buttonWithType:UIButtonTypeCustom];
            self.liBiaobtnd.frame = CGRectMake(260, 10, 50, 30);
            //  [self.liBiaobtnd setTitle:@"当天" forState:UIControlStateNormal];
            [self.liBiaobtnd setImage:[UIImage imageNamed:@"列表.png"] forState:UIControlStateNormal];
            [self addSubview:self.liBiaobtnd];
            
            self.jieShLabd = [[UILabel alloc] init];
            self.jieShLabd.frame =CGRectMake(5, 40, 300, 60);
            self.jieShLabd.textAlignment = NSTextAlignmentLeft;
            self.jieShLabd.numberOfLines = 0;
            self.jieShLabd.font = [UIFont fontWithName:@"Arial" size:12];
            self.jieShLabd.textColor = [UIColor blackColor];
            self.jieShLabd.backgroundColor = [UIColor clearColor];
            [self.diTuimageViewd addSubview:self.jieShLabd];
            
            //            self.scrView = [[UIScrollView alloc] init];
            //            self.scrView.frame = CGRectMake(5, 100, 250, 220);
            //            [self addSubview:self.scrView];
            
            self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 95, 300, 220) style:UITableViewStylePlain];
            self.myTableView.tag = 1001;
            //  [self.myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            [self addSubview:self.myTableView];
            
            
            
            self.huiFuBtn = [MyButton buttonWithType:UIButtonTypeRoundedRect];
            self.huiFuBtn.frame = CGRectMake(240, 315, 60, 20);
            [self.huiFuBtn setTitle:@"恢复内购" forState:UIControlStateNormal];
            [self addSubview:self.huiFuBtn];
            
            
            //            int k = 0 ;
            //            for (int i = 0; i < 3; i++) {
            //                for (int j = 0; j <3; j++) {
            //
            //                    MyButton * button = [MyButton buttonWithType:UIButtonTypeRoundedRect];
            //                    button.frame = CGRectMake(8 + j * 90 , 5+i*70, 60 , 60);
            //                    button.tag = 301 + k;
            //                    [button setTitle:@"播放" forState:UIControlStateNormal];
            //                    [button addTarget:self.controller action:@selector(bofangb:) forControlEvents:UIControlEventTouchUpInside];
            //                    [self.scrView addSubview:button];
            //                    k++;
            //                    
            //                }
            //                
            //            }
            

            
            
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
