//
//  ShareObject.m
//  PlusTimesPang
//
//  Created by kimpeng on 13-4-19.
//
//

#import "ShareObject.h"
#import <AGCommon/UINavigationBar+Common.h>
#import <ShareSDK/ShareSDK.h>


@implementation ShareObject

+ (void)sendNewsContent:(NSString *)uid
{
    id<ISSContent> content = [ShareSDK content:@"分享一款好玩的游戏！！"
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"touxiang.png"] quality:1]
                                         title:@"一起来玩吧！！"
                                           url:@"http://42.96.177.162/iwopeng/Login.html"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiSession
               authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                               allowCallback:YES
                                               authViewStyle:SSAuthViewStyleModal
                                                viewDelegate:nil
                                     authManagerViewDelegate:nil]
             statusBarTips:YES
                    result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        if (state == SSPublishContentStateSuccess)
                        {
//                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:@"知道了"
                                                                          otherButtonTitles:nil];
                                [alertView show];
                            }
                        }
                    }];
}

+ (void)sendTimelineNewsContent:(NSString *)uid
{
    id<ISSContent> content = [ShareSDK content:@"分享一款好玩的休闲小游戏"
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:[UIImage imageNamed:@"touxiang.png"] quality:1]
                                         title:@"大家一起来玩吧！！"
                                           url:@"http://42.96.177.162/iwopeng/Login.html"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeApp];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiTimeline
               authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                               allowCallback:YES
                                               authViewStyle:SSAuthViewStyleModal
                                                viewDelegate:nil
                                     authManagerViewDelegate:nil]
             statusBarTips:YES
                    result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        if (state == SSPublishContentStateSuccess)
                        {
//                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:@"知道了"
                                                                          otherButtonTitles:nil];
                                [alertView show];
                            }
                        }
                    }];
}

+ (void)shareToTencentWeiboClickHandler:(UIButton *)sender
{
    //创建分享内容
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"touxiang" ofType:@"jpg"];
    id<ISSContent> publishContent = [ShareSDK content:@"asdfasdhttp://www.plustimes.net"
                                       defaultContent:@""
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:nil
                                                  url:nil
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeText];
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //显示分享菜单
    [ShareSDK showShareViewWithType:ShareTypeTencentWeibo
                          container:container
                            content:publishContent
                      statusBarTips:YES
                        authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleModal
                                                         viewDelegate:nil
                                              authManagerViewDelegate:nil]
                       shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                           oneKeyShareList:nil
                                                            qqButtonHidden:NO
                                                     wxSessionButtonHidden:NO
                                                    wxTimelineButtonHidden:NO
                                                      showKeyboardOnAppear:NO
                                                         shareViewDelegate:nil
                                                       friendsViewDelegate:nil
                                                     picViewerViewDelegate:nil]
                             result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 if (state == SSPublishContentStateSuccess)
                                 {
//                                     NSLog(@"发表成功");
                                 }
                                 else if (state == SSPublishContentStateFail)
                                 {
//                                     NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                                 }
                             }];
}

+ (void)shareToSinaWeiboClickHandler:(UIButton *)sender
{
    //创建分享内容
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"touxiang" ofType:@"jpg"];
    id<ISSContent> publishContent = [ShareSDK content:@"你看不懂啊看不懂啊不懂啊不懂啊http://www.plustimes.net"
                                       defaultContent:@""
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"大家一起来玩吧！！"
                                                  url:nil
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeImage];
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
//    [container setIPadContainerWithView:nil arrowDirect:nil];
    
    //显示分享菜单
    [ShareSDK showShareViewWithType:ShareTypeSinaWeibo
                          container:container
                            content:publishContent
                      statusBarTips:YES
                        authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleModal
                                                         viewDelegate:nil
                                              authManagerViewDelegate:nil]
                       shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                           oneKeyShareList:nil
                                                            qqButtonHidden:NO
                                                     wxSessionButtonHidden:NO
                                                    wxTimelineButtonHidden:NO
                                                      showKeyboardOnAppear:NO
                                                         shareViewDelegate:nil
                                                       friendsViewDelegate:nil
                                                     picViewerViewDelegate:nil]
                             result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 if (state == SSPublishContentStateSuccess)
                                 {
//                                     NSLog(@"发表成功");
                                 }
                                 else if (state == SSPublishContentStateFail)
                                 {
//                                     NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                                 }
                             }];
}

//微信分享
- (void)weixin:(NSString *)title withText:(NSString *)text andImage:(UIImage *)image andUrl:(NSString *)url
{
    
    id<ISSContent> content = [ShareSDK content:text
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:image quality:1]
                                         title:title
                                           url:url
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeNews];
    
    
        
    
   
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiSession
               authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                               allowCallback:YES
                                               authViewStyle:SSAuthViewStyleModal
                                                viewDelegate:nil
                                     authManagerViewDelegate:nil]
             statusBarTips:YES
                    result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:@"知道了"
                                                                          otherButtonTitles:nil];
                                [alertView show];
                            }
                        }
                    }];
     
     
     
}

