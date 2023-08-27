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
    var summoned: Bool

    init() {
        YourNakama = Nakama()
        summoned = false
    }

    // MARK: - Intent(s)
    
    func chooseName(_ pickedName: String) {
        YourNakama.chooseName(pickedName)
    }
    
    func chooseElement(_ pickedElement: Element) {
        YourNakama.chooseElement(pickedElement)
    }
    
    func color() -> UIColor {
        if YourNakama.element == Element.fire { return .red }
        else if YourNakama.element == Element.earth { return .green }
        else { return .blue }
    }
}
