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
 
    // MARK: - UI Properties
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 31, weight: .bold)
        label.textColor = .systemBlue
        return label
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 38
        return stackView
    }()
    
    let showMessageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemIndigo, for: .normal)
        button.setTitle("Show Message", for: .normal)
        
        return button
    }()
    
    let showAnotherMessageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemIndigo, for: .normal)
        button.setTitle("Show Another Message", for: .normal)
        
        return button
    }()
    
    let imageView0: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Properties
    
    let messagesArray = ["You Are Awesome!", "You Are Great!", "You Are Fantastic!", "You Are A Genius!", "Glad, You Are Here!", "You Can Do It!", "Thanks for Being You!", "You Are Magnificent!", "You Are Fabulous!", "You Are Amazing!"]
    
    let imagesArray = [UIImage(named: "image0"), UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3"), UIImage(named: "image4"), UIImage(named: "image5"), UIImage(named: "image6"), UIImage(named: "image7"), UIImage(named: "image8"), UIImage(named: "image9")]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        messageLabel.isHidden = true
        setupViews()
        buttonTargetActions()
    }
    
    // MARK: - Helper Functions
    
    private func buttonTargetActions() {
        showMessageButton.addTarget(self, action: #selector(showMessageButtonPressed), for: .touchUpInside)
        showAnotherMessageButton.addTarget(self, action: #selector(showAnotherMessageButtonPressed), for: .touchUpInside)
    }
    
    @objc func showMessageButtonPressed() {
        messageLabel.isHidden = false
        messageLabel.text = messagesArray.randomElement()
        imageView0.image = imagesArray.randomElement()!
    }
    
    @objc func showAnotherMessageButtonPressed() {
        messageLabel.isHidden = false
        messageLabel.text = messagesArray.randomElement()
        imageView0.image = imagesArray.randomElement()!
    }
    
    // MARK: - UI Functions
    
    private func setupViews() {
        view.addSubview(messageLabel)
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(showMessageButton)
        horizontalStackView.addArrangedSubview(showAnotherMessageButton)
        view.addSubview(imageView0)
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),
            
            horizontalStackView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            horizontalStackView.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor),
            
            imageView0.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 16),
            imageView0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            imageView0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
        ])
    }
}
