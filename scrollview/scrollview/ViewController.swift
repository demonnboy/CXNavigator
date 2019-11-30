//
//  ViewController.swift
//  scrollview
//
//  Created by Demon on 2019/11/30.
//  Copyright © 2019 Demon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scroll: UIScrollView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scroll = UIScrollView(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 100))
        self.scroll = scroll
        scroll.delegate = self
        self.view.addSubview(scroll)
        scroll.contentSize = CGSize(width: 10*100, height: 100)
        for i in 0..<10 {
            let v = UIView(frame: CGRect(x: i * 100, y: 0, width: 100, height: 100))
            v.backgroundColor = UIColor(white: CGFloat(arc4random()%10)/10.0, alpha: 1.0)
            scroll.addSubview(v)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.scroll?.setContentOffset(CGPoint(x: 100, y: 0), animated: true)
        
        print(Date().timeIntervalSince1970)
        var sum = 0
        for i in 0...10000 {
            sum += i
        }
        print(sum)
        print(Date().timeIntervalSince1970)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("---------------")
        Thread.callStackSymbols.forEach {
            print($0)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("+++++++++++++++")
        Thread.callStackSymbols.forEach {
            print($0)
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("/////////////////")
        Thread.callStackSymbols.forEach {
            print($0)
        }
    }
}

