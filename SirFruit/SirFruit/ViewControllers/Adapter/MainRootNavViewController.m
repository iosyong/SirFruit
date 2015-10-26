//
//  AdaptViewController.m
//  SirFruit
//
//  Created by yong on 22/10/15.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "MainRootNavViewController.h"

// 得到屏幕高度
#define MainScreenHeight [UIScreen mainScreen].bounds.size.height
#define WKMainScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MainRootNavViewController ()

@end

@implementation MainRootNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [self.tabBarController.view subviews][0];
    //tab view（）
    
    view.frame = CGRectMake(0, 0, WKMainScreenWidth, MainScreenHeight);
    //屏幕的高度

//    self.navigationItem.backBarButtonItem  = nil;
    
//    UIButton *userCenter = [UIButton buttonWithType:UIButtonTypeCustom];
//    userCenter.frame = CGRectMake(0, 0, 30, 30);
//    userCenter.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [userCenter addTarget:self action:@selector(userCenterClick) forControlEvents:UIControlEventTouchUpInside];
//    //点击 userCenterClick
//    [userCenter setImage:[UIImage imageNamed:@"touxiang.png"] forState:UIControlStateNormal];
//    [userCenter setImage:[UIImage imageNamed:@"touxiang.png"] forState:UIControlStateHighlighted];
//    
//    UIBarButtonItem *userCenterBtn = [[UIBarButtonItem alloc] initWithCustomView:userCenter];
//    
//    self.navigationItem.rightBarButtonItem = userCenterBtn;

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)userCenterClick
{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
