//
//  ShareMoreView.m
//  PlusTimesPang
//
//  Created by kimpeng on 13-5-1.
//
//

#import "ShareMoreView.h"
#import "ShareObject.h"
#import "CONST.h"
//#import "Profile.h"
//#import "StaticObject.h"
#import "ShareObject.h"

@implementation ShareMoreView

//- (void)dealloc
//{
////    [_renrenButton release];
////    [_backImageView release];
////    [_closeButton release];
////    [_weixinButton release];
////    [_sinaWeiboButton release];
////    [_qqZoneButton release];
////    [_qqButton release];
////    [_weixinFriendsButton release];
////    [_tencentWeiboButton release];
////    [_account release];
//    [_score release];
//    [_shareImage release];
//    
//    [super dealloc];
//}

- (id)initWithFrame:(CGRect)frame andScore:(NSString *)score andShareImage:(UIImage *)image andAccount:(NSString *)account
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

       // self.alpha = 0.0f;
        
        UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
        backView.backgroundColor = [UIColor blackColor];
        backView.alpha = 0.7;
        [self addSubview:backView];
        
//        UIView * v = [[UIView alloc] init];
//        v.frame = CGRectMake(40, 100, 240, 240);
//        v.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"全背景.png"]];
       // [self addSubview:v];
        
        
        self.backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(28, 50, 284, 312.5)];
        self.backImageView.image = [UIImage imageNamed:@"syx_bg.png"];
        [self addSubview:self.backImageView];
        
        self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.closeButton setFrame:self.bounds];
        [self.closeButton setImage:[UIImage imageNamed:@"关闭1状态.png"] forState:UIControlStateNormal];
        [self addSubview:self.closeButton];
        
        self.weixinButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.weixinButton setFrame:CGRectMake(60, 130, 70, 70)];
        [self.weixinButton setImage:[UIImage imageNamed:@"发微信.png"] forState:UIControlStateNormal];
        [self addSubview:self.weixinButton];
        
        self.sinaWeiboButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.sinaWeiboButton setFrame:CGRectMake(190, 130, 70, 70)];
        [self.sinaWeiboButton setImage:[UIImage imageNamed:@"新浪.png"] forState:UIControlStateNormal];
        [self addSubview:self.sinaWeiboButton];
        
//        self.qqZoneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [self.qqZoneButton setFrame:CGRectMake(50, 290, 53.5, 53)];
//        [self.qqZoneButton setImage:[UIImage imageNamed:@"yqhy_qq_1.png"] forState:UIControlStateNormal];
//        [self.qqZoneButton setEnabled:NO];
////        [self addSubview:self.qqZoneButton];
//        
//        self.qqButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [self.qqButton setFrame:CGRectMake(186, 130, 52.5, 52.5)];
//        [self.qqButton setImage:[UIImage imageNamed:@"tx1zt.png"] forState:UIControlStateNormal];
//        [self.qqButton setEnabled:NO];
       // [self addSubview:self.qqButton];
        
        self.weixinFriendsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.weixinFriendsButton setFrame:CGRectMake(60, 235, 70, 70)];
        [self.weixinFriendsButton setImage:[UIImage imageNamed:@"朋友圈.png"] forState:UIControlStateNormal];
        [self addSubview:self.weixinFriendsButton];
        
        self.tencentWeiboButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.tencentWeiboButton setFrame:CGRectMake(190, 235, 70, 70)];
        [self.tencentWeiboButton setImage:[UIImage imageNamed:@"腾讯.png"] forState:UIControlStateNormal];
        [self addSubview:self.tencentWeiboButton];
        
