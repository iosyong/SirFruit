//
//  SexPicker.m
//  SirFruit
//
//  Created by yong on 15/10/23.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import "SexPicker.h"

///////////// SexButton  begin  ////////////////

@interface SexButton : UIButton

@end

@implementation SexButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(25, 15, 11, 11);
}
//
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(12, 5, 20, 20);
}

@end

@interface OAFileboardButton : UIButton

@end

///////////// SexButton  end  ////////////////



@implementation SexPicker

#define BorderColor WKColor(220, 220, 220)

- (id)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]){
        self.frame = frame;
        
        self.layer.cornerRadius = 3;
        self.clipsToBounds = YES;
        self.layer.borderWidth = 1;//边框宽度
        self.layer.borderColor =  BorderColor.CGColor ;//边框颜色

        
        [self initUI];
        
    }
    
    return self;
}

- (void)initUI {
    
    NSArray *sexs = @[@"男",@"女"];
    
    [sexs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        // title
        SexButton *segmentButton = [SexButton buttonWithType:UIButtonTypeCustom];
//        segmentButton.backgroundColor = WKRandomColor;
        
        segmentButton.frame = CGRectMake(0 + idx*(self.width/sexs.count),0, self.width/sexs.count, self.height);
        
        segmentButton.tag = idx ;
        
        [segmentButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [segmentButton.titleLabel setFont:RithtCellTitleFont];
        [segmentButton setTitle:obj forState:UIControlStateNormal];
        [segmentButton setTitleColor:RithtCellTitleColor forState:UIControlStateNormal];
        
        segmentButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        if (idx == 0) { // 男
            [segmentButton setTitleColor:WKColor(10, 150, 50) forState:UIControlStateSelected];
            
            [segmentButton setImage:[UIImage imageNamed:@"boy"] forState:UIControlStateNormal];
            [segmentButton setImage:[UIImage imageNamed:@"girl"] forState:UIControlStateSelected];

        } else {  // 女
            [segmentButton setTitleColor:WKColor(225, 47, 23) forState:UIControlStateSelected];
            
            [segmentButton setImage:[UIImage imageNamed:@"girl"] forState:UIControlStateNormal];
            [segmentButton setImage:[UIImage imageNamed:@"boy"] forState:UIControlStateSelected];
        }
        
//
//        [funBt setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
//        //    [funBt setTitle:@"100" forState:UIControlStateNormal];
//        [funBt setTitleColor:color forState:UIControlStateNormal];
//        funBt.titleLabel.font = [UIFont systemFontOfSize:11];
        
//        segmentButton.titleLabel.backgroundColor = WKRandomColor;
//        segmentButton.imageView.backgroundColor = WKRandomColor;
        
        
        [self addSubview:segmentButton];
    }];
    
    int lineY = 3;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(self.width/2-0.5, lineY, 1, self.height-lineY*2)];
    line.backgroundColor = BorderColor;
    [self addSubview:line];

    
}


- (void)buttonClicked:(UIButton *)button{
    
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([[obj class] isSubclassOfClass:[UIButton class]]){
            
            SexButton *theBtn=(SexButton *)obj;
            theBtn.selected = NO;
        }
        
    }];

    button.selected = YES;


    _selectedSegmentIndex = (int) button.tag;
    
    if([self.delegate respondsToSelector: @selector(sexPickerClicked:)]){
        
        [self.delegate sexPickerClicked:self];
        
    }
}




-(void)setSelectedSegmentIndex:(int) index{
    UIButton *btn=(UIButton *)[self viewWithTag:index+1];
    [self buttonClicked:btn];
    _selectedSegmentIndex=index;
}

@end
