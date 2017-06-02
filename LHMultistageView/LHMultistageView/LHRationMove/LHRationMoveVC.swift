//
//  LHRationMoveVC.swift
//  LHMultistageView
//
//  Created by liuhang on 17/6/2.
//  Copyright © 2017年 liuhang. All rights reserved.
//

import UIKit
class LHRationMoveVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let listScrollView = LHListScrollView.listScrollView(frame: CGRect(x:0,y:0,width:350,height:50),segmentWidth: 15,titles: ["视频","音乐","笑话"])
        view.addSubview(listScrollView)
    }

}
