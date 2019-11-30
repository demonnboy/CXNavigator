//
//  CXAttributeString.h
//  navigatorTest
//
//  Created by Demon on 2019/8/30.
//  Copyright © 2019 Demon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * CXAttributedStringKey NS_EXTENSIBLE_STRING_ENUM;

@interface CXAttributeString : NSObject

FOUNDATION_EXTERN CXAttributedStringKey const CXAttributeStringFont;
FOUNDATION_EXTERN CXAttributedStringKey const CXAttributeStringTextColor;

@end

NS_ASSUME_NONNULL_END
