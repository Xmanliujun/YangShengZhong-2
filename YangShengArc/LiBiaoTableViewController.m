//
//  LiBiaoTableViewController.m
//  YangShengArc
//
//  Created by 刘军 on 13-8-5.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "LiBiaoTableViewController.h"
#import "LiBiaoCell.h"
#import "UIImageView+WebCache.h"


#import "MshiViewController.h"
#import "MyaoViewController.h"
#import "MyudViewController.h"
#import "MpianViewController.h"
#import "NingViewController.h"

#import "MiFangViewController.h"
#import "FangFaViewController.h"

@interface LiBiaoTableViewController ()

@end

@implementation LiBiaoTableViewController
@synthesize liArray,numString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithNumber:(NSString *)nString
{
    self = [super init];
    if (self) {
        
        self.numString = nString;
        
  
    }
    
    return self;
    
}


-(NSMutableArray *)httpJsonModel:(NSDictionary *)dict
{
    NSMutableArray * array = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSArray * a = [dict objectForKey:@"NewsAll"];
    
    for (NSDictionary * d in a) {
        
        mJson = [[MiFangShuJvJson alloc] init];
        mJson.mNewTitle = [d objectForKey:@"NewsTitle"];
        mJson.mNewContent = [d objectForKey:@"NewsContent"];
        mJson.mNewImg = [d objectForKey:@"NewsImg"];
        mJson.mNewAdd = [d objectForKey:@"NewsAddtime"];
        mJson.mNewClassID = [d objectForKey:@"NewsClassid"];
        mJson.mNewClassName = [d objectForKey:@"NewsClassname"];
        
        [array addObject:mJson];
        mJson = nil;

 
    }
    NSLog(@"array is  %d",array.count);
    

    return array;

}

-(void)httpLrequest
{
    int al = [self.numString intValue];
    NSLog(@"al is  %d",al);
    //139.210.99.29:83 192.168.2.17
    NSString * stringUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/health/index.php/admin/y_yangsheng/search_news_list/%d",al];
    
    NSLog(@"url 3000+  is %@",stringUrl);
    
    NSURL * url = [NSURL URLWithString:stringUrl];
    
    lRequest = [[ASIHTTPRequest alloc] initWithURL:url];
    lRequest.delegate = self;
    lRequest.tag = 3000 + al;
    [lRequest startAsynchronous];

    lStrat = YES;
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"下载内容: %@",[request responseString]);
    
    NSError * error = nil;
    lStrat = NO;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
    self.liArray = [self httpJsonModel:dic];
    NSLog(@"liarray is %d",self.liArray.count);
    [liBiaoTableView reloadData];
    
    
    
    
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    lStrat = NO;
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"错误2"
                                                     message:@"网络链接超时!"
                                                    delegate:nil
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    [alertView show];
    

}

-(void)btnFanHui:(UIButton *)btn
{
    if (lStrat == YES) {
        [lRequest clearDelegatesAndCancel];
        lStrat = NO;
        [self dismissViewControllerAnimated:YES completion:NULL];
    }else{
    
        [self dismissViewControllerAnimated:YES completion:NULL];

    }
    
}

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

    
    liArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    NSLog(@"number is  %@",self.numString);
    
    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"6.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 30, 40);
    [btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bkbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bkbtn;
    
    //self.view.bounds
    liBiaoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height - 45) style:UITableViewStylePlain];
    liBiaoTableView.delegate = self;
    liBiaoTableView.dataSource = self;
    UIImageView * imageTable = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"全背景.png"]];
    liBiaoTableView.backgroundView = imageTable;
    [self.view addSubview:liBiaoTableView];
    
    
    [self httpLrequest];
    
    
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellID = [NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row];
    
    LiBiaoCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[LiBiaoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        
        
    }
    if (self.liArray.count != 0) {
        MiFangShuJvJson * mj = [self.liArray objectAtIndex:indexPath.row];
        
        cell.lLabelCell.text = mj.mNewTitle;
        [cell.lImageViewCell setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://139.210.99.29:83/health/%@",mj.mNewImg]] placeholderImage:nil];
        
        
    }



    return cell;

}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 50.0f;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.liArray.count != 0) {
        return self.liArray.count;
    }else{
        return 10;
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"cell is %d",indexPath.row);
    
    if ([self.numString isEqualToString:@"1"]) {
        NSLog(@"number is  %@",self.numString);
        
        MiFangViewController * m = [[MiFangViewController alloc] initWithJson:[self.liArray objectAtIndex:indexPath.row]];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:m];
        m.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
        
    }
    if ([self.numString isEqualToString:@"2"]) {
        NSLog(@"number is  %@",self.numString);
        
        FangFaViewController * f = [[FangFaViewController alloc] initWithJson:[self.liArray objectAtIndex:indexPath.row]];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:f];
        f.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
        
    }
    if ([self.numString isEqualToString:@"13"]) {
        NSLog(@"number is  %@",self.numString);
        
        MyudViewController * mu = [[MyudViewController alloc] initWithJson:[self.liArray objectAtIndex:indexPath.row]];
        UINavigationController * n = [[UINavigationController alloc] initWithRootViewController:mu];
        mu.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:n animated:YES completion:NULL];
        
        
    }
    if ([self.numString isEqualToString:@"15"]) {
        NSLog(@"number is  %@",self.numString);
        
        MpianViewController * mp = [[MpianViewController alloc] initWithJson:[self.liArray objectAtIndex:indexPath.row]];
        UINavigationController * n = [[UINavigationController alloc] initWithRootViewController:mp];
        mp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:n animated:YES completion:NULL];
        
    }
    if ([self.numString isEqualToString:@"16"]) {
        NSLog(@"number is  %@",self.numString);
        
        NingViewController * ni = [[NingViewController alloc] initWithJson:[self.liArray objectAtIndex:indexPath.row]];
        UINavigationController * n = [[UINavigationController alloc] initWithRootViewController:ni];
        ni.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:n animated:YES completion:NULL];
        
        
    }
    if ([self.numString isEqualToString:@"17"]) {
        NSLog(@"number is  %@",self.numString);
        
        MshiViewController * ms = [[MshiViewController alloc] initWithJson:[self.liArray objectAtIndex:indexPath.row]];
        UINavigationController * n = [[UINavigationController alloc] initWithRootViewController:ms];
        ms.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:n animated:YES completion:NULL];

        
        
        
    }
    if ([self.numString isEqualToString:@"18"]) {
        NSLog(@"number is  %@",self.numString);
        
        MyaoViewController * ma = [[MyaoViewController alloc] initWithJson:[self.liArray objectAtIndex:indexPath.row]];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ma];
        ma.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
        
        
        
        
    }
    
}

-(void)dealloc
{

    [lRequest clearDelegatesAndCancel];
    NSLog(@"dealloc");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
