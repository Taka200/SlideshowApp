import UIKit

class ViewController: UIViewController {
    
    let pictureArray = ["picture1.jpg", "picture2.jpg", "picture3.jpg", "picture4.jpg", "picture5.jpg"]
    var slideShow: Int = 0
    var timer: Timer!

    @IBOutlet weak var slideShowImage: UIImageView!
/*LP: プロパティーを変更してボタンを無効化したいのでIBAction接続に加えて、IBOutlet接続をしている*/
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
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
        if timer == nil {
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
            returnButton.isEnabled = false
            forwardButton.isEnabled = false
            playButton.setTitle("停止", for: .normal)
        } else {
            timer.invalidate()
            timer = nil
            returnButton.isEnabled = true
            forwardButton.isEnabled = true
            playButton.setTitle("再生", for: .normal)
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
        
        timer.invalidate()
        timer = nil
        returnButton.isEnabled = true
        forwardButton.isEnabled = true
        playButton.setTitle("再生", for: .normal)
        
        
        
    }
    
    
}

