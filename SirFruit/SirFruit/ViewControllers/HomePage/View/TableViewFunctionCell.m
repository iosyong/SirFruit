//
//  TableViewFunctionCell.m
//  SirFruit
//
//  Created by yong on 15/10/23.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import "TableViewFunctionCell.h"

@implementation TableViewFunctionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initUI];
//        [self testData];
        
    }
    return self;
}

- (void)initUI {
   
//    self.titleLabel.backgroundColor = WKRandomColor;
//    self.leftLabel.backgroundColor = WKRandomColor;
//    self.rightLabel.backgroundColor = WKRandomColor;
//    self.rightImgV.backgroundColor = WKRandomColor;
    
    self.titleLabel.frame = CGRectMake(RithtCellLeftRSpace, 0, 50, RightCellHeight);
    self.leftLabel.frame = CGRectMake(self.titleLabel.right, 0, 100, RightCellHeight);
    self.rightLabel.frame = CGRectMake(self.leftLabel.right, 0, self.rightImgV.left - self.leftLabel.right-RithtCellLeftRSpace, RightCellHeight);

    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.leftLabel];
    [self.contentView addSubview:self.rightLabel];
    [self.contentView addSubview:self.rightImgV];
    
}

- (UILabel *) titleLabel {
    
    if (!_titleLabel) {
      UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.lineBreakMode = NSLineBreakByTruncatingMiddle;
        label.font = RithtCellTitleFont;
        label.textColor = RithtCellTitleColor;
        self.titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *) leftLabel {
    
    if (!_leftLabel) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.lineBreakMode = NSLineBreakByTruncatingMiddle;
        label.font = RithtCellTitleFont;
        label.textColor = RithtCellTitleColor;
        self.leftLabel = label;
    }
    return _leftLabel;
}

- (UILabel *) rightLabel {
    
    if (!_rightImgV) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.lineBreakMode = NSLineBreakByTruncatingMiddle;
        label.textAlignment = NSTextAlignmentRight;
        label.font = RithtCellTitleFont;
        label.textColor = RithtCellTitleColor;
        self.rightLabel = label;
    }
    return _rightLabel;
}

- (UIImageView *) rightImgV {
    
    if (!_rightImgV) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectZero];
        //imgV.layer.cornerRadius = 6;
        //imgV.clipsToBounds = YES;
        //imgV.contentMode = UIViewContentModeScaleAspectFit;
        float img_H_W = 15;
        float imgX = WKMainScreenWidth - RithtCellLeftRSpace - img_H_W;
        float imgY = (RightCellHeight - img_H_W)/2;
        
        imgV.image = [UIImage imageNamed:@"settingRight"];
        imgV.frame = CGRectMake(imgX, imgY, img_H_W, img_H_W);
        
        self.rightImgV = imgV;
    }
    
    return _rightImgV;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
