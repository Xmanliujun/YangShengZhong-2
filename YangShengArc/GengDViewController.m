//
//  GengDViewController.m
//  YangShengArc
//
//  Created by XmL on 13-6-27.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "GengDViewController.h"
#import "MyButton.h"
#import "EveryDayViewController.h"
#import "BenDiViewController.h"
#import "RootViewController.h"
#import "GengDuoCell.h"
#import "UIImageView+WebCache.h"

#import "JieShaoViewController.h"

@interface GengDViewController ()

@end

@implementation GengDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)btnFanHui:(UIButton * )btn
{
    NSLog(@"btnFanHui");
    
    RootViewController * ra = [[RootViewController alloc] init];
    ra.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ra];
    [self presentViewController:nav animated:YES completion:NULL];

    
    
    
}

//在线练功
-(void)zaiXianbtna:(MyButton *)btn
{
    
    NSLog(@"zaiXianbtna");
    EveryDayViewController * b = [[EveryDayViewController alloc] init];
    UINavigationController *  nav = [[UINavigationController alloc] initWithRootViewController:b];
    b.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
    
}

//本地
-(void)benDibtna:(MyButton *)btn
{
    
    NSLog(@"benDibtna");
        BenDiViewController * b = [[BenDiViewController alloc] init];
        UINavigationController *  nav = [[UINavigationController alloc] initWithRootViewController:b];
        b.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
    
    
}

//更多方法
-(void)gengDuobtna:(MyButton *)btn
{
    
    NSLog(@"gengDuobtna");

    
    
    
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

    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"6.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 30, 40);
    [btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bkbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bkbtn;

    
    
    CGRect rect = self.view.bounds;
    
    
    gengTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, rect.size.height - 90) style:UITableViewStylePlain];
    gengTableView.tag = 1600;
    gengTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"全背景.png"]];
    gengTableView.delegate = self;
    gengTableView.dataSource= self;
    [self.view addSubview:gengTableView];
    
    if (self.view.bounds.size.height > 480 ){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 455, 320, 50)];
        imageView.image = [UIImage imageNamed:@"12.png"];
        [self.view addSubview:imageView];
        
        MyButton * zaiXianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
        zaiXianbtn.frame = CGRectMake(0, 455, 110, 50);
        [zaiXianbtn setImage:[UIImage imageNamed:@"底部按钮1-.png"] forState:UIControlStateNormal];
        [self.view addSubview:zaiXianbtn];
        
        MyButton* benDibtn = [MyButton buttonWithType:UIButtonTypeCustom];;
        benDibtn.frame = CGRectMake(110, 455, 110, 50);
        [benDibtn setImage:[UIImage imageNamed:@"底部按钮2-.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:benDibtn];
        
        MyButton*gengDuobtn = [MyButton buttonWithType:UIButtonTypeCustom];
        gengDuobtn.frame = CGRectMake(222, 455, 98, 50);
        [gengDuobtn setImage:[UIImage imageNamed:@"底部按钮3.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:gengDuobtn];
        [zaiXianbtn addTarget:self action:@selector(zaiXianbtna:) forControlEvents:UIControlEventTouchUpInside];
        [benDibtn addTarget:self action:@selector(benDibtna:) forControlEvents:UIControlEventTouchUpInside];
        [gengDuobtn addTarget:self action:@selector(gengDuobtna:) forControlEvents:UIControlEventTouchUpInside];

    }else if(self.view.bounds.size.height <= 480){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 370, 320, 50)];
        imageView.image = [UIImage imageNamed:@"12.png"];
        [self.view addSubview:imageView];
        
        MyButton * zaiXianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
        zaiXianbtn.frame = CGRectMake(0, 370, 110, 50);
        [zaiXianbtn setImage:[UIImage imageNamed:@"底部按钮1-.png"] forState:UIControlStateNormal];
        [self.view addSubview:zaiXianbtn];
        
        MyButton* benDibtn = [MyButton buttonWithType:UIButtonTypeCustom];;
        benDibtn.frame = CGRectMake(110, 370, 110, 50);
        [benDibtn setImage:[UIImage imageNamed:@"底部按钮2-.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:benDibtn];
        
        MyButton*gengDuobtn = [MyButton buttonWithType:UIButtonTypeCustom];
        gengDuobtn.frame = CGRectMake(222, 370, 98, 50);
        [gengDuobtn setImage:[UIImage imageNamed:@"底部按钮3.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:gengDuobtn];
        [zaiXianbtn addTarget:self action:@selector(zaiXianbtna:) forControlEvents:UIControlEventTouchUpInside];
        [benDibtn addTarget:self action:@selector(benDibtna:) forControlEvents:UIControlEventTouchUpInside];
        [gengDuobtn addTarget:self action:@selector(gengDuobtna:) forControlEvents:UIControlEventTouchUpInside];

    }
    
   
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString * cellID = [NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row];
    
    GengDuoCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell== nil) {
        cell = [[GengDuoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    if (indexPath.row == 0) {
        cell.gLabelName.text = @"吐纳养生功法(介绍)";
        cell.gLabelJiesh.text = @"一种练功方法。指通过呼出浊气吸进清气，或伴随发音来调整身体各部机能的气功锻炼方法。做法是用满吸的呼吸法，先把气呼净，腹部自然放松，然后吸气使肺部开张，再慢慢把气呼出去，以此来加强吐纳的过程，关键是为了换气。";
        
    }else if (indexPath.row == 1){
        cell.gLabelName.text = @"太极拳养生功法(介绍)";
        cell.gLabelJiesh.text = @"养生太极拳属于内家拳术。按张三丰太极丹诀、王宗岳太极拳论内外兼修。内练意气劲力，运太极阴阳；外练拳势招式，显气势神态。通俗说法：形体力量和精神气质同时锻炼。";
    
    }else if (indexPath.row == 2){
        cell.gLabelName.text = @"道家养生功法(介绍)";
        cell.gLabelJiesh.text = @"道家养生功，是老子创始的，传承至今己有二千多年的历史。至元代丘处机祖师创立道教龙门派，经十二代传到牛金宝。道家养生功以收心求静为基础，这叫做修性；以养精固本为归宿，这叫做养命。修性必须落实到养命之上，故此功称为性命双修养生功。";
        
    }else if (indexPath.row == 3){
        cell.gLabelName.text = @"八卦掌养生功法(介绍)";
        cell.gLabelJiesh.text = @"八卦掌又称游身八卦掌﹑八卦连环掌﹐是一种以掌法变换和行步走转为主的拳术。由于它运动时纵横交错﹐分为四正四隅八个方位﹐与“周易”八卦图中的卦象相似﹐故名八卦掌。有些八卦掌老拳谱常以卦理解释拳理﹐以八个卦位代表基本八掌。";
        
    }
    
    cell.selectionStyle = UITableViewCellAccessoryNone;

    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    return 80.0f;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"cell is here ");
    
    JieShaoViewController * js = [[JieShaoViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:js];
    js.numString = [NSString stringWithFormat:@"%d",indexPath.row];
    [self presentViewController:nav animated:YES completion:NULL];
    
    
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
