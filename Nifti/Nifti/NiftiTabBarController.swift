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
        let niftiSettingsVC = NiftiSettingsViewController()
        
        niftiQrVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "nifti-home"), selectedImage: UIImage(named: "nifti-home-fill"))
        niftiPetVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "info"), selectedImage: UIImage(named: "info-fill"))
        niftiScanVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "qrScan"), selectedImage: UIImage(named: "qrScan-fill"))
        niftiFriendVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "friends"), selectedImage: UIImage(named: "friends-fill"))
        niftiSettingsVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings-fill"))
        
        
        self.viewControllers = [niftiQrVC, niftiScanVC, niftiPetVC, niftiFriendVC, niftiSettingsVC]
    }

}

