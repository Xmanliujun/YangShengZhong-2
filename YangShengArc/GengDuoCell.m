//
//  GengDuoCell.m
//  YangShengArc
//
//  Created by XmL on 13-7-9.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "GengDuoCell.h"

@implementation GengDuoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UIView * v = [[UIView alloc] init];
        v.frame = CGRectMake(0, 0, 320, 80);
        v.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
        [self.contentView addSubview:v];
        
        self.gImageView = [[UIImageView alloc] init];
        self.gImageView.frame = CGRectMake(5, 10, 90, 60);
        self.gImageView.image = [UIImage imageNamed:@"9.png"];
        [self.contentView addSubview:self.gImageView];
        
        self.gLabelName = [[UILabel alloc] init];
        self.gLabelName.frame = CGRectMake(100, 2, 200, 18);
        self.gLabelName.textColor = [UIColor blackColor];
        self.gLabelName.font = [UIFont fontWithName:@"Arial" size:18];
        self.gLabelName.backgroundColor = [UIColor clearColor];
        self.gLabelName.textAlignment = NSTextAlignmentLeft;
        self.gLabelName.text = @"养生心法";
        [self.contentView addSubview:self.gLabelName];
        
        self.gLabelJiesh = [[UILabel alloc] init];
        self.gLabelJiesh.frame = CGRectMake(100, 20, 220, 56);
        self.gLabelJiesh.textColor = [UIColor grayColor];
        self.gLabelJiesh.font = [UIFont fontWithName:@"Arial" size:10];
        self.gLabelJiesh.backgroundColor = [UIColor clearColor];
        self.gLabelJiesh.textAlignment = NSTextAlignmentLeft;
        self.gLabelJiesh.numberOfLines = 0;
       // self.gLabelJiesh.text = @"离开时间对法拉开始就得法拉克丝的合法开奖号史蒂夫噶为；拉斯科大华股份上大号佛网撒旦法绿卡好几十东";
        [self.contentView addSubview:self.gLabelJiesh];
        
        
        //细线
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 310, 1)];
        imageView.image = [UIImage imageNamed:@"间隔线.png"];
        [self.contentView addSubview:imageView];
        
        
        
    }
    
    return self;
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
