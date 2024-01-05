//
//
// GHFollowers
// SearchVC.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import UIKit

class SearchVC: UIViewController {
    
    // MARK: - UI Properties
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(color: .systemGreen, title: "Get Followers", systemImageName: "person.3")
    
    // MARK: - Properties
    
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubViews(logoImageView, usernameTextField, callToActionButton)
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Button Actions
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            return
        }
        
        usernameTextField.resignFirstResponder()
    }
    
    // MARK: - UI Setup Functions
    
    func setupUI() {
        configureLogoImageView()
        configureUsernameTextField()
        configureCallToActionButton()
    }
    
    func configureLogoImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = Images.ghLogo
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureUsernameTextField() {
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton() {
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            callToActionButton.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Extension UITextField Delegate

extension SearchVC: UITextFieldDelegate {
    
}



// MARK: - SwiftUI Preview

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SearchVC_Preview: PreviewProvider {
    static var previews: some View {
        SearchVC().showPreview()
    }
}
#endif