//微信朋友圈分享
- (void)weixinFriends:(NSString *)title withText:(NSString *)text andImage:(UIImage *)image andUrl:(NSString *)url getDiamond:(NSInteger)give
{
    id<ISSContent> content = [ShareSDK content:text
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:image quality:1]
                                         title:title
                                           url:url
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeApp];
    
    [ShareSDK shareContent:content
                      type:ShareTypeWeixiTimeline
               authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                               allowCallback:YES
                                               authViewStyle:SSAuthViewStyleModal
                                                viewDelegate:nil
                                     authManagerViewDelegate:nil]
             statusBarTips:YES
                    result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                            if (give == 1) {
                                [self.delegate shareFinished:1];
                            }
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            [self.delegate shareFaild];
                            if ([error errorCode] == -22003)
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                    message:[error errorDescription]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:@"知道了"
                                                                          otherButtonTitles:nil];
                                [alertView show];
                            }
                        }
                    }];
}

//腾讯微博分享
- (void)tencenWeibo:(NSString *)title withText:(NSString *)text andShareImage:(UIImage *)shareImage getDiamond:(NSInteger)give
{
    //创建分享内容
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"touxiang" ofType:@"jpg"];
    id<ISSContent> publishContent = [ShareSDK content:text
                                       defaultContent:@""
                                                image:[ShareSDK jpegImageWithImage:shareImage quality:1]
                                                title:title
                                                  url:nil
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeText];
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    
    //显示分享菜单
    [ShareSDK showShareViewWithType:ShareTypeTencentWeibo
                          container:container
                            content:publishContent
                      statusBarTips:YES
                        authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleModal
                                                         viewDelegate:nil
                                              authManagerViewDelegate:nil]
                       shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                           oneKeyShareList:nil
                                                            qqButtonHidden:NO
                                                     wxSessionButtonHidden:NO
                                                    wxTimelineButtonHidden:NO
                                                      showKeyboardOnAppear:NO
                                                         shareViewDelegate:nil
                                                       friendsViewDelegate:nil
                                                     picViewerViewDelegate:nil]
                             result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 if (state == SSPublishContentStateSuccess)
                                 {
                                     if (give == 1) {
                                         [self.delegate shareFinished:3];
                                     }
                                     NSLog(@"发表成功");
                                 }
                                 else if (state == SSPublishContentStateFail)
                                 {
                                     [self.delegate shareFaild];
                                     NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                                 }
                             }];
}

//新浪微博分享
- (void)sinaWeibo:(NSString *)title withText:(NSString *)text andShareImage:(UIImage *)shareImage getDiamond:(NSInteger)give
{
    //创建分享内容
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"touxiang" ofType:@"jpg"];
    id<ISSContent> publishContent = [ShareSDK content:text
                                       defaultContent:@""
                                                image:[ShareSDK jpegImageWithImage:shareImage quality:1]
                                                title:title
                                                  url:nil
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeImage];
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    //    [container setIPadContainerWithView:nil arrowDirect:nil];
    
    //显示分享菜单
    [ShareSDK showShareViewWithType:ShareTypeSinaWeibo
                          container:container
                            content:publishContent
                      statusBarTips:YES
                        authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleModal
                                                         viewDelegate:nil
                                              authManagerViewDelegate:nil]
                       shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                           oneKeyShareList:nil
                                                            qqButtonHidden:NO
                                                     wxSessionButtonHidden:NO
                                                    wxTimelineButtonHidden:NO
                                                      showKeyboardOnAppear:NO
                                                         shareViewDelegate:nil
                                                       friendsViewDelegate:nil
                                                     picViewerViewDelegate:nil]
                             result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 if (state == SSPublishContentStateSuccess)
                                 {
                                     if (give == 1) {
                                         [self.delegate shareFinished:2];
                                     }
                                     NSLog(@"发表成功");
                                 }
                                 else if (state == SSPublishContentStateFail)
                                 {
                                     [self.delegate shareFaild];
                                     NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                                 }
                             }];
}

//QQ空间分享
+ (void)qZone:(NSString *)title withText:(NSString *)text andShareImage:(UIImage *)shareImage
{
    //创建分享内容
    id<ISSContent> publishContent = [ShareSDK content:text
                                       defaultContent:@""
                                                image:[ShareSDK jpegImageWithImage:shareImage quality:1]
                                                title:title
                                                  url:@"http://www.sharesdk.cn"
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeText];
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
//    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //显示分享菜单
    [ShareSDK showShareViewWithType:ShareTypeQQSpace
                          container:container
                            content:publishContent
                      statusBarTips:YES
                        authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleModal
                                                         viewDelegate:nil
                                              authManagerViewDelegate:nil]
                       shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                           oneKeyShareList:nil
                                                            qqButtonHidden:NO
                                                     wxSessionButtonHidden:NO
                                                    wxTimelineButtonHidden:NO
                                                      showKeyboardOnAppear:NO
                                                         shareViewDelegate:nil
                                                       friendsViewDelegate:nil
                                                     picViewerViewDelegate:nil]
                             result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 if (state == SSPublishContentStateSuccess)
                                 {
                                     NSLog(@"发表成功");
                                 }
                                 else if (state == SSPublishContentStateFail)
                                 {
                                     NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                                 }
                             }];
}

