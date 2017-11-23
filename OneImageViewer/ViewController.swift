//
//  ViewController.swift
//  OneImageViewer
//
//  Created by Susu Liang on 2017/11/23.
//  Copyright © 2017年 Susu Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
//        imageView = UIImageView(image: UIImage(named: "preview"))
//
//        //設定滾動區域及大小
//        scrollView = UIScrollView(frame: view.bounds)
//        scrollView.contentSize = imageView.bounds.size
//
//        view.addSubview(scrollView)
//        scrollView.addSubview(imageView)
//
//        //當裝置旋轉時，會重新調整大小
//        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        //1.將滾動區域的位置從原點在左上角改為(1000, 450)
//        scrollView.contentOffset = CGPoint(x: 1000, y: 450)
//
//        //2. 縮放功能需要指定delegate self 跟縮放比例
//        scrollView.delegate = self
//        //        scrollView.minimumZoomScale = 0.1
//        //        scrollView.maximumZoomScale = 4.0
//        //        scrollView.zoomScale = 1.0
//        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setView() {
        let yellowView = UIView()
        yellowView.frame = CGRect(x: 0, y: 590, width: self.view.frame.width, height: 77)
        yellowView.backgroundColor = UIColor(red: 249/255.0, green: 223/255.0, blue: 23/255.0, alpha: 1)
        self.view.addSubview(yellowView)
        
        let pickButton = UIButton()
        pickButton.frame = CGRect(x: 98, y: 17, width: 180, height: 44)
        pickButton.backgroundColor = UIColor.black
        pickButton.setTitle("Pick an Image", for: .normal)
        pickButton.setTitleColor(.white, for: .normal)
        pickButton.titleLabel?.font = UIFont(name: "SFUIText", size: 20)
        pickButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        yellowView.addSubview(pickButton)
        
        
    }

//    // 2.加了縮放功能 protocol (UIScrollViewDelegate) 需要implement 的function
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return imageView
//    }
//
//    //3. 為了讓圖片縮小填滿且有Aspect Fit
//    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
//        let widthScale = size.width / imageView.bounds.width
//        let heightScale = size.height / imageView.bounds.height
//
//        let minScale = min(widthScale, heightScale)
//        scrollView.minimumZoomScale = minScale
//
//        scrollView.zoomScale = minScale
//
//    }
//
//    //3. 呼叫
//    override func viewWillLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        updateMinZoomScaleForSize(view.bounds.size)
//
//    }
//
//    //4.讓圖片置中, 每次縮放之後會被呼叫
//    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        let imageViewSize = imageView.frame.size
//        let scrollViewSize = scrollView.bounds.size
//
//        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
//        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
//
//        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
//    }
    
}

