//
//  Sequences.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

var subscriptions1 = Set<AnyCancellable>()
func getFirst() {
    let numbers = (1...9).publisher
     
     // 2
     numbers
       .first(where: { $0 % 2 == 0 })
       .sink(receiveCompletion: { print("Completed with: \($0)") },
             receiveValue: { print($0) })
       .store(in: &subscriptions1)
}

func getLast() {
    let numbers = (1...9).publisher
      
      
      numbers
        .last(where: { $0 % 2 == 0 })
        .sink(receiveCompletion: { print("Completed with: \($0)") },
              receiveValue: { print($0) })
        .store(in: &subscriptions1)
}

func getLastWhere() {
    let numbers = PassthroughSubject<Int, Never>()
      
      numbers
        .last(where: { $0 % 2 == 0 })
        .sink(receiveCompletion: { print("Completed with: \($0)") },
              receiveValue: { print($0) })
        .store(in: &subscriptions1)
      
      numbers.send(1)
      numbers.send(2)
      numbers.send(3)
      numbers.send(4)
      numbers.send(5)
}
func dropValues() {
    let numbers = (1...10).publisher
      
      // 2
      numbers
        .dropFirst(8)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions1)
}

func dropValuesUntil() {
    let isReady = PassthroughSubject<Void, Never>()
      let taps = PassthroughSubject<Int, Never>()
      
      // 2
      taps
        .drop(untilOutputFrom: isReady)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions1)
      
      // 3
      (1...5).forEach { n in
        taps.send(n)
        
        if n == 3 {
          isReady.send()
        }
      }
}
