//
//  WKMyCourseTableViewCell.m
//  SirFruit
//
//  Created by yong on 15/10/22
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "HomePageCell.h"
#import "SignLabel.h"

@interface HomePageCell ()

{
    UIView *_backView;
}

@property (nonatomic, strong) SignLabel *zhenLabel;
@property (nonatomic, strong) SignLabel *jiLabel;
@property (nonatomic, strong) SignLabel *xueLabel;


@end


@implementation HomePageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initUI];
        [self testData];
        
    }
    return self;
}

- (void) testData {
    
    int i = [GlobalFunction getRandomNumber:0 to:1] ;
    
//    _headImgV.backgroundColor = WKRandomColor;
    _headImgV.sexType = i;
    _nameLabel.text = (i == 1 ? @"天上睡" : @"三百六" );
    _ageLabel.text  = (i == 1 ? @"21" : @"23" );
    _shoollabel.text = (i == 1 ? @"上海音乐学院" : @"中国河南少林寺" ); ;
    [_goodBt setTitle:(i == 1 ? @"100" : @"55" ) forState:UIControlStateNormal];
    [_pointBt setTitle:(i == 1 ? @"32" : @"234" ) forState:UIControlStateNormal];
    [_fruitBt setTitle:(i == 1 ? @"276" : @"232" ) forState:UIControlStateNormal];
    
    _contentLabel.text = @"中国梦中国梦中国梦中国梦中国梦";
    
    float signLabelH = 15;
    float signLabelY = self.ageLabel.top + (self.ageLabel.height - signLabelH)/2;
    int j = [GlobalFunction getRandomNumber:0 to:4] ;
    self.zhenLabel.hidden = YES;
    self.jiLabel.hidden = YES;
    self.xueLabel.hidden = YES;
    switch (j) {
        case 0:
        {
           
        }
            break;
        case 1:
        {
            self.zhenLabel.frame = CGRectMake(self.ageLabel.right, signLabelY, signLabelH, signLabelH);
            self.zhenLabel.hidden = NO;
        }
            break;
        case 2:
        {
            self.zhenLabel.frame = CGRectMake(self.ageLabel.right, signLabelY, signLabelH, signLabelH);
            self.zhenLabel.hidden = NO;
            self.jiLabel.frame = CGRectMake(self.zhenLabel.right+5, signLabelY, signLabelH, signLabelH);
            self.jiLabel.hidden = NO;
        }
            break;
        case 3:
        {
            self.zhenLabel.frame = CGRectMake(self.ageLabel.right, signLabelY, signLabelH, signLabelH);
            self.zhenLabel.hidden = NO;
            self.jiLabel.frame = CGRectMake(self.zhenLabel.right+5, signLabelY, signLabelH, signLabelH);
            self.jiLabel.hidden = NO;
            self.xueLabel.frame = CGRectMake(self.jiLabel.right+5, signLabelY, signLabelH, signLabelH);
            self.xueLabel.hidden = NO;
        }
            break;
            
        default:
            break;
    }
    
    
}

- (void)initUI {
    
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WKMainScreenWidth, HomePageCellHeight)];
    _backView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_backView];
    
    int top = 8;  // 头像上下边距
    int left = 10; // 左间距
    int imgRight = 15; // 图片右间距
    int contentLabelH = 25; // 简介label高度
    int imgW = HomePageCellHeight - top*2- contentLabelH;
    
    // 头像
    _headImgV = [[HeadImageView alloc] initWithFrame:CGRectMake(left, top, imgW, imgW)];
//    _headImgV.backgroundColor = WKRandomColor;
//    _headImgV.layer.cornerRadius = 6;
//    _headImgV.clipsToBounds = YES;
    [_backView addSubview:_headImgV];
    
    // 名字
    int labelX = _headImgV.right+imgRight; // 名称label 坐标x值
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, _headImgV.top+3, 60, 20)];
    _nameLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
//    _nameLabel.backgroundColor = WKRandomColor;
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textColor = WKColor(70, 70, 70);
    [_backView addSubview:_nameLabel];

    // 年龄
    _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.right+5, _nameLabel.top, 25, 20)];
    _ageLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    _ageLabel.textAlignment = NSTextAlignmentCenter;
//    _ageLabel.backgroundColor = WKRandomColor;
    _ageLabel.font = [UIFont systemFontOfSize:12];
    _ageLabel.textColor = WKColor(90, 90, 90);
    [_backView addSubview:_ageLabel];
    
    // 学校
    float shoollabelW = 100;
    _shoollabel = [[UILabel alloc] initWithFrame:CGRectMake(WKMainScreenWidth-shoollabelW-left, _nameLabel.top, shoollabelW, 20)];
