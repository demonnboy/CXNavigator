//
//  CXBarButtonItem.m
//  navigatorTest
//
//  Created by Demon on 2019/8/27.
//  Copyright © 2019 Demon. All rights reserved.
//

#import "CXBarButtonItem.h"

@implementation CXBarButtonItem

- (instancetype)initWithImage:(nonnull UIImage *)image target:(nonnull id)target action:(nonnull SEL)action {
    return [self initWithImage:image title:nil custom:nil target:target action:action];
}

- (instancetype)initWithTitle:(nonnull NSString *)title target:(nonnull id)target action:(nonnull SEL)action {
    return [self initWithImage:nil title:title custom:nil target:target action:action];
}

- (instancetype)initWithCustomView:(nonnull UIView *)customView {
    return [self initWithImage:nil title:nil custom:customView target:nil action:nil];
}

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title custom:(UIView *)customView target:(id)target action:(SEL)action {
    CXBarButtonItem *item = [[CXBarButtonItem alloc] init];
    item.image = image;
    item.title = title;
    item.customView = customView;
    item.target = target;
    item.action = action;
    return item;
}

@end
