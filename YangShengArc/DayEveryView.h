//
//  DayEveryView.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"

@interface DayEveryView : UIView

@property (nonatomic,retain)UIScrollView * scrView;
@property (nonatomic,retain)UITableView * myTableView;

@property (nonatomic,retain)UIImageView * diTuimageViewd;
@property (nonatomic,retain)UIImageView * biaoTiimageViewd;

@property (nonatomic,retain)MyButton * sheTimebtnd;
@property (nonatomic,retain)MyButton * liBiaobtnd;
@property (nonatomic,retain)MyButton * boFangbtnd;
@property (nonatomic,retain)MyButton * zaiXianbtnd;
@property (nonatomic,retain)MyButton * benDibtnd;
@property (nonatomic,retain)MyButton * gengDuobtnd;

@property (nonatomic,retain)MyButton *huiFuBtn;


@property (nonatomic,retain)UILabel * lgTimeLabd;
@property (nonatomic,retain)UILabel * tiMuLabd;
@property (nonatomic,retain)UILabel * jieShLabd;
@property (nonatomic,retain)UILabel * riQiLabd;



-(id)initWithFloat:(CGFloat )mfloat;


@end
