//
//  NavigationController.m
//  SirFruit
//
//  Created by yong on 22/10/15.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//系统方法 push
{
    if (self.viewControllers.count) {
        ((UIViewController*)self.viewControllers[0]).hidesBottomBarWhenPushed = YES;
        //当push到下一级  影藏 bottom
    }
    
    [super pushViewController:viewController animated:animated];
    
    //super push
    if (self.viewControllers.count) {
        ((UIViewController*)self.viewControllers[0]).hidesBottomBarWhenPushed = NO;
        
    }
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
//pop 到 root
{
    ((UIViewController*)self.viewControllers[0]).hidesBottomBarWhenPushed = NO;
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
//pop 到指定viewController
{
    int index = (int)[self.viewControllers indexOfObject:viewController];
    //获得index
    
    if (index > 0) {
        ((UIViewController*)self.viewControllers[0]).hidesBottomBarWhenPushed = YES;
    } else {
        ((UIViewController*)self.viewControllers[0]).hidesBottomBarWhenPushed = NO;
    }
    return [super popToViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
