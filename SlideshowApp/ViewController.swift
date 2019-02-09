//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中川貴裕 on 2019/02/05.
//  Copyright © 2019 Taka200. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pictureArray = ["picture1", "picture2", "picture3", "picture4", "picture5"]
    var slideShow: Int = 0
    var timer: Timer!

    @IBOutlet weak var slideShowImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    //呼び出されるタイマー関数
    @objc func updateTimer(_ timer: Timer) {
        if slideShow != 4{
            slideShow += 1
        } else {
            slideShow = 0
        }
        slideShowImage.image = UIImage(named: pictureArray[slideShow])
    }
    
    
    
    @IBAction func returnButton(_ sender: UIButton) {
        if timer == nil {    //再生中は戻る、進むボタンを無効化
            if slideShow != 0 {
                    slideShow -= 1
            } else {
                slideShow = 4
            }
            slideShowImage.image = UIImage(named: pictureArray[slideShow])
        }
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        //タイマーの作成・始動
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
            timer = nil
        }
    }
    
    
    @IBAction func forwardButton(_ sender: UIButton) {
        if timer == nil {    //再生中は戻る、進むボタンを無効化
            if slideShow != 4{
                slideShow += 1
            } else {
                slideShow = 0
            }
            slideShowImage.image = UIImage(named: pictureArray[slideShow])
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        
        secondViewController.picture = pictureArray[slideShow]
    }
    
    
}

