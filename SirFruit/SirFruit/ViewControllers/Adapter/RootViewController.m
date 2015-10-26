//
//  RootViewController.m
//  SirFruit
//
//  Created by yong on 22/10/15.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "RootViewController.h"

// 自定义颜色 ColorWihtRGB(r,g,b,a)

#define ColorWihtRGB(r,g,b,a) [UIColor  colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
// 背景色
#define MainBackgroundColor ColorWihtRGB(252, 252, 252, 1)

// 定义系统版本
#define SysVersion [[[UIDevice currentDevice] systemVersion] floatValue]

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = MainBackgroundColor;//背景色
    
    if (SysVersion >= 7.0) {
        //如果版本是7.0以上
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
    }
    
    //设置导航背景
    [self setNavBar];
    
//    设置导航条title颜色
    NSDictionary *titleAtt = @{
                               UITextAttributeTextColor: [UIColor whiteColor],
                               UITextAttributeTextShadowColor: [UIColor clearColor],
                               UITextAttributeFont:[UIFont systemFontOfSize:20]
                               };
    [self.navigationController.navigationBar setTitleTextAttributes:titleAtt];
    
    
    //取消ios7自带手势，比如navigationcontroller的右滑返回
    //self.navigationController.interactivePopGestureRecognizer.enabled = NO ;
    
}


//每一个继承了rootviewcontroller 都可实现此方法
- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

/**
 *  设置导航背景样式
 */
- (void)setNavBar{
  
    UIImage *image = [UIImage imageNamed:@"NavBarBg.png"];
    
    [[UINavigationBar appearance]setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
  
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
