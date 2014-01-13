//
//  ShareMoreView.h
//  PlusTimesPang
//
//  Created by kimpeng on 13-5-1.
//
//

#import <UIKit/UIKit.h>

@interface ShareMoreView : UIView

@property (nonatomic, retain) UIImageView *backImageView;
@property (nonatomic, retain) UIButton *closeButton;
@property (nonatomic, retain) UIButton *weixinButton;
@property (nonatomic, retain) UIButton *sinaWeiboButton;
@property (nonatomic, retain) UIButton *qqZoneButton;
@property (nonatomic, retain) UIButton *qqButton;
@property (nonatomic, retain) UIButton *weixinFriendsButton;
@property (nonatomic, retain) UIButton *tencentWeiboButton;
@property (nonatomic, retain) UIButton *renrenButton;
@property (nonatomic, retain) NSString *account;
@property (nonatomic, retain) NSString *score;
@property (nonatomic, retain) UIImage *shareImage;

- (id)initWithFrame:(CGRect)frame andScore:(NSString *)score andShareImage:(UIImage *)image andAccount:(NSString *)account;

@end
