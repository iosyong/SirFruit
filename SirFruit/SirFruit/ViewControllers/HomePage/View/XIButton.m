//
//  XIButton.m
//  LPA
//
//  Created by yxlong on 15/7/7.
//  Copyright (c) 2015年 yiche. All rights reserved.
//

#import "XIButton.h"

#pragma mark-- Private classes

@interface XIContentAlignVerticalButton : XIButton
@end
@interface XIContentAlignHorizontalButton : XIButton
@end
@interface XIContentAlignHorizontalLeftButton : XIContentAlignHorizontalButton
@end
@interface XIContentAlignHorizontalCenterButton : XIContentAlignHorizontalButton
@end


@interface XIButton ()
{
    NSMutableDictionary *titleDict;
    NSMutableDictionary *imageDict;
    BOOL shouldChangeImageSize;
}
- (void)setupConstraints;
@end

#define defaultTitleForegroundColor  [UIColor blackColor]
#define defaultTitleHighlightedColor [UIColor lightGrayColor]

@implementation XIButton
@synthesize preferedImageSize;

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        shouldChangeImageSize = NO;
        preferedImageSize = CGSizeZero;
        titleDict = [NSMutableDictionary dictionary];
        imageDict = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (instancetype)createItemButtonWithType:(XIContentAlign)type
{
    XIButton *item;
    if(type==XIContentAlignVertical){
        item = [[XIContentAlignVerticalButton alloc] initWithFrame:CGRectZero];
    }
    else if (type==XIContentAlignHorizontalCenter){
        item = [[XIContentAlignHorizontalCenterButton alloc] initWithFrame:CGRectZero];
    }
    else if (type==XIContentAlignHorizontalLeft){
        item = [[XIContentAlignHorizontalLeftButton alloc] initWithFrame:CGRectZero];
    }
    return item;
}

- (void)setupConstraints
{
    
}

- (void)setPreferedImageSize:(CGSize)size
{
    preferedImageSize = size;
    shouldChangeImageSize = YES;
    [self setNeedsUpdateConstraints];
}

- (void)setTextFount:(UIFont *)fount {
    proLabel.font = fount;
}

