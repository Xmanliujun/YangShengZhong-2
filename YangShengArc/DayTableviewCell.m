//
//  DayTableviewCell.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "DayTableviewCell.h"

@implementation DayTableviewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.cellDitiImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"全背景.png"]];
        self.cellDitiImage.frame = CGRectMake(0, 0, 310, 80);
        [self.contentView addSubview:self.cellDitiImage];
        
        self.cellImageView = [[UIImageView alloc] init];
        self.cellImageView.frame = CGRectMake(10, 5, 91, 63.5);
//        self.cellImageView.backgroundColor = [UIColor grayColor];
        self.cellImageView.image = [UIImage imageNamed:@"9.png"];
        [self.contentView addSubview:self.cellImageView];
        
        self.cellLabel = [[UILabel alloc] init];
        self.cellLabel.frame = CGRectMake(105, 10, 100, 50);
        self.cellLabel.textAlignment = NSTextAlignmentLeft;
        self.cellLabel.textColor = [UIColor blackColor];
        self.cellLabel.numberOfLines = 0;
        self.cellLabel.font = [UIFont fontWithName:@"Arial" size:15];
        self.cellLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.cellLabel];
        
        self.cellXiabtn = [MyButton buttonWithType:UIButtonTypeCustom];
        self.cellXiabtn.frame = CGRectMake(205, 15, 50, 50);
        [self.cellXiabtn setImage:[UIImage imageNamed:@"10.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.cellXiabtn];
        
        self.cellFenbtn = [MyButton buttonWithType:UIButtonTypeCustom];
        self.cellFenbtn.frame = CGRectMake(255, 15, 50, 50);
        [self.cellFenbtn setImage:[UIImage imageNamed:@"11.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.cellFenbtn];
        
        
      
        
        //细线
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 310, 1)];
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
