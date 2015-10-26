//
//  WKMyCourseTableViewCell.h
//  SirFruit
//
//  Created by yong on 15/10/22
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CountButton.h"
#import "HeadImageView.h"
/**
 *  我的课程cell
 */


//@protocol WKMyCourseTableViewCellDelegate <NSObject>
//
//
//- (void)courseTableViewCellFunButtonClickWithPath:(NSIndexPath *)indexPath withTag:(int)tag;
//
//@end

@interface HomePageCell : UITableViewCell

//@property (weak, nonatomic) id<WKMyCourseTableViewCellDelegate> delegate;

//@property (nonatomic, copy) NSIndexPath *indexPath;

@property (nonatomic, strong) HeadImageView *headImgV;  // 头像
@property (nonatomic, strong) UILabel *nameLabel;      // 名字
@property (nonatomic, strong) UILabel *ageLabel;     //  年龄
@property (nonatomic, strong) UILabel *shoollabel;  // 学校

@property (nonatomic, strong) CountButton *goodBt;     // 赞
@property (nonatomic, strong) CountButton *pointBt;     //
@property (nonatomic, strong) CountButton *fruitBt;     // 水果币

@property (nonatomic, strong) UILabel *contentLabel;

@end