- (void)setImage:(UIImage *)image title:(NSString *)title controlState:(UIControlState)state
{
    titleDict[@((NSUInteger)state)] = title;
    imageDict[@((NSUInteger)state)] = image;
    
    if(state==UIControlStateNormal){
        proImageView.image = image;
        proLabel.text = title;
    }
    else if (state==UIControlStateHighlighted){
        proImageView.highlightedImage = image;
    }
    
    [self setNeedsUpdateConstraints];
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    if(state==UIControlStateNormal){
        proLabel.textColor = color;
    }
    else if (state==UIControlStateHighlighted){
        proLabel.highlightedTextColor = color;
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    proLabel.highlighted = highlighted;
    proImageView.highlighted = highlighted;
}

- (void)updateConstraints
{
    if(CGSizeEqualToSize(preferedImageSize, CGSizeZero)==NO && shouldChangeImageSize){
        shouldChangeImageSize = NO;
        
        [proImageView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [proImageView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
        
        // Width
        imageWidthConstraint = [NSLayoutConstraint constraintWithItem:proImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.preferedImageSize.width];
        [self addConstraint:imageWidthConstraint];
        // Height
        imageHeightConstraint = [NSLayoutConstraint constraintWithItem:proImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.preferedImageSize.height];
        [self addConstraint:imageHeightConstraint];
    }
    
    [super updateConstraints];
}

@end

@implementation XIContentAlignHorizontalButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        containerView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:containerView];
        containerView.translatesAutoresizingMaskIntoConstraints = NO;
        containerView.backgroundColor = [UIColor clearColor];
        containerView.userInteractionEnabled = NO;
        
        proImageView = [[UIImageView alloc] init];
        proImageView.contentMode = UIViewContentModeScaleToFill;
        proImageView.backgroundColor = [UIColor clearColor];
        [containerView addSubview:proImageView];
        proImageView.translatesAutoresizingMaskIntoConstraints = NO;
        
        proLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        proLabel.textAlignment = NSTextAlignmentCenter;
        proLabel.numberOfLines = 1;
        proLabel.minimumScaleFactor = 0.5;
        proLabel.textColor = defaultTitleForegroundColor;
        proLabel.backgroundColor = [UIColor clearColor];
        proLabel.highlightedTextColor = defaultTitleHighlightedColor;
        [containerView addSubview:proLabel];
        proLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    NSDictionary *bindingViews = NSDictionaryOfVariableBindings(proImageView,proLabel);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(5)-[proImageView]-(5)-[proLabel]-(5)-|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:bindingViews];
    [containerView addConstraints:constraints];
    
    // image CenterY
    NSLayoutConstraint *_imageConstraint = [NSLayoutConstraint constraintWithItem:proImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self addConstraint:_imageConstraint];
    [proImageView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [proImageView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    
    // title CenterY
    NSLayoutConstraint *_titleConstraint = [NSLayoutConstraint constraintWithItem:proLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self addConstraint:_titleConstraint];
    // title Top
    _titleConstraint = [NSLayoutConstraint constraintWithItem:proLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeTop multiplier:1 constant:2];
    [self addConstraint:_titleConstraint];
    // title Bottom
    _titleConstraint = [NSLayoutConstraint constraintWithItem:proLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeBottom multiplier:1 constant:-2];
    [self addConstraint:_titleConstraint];
    
    // title Hugging content first
    [proLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [proLabel setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// XIContentAlignHorizontalCenterButton
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation XIContentAlignHorizontalCenterButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        
        NSLayoutConstraint *containerConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [self addConstraint:containerConstraint];
        
        containerConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [self addConstraint:containerConstraint];
        
        // Left
        containerConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:5];
        containerConstraint.priority = UILayoutPriorityDefaultLow;
        [self addConstraint:containerConstraint];
        // Right
        containerConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-5];
        containerConstraint.priority = UILayoutPriorityDefaultLow;
        [self addConstraint:containerConstraint];
        
        containerConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
        containerConstraint.priority = UILayoutPriorityRequired;
        [self addConstraint:containerConstraint];
        
        containerConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
        containerConstraint.priority = UILayoutPriorityRequired;
        [self addConstraint:containerConstraint];
    }
    return self;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// XIContentAlignHorizontalLeftButton
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation XIContentAlignHorizontalLeftButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        
        NSLayoutConstraint *_imageConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [self addConstraint:_imageConstraint];
        
        _imageConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [self addConstraint:_imageConstraint];
    }
    return self;
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// XIContentAlignVerticalButton
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation XIContentAlignVerticalButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        
        proImageView = [[UIImageView alloc] init];
        proImageView.contentMode = UIViewContentModeScaleToFill;
        proImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:proImageView];
        proImageView.translatesAutoresizingMaskIntoConstraints = NO;
        
        proLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        proLabel.textAlignment = NSTextAlignmentCenter;
        proLabel.numberOfLines = 2;
        proLabel.minimumScaleFactor = 0.5;
        proLabel.textColor = defaultTitleForegroundColor;
        proLabel.backgroundColor = [UIColor clearColor];
        proLabel.highlightedTextColor = defaultTitleHighlightedColor;
        [self addSubview:proLabel];
        proLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // image Bottom
    NSLayoutConstraint *_imageConstraint = [NSLayoutConstraint constraintWithItem:proImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self addConstraint:_imageConstraint];
    
    _imageConstraint = [NSLayoutConstraint constraintWithItem:proImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:2];
    _imageConstraint.priority = UILayoutPriorityDefaultLow;
    [self addConstraint:_imageConstraint];
    
    // image CenterX
    _imageConstraint = [NSLayoutConstraint constraintWithItem:proImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self addConstraint:_imageConstraint];
    [proImageView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [proImageView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    
    // title Top
    NSLayoutConstraint *_titleConstraint = [NSLayoutConstraint constraintWithItem:proLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:8];
    [self addConstraint:_titleConstraint];
    
    // title Left
    _titleConstraint = [NSLayoutConstraint constraintWithItem:proLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:2];
    _titleConstraint.priority = UILayoutPriorityRequired;
    [self addConstraint:_titleConstraint];
    // title Right
    _titleConstraint = [NSLayoutConstraint constraintWithItem:proLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-2];
    _titleConstraint.priority = UILayoutPriorityRequired;
    [self addConstraint:_titleConstraint];
    
    // title Bottom
    _titleConstraint = [NSLayoutConstraint constraintWithItem:proLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-2];
    _titleConstraint.priority = UILayoutPriorityDefaultLow;
    [self addConstraint:_titleConstraint];
    
    // title Hugging content first
    [proLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [proLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
}

@end



