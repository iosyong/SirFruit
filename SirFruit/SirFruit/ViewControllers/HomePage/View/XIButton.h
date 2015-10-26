//
//  XIButton.h
//  LPA
//
//  Created by yxlong on 15/7/7.
//  Copyright (c) 2015年 yiche. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    XIContentAlignVertical, // 垂直
    XIContentAlignHorizontalCenter,
    XIContentAlignHorizontalLeft
} XIContentAlign;


@interface XIButton : UIButton
{
    CGSize preferedImageSize;
    UIView *containerView;
    @protected
    UIImageView *proImageView;
    UILabel *proLabel;
    NSLayoutConstraint *imageWidthConstraint;
    NSLayoutConstraint *imageHeightConstraint;
}
@property(nonatomic, assign) CGSize preferedImageSize;

+ (instancetype)createItemButtonWithType:(XIContentAlign)type;
- (void)setImage:(UIImage *)image title:(NSString *)title controlState:(UIControlState)state;
- (void)setTextFount:(UIFont *)fount;

@end

