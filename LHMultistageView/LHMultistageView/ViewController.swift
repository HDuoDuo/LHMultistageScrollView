//
//  ViewController.swift
//  LHMultistageView
//
//  Created by liuhang on 17/6/2.
//  Copyright © 2017年 liuhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let listScrollView = LHListScrollView.listScrollView(frame: CGRect(x:0,y:100,width:350,height:50),segmentWidth: 80,
            titles: ["视频","音乐","笑话","音乐","笑话","音乐","笑话","音乐","笑话","音乐","笑话"])
        listScrollView.backgroundColor = UIColor.gray
        view.addSubview(listScrollView)
        
    }
}

