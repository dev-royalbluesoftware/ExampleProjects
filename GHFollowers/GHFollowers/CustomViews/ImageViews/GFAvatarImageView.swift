//
//
// GHFollowers
// GFAvatarImageView.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
//


import UIKit

class GFAvatarImageView: UIImageView {
    
    // MARK: - UI Properties
    
    let placeHolderImage = Images.placeholder
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure ImageView Functions
    
    private func configureImageView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
    }
}
