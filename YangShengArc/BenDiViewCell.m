//
//  BenDiViewCell.m
//  YangShengArc
//
//  Created by XmL on 13-7-10.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "BenDiViewCell.h"

@implementation BenDiViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UIView * v  = [[UIView alloc] init];
        v.frame = CGRectMake(0, 0, 320, 80);
        v.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
        [self.contentView addSubview:v];
        
        self.zhImageView = [[UIImageView alloc] init];
        self.zhImageView.frame = CGRectMake(5, 15, 70, 50);
        self.zhImageView.image = [UIImage imageNamed:@"9.png"];
        [self.contentView addSubview:self.zhImageView];
        
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.frame = CGRectMake(80, 20, 220, 30);
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.textColor = [UIColor grayColor];
        self.nameLabel.backgroundColor  = [UIColor clearColor];
        self.nameLabel.font = [UIFont fontWithName:@"Arial" size:15];
        self.nameLabel.text = @"Please go to download video!";
        [self.contentView addSubview:self.nameLabel];
        
        
        
        
        
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
