//
//  LoadingView.h
//  YangShengArc
//
//  Created by 刘军 on 13-8-7.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView

@property (nonatomic,retain)UIImageView * loadImageView;
@property (nonatomic,retain)UIView * lView;



-(id)initWithFloat:(CGFloat )mfloat;

@end
