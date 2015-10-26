//
//  MainViewController.m
//  SirFruit
//
//  Created by yong on 22/10/15.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "MainViewController.h"

#import "NavigationController.h"
#import "AdaptTabBar.h"

#import "HomePageViewController.h"
#import "ClassifyViewController.h"
#import "RedFruitViewController.h"
#import "MyViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"HomePageViewController", @"ClassifyViewController", @"RedFruitViewController", @"MyViewController"];
    NSArray *titles = @[@"首页",@"分类",@"红果",@"我的"];
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    for (int i=0; i<array.count; i++) {
        
        NavigationController *nav = [[NavigationController alloc] initWithRootViewController:[[NSClassFromString(array[i]) alloc] init]];
        [viewControllers addObject:nav];
        nav.title = titles[i];
    }

    _tab = [[AdaptTabBar alloc] init];
    _tab.viewControllers = viewControllers;
    _tab.selectedIndex = 0;

    [self.view addSubview:_tab.view];
    

}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
