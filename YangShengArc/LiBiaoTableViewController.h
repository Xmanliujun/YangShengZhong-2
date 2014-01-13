//
//  LiBiaoTableViewController.h
//  YangShengArc
//
//  Created by 刘军 on 13-8-5.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "MiFangShuJvJson.h"

#import "MyRootViewController.h"


@interface LiBiaoTableViewController : MyRootViewController
<UITableViewDataSource,UITableViewDelegate,ASIHTTPRequestDelegate>
{

    UITableView * liBiaoTableView;
    NSMutableArray * liArray;
    NSString * numString;
    
    ASIHTTPRequest * lRequest;
    MiFangShuJvJson * mJson;
    BOOL lStrat;

}
@property (nonatomic,retain) NSMutableArray * liArray;
@property (nonatomic,retain) NSString * numString;


-(id)initWithNumber:(NSString *)nString;




@end
