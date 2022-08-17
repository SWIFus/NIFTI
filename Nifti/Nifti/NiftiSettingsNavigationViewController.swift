//
//  NiftiSettingsNavigationViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/18.
//

import UIKit

class NiftiSettingsNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navController = UINavigationController(rootViewController: NiftiSettingsViewController()) // Creating a navigation controller with VC1 at the root of the navigation stack.
        self.present(navController, animated:true, completion: nil)
    }
    

}
