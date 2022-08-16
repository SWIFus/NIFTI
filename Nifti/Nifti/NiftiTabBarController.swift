//
//  NiftiTabBarController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/14.
//

import UIKit

class NiftiTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundColor =  UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        UITabBar.appearance().barTintColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        UITabBar.appearance().isTranslucent = false
        
        
        let niftiQrVC = NiftiQrViewController()
        let niftiPetVC = NiftiPetViewController()
        let niftiScanVC = NiftiScanViewController()
        let niftiFriendVC = NiftiFriendViewController()
        
        niftiQrVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "nifti-home.png"), selectedImage: UIImage(named: "nifti-home-fill.png"))
        niftiPetVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "info.png"), selectedImage: UIImage(named: "info-fill.png"))
        niftiScanVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "qrScan.png"), selectedImage: UIImage(named: "qrScan-fill.png"))
        niftiFriendVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "circle"), selectedImage: UIImage(systemName: "circle-fill"))
        
        
        self.viewControllers = [niftiQrVC, niftiScanVC, niftiPetVC, niftiFriendVC]
    }

}

