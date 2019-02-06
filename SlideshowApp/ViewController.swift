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
   
    @IBOutlet weak var slideShowImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func returnButton(_ sender: UIButton) {
        if slideShow != 0 {
            slideShow -= 1
        } else {
            slideShow = 4
        }
        slideShowImage.image = UIImage(named: pictureArray[slideShow])
    }
    @IBAction func playButton(_ sender: UIButton) {
        slideShowImage.image = UIImage(named: pictureArray[slideShow])
    }
    @IBAction func forwardButton(_ sender: UIButton) {
        if slideShow != 4{
            slideShow += 1
        } else {
            slideShow = 0
        }
        slideShowImage.image = UIImage(named: pictureArray[slideShow])
    }
    
    
    
    
}

