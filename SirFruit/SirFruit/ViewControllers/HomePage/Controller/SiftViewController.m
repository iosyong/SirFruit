//
//  SiftViewController.m
//  SirFruit
//
//  Created by yong on 15/10/23.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import "SiftViewController.h"
#import "TableViewFunctionCell.h"
#import "SexPicker.h" // 性别选择器

@interface SiftViewController ()  <UITableViewDataSource,UITableViewDelegate,ClickSexPickerDelegate>

{
    NSArray *titleArray;
}

@property (nonatomic, strong) UITableView *listTableView;

@property (nonatomic, strong) SexPicker *sexPicker; // 性别选择器


@end

@implementation SiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"筛选";
    
    titleArray = @[@[@"性\t别",@"国\t家",@"地\t区"],@[@"技\t能"]];
    
     [self.view addSubview:self.listTableView];
}

- (void)sexPickerClicked:(SexPicker *)sexPicker {
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RightCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return titleArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [titleArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID=@"cell";
    TableViewFunctionCell  *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[TableViewFunctionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.leftLabel.hidden = YES;
        
    }
    cell.titleLabel.text = titleArray[indexPath.section][indexPath.row];
    
    // 如果 性别
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.rightImgV.hidden = YES;
        cell.rightLabel.hidden = YES;
        [cell.contentView addSubview:self.sexPicker];
        
    } else {
        
        cell.rightImgV.hidden = NO;
        cell.rightLabel.hidden = NO;
//        [self.sexPicker removeFromSuperview];
    }
    
    
    
    cell.rightLabel.text = @"请选择";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (UITableView *) listTableView {
    
    if (!_listTableView) {
        UITableView *tabl = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WKMainScreenWidth, WKMainScreenHeight-Stav_H-Navi_H)];
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

-(SexPicker *)sexPicker {
    if (!_sexPicker) {
        
        float pickerY = 5;
        float pickerH = RightCellHeight - 2* pickerY;
        float pickerW = (pickerH + 10)*2;
        float pickerX = WKMainScreenWidth - RithtCellLeftRSpace - pickerW;
        
        SexPicker *seg = [[SexPicker alloc] initWithFrame:CGRectMake(pickerX, pickerY, pickerW, pickerH)];
        
        seg.delegate = self;
        
        self.sexPicker=seg;
    }
    
    return _sexPicker;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
