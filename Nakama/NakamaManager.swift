//
//  Nakama.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI

class NakamaManager: ObservableObject {

    @Published private var YourNakama: Nakama

    init(name: String, type: Type) {
        YourNakama = Nakama(name: name, type: type)
    }


    // MARK: - Intent(s)

}
