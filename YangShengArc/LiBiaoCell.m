//
//  LiBiaoCell.m
//  YangShengArc
//
//  Created by 刘军 on 13-8-5.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "LiBiaoCell.h"

@implementation LiBiaoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIImageView *cellDitiImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"全背景.png"]];
        cellDitiImage.frame = CGRectMake(0, 0, 320, 50);
        [self.contentView addSubview:cellDitiImage];
        
        self.lImageViewCell = [[UIImageView alloc] init];
        self.lImageViewCell.frame = CGRectMake(10, 5, 40, 40);
      //  self.lImageViewCell.image = [UIImage imageNamed:@"9.png"];
        [self.contentView addSubview:self.lImageViewCell];
        
        self.lLabelCell = [[UILabel alloc] init];
        self.lLabelCell.frame = CGRectMake(55, 10, 270, 30);
        self.lLabelCell.textAlignment = NSTextAlignmentCenter;
        self.lLabelCell.textColor = [UIColor blackColor];
        self.lLabelCell.numberOfLines = 0;
        self.lLabelCell.font = [UIFont fontWithName:@"Arial" size:18];
        self.lLabelCell.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.lLabelCell];
        
        //细线
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
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
