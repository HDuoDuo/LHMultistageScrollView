
//
//  LHListScrollView.swift
//  LHMultistageView
//
//  Created by liuhang on 17/6/2.
//  Copyright © 2017年 liuhang. All rights reserved.
//

import UIKit

class LHListScrollView: UIScrollView {
    private var titlesArr: [String] = []
    private var segmentW: CGFloat = 0
    var indicatorHeight: CGFloat = 2
    //指示器
    private var indicator: UILabel = UILabel()
    // 静态方法创建对象
    class func listScrollView(frame:CGRect,segmentWidth:CGFloat,titles:[String]) -> LHListScrollView {
        let listSV = LHListScrollView()
        listSV.showsHorizontalScrollIndicator = false
        listSV.frame = frame
        listSV.titlesArr = titles
        listSV.segmentW = segmentWidth
        listSV.contentSize = CGSize(width:segmentWidth * CGFloat(titles.count),height:frame.size.height)
        listSV.setupUI()
        return listSV
    }
    //setupUI
    private func setupUI() {
        let labelH = self.frame.size.height
        //添加指示器
        indicator.frame = CGRect(x:0,y:self.frame.size.height-2,width:50,height:indicatorHeight)
        indicator.backgroundColor = UIColor.orange
        self.addSubview(indicator)
        //添加label
        for index in 0 ..< titlesArr.count {
            let btn = UIButton()
            btn.setTitle(titlesArr[index], for: .normal)
            let btnX = segmentW * CGFloat(index)
            btn.frame = CGRect(x:btnX,y:0,width:segmentW,height:labelH)
            //算出文字的宽度
            self.addSubview(btn)
            //点击事件
            btn.tag = titlesArr.count + index
            btn.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
            if index == 0 {
                self.btnClicked(btn)
            }
        }
    }
    //btn点击触发
    @objc private func btnClicked(_ btn:UIButton) {
        print(btn.tag)
        //改变指示器的位置
        UIView.animate(withDuration: 0.35, animations: {
           self.indicator.center = CGPoint(x:btn.center.x,y:self.indicator.center.y)
        })
        self.moveToCenter(btn: btn)
    }
    //居中
    private func moveToCenter(btn:UIButton) {
        let btnX = btn.center.x
        let distaneFromCenter = self.contentOffset.x + self.bounds.size.width / 2.0
        let distance = btnX - distaneFromCenter
        let movedOffSetY = self.contentOffset.x + distance
        print(movedOffSetY)
        
        if movedOffSetY < 0 {
            UIView.animate(withDuration: 0.35, animations: {
                self.contentOffset.x = 0
            })
            return
        }
        if movedOffSetY > (self.contentSize.width - self.bounds.size.width) {
            UIView.animate(withDuration: 0.35, animations: {
                self.contentOffset.x = self.contentSize.width - self.bounds.size.width
            })
            return
        }
        UIView.animate(withDuration: 0.35, animations: {
            self.contentOffset.x = movedOffSetY
        })

    }
    
}
