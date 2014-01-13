//
//  NeiRongView.h
//  YangShengArc
//
//  Created by XmL on 13-7-9.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NeiRongView : UIView

@property (nonatomic,retain)UIImageView * mgimageView;
@property (nonatomic,retain)UILabel * labOne;
@property (nonatomic,retain)UILabel * labBiaoti;
@property (nonatomic,retain)UILabel * labNeirong;
@property (nonatomic,retain)UILabel * labJieshao;

@property (nonatomic,retain)UITextView * ntextView;

-(id)initWithFloat:(CGFloat )mfloat;


@end
