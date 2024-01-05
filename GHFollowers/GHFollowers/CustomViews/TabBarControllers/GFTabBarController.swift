//
//
// GHFollowers
// GFTabBarController.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import UIKit

class GFTabBarController: UITabBarController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        
        viewControllers = [createSearchNC(), createFavoritesListNC()]
    }
    
    // MARK: - TabBar Controllers
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesListNC() -> UINavigationController {
        let favoritesListVC = FavoritesListVC()
        favoritesListVC.title = "Favorites"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesListVC)
    }
}


// MARK: - SwiftUI Preview

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct GFTabBarController_Preview: PreviewProvider {
    static var previews: some View {
        GFTabBarController().showPreview()
    }
}
#endif
