//
//  settingsModel.swift
//  Study Timer
//
//  Created by Ferdi DEMİRCİ on 28.06.2022.
//

import Foundation

class settingsModel {
    var settingTitle: String?
    var settingName: [String]
    init(settingTitle: String, settingName: [String]) {
        self.settingTitle = settingTitle
        self.settingName = settingName
    }
}
