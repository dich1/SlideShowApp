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
    var imageView: UIImageView!
    // 渡されてきた値用
    var imageName: String!
    var currentImageIndex: Int!
    
    // 画像サイズ指定用
    var scale:CGFloat = 1.0
    var width:CGFloat = 0
    var height:CGFloat = 0
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Screen Size の取得
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        // UIImageView インスタンス生成
        imageView = UIImageView(image: UIImage(named: imageName))
        
        // 画像の幅・高さの取得
//        width = imageName.size.width
//        height = imageName.size.height
        
        // 画像サイズをスクリーン幅に合わせる
        scale = screenWidth / width
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        
        // 画像の中心をスクリーンの中心位置に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // view に ImageView を追加する
        self.view.addSubview(imageView)
        
        // 画面背景を明るいグレーに設定
        self.view.backgroundColor = UIColor.lightGray
        
//        imageView = UIImageView(image: UIImage(named: imageName))
//        scrollView.addSubview(imageView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        if let size = imageView.image?.size {
//            // imageViewのサイズがscrollView内に収まるように調整
//            let wrate = scrollView.frame.width / size.width
//            let hrate = scrollView.frame.height / size.height
//            let rate = min(wrate, hrate, 1)
//            imageView.frame.size = CGSize(width: size.width * rate, height: size.height * rate)
//            
//            // contentSizeを画像サイズに設定
//            scrollView.contentSize = imageView.frame.size
//            // 初期表示のためcontentInsetを更新
//            updateScrollInset()
//        }
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
