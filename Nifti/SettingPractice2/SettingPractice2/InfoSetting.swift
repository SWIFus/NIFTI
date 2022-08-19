//
//  InfoSetting.swift
//  SettingPractice2
//
//  Created by BoMin on 2022/08/20.
//

import UIKit

enum CellType: String {
    case aciton
    case disclosure
    case `switch`
    case checkmark
}

class InfoSettingItem {
    init(type: CellType, title: String, on: Bool = false) {
        self.type = type
        self.title = title
        self.on = on
    }
    
    let type: CellType
    let title: String
    var on: Bool
}

class InfoSettingSection {
    init(items: [InfoSettingItem], header: String? = nil) {
        self.items = items
        self.header = header
    }
    
    let items: [InfoSettingItem]
    var header: String?
    
    static func generateData() -> [InfoSettingSection] {
        return [
            InfoSettingSection(items: [
                InfoSettingItem(type: .checkmark, title: "안녕", on: false),
                InfoSettingItem(type: .checkmark, title: "하세요", on: false),
                InfoSettingItem(type: .checkmark, title: "저는", on: false),
                InfoSettingItem(type: .checkmark, title: "동물의 숲을 합니다", on: false)
            ], header: "동물의 숲"),
            
            InfoSettingSection(items: [
                InfoSettingItem(type: .checkmark, title: "안녕", on: false),
                InfoSettingItem(type: .checkmark, title: "하세요", on: false),
                InfoSettingItem(type: .checkmark, title: "저는", on: false),
                InfoSettingItem(type: .checkmark, title: "별의 커비를 합니다", on: false)
            ], header: "별의 커비"),
            
            InfoSettingSection(items: [
                InfoSettingItem(type: .checkmark, title: "안녕", on: false),
                InfoSettingItem(type: .checkmark, title: "하세요", on: false),
                InfoSettingItem(type: .checkmark, title: "저는", on: false),
                InfoSettingItem(type: .checkmark, title: "발로란트를 합니다", on: false)
            ], header: "발로란트")
        ]
    }
}
