//
//
// GHFollowers
// FollowerListVC.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
//


import UIKit

class FollowerListVC: UIViewController {
    
    // MARK: - CollectionView Properties
    
    enum Section { case main } // UICollectionView Section (only 1 section) needed for Diffable DataSource
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    // MARK: - Properties
    
    var username: String!
    var followers: [Follower] = []
    var page = 1
    var hasMoreFollowers = true
    var isSearching = false
    var isLoadingMoreFollowers = false
    
    // MARK: - Initializers
    
    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.username = username
        title = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureCollectionView()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Get Followers Network Call
    
    func getFollowers(username: String, page: Int) {
        NetworkManager.sharedInstance.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let followers):
                self.followers.append(contentsOf: followers)
//                self.updateData()
                
            case .failure(let error):
                self.presentGFAlert(title: "Stuff Happened", message: error.localizedDescription, buttonTitle: "Ok")
            }
        }
    }
    
    
    // MARK: - Configure ViewController
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - CollectionView Configuration
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
    }
    
    // MARK: - CollectionView Data Source
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseID, for: indexPath) as? FollowerCollectionViewCell else { return UICollectionViewCell() }
            cell.set(follower: follower)
            return cell
        })
    }
    
    // UICollectionView Snapshot Function
    func updateData(on followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}

// MARK: - Extension UICollectionView Delegate

extension FollowerListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            //            guard hasMoreFollowers, !isLoadingMoreFollowers else { return }
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
