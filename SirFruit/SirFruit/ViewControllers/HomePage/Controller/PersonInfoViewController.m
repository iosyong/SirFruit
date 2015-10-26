//
//  PersonInfoViewController.m
//  SirFruit
//
//  Created by yong on 15/10/23.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "AdView.h" // 广告轮播器
#import "SDPhotoGroup.h" // 图片浏览器
#import "PersonInfoHeadViewCell.h"

#define TableViewHeadVHeight 30

@interface PersonInfoViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *listTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic,strong) AdView * adView; // 广告循环滚动效果

@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"个人信息";

    [self.view addSubview:self.listTableView];
   
    self.navigationItem.rightBarButtonItem = [self rightBarButtonItem];
}

#pragma mark - 点击编辑
- (void) edit {
    
}

- (UIBarButtonItem *) rightBarButtonItem {
    UIButton *barBt = [UIButton buttonWithType:UIButtonTypeCustom];
    barBt.frame = CGRectMake(0, 0, 40, 40);
    barBt.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [barBt addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    [barBt setTitle:@"编辑" forState:UIControlStateNormal];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:barBt];
    
    return barItem;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 172;
    } else if (indexPath.section == 1) {
        return 180;
    } else if (indexPath.section == 2) {
        return headViewCellHeight;
    }

    return RightCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    if (section == 3 || section == 4 || section == 7) {
        return  TableViewHeadVHeight;
    }
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 18;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:   // 视频轮播
        {
            return 1;
        }
            break;
        case 1:   // 图片列表
        {
            return 1;
        }
            break;
        case 2:   // 头像
        {
            return 1;
        }
            break;
        case 3: // 个人技能
        {
            return 3;
        }
            break;
        case 4: // 个人资料
        {
            return 7;
        }
            break;
        case 5:  // 星座
        {
            return 2;
        }
            break;
        case 6: // 心愿
        {
            return 4;
        }
            break;
        case 7: // 个人标签1
        {
            return 1;
        }
            break;
            
            
        default:
            break;
    }
    
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//
//    if (section == 3) {
//        return @"个人技能";
//    }
//    if (section == 4) {
//        return @"个人资料";
//    }
//    if (section == 7) {
//        return @"个人标签";
//    }
//    return nil;
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    // 自定义的Header
    
    UIView * headView = [[UIView alloc] init];
    headView.backgroundColor = WKColor(235, 235, 244);
    
    if (section == 3 || section == 4 || section == 7)  {
        
        headView.frame = CGRectMake(0, 0, WKMainScreenWidth, TableViewHeadVHeight);
        
        int left = 10;
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(left, 0, WKMainScreenWidth-left, TableViewHeadVHeight)];
        [headView addSubview:title];
        title.textColor = WKColor(80, 80, 80);
        title.font = [UIFont systemFontOfSize:14];
//        title.backgroundColor = WKColor(235, 235, 244);
        
        if (section == 3) {
            title.text =  @"个人技能";
        } else if (section == 4) {
            title.text =  @"个人资料";
        } else if (section == 7) {
            title.text =  @"个人标签";
        }
        
    } else {
        headView.frame = CGRectMake(0, 0, 10, WKMainScreenWidth);
    }
    
    return headView;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
       
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
        {
            
            static NSString *ID=@"cell";
            cell=[tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            
            NSArray *imagesURL = @[
                                   @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                   @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                                   @"http://www.5858baypgs.com/img/aHR0cDovL3BpYzE4Lm5pcGljLmNvbS8yMDEyMDEwNS8xMDkyOTU0XzA5MzE1MTMzOTExNF8yLmpwZw==.jpg",@"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                   @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                                   @"http://www.5858baypgs.com/img/aHR0cDovL3BpYzE4Lm5pcGljLmNvbS8yMDEyMDEwNS8xMDkyOTU0XzA5MzE1MTMzOTExNF8yLmpwZw==.jpg"
                                   ];
            
            // 情景三：图片配文字(可选)
            //NSArray *titles = @[@"感谢您的支持，如果下载的",
//                                @"代码在使用过程中出现问题",
//                                @"您可以发邮件到qzycoder@163.com",
//                                @"感谢您的支持，如果下载的",
//                                @"代码在使用过程中出现问题",
//                                @"您可以发邮件到qzycoder@163.com",
//                                ];
            
            //如果你的这个广告视图是添加到导航控制器子控制器的View上,请添加此句,否则可忽略此句
            self.automaticallyAdjustsScrollViewInsets = NO;
            
            _adView = [AdView adScrollViewWithFrame:CGRectMake(0, 0, width, 172) imageLinkURL:imagesURL placeHoderImageName:@"xiaotupan" pageControlShowStyle:UIPageControlShowStyleCenter];
            
            //    是否需要支持定时循环滚动，默认为YES
            //    adView.isNeedCycleRoll = YES;
            
            // 标题
            //    [adView setAdTitleArray:titles withShowStyle:AdTitleShowStyleNone];
            //    设置图片滚动时间,默认3s
            //    adView.adMoveTime = 2.0;
            
            //图片被点击后回调的方法
            _adView.callBack = ^(NSInteger index,NSString * imageURL)
            {
                NSLog(@"被点中图片的索引:%d---地址:%@",(int)index,imageURL);
            };
            [cell.contentView addSubview:_adView];
            }
            
        }
            break;
        case 1:
        {
            static NSString *ID=@"cell1";
            cell=[tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            
            NSArray *srcStringArray = @[
                                        @"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                                        @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                        @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                                        @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                                        
                                        @"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                                        @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                                        @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                                        @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                                        
                                        @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                                        @"http://ww4.sinaimg.cn/thumbnail/9e9cb0c9jw1ep7nlyu8waj20c80kptae.jpg",
                                        
                                        ];
            
            
            SDPhotoGroup *scrollV = [[SDPhotoGroup alloc] initWithFrame:CGRectMake(0, 0, WKMainScreenWidth, 180)];
            scrollV.photoItemArray =  srcStringArray;
            
            [scrollV setClickBlock:^(NSInteger tag){
                
                
                
            }];
            
            [cell.contentView addSubview:scrollV];

            }
            
        }
            break;
        case 2:
        {
            static NSString *ID=@"cell_2";
            cell=[tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell= [[PersonInfoHeadViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            
        }
            break;
//        case 3:
//        {
//            
//        }
//            break;
            
        default: {
            static NSString *ID=@"cell_default";
            cell=[tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            cell.textLabel.text = @"请选择";

        }
            break;
    }
    
    
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
