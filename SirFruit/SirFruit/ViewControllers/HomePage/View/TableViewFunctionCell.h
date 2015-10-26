//
//  TableViewFunctionCell.h
//  SirFruit
//
//  Created by yong on 15/10/23.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 
   cell
 
 -------------------------------------
 标 题（中国）                    中国 >
 -------------------------------------
 
 
 -------------------------------------
 titleLabel（leftLabel）   rightLabel rightImgV
 -------------------------------------
 
 */


@interface TableViewFunctionCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UIImageView *rightImgV;




@end
