//
//  CXBarButtonItem.h
//  navigatorTest
//
//  Created by Demon on 2019/8/27.
//  Copyright © 2019 Demon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXBarButtonItem : NSObject

/**
 注意!,规范导航栏高度,在customview中的UI高度统一为44
      字体标准大小为 17.0f
 */
@property(nullable, nonatomic, strong) __kindof UIView *customView;       // default is nil
@property(nullable, nonatomic) SEL action;           // default is NULL
@property(nullable, nonatomic, weak) id target;           // default is nil
@property(nullable, nonatomic, copy) NSString *title;        // default is nil
@property(nullable, nonatomic, strong) UIImage *image;        // default is nil

- (instancetype)initWithImage:(nonnull UIImage *)image target:(nonnull id)target action:(nonnull SEL)action;
- (instancetype)initWithTitle:(nonnull NSString *)title target:(nonnull id)target action:(nonnull SEL)action;
- (instancetype)initWithCustomView:(nonnull UIView *)customView;

@end

NS_ASSUME_NONNULL_END
