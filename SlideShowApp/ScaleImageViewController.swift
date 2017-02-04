//
//  ScaleImageViewController.swift
//  SlideShowApp
//
//  Created by 伊藤 大智 on 2017/01/18.
//  Copyright © 2017年 daichi.itoh. All rights reserved.
//

import UIKit

class ScaleImageViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!

    var imageName: String!
    var currentImageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        imageView.image = UIImage(named: imageName)
        scrollView.addSubview(imageView)
        scrollView.maximumZoomScale = 8.0
        scrollView.minimumZoomScale = 1.0
        
        // タップイベント
        let doubleTapGesture = UITapGestureRecognizer(target: self, action:#selector(self.doubleTap))
        // タップ回数
        doubleTapGesture.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     * ズームする画像を返す
     * @param scrollView
     */
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    /**
     * 2回タップ
     * @param gesture
     */
    func doubleTap(gesture: UITapGestureRecognizer) -> Void {
        if (scrollView.zoomScale < scrollView.maximumZoomScale) {
            let newScale = scrollView.zoomScale * 3
            let zoomRect = self.zoomRectForScale(scale: newScale, center: gesture.location(in: gesture.view))
            scrollView.zoom(to: zoomRect, animated: true)
        } else {
            scrollView.setZoomScale(1.0, animated: true)
        }
    }
    
    /**
     * ズーム時の表示サイズを返す
     * @param scale
     * @param center
     */
    func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect{
        let size = CGSize(
            width: scrollView.frame.size.width / scale,
            height: scrollView.frame.size.height / scale
        )
        return CGRect(
            origin: CGPoint(
                x: center.x - size.width / 2.0,
                y: center.y - size.height / 2.0
            ),
            size: size
        )
    }
}
