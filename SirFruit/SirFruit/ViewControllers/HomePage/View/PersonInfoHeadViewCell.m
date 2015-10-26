//
//  PersonInfoHeadViewCell.m
//  SirFruit
//
//  Created by yong on 15/10/26.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import "PersonInfoHeadViewCell.h"
#import "XIButton.h"
#define headVLeft 5
#define BorderColor WKColor(220, 220, 220)


@interface PersonInfoHeadViewCell ()

@property (nonatomic, strong) SignLabel *zhenLabel;


@end

@implementation PersonInfoHeadViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initUI];
        //        [self testData];
        
    }
    return self;
}

- (void)initUI  {
    
    [self.contentView addSubview:self.headImgV];
    
    float labelY = HeadViewTop+5;
    float labelW = 60;
    float labelH = 22;
    
    UILabel *look = [self labelWithTitle:@"1535看过" bgColor:WKColor(223, 250, 218) textColor:WKColor(73, 168, 32) frame:CGRectMake(self.headImgV.right+headVLeft, labelY, labelW, labelH)];
    [self.contentView addSubview:look];
   
    UILabel *order = [self labelWithTitle:@"5035订单" bgColor:WKColor(246, 252, 208) textColor:WKColor(203, 165, 0) frame:CGRectMake(look.right+5, labelY, labelW, labelH)];
    [self.contentView addSubview:order];

    UILabel *money = [self labelWithTitle:@"2253红果" bgColor:WKColor(242, 218, 226) textColor:WKColor(231, 82, 88) frame:CGRectMake(order.right+5, labelY, labelW, labelH)];
    [self.contentView addSubview:money];
    
    
    XIButton *okButton = [XIButton createItemButtonWithType:XIContentAlignVertical];
    
    float w_h = headViewCellHeight-HeadViewTop*2;
    
    okButton.frame = CGRectMake(WKMainScreenWidth-w_h-headVLeft, labelY, w_h, w_h);
    [okButton setImage:[UIImage imageNamed:@"girl"] title:@"888" controlState:UIControlStateNormal];
//    okButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [okButton setTextFount:[UIFont  systemFontOfSize:12]];
    [okButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.contentView addSubview:okButton];
    
    
    int lineY = 10;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(okButton.left  , lineY, 1, headViewCellHeight-lineY*2)];
    line.backgroundColor = BorderColor;
    [self.contentView addSubview:line];
    
    float signLabelH = 15;
    float signLabelY = headViewCellHeight - signLabelH-HeadViewTop;
     self.zhenLabel.frame = CGRectMake(look.left, signLabelY, signLabelH, signLabelH);
    [self.contentView addSubview:self.zhenLabel];
    
}

- (UIImageView *) headImgV {
    
    if (!_headImgV) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        float imgX = 10;
        float imgY = HeadViewTop;
        float img_H_W = headViewCellHeight - HeadViewTop*2;
        imgV.frame = CGRectMake(imgX, imgY, img_H_W, img_H_W);
        
        imgV.layer.cornerRadius = img_H_W/2;
        imgV.clipsToBounds = YES;
        imgV.contentMode = UIViewContentModeScaleAspectFit;
        imgV.backgroundColor = WKRandomColor;
        
        self.headImgV = imgV;
    }
    
    return _headImgV;
}

- (UILabel *) labelWithTitle:(NSString *)text bgColor:(UIColor *)bgColor textColor:(UIColor *)textColor frame:(CGRect)frame {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    label.text = text;
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

- (SignLabel *) zhenLabel {
    
    if (_zhenLabel == nil) {
        SignLabel *label = [[SignLabel alloc ]init];
        label.text = @"真";
        label.textColor =  WKColor(59, 159, 17);
        self.zhenLabel = label;
        //        label.backgroundColor = WKRandomColor;
        [self.contentView addSubview:label];
    }
    return _zhenLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
