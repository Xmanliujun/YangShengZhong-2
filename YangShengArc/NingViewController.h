//
//  NingViewController.h
//  YangShengArc
//
//  Created by XmL on 13-7-9.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGFourView.h"
#import "MiFangShuJvJson.h"
#import "ASIHTTPRequest.h"


#import "MyRootViewController.h"


@interface NingViewController : MyRootViewController
<ASIHTTPRequestDelegate>
{
    
    MGFourView * mg ;
    NSMutableArray * arrayJson;
    MiFangShuJvJson * mJsonShuJv;
    ASIHTTPRequest * mRequest;
    
    
}
@property (nonatomic,retain)NSMutableArray * arrayJson;
@property (nonatomic,retain) MiFangShuJvJson * mJsonShuJv;

-(id)initWithJson:(MiFangShuJvJson*)json;



@end
