//
//  ScaleImageViewController.swift
//  SlideShowApp
//
//  Created by 伊藤 大智 on 2017/01/18.
//  Copyright © 2017年 daichi.itoh. All rights reserved.
//

import UIKit

class ScaleImageViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
//    @IBOutlet weak var imageView: UIImageView!
    var imageView: UIImageView!
    var imageName: String!
    var currentImageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = UIViewContentMode.center
        scrollView.addSubview(imageView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let size = imageView.image?.size {
            // imageViewのサイズがscrollView内に収まるように調整
            let wrate = scrollView.frame.width / size.width
            let hrate = scrollView.frame.height / size.height
            let rate = min(wrate, hrate, 1)
            imageView.frame.size = CGSize(width: size.width * rate, height: size.height * rate)
            
            // contentSizeを画像サイズに設定
            scrollView.contentSize = imageView.frame.size
            // 初期表示のためcontentInsetを更新
            updateScrollInset()
        }
    }
    
    private func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        // ズームのために要指定
        return imageView
    }
    
    
    
    private func updateScrollInset() {
        // imageViewの大きさからcontentInsetを再計算
        // 0を下回らないようにする
        scrollView.contentInset = UIEdgeInsetsMake(
            max((scrollView.frame.height - imageView.frame.height)/2, 0),
            max((scrollView.frame.width - imageView.frame.width)/2, 0),
            0,
            0
        );
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
