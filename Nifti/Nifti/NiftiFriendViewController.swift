//
//  NiftiFriendViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/15.
//

import UIKit

class NiftiFriendViewController: UIViewController {
    let friendsFlowLayout: FriendsCollectionViewFlowLayout = {
        let layout = FriendsCollectionViewFlowLayout()
        layout.cellSpacing = 15
        layout.numOfColumns = 3
        
        return layout
    }()
    
    var dataSource = getSampleImages()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.friendsFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        view.clipsToBounds = true
        view.register(FriendsCell.self, forCellWithReuseIdentifier: "FriendsCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
        self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
        self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
}

extension NiftiFriendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsCell.id, for: indexPath) as! FriendsCell
        cell.prepare(image: self.dataSource[indexPath.item])
        return cell
    }
}

extension NiftiFriendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? FriendsCollectionViewFlowLayout, flowLayout.numOfColumns > 0 else { fatalError() }
        
        let widthOfCells = collectionView.bounds.width - (collectionView.contentInset.left + collectionView.contentInset.right)
        let widthOfSpacing = CGFloat(flowLayout.numOfColumns - 1) * flowLayout.cellSpacing
        let width = (widthOfCells - widthOfSpacing) / CGFloat(flowLayout.numOfColumns)
        
        return CGSize(width: width, height: width * flowLayout.ratioHeighttoWidth)
    }
}

func getSampleImages() -> [UIImage?] {
    (1...100).map { _ in return UIImage(named: "dog")}
}
