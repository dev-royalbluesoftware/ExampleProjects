//
//
// GHFollowers
// FollowerCollectionViewCell.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseID = "FollowerCollectionViewCell"
    
    // MARK: - UI Properties
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarURL)
    }
    
    // MARK: - Setup UI Functions
    
    private func configureCell() {
        addSubViews(avatarImageView, usernameLabel)
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
