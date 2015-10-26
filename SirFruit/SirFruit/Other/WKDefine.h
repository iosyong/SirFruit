//
//  WKDefine.h
//  SirFruit
//
//  Created by yong on 15/7/30.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#ifndef SirFruit_WKDefine_h
#define SirFruit_WKDefine_h

// 重定义NSLog
#if DEBUG
    #if 1
        #define NSSLog(format, ...) NSLog(@"%s--line:%d " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
    #else
        #define NSSLog(format, ...)
    #endif
#else
    #define NSSLog(format, ...)
#endif


/// WeakSelf
#define WeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;



#define WKColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define WKRandomColor WKColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 背景色
#define MainBackgroundColor ColorWihtRGB(252, 252, 252, 1)

#define AppDeLegate ((AppDelegate*)([[UIApplication sharedApplication] delegate]))


// 得到屏幕bounds
#define WKMainScreenSize [UIScreen mainScreen].bounds

// 得到屏幕高度
#define WKMainScreenHeight [UIScreen mainScreen].bounds.size.height

// 得到屏幕宽度
#define WKMainScreenWidth [UIScreen mainScreen].bounds.size.width

#define Navi_H 44
#define Stav_H 20

// tabBar的高度 默认
#define TabBarHeight  49

//
#define HomePageCellHeight 90

//
#define RightCellHeight 38
#define RithtCellLeftRSpace 10 // cell左右间隔
#define RithtCellTitleFont [UIFont systemFontOfSize:13.5]
#define RithtCellTitleColor WKColor(150, 150, 150)

// 个人信息界面
#define headViewCellHeight 60
#define HeadViewTop 5



// 是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOSLess8 ([[UIDevice currentDevice].systemVersion doubleValue] < 8.0) // ios8 以下 (不含ios8)

#define iPhon6Pluse  ([UIScreen mainScreen].bounds.size.height == 736)
#define iPhon6       ([UIScreen mainScreen].bounds.size.height == 667)
#define iPhon5       ([UIScreen mainScreen].bounds.size.height == 568)
#define iPhon4       ([UIScreen mainScreen].bounds.size.height == 480)
#define iPhonMore4   ([UIScreen mainScreen].bounds.size.height > 480)
#define iPhonMore5   ([UIScreen mainScreen].bounds.size.height > 568)

#define UIFontSize(size) ((UIFont *)[UIFont systemFontOfSize:(CGFloat)size])
#define UIFontBoldSize(size) ((UIFont *)[UIFont boldSystemFontOfSize:(CGFloat)size])

#pragma mark - 通知宏
#define NotiChangeSchool @"NotiChangeSchool"  // 确认通知

// Bundle文件路径
#define  BundleResourcePath  [NSString stringWithFormat:@"%@/",[[NSBundle mainBundle] resourcePath]]

// 本地缓存文件路径
#define LibCachesPath [NSString stringWithFormat:@"%@/Library/Caches/",NSHomeDirectory()]
//
#define kDownloadFilePath [NSString stringWithFormat:@"%@/Library/downloadFile", NSHomeDirectory()]
//
#define kDocumentsVideoFile [NSString stringWithFormat:@"%@/Documents/videos", NSHomeDirectory()]

// 数据库目录
#define kDocumentsPathDB [NSString stringWithFormat:@"%@/Documents/Database/", NSHomeDirectory()]
// 本地数据库名称
#define DataBaseName @"WKDB.db"

// 字符串若为空 返回@""
#define Str(string) (NSString *) ( string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || ![string isKindOfClass:[NSString class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 ? @"" : string )

// 字符串若为空 返回NO
#define StrNotNull(string) string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || ![string isKindOfClass:[NSString class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 ? NO : YES


#define UserName @"UserName"
#define PassWord @"PassWord"


#define Result_0001 @"0001"

#define  ResultIs0001(result) [result isEqualToString:Result_0001]


// num字符串数字 大于1万处理
#define numChange(num)  ((NSString *)num).length>4 ? [NSString stringWithFormat:@"%0.1f万",((NSString *)num).doubleValue/10000] : num


#endif
