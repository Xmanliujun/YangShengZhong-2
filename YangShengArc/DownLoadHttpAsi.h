//
//  DownLoadHttpAsi.h
//  YangShengArc
//
//  Created by XmL on 13-6-27.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
@protocol DownLoadDelegate <NSObject>

-(void)downloadDelegateArray:(NSMutableArray *)array withString:(NSString*)string;

@end

@interface DownLoadHttpAsi : NSObject
<ASIHTTPRequestDelegate>
{

    ASIHTTPRequest * mRequest;
    NSMutableArray * httpArray;
    NSString * string;
    
    

}

@property(nonatomic,retain)id<DownLoadDelegate>delegate;
@property(nonatomic,retain)ASIHTTPRequest * mRequest;
@property(nonatomic,retain)NSMutableArray * httpArray;
@property(nonatomic,retain)NSString * string;




-(void)downHttpOne:(NSURL*)url withStringTag:(NSString *)strTag;

@end
