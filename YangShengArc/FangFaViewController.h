//
//  FangFaViewController.h
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiView.h"
#import "NeiRongView.h"
#import "ASIHTTPRequest.h"
#import "MiFangShuJvJson.h"
#import "MyRootViewController.h"


@interface FangFaViewController : MyRootViewController

<ASIHTTPRequestDelegate>

{
    
    MiView * mView ;
    NeiRongView  * mg;
    
    NSMutableArray * arrayJson;
    MiFangShuJvJson * mJsonShuJv;
    ASIHTTPRequest * mRequest;
    
    
    
}
@property (nonatomic,retain)NSMutableArray * arrayJson;
@property (nonatomic,retain) MiFangShuJvJson * mJsonShuJv;

-(id)initWithJson:(MiFangShuJvJson*)json;




@end
