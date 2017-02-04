//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 伊藤 大智 on 2017/01/17.
//  Copyright © 2017年 daichi.itoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slideShowButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // 時間を扱う変数を用意
    var currentImageIndex: Int = 0
    var images: [String] = ["dfp-0.png", "dfp-1.png", "dfp-2.png", "dfp-3.png", "dfp-4.png"]
    
    var timer: Timer!
    var timer_section: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * 画像を置き換える
     */
    func refreshImageView() {
        imageView.image = UIImage(named: images[currentImageIndex])
    }
    
    /**
     * 配列の要素数を置き換える
     */
    func updateImage(timer: Timer) {
        if self.currentImageIndex == self.images.count - 1 {
            self.currentImageIndex = 0
        } else {
            self.currentImageIndex += 1
        }
        
        refreshImageView()
    }
    
    
    /**
     * スライドショーを再生/停止する
     */
    @IBAction func slideShow(_ sender: AnyObject) {
        if self.timer != nil {
            stopSlideshow()
        } else {
            startSlideshow()
        }
    }
    
    /**
     * スライドショーを停止する
     */
    private func stopSlideshow(){
        self.timer.invalidate()
        self.timer = nil
        
        // 停止後はボタン使用可能
        previousButton.isEnabled = true
        nextButton.isEnabled = true
    }
    
    /**
     * スライドショーを再生する
     */
    private func startSlideshow(){
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true)
        
        // 再生中はボタン使用不可
        previousButton.isEnabled = false
        nextButton.isEnabled = false
    }
    
    /**
     * 1つ前の画像に戻る
     */
    @IBAction func previous(_ sender: AnyObject) {
        if self.currentImageIndex == 0 {
            self.currentImageIndex = self.images.count - 1
        } else {
            self.currentImageIndex -= 1
        }
        
        refreshImageView()
    }
    
    /**
     * 1つ前の画像に進む
     */
    @IBAction func next(_ sender: AnyObject) {
        if self.currentImageIndex == self.images.count - 1 {
            self.currentImageIndex = 0
        } else {
            self.currentImageIndex += 1
        }
        
        refreshImageView()
    }
    
    /**
     * 拡大画像に遷移
     */
    @IBAction func tapimageView(_ sender: AnyObject) {
        performSegue(withIdentifier: "result", sender: images[currentImageIndex])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            let secondViewController = segue.destination as! ScaleImageViewController
            secondViewController.imageName = sender as! String!
        }
    }
    /**
     * 遷移先から戻る
     */
    @IBAction func unwind(segue: UIStoryboardSegue) {
        if timer != nil {
            
        }
    }
}