//    _shoollabel.backgroundColor = WKRandomColor;
    _shoollabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    _shoollabel.textAlignment = NSTextAlignmentRight;
    _shoollabel.font = [UIFont systemFontOfSize:12];
    _shoollabel.textColor = WKColor(180, 180, 180);
    [_backView addSubview:_shoollabel];
    
    int funBtWidth = 50;
    int funBtH = 11;
    int funBtnY = _headImgV.bottom-funBtH-2;
    self.goodBt = [self allocInitButtonWithImgName:@"sha" tag:0 frame:CGRectMake(_nameLabel.left, funBtnY, funBtWidth, funBtH) titleColor:WKColor(18, 98, 205)];
     [_backView addSubview:self.goodBt];
    self.pointBt = [self allocInitButtonWithImgName:@"shoucang" tag:1 frame:CGRectMake(_goodBt.right, funBtnY, funBtWidth, funBtH) titleColor:WKColor(245, 143, 0)];
     [_backView addSubview:self.pointBt];
    self.fruitBt = [self allocInitButtonWithImgName:@"zan" tag:2 frame:CGRectMake(_pointBt.right, funBtnY, funBtWidth, funBtH) titleColor:WKColor(87, 198, 0)];
    [_backView addSubview:self.fruitBt];
    
    
    UILabel *line  = [[UILabel alloc] init];
    line.frame = CGRectMake(left, _headImgV.bottom+top, WKMainScreenWidth-left*2, 0.5);
    line.backgroundColor = WKColor(180,190,198);
    line.alpha = 0.5;
    [_backView addSubview:line];
    
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(left, line.bottom, WKMainScreenWidth-left*2, contentLabelH)];
    _contentLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
//    _contentLabel.backgroundColor = WKRandomColor;
    _contentLabel.font = [UIFont systemFontOfSize:13];
    _contentLabel.textColor = WKColor(100, 100, 100);
    [_backView addSubview:_contentLabel];
    
  
}

- (CountButton *)allocInitButtonWithImgName:(NSString *)imgName tag:(int)tag frame:(CGRect)frame titleColor:(UIColor *)color {
    
    CountButton *funBt = [CountButton buttonWithType:UIButtonTypeCustom];
    funBt.frame = frame;
    funBt.imageView.contentMode = UIViewContentModeScaleAspectFit;
   
    [funBt setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
//    [funBt setTitle:@"100" forState:UIControlStateNormal];
    [funBt setTitleColor:color forState:UIControlStateNormal];
    funBt.titleLabel.font = [UIFont systemFontOfSize:11];
    
//    funBt.backgroundColor = WKRandomColor;
//    funBt.imageView.backgroundColor= WKRandomColor;
//    funBt.titleLabel.backgroundColor = WKRandomColor;
    
//    [funBt addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    funBt.tag = tag;
    
    return funBt;
}

- (SignLabel *) zhenLabel {
    
    if (_zhenLabel == nil) {
        SignLabel *label = [[SignLabel alloc ]init];
        label.text = @"真";
        label.textColor =  WKColor(59, 159, 17);
        self.zhenLabel = label;
//        label.backgroundColor = WKRandomColor;
        [_backView addSubview:label];
    }
    return _zhenLabel;
}

- (SignLabel *) jiLabel {
    
    if (_jiLabel == nil) {
        SignLabel *label = [[SignLabel alloc ]init];
        label.text = @"技";
        label.textColor = WKColor(225, 109, 15);
        self.jiLabel = label;

        [_backView addSubview:label];
    }
    return _jiLabel;
}

- (SignLabel *) xueLabel {
    
    if (_xueLabel == nil) {
        SignLabel *label = [[SignLabel alloc ]init];
        label.text = @"学";
        label.textColor = WKColor(253, 80, 84);
        self.xueLabel = label;
        [_backView addSubview:label];
    }
    return _xueLabel;
}

//- (void) clickButton:(id)send {
//    
//    if (self.indexPath == nil) {
//        return;
//    }
//    
//    UIButton *bt = (UIButton *)send;
//    
//    if ([self.delegate respondsToSelector:@selector(courseTableViewCellFunButtonClickWithPath:withTag:)]) {
//        
//        [self.delegate courseTableViewCellFunButtonClickWithPath:self.indexPath withTag:(int)bt.tag];
//        
//    }
//
//    
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
