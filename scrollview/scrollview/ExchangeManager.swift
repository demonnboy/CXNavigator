//
//  ExchangeManager.swift
//  scrollview
//
//  Created by Demon on 2019/11/30.
//  Copyright © 2019 Demon. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    //方法替换
    fileprivate static func swizzleMethod(target: NSObject.Type, _ left: Selector, _ right: Selector) {
        
        guard let originalMethod = class_getInstanceMethod(target, left), let swizzledMethod = class_getInstanceMethod(target, right) else {
            return
        }
        
        let didAddMethod = class_addMethod(target, left, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(target, right, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
}


class ExchangeManager {
    
    static func registerMethod() {
        NSObject.swizzleMethod(target: UIScrollView.self, NSSelectorFromString("_scrollViewDidEndDeceleratingForDelegate"), #selector(UIScrollView.sh_scrollViewDidEndDeceleratingForDelegate))
        NSObject.swizzleMethod(target: UIScrollView.self, NSSelectorFromString("_scrollViewDidEndDraggingForDelegateWithDeceleration:"), #selector(UIScrollView.sh_scrollViewDidEndDraggingForDelegateWithDeceleration(_:)))
        NSObject.swizzleMethod(target: UIScrollView.self, NSSelectorFromString("_delegateScrollViewAnimationEnded"), #selector(UIScrollView.sh_delegateScrollViewAnimationEnded))
    }
}


extension UIScrollView {
    
    @objc func sh_scrollViewDidEndDeceleratingForDelegate() {
        self.sh_scrollViewDidEndDeceleratingForDelegate()
        print("自动停止")
    }
    
    @objc func sh_scrollViewDidEndDraggingForDelegateWithDeceleration(_ object: Bool) {
        self.sh_scrollViewDidEndDraggingForDelegateWithDeceleration(object)
        print("拖拽停止")
    }
    
    @objc func sh_delegateScrollViewAnimationEnded() {
        self.sh_delegateScrollViewAnimationEnded()
        print("动画停止")
    }
}
