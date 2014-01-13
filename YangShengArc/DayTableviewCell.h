//
//  DayTableviewCell.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"
@interface DayTableviewCell : UITableViewCell

@property (nonatomic,retain)UIImageView * cellImageView;
@property (nonatomic,retain)UILabel * cellLabel;
@property (nonatomic,retain)MyButton * cellXiabtn;
@property (nonatomic,retain)MyButton * cellFenbtn;

@property (nonatomic,retain)UIImageView * cellDitiImage;


@end
