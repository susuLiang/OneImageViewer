//
//  ViewController.swift
//  OneImageViewer
//
//  Created by Susu Liang on 2017/11/23.
//  Copyright © 2017年 Susu Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var scrollView: UIScrollView!
    @IBOutlet weak var pickButton: UIButton!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var imageViewPicked: UIImageView!
    var imagePicker: UIImagePickerController!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonView()
        setScrollView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButtonView() {
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
        pickButton.addTarget(self, action: #selector(self.loadImage(_:)), for: .touchUpInside)
        
        
    }
    
    @objc func loadImage(_ sender: UIButton) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let imageViewPicked = UIImageView()
            imageViewPicked.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 77)
            
            imageViewPicked.contentMode = .scaleAspectFit
            imageViewPicked.image = pickedImage
            
            scrollView.contentSize = imageViewPicked.bounds.size
            
            scrollView.addSubview(imageViewPicked)
            
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    func setScrollView() {

        scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 77)
//        scrollView.contentSize = imageViewPicked.bounds.size
        scrollView.backgroundColor = UIColor.black

        self.view.addSubview(scrollView)
//        scrollView.addSubview(imageViewPicked)

        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViewPicked
    }

//    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
//        let widthScale = size.width / imageViewPicked.bounds.width
//        let heightScale = size.height / imageViewPicked.bounds.height
//
//        let minScale = min(widthScale, heightScale)
//        scrollView.minimumZoomScale = minScale
//        scrollView.zoomScale = minScale
//
//    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        updateMinZoomScaleForSize(view.bounds.size)
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let imageViewSize = imageViewPicked.frame.size
        let scrollViewSize = scrollView.bounds.size

        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0

        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
}

