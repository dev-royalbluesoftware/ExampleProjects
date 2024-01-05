//
//
// GHFollowers
// GFTextField.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import UIKit

class GFTextField: UITextField {
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure TextField
    
    private func configureTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        
        // layer configuration
        layer.cornerRadius = 12
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        // text configuration
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        // textField configuration
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
        placeholder = "Enter a username..."
    }
}
