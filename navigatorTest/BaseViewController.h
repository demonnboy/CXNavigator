//
//  BaseViewController.h
//  navigatorTest
//
//  Created by Demon on 2019/8/27.
//  Copyright © 2019 Demon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CXNavigatorView/CXNavigatorView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong, readonly) CXNavigatorView *navigatorBar;

@end

NS_ASSUME_NONNULL_END
