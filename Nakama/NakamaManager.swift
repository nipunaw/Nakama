//
//  Nakama.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI

class NakamaManager: ObservableObject {

    @Published var YourNakama: Nakama

    init(name: String, element: Element) {
        YourNakama = Nakama(name: name, element: element)
    }


    // MARK: - Intent(s)

}
