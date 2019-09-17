//
//  UIView+Navigator.h
//  navigatorTest
//
//  Created by Demon on 2019/8/27.
//  Copyright © 2019 Demon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static CGFloat const NavigationBarHeight = 44.0f;

@interface UIView (NavigatorBar)

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

+ (CGFloat)navigatorHeight;
+ (CGFloat)statusHeight;
+ (CGFloat)screeWidth;
+ (BOOL)isFringeScreenPhone;

@end

NS_ASSUME_NONNULL_END
