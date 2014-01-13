//
//  JieShaoViewController.h
//  YangShengArc
//
//  Created by 刘军 on 13-8-28.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyRootViewController.h"
#import "GengDuoView.h"


@interface JieShaoViewController : MyRootViewController

{

    GengDuoView * gView;
    NSString * numString;
}
@property(nonatomic,retain)NSString * numString;

@end
