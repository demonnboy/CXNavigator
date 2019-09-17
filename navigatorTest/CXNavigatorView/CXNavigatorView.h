//
//  CXNavigatorView.h
//  navigatorTest
//
//  Created by Demon on 2019/8/27.
//  Copyright © 2019 Demon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CXBarButtonItem.h"
#import "CXAttributeString.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXNavigatorView : UIView

@property (nonatomic, copy) NSString *title;
/**
 buttonitem的字体颜色
 */
@property (nonatomic, strong) UIColor *tintColor;
/**
 bar的背景色
 */
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, assign) CGFloat alpha;

@property (nonatomic, strong, nullable) CXBarButtonItem *leftBarButtonItem;
@property (nonatomic, strong, nullable) NSArray<CXBarButtonItem *> *leftBarButtonItems;

@property (nonatomic, strong, nullable) CXBarButtonItem *rightBarButtonItem;
@property (nonatomic, strong, nullable) NSArray<CXBarButtonItem *> *rightBarButtonItems;

- (void)setTitleAttribute:(NSDictionary<CXAttributedStringKey, id> *)attributes;

@end

NS_ASSUME_NONNULL_END
