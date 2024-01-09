//
//
// GHFollowers
// UserInfoVC.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import UIKit

class UserInfoVC: UIViewController {

    // MARK: - UI Properties
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    let itemViews: [UIView] = []
    
    // MARK: - Properties
    
    var username: String!  // landing pad
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureScrollView()
    }
    
    // MARK: - Button Actions
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    // MARK: - Setup ViewController
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    // MARK: - Setup ScrollView
    
    private func configureScrollView() {
        
    }
}
