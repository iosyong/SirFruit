//
//  AdaptTabBar.m
//  SirFruit
//
//  Created by yong on 22/10/15.
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "AdaptTabBar.h"


// tag
#define tagNum 1000

// 通过三色值获取到颜色对象
#define rgb(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

// 定义系统版本
#define SysVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#define WKRandomColor WKColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

/// 颜色(RGB)
#define RGB(r, g, b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

/// 随机颜色(RGB)
#define RandomRGB  RGB(arc4random()%255, arc4random()%255, arc4random()%255)

#define WKMainScreenWidth [UIScreen mainScreen].bounds.size.width

#define  num 4

@interface TabBarButton : UIButton

@end

@implementation TabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
//    if (!self.titleLabel.text.length) {
//        return CGRectMake(10, 2, 45, 45);
//    }

    float imgW = 24;
    float lett = (WKMainScreenWidth/num - imgW)/2 ;
    return CGRectMake(lett, 6, imgW, imgW);
//    return CGRectMake(20, 6, 24, 24);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    float labelW = WKMainScreenWidth/num;
    return CGRectMake(0, 29, labelW, 20);

}

@end


@interface AdaptTabBar ()

@property(nonatomic,strong)UIImageView *tabBarView; //底部栏

@end

@implementation AdaptTabBar

- (void)viewDidLoad {
    [super viewDidLoad];

    // 移除系统tabBar子视图
    [self.tabBar.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.tabBar.tintColor =  rgb(16,42,80,1); //[UIColor clearColor];
    [self creatTabbar];

}

//创建tabbar
- (void)creatTabbar
{
    _tabBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WKMainScreenWidth, TabBarHeight)];
    //初始化底部栏
    _tabBarView.backgroundColor = [UIColor whiteColor];
    _tabBarView.userInteractionEnabled = YES;
    //可点击

    NSArray *normalImages = @[@"HomepageNorl.png", @"ClassifyNorl.png", @"RedFruitNorl.png", @"MyNorl.png"];
    NSArray *selectedImages = @[@"HomepageHigh.png", @"ClassifyHigh.png", @"RedFruitHigh.png", @"MyHigh.png"];
//    NSArray *highlightedImages = @[@"HomepageSelect.png", @"ClassifySelect.png", @"RedFruitSelect.png", @"MySelect.png"];
    
//    NSArray *titles = @[@"首页", @"分类", @"红果", @"我的"];
    //文字
    
    for (int i=0; i<normalImages.count; i++) {
        
        TabBarButton *button = [[TabBarButton alloc] initWithFrame:CGRectMake(i*WKMainScreenWidth/normalImages.count, 0, WKMainScreenWidth/normalImages.count, TabBarHeight)];
//        button.backgroundColor = RandomRGB;
        
        button.tag = i+ (tagNum);//tag
        
//        [button setTitle:titles[i] forState:UIControlStateNormal];
        
        //[button addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [button setTitleColor:rgb(83, 83, 83, 1) forState:UIControlStateNormal];
        [button setTitleColor:rgb(16,42,80,1) forState:UIControlStateSelected];
        
        [button setImage:[UIImage imageNamed:normalImages[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectedImages[i]] forState:UIControlStateSelected];
//        [button setImage:[UIImage imageNamed:highlightedImages[i]] forState:UIControlStateHighlightedd];
    
        [_tabBarView addSubview:button];

    }
    
    [self.tabBar addSubview:_tabBarView];
    
    if (SysVersion<7.0) {
        //如果系统版本小于7.0
        UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WKMainScreenWidth, 1)];
        sep.backgroundColor = rgb(217, 217, 217, 1);
        [_tabBarView addSubview:sep];
        //tab的上边 线
    }

    
}



//切换tabbar
- (void)tabBarBtnClickIndex:(NSUInteger)selectedIndex {
    
    for (int i=0; i<5; i++) {
        TabBarButton *btn = (TabBarButton*)[_tabBarView viewWithTag:i+tagNum];
        btn.selected = NO;
        //默认选中为no
    }
    
    TabBarButton *btn = (TabBarButton*)[_tabBarView viewWithTag:selectedIndex+tagNum];
    //选中index
    btn.selected = YES;
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSUInteger tabIndex = [tabBar.items indexOfObject:item];
    if (tabIndex != self.selectedIndex) {
        self.selectedIndex = tabIndex;

    }
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    
    [self tabBarBtnClickIndex:selectedIndex];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"Tabar内存释放");
    NSUInteger tabIndex = self.selectedIndex;
    [self creatTabbar];
    self.selectedIndex = tabIndex;
}

@end
