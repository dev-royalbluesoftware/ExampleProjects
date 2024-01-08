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
    
    let cache = NetworkManager.sharedInstance.cache
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
    
    // MARK: - Download Image (Network Call)
    
    func downloadImage(from urlString: String) {
        // cache images
        let cacheKey = NSString(string: urlString)
        /*
         Check cache, if image is in cache
         use that image and return
         */
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return } // download image
            cache.setObject(image, forKey: cacheKey) // set image to cache
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
