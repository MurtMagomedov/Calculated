//
//  MainViewModel.swift
//  Calculated
//
//  Created by Муртазали Магомедов on 22.07.2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    //MARK: Property
    @Published var value = "0"
    @Published var number: Double = 0
    @Published var currentOperation: Operation = .none
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .night, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal , .equal]
    ]
    //MARK: Tab Button Method
    func didTap(item: Buttons) {
        let currentValue = Double(value.replacingOccurrences(of: ",", with: ".")) ?? 0
        switch item {
        case .plus, .minus, .multiple, .divide:
            currentOperation = item.buttonOperation()
            number = currentValue
            value = "0"
        case .equal:
            value = formatResult(performOperation(currentValue))
        case .decimal:
            if !value.contains(",") {
                value += ","
            }
        case .percent:
            value = formatResult(currentValue / 100)
        case .negative:
            value = formatResult(-currentValue)
        case .clear:
            value = "0"
        default:
            if value == "0" {
                value = item.rawValue
            } else {
                value += item.rawValue
            }
        }
    }
    
    //MARK: Helper Calculate Method
    func performOperation(_ currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
            return (number + currentValue)
        case .multiply:
            return number * currentValue
        case .subtract:
            return number - currentValue
        case .divide:
            return number / currentValue
        case .none:
            return currentValue
        }
    }
    
//    func formatValue() {
//        self.value.append(" ")
//  
//    }
    
    func limitedValue() -> String {
            if value.count > 9 {
                return String(value.removeLast())
            }
            return value
        }
    
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result).replacingOccurrences(of: ".", with: ",")
    }
    
    //MARK: Size of Buttons Methods
    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let zeroTotalSpacing: CGFloat = 5 * spacing
        let totalSpacing: CGFloat = 4 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        if item == .zero {
            return (screenWidth - zeroTotalSpacing) / totalColumns * 2 + 20
        }
        return (screenWidth - totalSpacing) / totalColumns
    }
    
    func buttonHeidth() -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 4 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColumns
    }

}
