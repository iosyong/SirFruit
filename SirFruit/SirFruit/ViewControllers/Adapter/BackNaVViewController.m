//
//  AdaptNaVViewController.m
//  SirFruit
//
//  Created by yong on 22/10/15.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "BackNaVViewController.h"

@interface BackNaVViewController () <UIGestureRecognizerDelegate>

@end

@implementation BackNaVViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 26, 22);
    backBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = back;
    
    // 在iOS7上使用leftBarButtonItem却无法响应滑动返回事件的问题，
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
