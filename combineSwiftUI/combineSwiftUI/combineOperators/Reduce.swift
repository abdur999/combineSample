//
//  Reduce.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

/*
 
 This operator iteratively accumulates a new value based on the emissions of the upstream publisher.
 
 It returns the publisher that applies the closure to all received elements and produces an accumulated value when the upstream publisher finishes.

 Let’s understand it with an example.
 
 Here we can see that it reduces the separate array elements in a single element by prepending all values.
 
 */

func reduce() {
    var subscriptions = Set<AnyCancellable>()
    let publisher = ["Hello!", " ", "How ", "Are ", "You?"].publisher

    publisher
        .reduce("👋🏻 ", +)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

/*
 
 Output:
 👋🏻 Hello! How Are You?
 
 */
