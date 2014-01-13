//
//  HelpViewController.h
//  YangShengArc
//
//  Created by 刘军 on 13-8-19.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController
<UIScrollViewDelegate>
{
    UIScrollView * scrollView;
    UIPageControl *pageControl;
    NSMutableArray *picArray;
    BOOL pageControlUsed;
}
@end