//人人网分享
- (void)renren:(NSString *)title withText:(NSString *)text andShareImage:(UIImage *)shareImage
{
    //创建分享内容
    id<ISSContent> publishContent = [ShareSDK content:text
                                       defaultContent:@""
                                                image:[ShareSDK jpegImageWithImage:shareImage quality:1]
                                                title:title
                                                  url:@"http://www.sharesdk.cn"
                                          description:@"Hello 人人网"
                                            mediaType:SSPublishContentMediaTypeText];
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    
    //显示分享菜单
    [ShareSDK showShareViewWithType:ShareTypeRenren
                          container:container
                            content:publishContent
                      statusBarTips:YES
                        authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleModal
                                                         viewDelegate:nil
                                              authManagerViewDelegate:nil]
                       shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                           oneKeyShareList:nil
                                                            qqButtonHidden:NO
                                                     wxSessionButtonHidden:NO
                                                    wxTimelineButtonHidden:NO
                                                      showKeyboardOnAppear:NO
                                                         shareViewDelegate:nil
                                                       friendsViewDelegate:nil
                                                     picViewerViewDelegate:nil]
                             result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 if (state == SSPublishContentStateSuccess)
                                 {
                                     NSLog(@"发表成功");
                                 }
                                 else if (state == SSPublishContentStateFail)
                                 {
                                     NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                                 }
                             }];
}

//短信分享
+ (void)siMail:(NSString *)title withText:(NSString *)text andImge:(UIImage *)image
{
    
}

/**
 *	@brief	分享到Twitter
 *
 *	@param 	sender 	Twitter
 */
- (void)shareToTwitterClickHandler:(NSString *)title withText:(NSString *)text andImge:(UIImage *)image
{
    //创建分享内容
   
    id<ISSContent> publishContent = [ShareSDK content:text
                                       defaultContent:@""
                                                image:[ShareSDK jpegImageWithImage:image quality:1]
                                                title:nil
                                                  url:nil
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeText];
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
   // [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //显示分享菜单
    [ShareSDK showShareViewWithType:ShareTypeTwitter
                          container:container
                            content:publishContent
                      statusBarTips:YES
                        authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleModal
                                                         viewDelegate:nil
                                              authManagerViewDelegate:nil]
                       shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                           oneKeyShareList:nil
                                                            qqButtonHidden:NO
                                                     wxSessionButtonHidden:NO
                                                    wxTimelineButtonHidden:NO
                                                      showKeyboardOnAppear:NO
                                                         shareViewDelegate:nil
                                                       friendsViewDelegate:nil
                                                     picViewerViewDelegate:nil]
                             result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 if (state == SSPublishContentStateSuccess)
                                 {
                                     NSLog(@"发表成功");
                                 }
                                 else if (state == SSPublishContentStateFail)
                                 {
                                     NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                                 }
                             }];
}

/**
 *	@brief	分享到Facebook
 *
 *	@param 	sender  事件对象
 */
- (void)shareToFacebookClickHandler:(NSString *)title withText:(NSString *)text andImge:(UIImage *)image
{
    //创建分享内容
   // NSString *imagePath = [[NSBundle mainBundle] pathForResource:IMAGE_NAME ofType:IMAGE_EXT];
    id<ISSContent> publishContent = [ShareSDK content:text
                                       defaultContent:@""
                                                image:[ShareSDK jpegImageWithImage:image quality:1]
                                                title:nil
                                                  url:nil
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeText];
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
  //  [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //显示分享菜单
    [ShareSDK showShareViewWithType:ShareTypeFacebook
                          container:container
                            content:publishContent
                      statusBarTips:YES
                        authOptions:[ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleModal
                                                         viewDelegate:nil
                                              authManagerViewDelegate:nil]
                       shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                           oneKeyShareList:nil
                                                            qqButtonHidden:NO
                                                     wxSessionButtonHidden:NO
                                                    wxTimelineButtonHidden:NO
                                                      showKeyboardOnAppear:NO
                                                         shareViewDelegate:nil
                                                       friendsViewDelegate:nil
                                                     picViewerViewDelegate:nil]
                             result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 if (state == SSPublishContentStateSuccess)
                                 {
                                     NSLog(@"发表成功");
                                 }
                                 else if (state == SSPublishContentStateFail)
                                 {
                                     NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                                 }
                             }];
}




@end
