//
//  ViewControllerA.m
//  SirFruit
//
//  Created by yong on 22/10/15.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageCell.h"
#import "SiftViewController.h" // 筛选
#import "PersonInfoViewController.h" // 个人信息展示

@interface HomePageViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *listTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    self.view.backgroundColor =  WKColor(218, 218, 218);

    self.dataArray = (NSMutableArray *)@[@"s",@"2",@"s",@"2",@"s",@"2",@"s",@"2"];
    
    [self initUI];
    
}

// 点击筛选
- (void) sift {
    SiftViewController *vc = [[SiftViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) initUI {
    
    UIButton *barBt = [UIButton buttonWithType:UIButtonTypeCustom];
    barBt.frame = CGRectMake(0, 0, 40, 40);
    barBt.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [barBt addTarget:self action:@selector(sift) forControlEvents:UIControlEventTouchUpInside];
    [barBt setTitle:@"筛选" forState:UIControlStateNormal];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:barBt];
    self.navigationItem.rightBarButtonItem = barItem;
    
//     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"筛选" style:UIBarButtonItemStyleDone target:self action:@selector(select)];
    
     [self.view addSubview:self.listTableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return HomePageCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID=@"cell";
    HomePageCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[HomePageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PersonInfoViewController *vc = [[PersonInfoViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (UITableView *) listTableView {
    
    if (!_listTableView) {
        UITableView *tabl = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WKMainScreenWidth, WKMainScreenHeight-Stav_H-Navi_H-TabBarHeight)];
        tabl.delegate = self;
        tabl.dataSource = self;
        
        // 去掉多余分割线
        [tabl setContentInset:UIEdgeInsetsZero];
        [tabl setScrollIndicatorInsets:UIEdgeInsetsZero];
        tabl.tableFooterView = [[UIView alloc] init];
        tabl.tableHeaderView = [[UIView alloc] init];
        
        self.listTableView = tabl;
    }
    
    return _listTableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
