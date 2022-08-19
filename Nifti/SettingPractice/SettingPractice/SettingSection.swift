//
//  SettingSection.swift
//  SettingPractice
//
//  Created by BoMin on 2022/08/19.
//

enum SettingSection {
    case security([TitleModel])
    case account([TitleModel])
    case privacy([TitleModel])
}

struct TitleModel {
    let title: String?
}
