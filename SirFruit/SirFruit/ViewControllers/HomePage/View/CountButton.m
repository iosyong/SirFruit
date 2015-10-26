//
//  CountButton.m
//  SirFruit
//
//  Created by yong on 15/10/22
//  Copyright (c) 2015年 iosYong. All rights reserved.
//

#import "CountButton.h"

#define imageViewH 12

@implementation CountButton

//-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//    
//    
//    float y = (self.height - imageViewH)/2;
//    
//    return CGRectMake(0, y, imageViewH, imageViewH);
//}
//
//-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//    
//    float x= imageViewH + 2;
//    float y = (self.height - imageViewH)/2;
//    
//    return  CGRectMake(x, y,self.width-x , imageViewH);
//}


-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    
    
    return CGRectMake(0, 0, self.height, self.height);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    float x= self.height + 2;
    
    return  CGRectMake(x, 0,self.width-x , self.height);
}

@end
