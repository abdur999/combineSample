//
//  RemoveDuplicates.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

func removeDuplicates() {
    var subscriptions = Set<AnyCancellable>()
    let words = "hey hey there! want to listen to mister mister ?"
                      .components(separatedBy: " ")
                      .publisher
      // 2
      words
        .removeDuplicates()
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
}

