//
//  MJPCheckMark.m
//  MJPCheckMark
//
//  Created by Mike Platt on 28/08/2014.
//  Copyright (c) 2014 RABFAP. All rights reserved.
//

#import "MJPCheckMark.h"

@interface MJPCheckMark ()

@property (nonatomic, strong) UIView *border;
@property (nonatomic, strong) UIView *check;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, assign) BOOL on;
@property (nonatomic, assign) CGRect hitFrame;

@end

@implementation MJPCheckMark

@synthesize borderWidth = _borderWidth;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self commonInit];
}

- (void)commonInit
{
    self.borderWidth = 2.0;
    _on = YES;
    
    CGFloat width = self.frame.size.width;
    if(width < 50.0) {
        CGFloat offset = (50.0 - width) / 2;
        _hitFrame = CGRectMake(0 - offset, 0 - offset, 50.0, 50.0);
    } else {
        _hitFrame = self.frame;
    }
    
    _border = [[UIView alloc] initWithFrame:self.bounds];
    _border.backgroundColor = [UIColor clearColor];
    _border.layer.cornerRadius = self.bounds.size.width / 2;
    _border.layer.borderWidth = self.borderWidth;
    _border.layer.borderColor = self.tintColor.CGColor;
    [self addSubview:_border];
    
    _check = [[UIView alloc] init];
    [self frameForCheck];
    _check.backgroundColor = self.tintColor;
    [self addSubview:_check];
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switchCheckMark:)];
    [self addGestureRecognizer:_tapGesture];
}

#pragma mark - Private

- (void)frameForCheck
{
    CGFloat width = self.bounds.size.width - (4 * self.borderWidth);
    CGFloat offSet = (self.frame.size.width - width) / 2;
    _check.frame = CGRectMake(offSet, offSet, width, width);
    _check.layer.cornerRadius = _check.frame.size.width / 2;
}

- (void)switchCheckMark:(UITapGestureRecognizer *)gesture
{
    _on = !_on;
    
    [self.delegate checkMarkValueChanged:self];
    
    CGFloat alpha = (_on) ? 1.0 : 0.0;
    CGFloat scale = (_on) ? 1.0 : 0.1;

    [UIView animateWithDuration:0.3
                          delay:0.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         _check.alpha = alpha;
                         _check.transform = CGAffineTransformMakeScale(scale, scale);
                     } completion:nil];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return CGRectContainsPoint(_hitFrame, point);
}

#pragma mark - Getters

- (BOOL)isOn
{
    return _on;
}

#pragma mark - Setters

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    _border.layer.borderWidth = borderWidth;
    [self frameForCheck];
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    _border.layer.borderColor = tintColor.CGColor;
    _check.backgroundColor = tintColor;
}

@end
