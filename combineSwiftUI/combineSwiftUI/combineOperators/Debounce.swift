//
//  Debounce.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

/*
 
 It waits for a specific period from the emission of the last value before emitting the last value received.
 
 For example, we are implementing search in our app and we only want to fire a search query if the user does not type for 500ms, otherwise, we may have too many unwanted query call continuously along with the user type any single character in the search box.

 So, we can do this as given in the following example,
 
 Here, some indexes are waiting until the debounce period ends and after its completion, they again start publishing the index.
 
 */
func debounce() {
    var subscriptions = Set<AnyCancellable>()
    let bounces: [(Int, TimeInterval)] = [
        (0, 0),
        (1, 0.25),  // 0.25s interval since last index
        (2, 1),     // 0.75s interval since last index
        (3, 1.25),  // 0.25s interval since last index
        (4, 1.5),   // 0.25s interval since last index
        (5, 2)      // 0.5s interval since last index
    ]

    let subject = PassthroughSubject<Int, Never>()
    subject
        .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    for bounce in bounces {
        DispatchQueue.main.asyncAfter(deadline: .now() + bounce.1) {
            subject.send(bounce.0)
        }
    }

}

/*
 
 Output:
 1
 4
 5
 
 */
