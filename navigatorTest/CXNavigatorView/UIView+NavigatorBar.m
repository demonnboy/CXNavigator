//
//  UIView+Navigator.m
//  navigatorTest
//
//  Created by Demon on 2019/8/27.
//  Copyright © 2019 Demon. All rights reserved.
//

#import "UIView+NavigatorBar.h"
#import <sys/utsname.h>

CGFloat const IphoneFringScreenBarHeight = 88.0f;
CGFloat const IphoneNormalScreenBarHeight = 44.0f;

@implementation UIView (NavigatorBar)

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

+ (CGFloat)navigatorHeight {
    return [self isFringeScreenPhone] ? IphoneFringScreenBarHeight : IphoneNormalScreenBarHeight;
}

+ (CGFloat)statusHeight {
    return [self navigatorHeight] - NavigationBarHeight;
}

+ (CGFloat)screeWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

/// https://www.theiphonewiki.com/wiki/Models 来源
+ (BOOL)isFringeScreenPhone {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *phoneType = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([phoneType isEqualToString:@"iPhone10,3"] ||
        [phoneType isEqualToString:@"iPhone10,6"] ||
        [phoneType isEqualToString:@"iPhone11,8"] ||
        [phoneType isEqualToString:@"iPhone11,2"] ||
        [phoneType isEqualToString:@"iPhone11,6"]) {
        return YES;
    }
    if ([phoneType isEqualToString:@"i386"] || [phoneType isEqualToString:@"x86_64"]) {
        return CGRectEqualToRect([UIScreen mainScreen].bounds, CGRectMake(0, 0, 375, 812)) || CGRectEqualToRect([UIScreen mainScreen].bounds, CGRectMake(0, 0, 414, 896));
    }
    return NO;
}

@end
