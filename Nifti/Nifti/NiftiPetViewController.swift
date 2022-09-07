//
//  NiftiPetViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/14.
//

import UIKit

let petImageSet = [
    UIImage(named: "boatocean"),
    UIImage(named: "greenmountain"),
    UIImage(named: "wanakatree"),
    UIImage(named: "lakemountain"),
    UIImage(named: "rock"),
    UIImage(named: "antelope"),
    UIImage(named: "foresttrees"),
    UIImage(named: "sprouts"),
    UIImage(named: "redtrees"),
]

class NiftiPetViewController: UIViewController {
    
    let petSquareView: UIView = {
        let petSquare = UIView()
        
        petSquare.frame = CGRect(x: 0, y: 0, width: 280, height: 280)
        petSquare.backgroundColor = .white
        
        petSquare.layer.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 1).cgColor
        petSquare.layer.cornerRadius = 40
        
        // shadow - outside
//        petSquare.layer.borderWidth = 1
//        petSquare.layer.masksToBounds = false
//        petSquare.layer.shadowColor = UIColor.black.cgColor
//        petSquare.layer.shadowOffset = CGSize(width: 0, height: 20)
//        petSquare.layer.shadowOpacity = 0.8
//        petSquare.layer.shadowRadius = 5.0
        
        return petSquare
    }()
    
    let petImageView: UIImageView = {
        let petImage = UIImageView.init(image: UIImage(named: "greenmountain"))
    
        petImage.contentMode = .scaleAspectFit
        petImage.clipsToBounds = true
        petImage.layer.masksToBounds = true
        petImage.layer.cornerRadius = 25
        
//        petImage.layer.masksToBounds = false
//        petImage.layer.shadowColor = UIColor.black.cgColor
//        petImage.layer.shadowOffset = CGSize(width: 0, height: 20)
//        petImage.layer.shadowOpacity = 0.8
//        petImage.layer.shadowRadius = 5.0
        
        return petImage
        
    }()
    
    let usernameLabel: UILabel = {
        let username = UILabel()
        
//        username.frame = CGRect(x: 0, y: 0, width: 137, height: 20)
        username.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        username.font = .boldSystemFont(ofSize: 25)
        username.numberOfLines = 0
        
        username.text = "\(StartViewController.PostValues.nameValue)"
        username.textAlignment = .center
        
        return username
    }()
    
    let commingSoonLabel: UILabel = {
        let commingSoon = UILabel()
        
//        commingSoon.backgroundColor = .red
        commingSoon.textColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 0.8)
        commingSoon.font = .systemFont(ofSize: 15)
        
        commingSoon.text = "Comming Soon"
        commingSoon.textAlignment = .center
        
        return commingSoon
    }()
    
    let connectToApps: UIView = {
        let connect = UIView()
        
        connect.frame = CGRect(x: 0, y: 0, width: 280, height: 250)
        connect.backgroundColor = .white
//        connect.layer.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 0.9).cgColor
        connect.layer.backgroundColor = UIColor.clear.cgColor
        connect.layer.cornerRadius = 40
        
        return connect
    }()
    
    let petFlowLayout: PetCollectionViewFlowLayout = {
        let layout = PetCollectionViewFlowLayout()
        layout.cellSpacing = 15
        layout.numOfColumns = 1
        return layout
    }()
    
    var dataSource = getPetImages()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.petFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = true
        view.showsVerticalScrollIndicator = false
        view.contentInset = .zero
//        view.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 0.9)
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.register(PetCell.self, forCellWithReuseIdentifier: PetCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setAutoLayouts()
        
    }
    
    func setView() {
        view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
    }
    
    func setAutoLayouts() {
        self.view.addSubview(petSquareView)
        self.view.addSubview(petImageView)
        
        self.view.addSubview(usernameLabel)
        
        self.view.addSubview(connectToApps)
//        self.connectToApps.addSubview(commingSoonLabel)
        self.connectToApps.addSubview(self.collectionView)
        
        petSquareViewAutoLayout()
        petImageViewAutoLayout()
        
        usernameLabelAutoLayout()
        
        connectToAppsAutoLayout()
//        commingSoonLabelAutoLayout()
        collectionViewAutoLayout()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
}

