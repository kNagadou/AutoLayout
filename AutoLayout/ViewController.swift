//
//  ViewController.swift
//  AutoLayout
//
//  Created by k_nagadou on 2016/09/21.
//  Copyright © 2016年 dreamarts.co.jp. All rights reserved.
//  http://qiita.com/tadakazu1972/items/1982d527a70590f63529
//  ↑上記の記事について検証

import UIKit

class ViewController: UIViewController {
    
    private var buttons: [UIButton!] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
        addConstraints()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addButton() {
        let count: Int = 10
        let height: Int = 50
        for i in 1..<count {
            let button: UIButton = UIButton(type: UIButtonType.System)
            button.frame = CGRect(x: 0, y: (i * height), width: 100, height: height)
            button.setTitle("Button\(i)", forState: UIControlState.Normal)
            self.view.addSubview(button)
            buttons.append(button)
        }
    }
    
    func addConstraints() {
        for i in 0..<buttons.count {
            var toItem: AnyObject
            if 0 != i {
                toItem = buttons[i - 1]
            } else {
                toItem = self.view
            }
            
            // addConstraints()で追加するConstraintの数は少なくた方が良い
            self.view.addConstraints(
                [
                    NSLayoutConstraint(
                        item: buttons[i],
                        attribute: NSLayoutAttribute.Top,
                        relatedBy: NSLayoutRelation.Equal,
                        toItem: toItem,
                        attribute: NSLayoutAttribute.Top,
                        multiplier: 1.0,
                        constant: 20
                    ),
                    NSLayoutConstraint(
                        item: buttons[i],
                        attribute: NSLayoutAttribute.Leading,
                        relatedBy: NSLayoutRelation.Equal,
                        toItem: toItem,
                        attribute: NSLayoutAttribute.Leading,
                        multiplier: 1,
                        constant: 8
                    ),
                    NSLayoutConstraint(
                        item: buttons[i],
                        attribute: NSLayoutAttribute.Trailing,
                        relatedBy: NSLayoutRelation.Equal,
                        toItem: toItem,
                        attribute: NSLayoutAttribute.Trailing,
                        multiplier: 1,
                        constant: 8
                    )
                ]
            )
        }
    }
    
    // 注意！
    // 下記コメントを外すと、ビルドが激遅になる
//    func hardCodingConstraints() {
//        self.view.addConstraints(
//            [
//                // button1
//                NSLayoutConstraint(
//                    item: buttons[1],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: self.view,
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[1],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: self.view,
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[1],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: self.view,
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                //button2
//                NSLayoutConstraint(
//                    item: buttons[2],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[1],
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[2],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[1],
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[2],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[1],
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                //button3
//                NSLayoutConstraint(
//                    item: buttons[3],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[2],
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[3],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[2],
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[3],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[2],
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                //button4...
//                NSLayoutConstraint(
//                    item: buttons[4],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[3],
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[4],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[3],
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[4],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[3],
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[5],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[4],
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[5],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[4],
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[5],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[4],
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[6],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[5],
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[6],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[5],
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[6],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[5],
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[7],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[6],
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[7],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[6],
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[7],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[6],
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[8],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[7],
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[8],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[7],
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[8],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[7],
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[9],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[8],
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[9],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[8],
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[9],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[8],
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[10],
//                    attribute: NSLayoutAttribute.Top,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[9],
//                    attribute: NSLayoutAttribute.Top,
//                    multiplier: 1.0,
//                    constant: 20
//                ),
//                NSLayoutConstraint(
//                    item: buttons[10],
//                    attribute: NSLayoutAttribute.Leading,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[9],
//                    attribute: NSLayoutAttribute.Leading,
//                    multiplier: 1,
//                    constant: 8
//                ),
//                NSLayoutConstraint(
//                    item: buttons[10],
//                    attribute: NSLayoutAttribute.Trailing,
//                    relatedBy: NSLayoutRelation.Equal,
//                    toItem: buttons[9],
//                    attribute: NSLayoutAttribute.Trailing,
//                    multiplier: 1,
//                    constant: 8
//                )
//            ]
//        )
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

