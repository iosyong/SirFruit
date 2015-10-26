//
//  RootViewController.h
//  SirFruit
//
//  Created by yong on 22/10/15.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *此类是所有视图控制器的父类，他们都继承于此类。
 */

@interface RootViewController : UIViewController

/**
 *  pop上一层
 */
- (void)backAction;

@end
