//
//  SDPhotoGroup.m
//  SDPhotoBrowser
//
//  Created by aier on 15-2-4.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDPhotoGroup.h"
#import "SDPhotoItem.h"
#import "UIButton+WebCache.h"
#import "SDPhotoBrowser.h"

// 得到屏幕宽度
#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define Margin 10

#define kRandomColor WKColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define num 8


@interface SDPhotoGroup () <SDPhotoBrowserDelegate,UIScrollViewDelegate>

@property (nonatomic,assign) NSUInteger currentPageIndex;

@property (nonatomic , strong) UIScrollView *scrollView;

@property (strong, nonatomic) UIPageControl *pageControl;

@end

@implementation SDPhotoGroup 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 清除图片缓存，便于测试
        [[SDWebImageManager sharedManager].imageCache clearDisk];
        
        self.pageControlH = 20;
        
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
        
    }
    return self;
}


- (void)setPhotoItemArray:(NSArray *)photoItemArray
{
    if (photoItemArray == nil || photoItemArray.count == 0) {
        NSAssert(NO, @"数据源数组不能为空");
        return;
    }
    _photoItemArray = nil;
    
    NSMutableArray *temp = [NSMutableArray array];
    [photoItemArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
        SDPhotoItem *item = [[SDPhotoItem alloc] init];
        item.thumbnail_pic = src;
        [temp addObject:item];
    }];
    
    [temp addObject:@""]; // 加最后的➕加号
    _photoItemArray = [temp copy];
    
     int perRowImageCount = 4; // 4列
    CGFloat w = (kMainScreenWidth - Margin*5)/perRowImageCount; // 图片大小
    CGFloat h = w;
    
    int t = _photoItemArray.count%num ;
    int numGroup = t>0 ? 1 + (int)_photoItemArray.count/num : (int)_photoItemArray.count/num ;
    
    for (int i=0; i<numGroup; i++) {
        
        int leftover = (int) _photoItemArray.count - i*num ;
        int tem = leftover>=8 ? num : leftover;
        
        NSArray *imgs = [_photoItemArray subarrayWithRange:NSMakeRange(i*num, tem)];
        
        [imgs enumerateObjectsUsingBlock:^(SDPhotoItem *obj, NSUInteger idx, BOOL *stop) {
            UIButton *btn = [[UIButton alloc] init];
            btn.layer.cornerRadius = 6;
            btn.clipsToBounds = YES;
            //imgV.contentMode = UIViewContentModeScaleAspectFit;
            btn.backgroundColor = [UIColor orangeColor];
            
            btn.tag = idx+i*num;
            
            if (idx+i*num == _photoItemArray.count-1) { // ➕图片
                [btn setImage:[UIImage imageNamed:@"barbuttonicon_add"] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            } else {
                [btn sd_setImageWithURL:[NSURL URLWithString:obj.thumbnail_pic] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            
            [self.scrollView addSubview:btn];
            
            int rowIndex  = (int) idx / perRowImageCount; // 所在行
            int columnIndex = idx % perRowImageCount; // 所在列
            CGFloat x = Margin + columnIndex * (w + Margin);
            CGFloat y = Margin + rowIndex * (h + Margin);
            btn.frame = CGRectMake(x+kMainScreenWidth*i, y, w, h);
            
        }];
    }

    self.pageControl.numberOfPages = numGroup;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*numGroup, self.scrollView.frame.size.height);

}

- (void)layoutSubviews
{
    [super layoutSubviews];

}

- (void)addButtonClick:(UIButton *)button {
        if (_clickBlock !=nil) {
    
            _clickBlock(0);
        }
}

- (void)buttonClick:(UIButton *)button
{
    
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = self.scrollView; // 原图的父控件
    browser.imageCount = self.photoItemArray.count; // 图片总数
    browser.currentImageIndex = (int) button.tag;
    browser.delegate = self;
    [browser show];
    
}

#pragma mark - photobrowser代理方法

// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    return [self.scrollView.subviews[index] currentImage];
}


// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *urlStr = [[self.photoItemArray[index] thumbnail_pic] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
    return [NSURL URLWithString:urlStr];
}

// scrollview 减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
    
    int contentOffsetX = scrollView.contentOffset.x;
    
    int newPage = contentOffsetX/self.frame.size.width;
    
    if(newPage == _currentPageIndex) {
        return;
    } else {
        _currentPageIndex = newPage;
        self.pageControl.currentPage = _currentPageIndex;
    }
}

-(void)setPageControlH:(float)pageControlH {
    
    _pageControlH = pageControlH;
    
    CGRect frame = self.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.height = self.frame.size.height - self.pageControlH;
    
    self.scrollView.frame = frame;
    
    frame.origin.x = 0;
    frame.origin.y = self.frame.size.height - self.pageControlH;
    frame.size.height = self.pageControlH;
    
    self.pageControl.frame = frame;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        self.pageControl.currentPage = 0;
        
    }
    return _pageControl;
}

- (UIScrollView *) scrollView {
    
    if (!_scrollView) {
        
        UIScrollView * view = [[UIScrollView alloc] init];
        //        view.autoresizingMask = 0xFF;
        //        view.contentMode = UIViewContentModeCenter;
        view.delegate = self;
                view.pagingEnabled = YES;
        //        view.bounces = YES;
        //view.showsHorizontalScrollIndicator = NO;
        view.backgroundColor = [UIColor orangeColor];
        self.scrollView = view;
    }
    
    return _scrollView;
}

@end

