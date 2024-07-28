//
//  CompactMap.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

/*
 
 Create a publisher that emits a finite list of strings.
 Use compactMap to attempt to initialize a Float from each individual string. If Float’s initializer doesn’t know how to convert the provided string, it returns nil. Those nil values are automatically filtered out by the compactMap operator.
 Only print strings that have been successfully converted to Floats.
 
 */

func compactMap() {
    var subscriptions = Set<AnyCancellable>()
    let strings = ["a", "1.24", "3",
                     "def", "45", "0.23"].publisher
      
      // 2
      strings
        .compactMap { Float($0) }
        .sink(receiveValue: {
          // 3
          print($0)
        })
        .store(in: &subscriptions)
}
