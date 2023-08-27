//
//  Nakama.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI
import Observation

@Observable class NakamaManager {

    var YourNakama: Nakama

    init(name: String, element: Element) {
        YourNakama = Nakama(name: name, element: element)
    }


    // MARK: - Intent(s)
    
    func color() -> UIColor {
        if YourNakama.element == Element.fire { return .red }
        else if YourNakama.element == Element.earth { return .green }
        else { return .blue }
    }
}
