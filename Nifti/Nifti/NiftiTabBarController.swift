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

        UITabBar.appearance().barTintColor = .blue
        
        let niftiQrVC = NiftiQrViewController()
        let niftiPetVC = NiftiPetViewController()
        let niftiScanVC = NiftiScanViewController()
        
        niftiQrVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        niftiPetVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "multiply.circle"), selectedImage: UIImage(systemName: "multiply.circle.fill"))
        niftiScanVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "qrScan.png"), selectedImage: UIImage(systemName: "circle.fill"))
        
        self.viewControllers = [niftiQrVC, niftiPetVC, niftiScanVC]
    }

}

