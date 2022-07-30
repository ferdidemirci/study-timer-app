//
//  tabBarController.swift
//  Study Timer
//
//  Created by Ferdi DEMİRCİ on 28.06.2022.
//

import UIKit

class tabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.selectedIndex = 2
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.selectedIndex = 2
    }

}
