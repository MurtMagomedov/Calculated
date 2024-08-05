//
//  Extension.swift
//  Calculated
//
//  Created by Муртазали Магомедов on 22.07.2024.
//

import SwiftUI

extension Color {
    static let darkGrayColor = Color("darkGrayColor")
    static let grayColor = Color("grayColor")
    static let orangeColor = Color("orangeColor")
}

extension Buttons {
    func buttonOperation() -> Operation {
        switch self {
        case .minus:
            return .subtract
        case .divide:
            return .divide
        case .multiple:
            return .multiply
        case .plus:
            return .addition
        default:
            return .none
        }
    }
}
