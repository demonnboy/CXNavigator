//
//  ViewController.m
//  navigatorTest
//
//  Created by Demon on 2019/8/27.
//  Copyright © 2019 Demon. All rights reserved.
//

#import "ViewController.h"
#import "CXNavigatorView/CXBarButtonItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 44, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    self.navigatorBar.leftBarButtonItems = @[[[CXBarButtonItem alloc] initWithCustomView:button],[[CXBarButtonItem alloc] initWithTitle:@"你好" target:self action:@selector(sayHello)]];
//    self.navigatorBar.leftBarButtonItem = [[CXBarButtonItem alloc] initWithTitle:@"你好" target:self action:@selector(sayHello)];
    self.navigatorBar.rightBarButtonItems = @[[[CXBarButtonItem alloc] initWithTitle:@"你好什么你好" target:self action:@selector(sayHello)],[[CXBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Group"] target:self action:@selector(sayHello)]];
    NSLog(@"%@ %@",NSForegroundColorAttributeName, NSFontAttributeName);
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)sayHello {
    NSLog(@"hello");
}

@end
