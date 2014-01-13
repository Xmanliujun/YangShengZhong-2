//
//  DownLoadHttpAsi.m
//  YangShengArc
//
//  Created by XmL on 13-6-27.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "DownLoadHttpAsi.h"



@implementation DownLoadHttpAsi
@synthesize delegate,mRequest,string,httpArray;



-(void)downHttpOne:(NSURL *)url withStringTag:(NSString *)strTag
{
 
    self.string = strTag;
    NSLog(@"url is %@",url);
    mRequest = [[ASIHTTPRequest alloc] initWithURL:url] ;
    mRequest.tag = 1000;
    mRequest.delegate = self;
//    [mRequest setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"1.mp4"]];
//    [mRequest setDownloadProgressDelegate:self];
    [mRequest startAsynchronous];


}


-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"下载内容 : %@",[request responseString]);
    NSData * data = [request responseData];
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/xxx.mp4"];
    [data writeToFile:filePath atomically:YES];
    
}

-(void)requestFailed:(ASIHTTPRequest *)request
{

    NSLog(@"error");

}




@end
