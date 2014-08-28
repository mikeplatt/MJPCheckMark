//
//  MJPCheckMark.h
//  MJPCheckMark
//
//  Created by Mike Platt on 28/08/2014.
//  Copyright (c) 2014 RABFAP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MJPCheckMarkDelegate;

@interface MJPCheckMark : UIControl

@property (nonatomic, assign) IBOutlet id<MJPCheckMarkDelegate> delegate;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat gapWidth;
@property (nonatomic, readonly) BOOL isOn;
@property (nonatomic, assign) CGFloat animationDuration;

- (void)setCheckMarkOn:(BOOL)on animated:(BOOL)animated;

@end

@protocol MJPCheckMarkDelegate <NSObject>

- (void)checkMarkValueChanged:(MJPCheckMark *)checkMark;

@end