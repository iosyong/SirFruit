//
//  HeadImageView.m
//  SirFruit
//
//  Created by yong on 15/10/22.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "HeadImageView.h"

@interface HeadImageView ()

@property (nonatomic, strong)  UIImageView *sexIconViev; // 性别icon标志

@end

@implementation HeadImageView

- (id) initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = 6;
        self.clipsToBounds = YES;
        self.layer.borderWidth = 1;//边框宽度
        
        [self addSubview:self.sexIconViev];
    }
    
    return self;
    
}

- (UIImageView *)sexIconViev {
    
    if (_sexIconViev == nil) {
        float iconH =15;
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(self.width-iconH, self.height-iconH, iconH, iconH)];
        img.layer.cornerRadius = iconH/2;
        img.clipsToBounds = YES;
        self.sexIconViev = img;
    }
    
    return _sexIconViev;
}


-(void)setSexType:(SexType)sexType {
    
    _sexType = sexType;
    
    UIColor *color;
    
    switch (sexType) {
        case Sex_Boy:
        {
            color = WKColor(72, 171, 19);
            self.sexIconViev.image = [UIImage imageNamed:@"boy"];
        }
            break;
        case Sex_Girl:
        {
            color = WKColor(226, 45, 65);;
            self.sexIconViev.image = [UIImage imageNamed:@"girl"];

        }
            break;
        case Sex_Unknown:
        default:
        {
            color = [UIColor grayColor];
            self.sexIconViev.backgroundColor = [UIColor grayColor];
        }
            break;
    }
    
    self.layer.borderColor = color.CGColor;//边框颜色,要为CGColor
    
}

@end
