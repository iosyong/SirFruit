//
//  GlobalFunction.m
//  SirFruit
//
//  Created by yong on 15/10/23.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import "GlobalFunction.h"
#import <objc/runtime.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation GlobalFunction

/**
 *  获取一个随机整数，范围在[from,to），包括from，不包括to
 */
+ (int)getRandomNumber:(int)from to:(int)to

{
    return (int)(from + (arc4random() % (to - from + 1)));
}



@end
