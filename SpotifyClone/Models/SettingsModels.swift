//
//  SettingsModels.swift
//  SpotifyClone
//
//  Created by Zeynep Özdemir Açıkgöz on 11.05.2023.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}
struct Option {
    let title: String
    //içine veri alan ve hiçbirşey döndürmeyen bir kapanış
    let handler: () -> Void
}
