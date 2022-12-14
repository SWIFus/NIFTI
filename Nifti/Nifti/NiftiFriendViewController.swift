//
//  NiftiFriendViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/15.
//

import UIKit

let friendsImageSet = [
    UIImage(named: "boatocean"),
    UIImage(named: "greenmountain"),
    UIImage(named: "lakemountain"),
    UIImage(named: "rock"),
]

let friendsNameSet = [
    "zett3",
    "chamber",
    "xdon_mo",
    "rwksmz"
]

let friendsLabel: UILabel = {
    let friends = UILabel()
    
    friends.text = "Friends"
    friends.textColor = .white
    friends.font = .boldSystemFont(ofSize: 30)
    
    return friends
}()



class NiftiFriendViewController: UIViewController {
    let friendsFlowLayout: FriendsCollectionViewFlowLayout = {
        let layout = FriendsCollectionViewFlowLayout()
        layout.cellSpacing = 15
        layout.numOfColumns = 3
        
        return layout
    }()
    
    var imageSource = getFriendImages()
    var nameSource = getFriendNames()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.friendsFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        view.clipsToBounds = true
        view.register(FriendsCell.self, forCellWithReuseIdentifier: FriendsCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        
        self.view.addSubview(self.collectionView)
        self.view.addSubview(friendsLabel)
        friendsLabelAutoLayout()
        collectionViewAutoLayout()
    }
    
    func collectionViewAutoLayout() {
        NSLayoutConstraint.activate([
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10),
        ])
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func friendsLabelAutoLayout() {
        friendsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            friendsLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            friendsLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            friendsLabel.bottomAnchor.constraint(equalTo: self.collectionView.topAnchor)
        ])
    }
    
}

extension NiftiFriendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.imageSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsCell.identifier, for: indexPath) as! FriendsCell
        cell.prepare(image: self.imageSource[indexPath.item], name: self.nameSource[indexPath.item])
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

func getFriendImages() -> [UIImage?] {
    friendsImageSet
}

func getFriendNames() -> [String] {
    friendsNameSet
}
