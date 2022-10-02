//
//  ViewController.swift
//  slotMachine
//
//  Created by Aluno on 05/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    let image1 = UIImage(named: "slot1.png")
    let image2 = UIImage(named: "slot2.png")
    let image3 = UIImage(named: "slot3.png")
    let image4 = UIImage(named: "slot4.png")
    let image5 = UIImage(named: "slot5.png")
    let image6 = UIImage(named: "slot6.png")
    let image7 = UIImage(named: "slot7.png")
    let image8 = UIImage(named: "slot8.png")
    let image9 = UIImage(named: "slot9.png")

    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var win: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        win.isHidden = true
    }
    
    func showFirstImage(_ view: UIImageView) -> Int {
        let  random = Int.random(in: 1...9)
        switch random {
            case 1:
                view.image = image1
            case 2:
                view.image = image2
            case 3:
                view.image = image3
            case 4:
                view.image = image4
            case 5:
                view.image = image5
            case 6:
                view.image = image6
            case 7:
                view.image = image7
            case 8:
                view.image = image8
            case 9:
                view.image = image9
            default:
                view.image = UIImage()
        }
        return random
    }
    
    func hideImageAfterTime(time: CFTimeInterval , imageView: UIImageView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
          imageView.isHidden = true
        }
      }
    
    @IBAction func draw(_ sender: Any) {
        var one = showFirstImage(firstImage)
        var two = showFirstImage(secondImage)
        var three = showFirstImage(thirdImage)
        
        if one == two && one == three {
            win.isHidden = false
            hideImageAfterTime(time: 2, imageView: win)
        }
    }
}

