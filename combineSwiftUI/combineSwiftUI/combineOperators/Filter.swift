//
//  Filter.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

func filter() {
    var subscriptions = Set<AnyCancellable>()
    let numbers = (1...10).publisher
    let filteredNumbers = numbers
        .filter { $0 % 2 == 0 }
        .sink { print($0) } 
        .store(in: &subscriptions)
    print("\n Filtered Numbers \(filteredNumbers)")
}
