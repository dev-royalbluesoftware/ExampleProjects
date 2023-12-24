//
//
// BC-YouAreAwesome
// ViewController.swift
//
// Created by jjbuell-dev
// Royal Blue Software
// 


import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView0: UIImageView!
    
    // MARK: - Properties
    
    let messagesArray = ["You Are Awesome!", "You Are Great!", "You Are Fantastic!", "You Are A Genius!", "Glad, You Are Here!", "You Can Do It!", "Thanks for Being You!", "You Are Magnificent!", "You Are Fabulous!", "You Are Amazing!"]
    
    let imagesArray = [UIImage(named: "image0"), UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3"), UIImage(named: "image4"), UIImage(named: "image5"), UIImage(named: "image6"), UIImage(named: "image7"), UIImage(named: "image8"), UIImage(named: "image9")]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.isHidden = true
    }
    
    // MARK: - Actions
    
    @IBAction func showMessageButtonPressed(_ sender: UIButton) {
        messageLabel.isHidden = false
        messageLabel.text = messagesArray.randomElement()
        imageView0.image = imagesArray.randomElement()!
    }
    
    @IBAction func showAnotherMessageButtonPressed(_ sender: UIButton) {
        messageLabel.isHidden = false
        messageLabel.text = messagesArray.randomElement()
        imageView0.image = imagesArray.randomElement()!
    }
}
