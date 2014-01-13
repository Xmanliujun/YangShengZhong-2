//
//  MyaoViewController.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "MyaoViewController.h"
#import "MiFangShuJvJson.h"
#import "UIImageView+WebCache.h"



@interface MyaoViewController ()

@end

@implementation MyaoViewController

@synthesize arrayJson,mJsonShuJv;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithJson:(MiFangShuJvJson *)json
{
    if (self = [super init]) {
        self.mJsonShuJv = json;
    }
    
    return self;
}



-(void)fanhuiam:(MyButton *)btn
{
    
    NSLog(@"fanhuibtn");
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    
    
}

/*
-(NSMutableArray *)jsonStringDict:(NSDictionary *)responseDict
{
    NSDictionary * d = [responseDict objectForKey:@"NewsAll"];
    NSMutableArray * ary = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    mJsonShuJv = [[MiFangShuJvJson alloc] init];
    mJsonShuJv.mNewTitle = [d objectForKey:@"NewsTitle"];
    mJsonShuJv.mNewContent = [d objectForKey:@"NewsContent"];
    mJsonShuJv.mNewImg = [d objectForKey:@"NewsImg"];
    mJsonShuJv.mNewVideo = [d objectForKey:@"NewsVideo"];
    mJsonShuJv.mNewAdd = [d objectForKey:@"NewsAddtime"];
    mJsonShuJv.mNewClassID = [d objectForKey:@"NewsClassid"];
    mJsonShuJv.mNewClassName = [d objectForKey:@"NewsClassname"];
    
    [ary addObject:mJsonShuJv];
    mJsonShuJv = nil;
    
    
    
    
    
    
    return ary;
    
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    if (request.tag == 1000) {
        
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        
        self.arrayJson = [self jsonStringDict:dic];
        
        if (self.arrayJson.count != 0) {
            NSLog(@"json 解析数组长度 %d",[self.arrayJson count]);
            MiFangShuJvJson * mf = [self.arrayJson objectAtIndex:0];
            NSLog(@"title is  %@",mf.mNewTitle);
            NSLog(@"image is  %@",mf.mNewImg);
            NSLog(@"cocent is  %@",mf.mNewContent);
            
            mg.labBiaoti.text = mf.mNewTitle;
            mg.ntextView.text = mf.mNewContent;
            //异步加载图片
            [mg.mgimageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.tripg.com/health/%@",mf.mNewImg]] placeholderImage:nil];
            
            //    [imageNew setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",num.snOUrl]] placeholderImage:nil];
            
            
            
        }
        
        
    }else{
        
        NSLog(@"没有下载解析");
        
    }
    
    
    
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    
    NSLog(@"error is  %@",[request responseString]);
    if (request.tag == 1000) {
        
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"错误"
														 message:@"网络链接超时!"
														delegate:nil
											   cancelButtonTitle:@"确定"
											   otherButtonTitles:nil];
		[alertView show];
    }
}


-(void)httpMifang
{
    
    //图片 http://www.tripg.com/health/./uploads/0710092417-23.jpg
    NSString * stringUrl = @"http://www.tripg.com/health/admin/y_yangsheng/search_news_list/18";
    NSURL * url = [NSURL URLWithString:stringUrl];
    
    mRequest = [ASIHTTPRequest requestWithURL:url];
    mRequest.tag = 1000;
    [mRequest setTimeOutSeconds:60];

    mRequest.delegate = self;
    [mRequest startAsynchronous];
    
}

*/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"6.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 30, 40);
    [btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(fanhuiam:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bkbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bkbtn;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];

    
    mg = [[MGFourView alloc] initWithFloat:self.view.bounds.size.height];
    mg.frame = self.view.bounds;
    [mg.fanBtn addTarget:self action:@selector(fanhuiam:) forControlEvents:UIControlEventTouchUpInside];
    mg.labBiaoti.text = @"药补";

    [self.view addSubview:mg];
    
    
    NSLog(@"title is  %@",mJsonShuJv.mNewTitle);
    NSLog(@"image is  %@",mJsonShuJv.mNewImg);
    NSLog(@"cocent is  %@",mJsonShuJv.mNewContent);
    
    mg.labBiaoti.text = mJsonShuJv.mNewTitle;
    mg.ntextView.text = mJsonShuJv.mNewContent;
    //异步加载图片
    [mg.mgimageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://139.210.99.29:83/health/%@",mJsonShuJv.mNewImg]] placeholderImage:nil];
    
    //    [imageNew setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",num.snOUrl]] placeholderImage:nil];

    
   // [self httpMifang];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
