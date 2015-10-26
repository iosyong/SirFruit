//
//  WKEnum.h
//  SirFruit
//
//  Created by yong on 15/7/30.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#ifndef SirFruit_WKEnum_h
#define SirFruit_WKEnum_h

/**
 *  枚举所有网络通讯接口 tag
 */
typedef enum : NSUInteger {
    
    InterfaceTag_Register = 0,                       // 注册
    InterfaceTag_Login = 1,                          // 登录
    InterfaceTag_ChangePassword = 2,                 // 密码修改
    InterfaceTag_FindPasswd = 3,                     // 找回密码
    
    
} InterfaceTagType;

/**
 *  枚举 性别
 */
typedef enum : NSUInteger {
    
    Sex_Boy = 0,                       // 男性
    Sex_Girl = 1,                     // 女性
    Sex_Unknown = 2,                   // 未知

} SexType;

#endif


/*
 
 ///////////////////////////////////////

 - (UILabel *) rightLabel {
 
 if (!_rightImgV) {
 UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
 label.lineBreakMode = NSLineBreakByTruncatingMiddle;
 label.textAlignment = NSTextAlignmentRight;
 label.font = font;
 label.textColor = WKColor(100, 100, 100);
 self.rightLabel = label;
 }
 return _rightLabel;
 }
 
 ///////////////////////////////////////
 
 - (UIImageView *) rightImgV {
 
 if (!_rightImgV) {
 UIImageView imgV = [[HeadImageView alloc] initWithFrame:CGRectZero];
 imgV.backgroundColor = WKRandomColor;
 //imgV.layer.cornerRadius = 6;
 //imgV.clipsToBounds = YES;
 //imgV.contentMode = UIViewContentModeScaleAspectFit;
 
 float img_H_W = 15;
 float imgX = WKMainScreenWidth - RithtCellLeftRSpace - img_H_W;
 float imgY = (RightCellHeight - img_H_W)/2;
 
 imgV.image = [UIImage imageNamed:@"settingRight"];
 imgV.frame = CGRectMake(imgX, imgY, img_H_W, img_H_W)
 
 self.rightImgV = imgV;
 }
 
 return _rightImgV;
 }


*/