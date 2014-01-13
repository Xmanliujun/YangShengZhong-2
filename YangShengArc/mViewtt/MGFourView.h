//
//  MGFourView.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"
@interface MGFourView : UIView


@property (nonatomic,retain)MyButton * fanBtn;
@property (nonatomic,retain)UIImageView * mgimageView;
@property (nonatomic,retain)UILabel * labOne;
@property (nonatomic,retain)UILabel * labBiaoti;
@property (nonatomic,retain)UILabel * labNeirong;
@property (nonatomic,retain)UILabel * labJieshao;
@property (nonatomic,retain)UITextView * ntextView;

-(id)initWithFloat:(CGFloat )mfloat;




@end