//        self.renrenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [self.renrenButton setFrame:CGRectMake(190, 330, 52.5, 52.5)];
//        [self.renrenButton setImage:[UIImage imageNamed:@"rr1zt.png"] forState:UIControlStateNormal];
//        [self addSubview:self.renrenButton];
        
        self.score = score;//分数
        self.account = account;
        self.shareImage = [UIImage imageNamed:@"icon.png"];//log
        
        [self.weixinButton addTarget:self action:@selector(shareMoreWeixinButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.weixinFriendsButton addTarget:self action:@selector(shareMoreWeixinFButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.sinaWeiboButton addTarget:self action:@selector(shareMoreSinaWeiboButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.tencentWeiboButton addTarget:self action:@selector(shareMoreTencentWeiBoButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.closeButton addTarget:self action:@selector(shareMoreCloseButtonAction) forControlEvents:UIControlEventTouchUpInside];
      // [self.renrenButton addTarget:self action:@selector(shareMoreRenrenButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//晒一下窗口关闭事件
- (void)shareMoreCloseButtonAction
{
    self.hidden = YES;
}
- (NSString *)getWeixinText
{
    int i = arc4random() % 4;
    NSString *str = nil;
    switch (i) {
        case 0:
            str = [NSString stringWithFormat:WEIXIN_SHARE_TEXT1];
            break;
        case 1:
            str = [NSString stringWithFormat:WEIXIN_SHARE_TEXT2];
            break;
        case 2:
            str = [NSString stringWithFormat:WEIXIN_SHARE_TEXT3];
            break;
        case 3:
            str = [NSString stringWithFormat:WEIXIN_SHARE_TEXT4];
            break;
            
        default:
            break;
    }
    return str;
}

//分享带有网址的语句  新浪分享用的 
- (NSString *)getWeiboText
{
    int i = arc4random() % 4;
    NSString *str = nil;
   // Profile *p = [StaticObject getTemporaryProfile];
    switch (i) {
        case 0:
            str = [NSString stringWithFormat:WEIBO_SHARE_TEXT_1];
            break;
        case 1:
            str = [NSString stringWithFormat:WEIBO_SHARE_TEXT_2];
            break;
        case 2:
            str = [NSString stringWithFormat:WEIBO_SHARE_TEXT_3];
            break;
        case 3:
            str = [NSString stringWithFormat:WEIBO_SHARE_TEXT_4];
            break;
            
        default:
            break;
    }
    
    return str;
    
}
 
//晒一下微信好友 a
- (void)shareMoreWeixinButtonAction
{
  //  Profile *p = [StaticObject getTemporaryProfile];
    ShareObject *s = [[ShareObject alloc] init];
    [s weixin:WEIXIN_SHARE_TITLE withText:[self getWeixinText] andImage:self.shareImage andUrl:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/bu-shen-jian-shen-bao-dian/id695438455?ls=1&mt=8"]];
   // [s release];
    self.hidden = YES;
    
}

//晒一下微信朋友圈 a
- (void)shareMoreWeixinFButtonAction
{
   // Profile *p = [StaticObject getTemporaryProfile];
    ShareObject *s = [[ShareObject alloc] init];
    [s weixinFriends:[self getWeixinText] withText:WEIXIN_SHARE_TITLE andImage:self.shareImage andUrl:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/bu-shen-jian-shen-bao-dian/id695438455?ls=1&mt=8"] getDiamond:0];
  //  [s release];
    self.hidden = YES;
    
}

//晒一下新浪微博 a
- (void)shareMoreSinaWeiboButtonAction
{
    ShareObject *s = [[ShareObject alloc] init];
    [s sinaWeibo:WEIBO_TITLE withText:[self getWeiboText] andShareImage:self.shareImage getDiamond:0];
  //[s release];
  // self.hidden = YES;
    
}

//晒一下腾讯微博 a
- (void)shareMoreTencentWeiBoButtonAction
{
    ShareObject *s = [[ShareObject alloc] init];
    [s tencenWeibo:WEIBO_TITLE withText:[self getWeiboText] andShareImage:self.shareImage getDiamond:0];
    // [s release];
    //  self.hidden = YES;
    
    
}



//晒一下Facebook
//- (void)shareMoreRenrenButtonAction
//{
//    ShareObject *s = [[ShareObject alloc] init];
//   // [s renren:WEIBO_TITLE withText:[self getWeiboText] andShareImage:self.shareImage];
//    [s shareToFacebookClickHandler:WEIBO_TITLE withText:[self getWeiboText] andImge:self.shareImage];
//  //  [s release];
//}



@end