extension NiftiPetViewController {
    func petSquareViewAutoLayout() {
        petSquareView.translatesAutoresizingMaskIntoConstraints = false
        
        let petSquareViewConstraints = [
            // set width & height anchors
            petSquareView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width*0.6),
            petSquareView.heightAnchor.constraint(equalTo: petSquareView.widthAnchor),
            
            // set other anchors
            petSquareView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            petSquareView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.size.height*0.15)
        ]
        
        NSLayoutConstraint.activate(petSquareViewConstraints)
    }
    
    func petImageViewAutoLayout() {
        petImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let petImageViewConstraints = [
            // set width & height anchors
            petImageView.widthAnchor.constraint(equalToConstant: self.petSquareView.frame.size.width*0.6),
            petImageView.heightAnchor.constraint(equalTo: petImageView.widthAnchor),
            
            // set other anchors
            petImageView.centerXAnchor.constraint(equalTo: self.petSquareView.centerXAnchor),
            petImageView.centerYAnchor.constraint(equalTo: self.petSquareView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(petImageViewConstraints)
    }
    
    func usernameLabelAutoLayout() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        usernameLabel.leadingAnchor.constraint(equalTo: self.petSquareView.leadingAnchor).isActive = true
        usernameLabel.trailingAnchor.constraint(equalTo: self.petSquareView.trailingAnchor).isActive = true
        
        // set other anchors
        usernameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: self.petSquareView.bottomAnchor, constant: 20).isActive = true
//        usernameLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func connectToAppsAutoLayout() {
        connectToApps.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        connectToApps.widthAnchor.constraint(equalToConstant: self.petSquareView.frame.size.width).isActive = true
        connectToApps.heightAnchor.constraint(equalToConstant: self.view.frame.size.height * 0.3).isActive = true
        
        // set other anchors
        connectToApps.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        connectToApps.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.petSquareView.frame.size.height * 0.1).isActive = true
//        connectToApps.topAnchor.
    }
    
    func commingSoonLabelAutoLayout() {
        commingSoonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let commingSoonLabelConstraints = [
            // set width & height anchors
            commingSoonLabel.widthAnchor.constraint(equalToConstant: self.connectToApps.frame.size.width * 0.8),
            commingSoonLabel.heightAnchor.constraint(equalToConstant: self.connectToApps.frame.size.height * 0.2),
            
            // set other anchors
            commingSoonLabel.centerXAnchor.constraint(equalTo: self.connectToApps.centerXAnchor),
            commingSoonLabel.centerYAnchor.constraint(equalTo: self.connectToApps.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(commingSoonLabelConstraints)
    }
    
    func collectionViewAutoLayout() {
        NSLayoutConstraint.activate([
            self.collectionView.leadingAnchor.constraint(equalTo: self.connectToApps.leadingAnchor, constant: 10),
            self.collectionView.trailingAnchor.constraint(equalTo: self.connectToApps.trailingAnchor, constant: -10),
            self.collectionView.heightAnchor.constraint(equalToConstant: self.connectToApps.frame.size.height*0.3),
            self.collectionView.centerYAnchor.constraint(equalTo: self.connectToApps.centerYAnchor),
        ])
        
        
    }
}

extension NiftiPetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetCell.identifier, for: indexPath) as! PetCell
        cell.prepare(image: self.dataSource[indexPath.item])
        return cell
    }
}

extension NiftiPetViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? PetCollectionViewFlowLayout, flowLayout.numOfColumns > 0 else { fatalError() }
        
//        let widthOfCells = collectionView.bounds.width - (collectionView.contentInset.left + collectionView.contentInset.right)
        let widthOfCells = collectionView.bounds.height
        let widthOfSpacing = CGFloat(flowLayout.numOfColumns - 1) * flowLayout.cellSpacing
        let width = (widthOfCells - widthOfSpacing) / CGFloat(flowLayout.numOfColumns)
        
        return CGSize(width: width, height: width * flowLayout.ratioHeighttoWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        petImageView.image = dataSource[indexPath.item]
    }
}

func getPetImages() -> [UIImage?] {
    petImageSet
}
