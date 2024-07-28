//
//  IgnoreOutput.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

func ignoreOutput() {
    var subscriptions = Set<AnyCancellable>()
      // 1
      let numbers = (1...10_000).publisher
      
      // 2
      numbers
        .ignoreOutput()
        .sink(receiveCompletion: { print("Completed with: \($0)") },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
    

}
