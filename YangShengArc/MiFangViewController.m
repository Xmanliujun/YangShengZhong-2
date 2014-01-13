//
//  MiFangViewController.m
//  YangShengArc
//
//  Created by XmL on 13-6-26.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "MiFangViewController.h"
#import "MiFangShuJvJson.h"
#import "UIImageView+WebCache.h"




@interface MiFangViewController ()

@end

@implementation MiFangViewController
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




-(void)btnFanHui:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
/*

*/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    arrayJson = [[NSMutableArray alloc] initWithCapacity:0];
    

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
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bkbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bkbtn;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
    
   
    
    mg = [[NeiRongView alloc] initWithFloat:self.view.bounds.size.height];
    mg.frame = self.view.bounds;
  //  mg.labBiaoti.text = @"第二模块";
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
