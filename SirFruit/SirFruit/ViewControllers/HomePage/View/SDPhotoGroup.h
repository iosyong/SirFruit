//
//  SDPhotoGroup.h
//  SDPhotoBrowser
//
//  Created by aier on 15-2-4.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(NSInteger clickTag);

@interface SDPhotoGroup : UIView 

@property (nonatomic, strong) NSArray *photoItemArray;

@property(nonatomic,copy) ClickBlock clickBlock;

@property (assign, nonatomic) float pageControlH;  // 默认20

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com