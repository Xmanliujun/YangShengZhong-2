//
//  ShareObject.h
//  PlusTimesPang
//
//  Created by kimpeng on 13-4-19.
//
//

#import <Foundation/Foundation.h>
#import "WXApiObject.h"

@protocol ShareObjectDelegate <NSObject>

@optional

- (void)shareFinished:(NSInteger)type;

- (void)shareFaild;

@end

@interface ShareObject : NSObject

@property (nonatomic, assign) id<ShareObjectDelegate> delegate;

+ (void)sendNewsContent:(NSString *)uid;

+ (void)sendTimelineNewsContent:(NSString *)uid;

+ (void)shareToTencentWeiboClickHandler:(UIButton *)sender;

+ (void)shareToSinaWeiboClickHandler:(UIButton *)sender;

//微信分享
- (void)weixin:(NSString *)title withText:(NSString *)text andImage:(UIImage *)image andUrl:(NSString *)url;

//微信朋友圈分享
- (void)weixinFriends:(NSString *)title withText:(NSString *)text andImage:(UIImage *)image andUrl:(NSString *)url getDiamond:(NSInteger)give;

//腾讯微博分享
- (void)tencenWeibo:(NSString *)title withText:(NSString *)text andShareImage:(UIImage *)shareImage getDiamond:(NSInteger)give;

//新浪微博分享
- (void)sinaWeibo:(NSString *)title withText:(NSString *)text andShareImage:(UIImage *)shareImage getDiamond:(NSInteger)give;

//分享到Twitter
- (void)shareToTwitterClickHandler:(NSString *)title withText:(NSString *)text andImge:(UIImage *)image;
//Facebook
- (void)shareToFacebookClickHandler:(NSString *)title withText:(NSString *)text andImge:(UIImage *)image;


//QQ空间分享
+ (void)qZone:(NSString *)title withText:(NSString *)text andShareImage:(UIImage *)shareImage;

//人人网分享
- (void)renren:(NSString *)title withText:(NSString *)text andShareImage:(UIImage *)shareImage;

//短信分享
+ (void)siMail:(NSString *)title withText:(NSString *)text andImge:(UIImage *)image;

@end
