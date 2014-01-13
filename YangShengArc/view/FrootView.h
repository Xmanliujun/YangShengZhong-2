//
//  FrootView.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"
@interface FrootView : UIView

@property (nonatomic,retain)MyButton * meiTianbtn;
@property (nonatomic,retain)MyButton * miFangbtn;
@property (nonatomic,retain)MyButton * liLunbtn;
@property (nonatomic,retain)MyButton * fangFabtn;
@property (nonatomic,retain)MyButton * sheZhibtn;



-(id)initWithFloat:(CGFloat )mfloat;

@end
