//
//  Throttle.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

/*
 
 Throttle works similar to Debounce, but it waits for the specified interval repeatedly, and at the end of each interval, it will emit either the first or the last of the values depending on what is passed for its latest parameter.
 In short, throttle does not pause after receiving values.

 Let’s understand it with an example.
 
 Here, values of index 2, 3, and 4 are emitted in the given interval, so it took the very first emitted value from three of them which is 2, and then took the next value which is of the next interval.

 After each given interval, throttle sends the first value it received during that interval.
 
 */

func throttle() {
    var subscriptions = Set<AnyCancellable>()
    let bounces: [(Int, TimeInterval)] = [
        (0, 0), (1, 1), (2, 1.1), (3, 1.2), (4, 1.3), (5, 2)
    ]

    let subject = PassthroughSubject<Int, Never>()
    subject
        .throttle(for: .seconds(0.5), scheduler: RunLoop.main, latest: false)
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
 0
 1
 2
 5
 
 */
