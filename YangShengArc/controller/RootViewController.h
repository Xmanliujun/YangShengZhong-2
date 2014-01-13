//
//  RootViewController.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrootView.h"
#import "ASIHTTPRequest.h"
#import "MyRootViewController.h"
@interface RootViewController : MyRootViewController
<ASIHTTPRequestDelegate,UIAlertViewDelegate>
{
    FrootView * fview;
    ASIHTTPRequest * numRequset;
    

}



@end
