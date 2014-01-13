//
//  MiView.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"
@interface MiView : UIView

@property (nonatomic,retain)MyButton * btnOne;
@property (nonatomic,retain)MyButton * btnTwo;
@property (nonatomic,retain)MyButton * btnThr;
@property (nonatomic,retain)MyButton * btnFou;
@property (nonatomic,retain)MyButton * ningBtn;
@property (nonatomic,retain)UIImageView * diTuimageViewd;



-(id)initWithFloat:(CGFloat )mfloat;

@end
