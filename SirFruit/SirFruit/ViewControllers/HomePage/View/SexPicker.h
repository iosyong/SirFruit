//
//  SexPicker.h
//  SirFruit
//
//  Created by yong on 15/10/23.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  自定义时间选择器
 *
 */

@class SexPicker;

@protocol ClickSexPickerDelegate <NSObject>

- (void)sexPickerClicked:(SexPicker *)sexPicker ;

@end

@interface SexPicker : UIView



- (void)buttonClicked:(UIButton *)button;

@property (nonatomic,assign) int selectedSegmentIndex;

@property (weak, nonatomic) id <ClickSexPickerDelegate> delegate;


@end
