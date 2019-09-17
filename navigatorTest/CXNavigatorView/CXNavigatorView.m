//
//  CXNavigatorView.m
//  navigatorTest
//
//  Created by Demon on 2019/8/27.
//  Copyright © 2019 Demon. All rights reserved.
//

#import "CXNavigatorView.h"
#import "UIView+NavigatorBar.h"
#import "UIFont+CXFont.h"
#import "NSString+CXAdd.h"

static CGFloat const itemInterval = 2.0f;

@interface CXNavigatorView (DrawRect)

- (void)drawLeftBarButtonView;
- (void)drawRightBarButtonView;

@end

@interface CXNavigatorView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *shadowLine;

@property (nonatomic, strong) NSMutableArray<UIView *> *stackLeftViewArray;
@property (nonatomic, strong) NSMutableArray<UIView *> *stackRightViewArray;

@end

@implementation CXNavigatorView

@synthesize tintColor = _tintColor, barTintColor = _barTintColor, alpha = _alpha;

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, 0, [UIView screeWidth], [UIView navigatorHeight])];
    if (self) {
        [self loadUI];
        [self loadConfig];
    }
    return self;
}

- (void)loadUI {
    self.backgroundColor = self.barTintColor;
    self.backgroundColor = [self.barTintColor colorWithAlphaComponent:self.alpha];
    [self addSubview:self.shadowLine];
    [self addSubview:self.titleLabel];
}

- (void)loadConfig {
    self.backgroundColor = self.barTintColor;
}

- (void)setTitleAttribute:(NSDictionary *)attributes {
    for (CXAttributedStringKey key in attributes.allKeys) {
        [self.titleLabel setValue:attributes[key] forKey:key];
        if ([key isEqualToString:CXAttributeStringFont]) {
            CGFloat width = [self.titleLabel.text widthForFont:attributes[key]];
            self.titleLabel.frame = CGRectMake(([UIView screeWidth] - width)/2.0, [UIView statusHeight], width, NavigationBarHeight);
        }
    }
}

- (void)removeLeftBarItemsFromSuperView {
    for (UIView *subView in self.stackLeftViewArray) {
        [subView removeFromSuperview];
    }
    [self.stackLeftViewArray removeAllObjects];
}

- (void)removeRightBarItemsFromSuperView {
    for (UIView *subView in self.stackRightViewArray) {
        [subView removeFromSuperview];
    }
    [self.stackRightViewArray removeAllObjects];
}

#pragma mark -- setter

- (void)setTitle:(NSString *)title {
    _title = title;
    CGFloat width = [title widthForFont:self.titleLabel.font];
    self.titleLabel.frame = CGRectMake(([UIView screeWidth] - width)/2.0, [UIView statusHeight], width, NavigationBarHeight);
    self.titleLabel.text = title;
}

- (void)setLeftBarButtonItem:(CXBarButtonItem *)leftBarButtonItem {
    _leftBarButtonItem = leftBarButtonItem;
    self.leftBarButtonItems = leftBarButtonItem ? @[leftBarButtonItem] : nil;
}

- (void)setLeftBarButtonItems:(NSArray<CXBarButtonItem *> *)leftBarButtonItems {
    _leftBarButtonItems = leftBarButtonItems;
    [self removeLeftBarItemsFromSuperView];
    if (leftBarButtonItems) {
        [self drawLeftBarButtonView];
    }
}

- (void)setRightBarButtonItem:(CXBarButtonItem *)rightBarButtonItem {
    _rightBarButtonItem = rightBarButtonItem;
    self.rightBarButtonItems = rightBarButtonItem ? @[rightBarButtonItem] : nil;
}

- (void)setRightBarButtonItems:(NSArray<CXBarButtonItem *> *)rightBarButtonItems {
    _rightBarButtonItems = rightBarButtonItems;
    [self removeRightBarItemsFromSuperView];
    if (rightBarButtonItems) {
        [self drawRightBarButtonView];
    }
}

- (void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    for (UIView *itemView in self.stackLeftViewArray) {
        if ([itemView isKindOfClass:[UIButton class]]) {
            [(UIButton *)itemView setTitleColor:tintColor forState:UIControlStateNormal];
            [(UIButton *)itemView setTitleColor:tintColor forState:UIControlStateHighlighted];
        }
    }
    for (UIView *itemView in self.stackRightViewArray) {
        if ([itemView isKindOfClass:[UIButton class]]) {
            [(UIButton *)itemView setTitleColor:tintColor forState:UIControlStateNormal];
            [(UIButton *)itemView setTitleColor:tintColor forState:UIControlStateHighlighted];
        }
    }
}

- (void)setBarTintColor:(UIColor *)barTintColor {
    _barTintColor = barTintColor;
    [self setBackgroundColor:barTintColor];
}

- (void)setAlpha:(CGFloat)alpha {
    _alpha = alpha;
    self.backgroundColor = [self.barTintColor colorWithAlphaComponent:alpha];
    self.shadowLine.alpha = alpha;
}

#pragma mark -- lazyload getter

- (UIColor *)barTintColor {
    if (!_barTintColor) {
        _barTintColor = [UIColor whiteColor];
    }
    return _barTintColor;
}

