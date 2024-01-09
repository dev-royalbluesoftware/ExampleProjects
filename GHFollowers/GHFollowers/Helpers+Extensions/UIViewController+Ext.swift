//
//
// GHFollowers
// UIViewController+Ext.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import UIKit

fileprivate var containerView: UIView! // anything can use this variable

extension UIViewController {
    
    // MARK: - Present GFAlert
    
    func presentGFAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        
        present(alertVC, animated: true)
    }
}
