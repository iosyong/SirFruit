//
//  SignLabel.m
//  SirFruit
//
//  Created by yong on 15/10/23.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import "SignLabel.h"

@implementation SignLabel

- (id) init {
    
    self = [super init];
    if (self) {
        
        self.layer.cornerRadius = 3;
        self.clipsToBounds = YES;
        self.layer.borderWidth = 1; //边框宽度
        self.font = [UIFont systemFontOfSize:10];
        self.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
    
}

-(void)setTextColor:(UIColor *)textColor {
    
    [super setTextColor:textColor];
    self.layer.borderColor = textColor.CGColor; //边框颜色

}

@end
