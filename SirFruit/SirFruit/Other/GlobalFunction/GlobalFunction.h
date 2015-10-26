//
//  GlobalFunction.h
//  SirFruit
//
//  Created by yong on 15/10/23.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  定义全局函数 所有的文件中调用
 */
@interface GlobalFunction : NSObject

/**
 *  获取一个随机整数，范围在[from,to），包括from，不包括to
 */
+ (int)getRandomNumber:(int)from to:(int)to;

@end
