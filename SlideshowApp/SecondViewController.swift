//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 中川貴裕 on 2019/02/08.
//  Copyright © 2019 Taka200. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
 
    @IBOutlet weak var label: UIImageView!
    
    var picture = "picture1"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.image = UIImage(named: picture)
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
