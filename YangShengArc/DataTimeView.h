//
//  DataTimeView.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"
@interface DataTimeView : UIView


@property (nonatomic,retain) UIDatePicker * datePicker;
@property (nonatomic,retain) MyButton * dataButton;



-(id)initWithFloat:(CGFloat )mfloat;
@end
