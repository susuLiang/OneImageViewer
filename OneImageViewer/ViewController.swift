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
    var imagePicker: UIImagePickerController!
    var imageViewPicked = UIImageView()
    var yellowView = UIView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setScrollView()
        
        yellowView.frame = CGRect(x: 0, y: self.view.frame.height - 77, width: self.view.frame.width, height: 77)
        yellowView.backgroundColor = UIColor(red: 249/255.0, green: 223/255.0, blue: 23/255.0, alpha: 1)
        self.view.addSubview(yellowView)

        imageViewPicked.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - yellowView.frame.height)
        imageViewPicked.image = UIImage(named: "placeholder")?.withRenderingMode(.alwaysTemplate)
        imageViewPicked.contentMode = .center
        imageViewPicked.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setButton() {
        let pickButton = UIButton()
        pickButton.frame = CGRect(x: self.view.frame.width / 2 - 90 , y: 17 , width: 180, height: 44)
        pickButton.backgroundColor = UIColor(red: 43/255.0, green: 43/255.0, blue: 43/255.0, alpha: 1)
        pickButton.setTitle("Pick an Image", for: .normal)
        pickButton.setTitleColor(.white, for: .normal)
        pickButton.titleLabel?.font = UIFont(name: "SFUIText", size: 20)
        pickButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        pickButton.layer.cornerRadius = 2
        pickButton.layer.shadowColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.25).cgColor
        pickButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        pickButton.layer.shadowRadius = 2
        pickButton.layer.shadowOpacity = 1.0
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
        
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageViewPicked.image = pickedImage
            imageViewPicked.contentMode = .scaleAspectFit
            dismiss(animated: true, completion: nil)
        }
    }
    
    func setScrollView() {

        scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - yellowView.frame.height)
        scrollView.backgroundColor = UIColor(red: 43/255.0, green: 43/255.0, blue: 43/255.0, alpha: 1)
        scrollView.contentSize = imageViewPicked.bounds.size

        self.view.addSubview(scrollView)
        scrollView.addSubview(imageViewPicked)
        
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.delegate = self
        
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViewPicked
    }

    fileprivate func updateMinZoomScaleForSize(_ size: CGSize, contentView: UIImageView) {
        let widthScale = size.width / contentView.bounds.width
        let heightScale = size.height / contentView.bounds.height
        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size, contentView: imageViewPicked)
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let imageViewSize = imageViewPicked.bounds.size
        let scrollViewSize = scrollView.bounds.size

        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0

        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
}


