//
//  EveryView.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"
@interface EveryView : UIView

@property (nonatomic,retain)UIImageView * diTuimageView;
@property (nonatomic,retain)UIImageView * biaoTiimageView;

@property (nonatomic,retain)MyButton * quxiaoBtn;
@property (nonatomic,retain)MyButton * sheTimebtn;
@property (nonatomic,retain)MyButton * liBiaobtn;
@property (nonatomic,retain)MyButton * boFangbtn;
@property (nonatomic,retain)MyButton * zaiXianbtn;
@property (nonatomic,retain)MyButton * benDibtn;
@property (nonatomic,retain)MyButton * gengDuobtn;
@property (nonatomic,retain)UILabel * lgTimeLab;
@property (nonatomic,retain)UILabel * tiMuLab;
@property (nonatomic,retain)UILabel * jieShLab;
@property (nonatomic,retain)UILabel * riQiLab;


@property (nonatomic,retain)UILabel * nameLabel;
@property (nonatomic,retain)UILabel * fenLabel;



-(id)initWithFloat:(CGFloat )mfloat;

@end