- (UIColor *)tintColor {
    if (!_tintColor) {
        _tintColor = [UIColor blackColor];
    }
    return _tintColor;
}

- (CGFloat)alpha {
    if (!_alpha) {
        _alpha = 1.0f;
    }
    return _alpha;
}

- (NSMutableArray<UIView *> *)stackLeftViewArray {
    if (!_stackLeftViewArray) {
        _stackLeftViewArray = [NSMutableArray array];
    }
    return _stackLeftViewArray;
}

- (NSMutableArray<UIView *> *)stackRightViewArray {
    if (!_stackRightViewArray) {
        _stackRightViewArray = [NSMutableArray array];
    }
    return _stackRightViewArray;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont pingFangSCWithWeight:FontWeightStyleMedium size:17];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)shadowLine {
    if (!_shadowLine) {
        _shadowLine = [[UILabel alloc] initWithFrame:CGRectMake(0, [UIView navigatorHeight] - 0.5, [UIView screeWidth], 0.5)];
        _shadowLine.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
    }
    return _shadowLine;
}

@end

@implementation  CXNavigatorView (DrawRect)

- (void)drawLeftBarButtonView {
    CGFloat originX = 10;
    for (int i = 0; i < self.leftBarButtonItems.count; i++) {
        CXBarButtonItem *leftItem = self.leftBarButtonItems[i];
        if (leftItem.customView) {
            CGRect rect = leftItem.customView.frame;
            rect.origin.x = originX;
            rect.origin.y = [UIView statusHeight];
            leftItem.customView.frame = rect;
            originX = rect.origin.x + leftItem.customView.width + itemInterval;
            [self addSubview:leftItem.customView];
            [self.stackLeftViewArray addObject:leftItem.customView];
        } else if (leftItem.image) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(originX, [UIView statusHeight], NavigationBarHeight, NavigationBarHeight);
            [button setImage:leftItem.image forState:UIControlStateNormal];
            [button setImage:leftItem.image forState:UIControlStateHighlighted];
            [button addTarget:leftItem.target action:leftItem.action forControlEvents:UIControlEventTouchUpInside];
            originX = button.frame.origin.x + button.width + itemInterval;
            [self addSubview:button];
            [self.stackLeftViewArray addObject:button];
        } else if (leftItem.title) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.font = [UIFont systemFontOfSize:17];
            CGFloat titleWidth = [leftItem.title widthForFont:button.titleLabel.font];
            button.frame = CGRectMake(originX, [UIView statusHeight], titleWidth, NavigationBarHeight);
            [button setTitleColor:self.tintColor forState:UIControlStateNormal];
            [button setTitleColor:self.tintColor forState:UIControlStateHighlighted];
            [button setTitle:leftItem.title forState:UIControlStateNormal];
            [button setTitle:leftItem.title forState:UIControlStateHighlighted];
            [button addTarget:leftItem.target action:leftItem.action forControlEvents:UIControlEventTouchUpInside];
            originX = button.frame.origin.x + button.width + itemInterval;
            [self addSubview:button];
            [self.stackLeftViewArray addObject:button];
        } else {}
    }
}

- (void)drawRightBarButtonView {
    CGFloat originX = self.width - 10;
    for (int i = 0; i < self.rightBarButtonItems.count; i++) {
        CXBarButtonItem *rightItem = self.rightBarButtonItems[i];
        if (rightItem.customView) {
            CGRect rect = rightItem.customView.frame;
            rect.origin.x = originX - rect.size.width;
            rect.origin.y = [UIView statusHeight];
            rightItem.customView.frame = rect;
            originX = rect.origin.x - itemInterval;
            [self addSubview:rightItem.customView];
            [self.stackRightViewArray addObject:rightItem.customView];
        } else if (rightItem.image) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(originX - NavigationBarHeight, [UIView statusHeight], NavigationBarHeight, NavigationBarHeight);
            [button setImage:rightItem.image forState:UIControlStateNormal];
            [button setImage:rightItem.image forState:UIControlStateHighlighted];
            [button addTarget:rightItem.target action:rightItem.action forControlEvents:UIControlEventTouchUpInside];
            originX = button.frame.origin.x - itemInterval;
            [self addSubview:button];
            [self.stackRightViewArray addObject:button];
        } else if (rightItem.title) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.font = [UIFont systemFontOfSize:17];
            CGFloat titleWidth = [rightItem.title widthForFont:button.titleLabel.font];
            button.frame = CGRectMake(originX - titleWidth, [UIView statusHeight], titleWidth, NavigationBarHeight);
            [button setTitleColor:self.tintColor forState:UIControlStateNormal];
            [button setTitleColor:self.tintColor forState:UIControlStateHighlighted];
            [button setTitle:rightItem.title forState:UIControlStateNormal];
            [button setTitle:rightItem.title forState:UIControlStateHighlighted];
            [button addTarget:rightItem.target action:rightItem.action forControlEvents:UIControlEventTouchUpInside];
            originX = button.frame.origin.x - itemInterval;
            [self addSubview:button];
            [self.stackRightViewArray addObject:button];
        } else {}
    }
}

@end
