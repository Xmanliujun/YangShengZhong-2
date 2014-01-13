//
//  DataTimeView.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "DataTimeView.h"

@implementation DataTimeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)initWithFloat:(CGFloat )mfloat
{
    self = [super init];
    if (self) {
        
        
        
        if (mfloat > 480 && mfloat < 1000) {
            
           
//            
//            self.dataButton = [MyButton buttonWithType:UIButtonTypeRoundedRect];
//            self.dataButton.frame = CGRectMake(80, 350, 160, 40);
//            [self.dataButton setTitle:@"确定闹钟时间" forState:UIControlStateNormal];
//            [self addSubview:self.dataButton];
            
            
        }if (mfloat < 480) {
            
            
            
            
            
            
            
            
            
            
        }if (mfloat > 1000) {
            
            
            
            
        }
        
        
    }
    
    
    
    return self;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
