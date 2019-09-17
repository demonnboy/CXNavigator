//
//  BaseViewController.m
//  navigatorTest
//
//  Created by Demon on 2019/8/27.
//  Copyright © 2019 Demon. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong, readwrite) CXNavigatorView *navigatorBar;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navigatorBar];
}

- (void)setTitle:(NSString *)title {
    self.navigatorBar.title = title;
}

- (CXNavigatorView *)navigatorBar {
    if (!_navigatorBar) {
        _navigatorBar = [[CXNavigatorView alloc] init];
    }
    return _navigatorBar;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
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
