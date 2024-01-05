//
//
// GHFollowers
// UIView+Ext.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import UIKit

extension UIView {
    
    // add multiple views
    func addSubViews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
