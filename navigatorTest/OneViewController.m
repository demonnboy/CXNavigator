//
//  OneViewController.m
//  navigatorTest
//
//  Created by Demon on 2019/8/28.
//  Copyright © 2019 Demon. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"四块五的";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 44, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitle:@"返回" forState:UIControlStateNormal];
//    self.navigatorBar.leftBarButtonItems = @[[[CXBarButtonItem alloc] initWithCustomView:button],[[CXBarButtonItem alloc] initWithTitle:@"你好" target:self action:@selector(sayHello)],[[CXBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Comment"] target:self action:@selector(sayHello)]];
//    self.navigatorBar.leftBarButtonItem = [[CXBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Group"] target:self action:@selector(sayHello)];
    self.navigatorBar.barTintColor = [UIColor whiteColor];
    self.navigatorBar.leftBarButtonItems = @[[[CXBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Group"] target:self action:@selector(sayHello)],[[CXBarButtonItem alloc] initWithTitle:@"你好" target:self action:@selector(sayHello)]];
//    [self setNeedsStatusBarAppearanceUpdate];
    self.navigatorBar.tintColor = [UIColor blueColor];
    self.view.backgroundColor = [UIColor brownColor];
    self.navigatorBar.alpha = 0;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)sayHello {
    NSLog(@"yeah i am bad boy");
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
