//
//  SwitchToLatest.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine


/*
 switchToLatest

 It is a more powerful and complex operator as it switches the entire publisher subscriptions stream along with canceling the pending publisher subscription to the latest one as a single stream.
 
 What happens is that each time you send a publisher through publishers, you switch to the new one and cancel the previous subscription.

 Consider a real-world example where we have a search text field that is used to detect if an item is available. Once the user inputs something, we want to trigger a request. Our goal is to cancel the previous request if the user has inputted a new value. This can be done with the help of .switchToLatest
 
 */
func switchTolatest() {
    var subscriptions = Set<AnyCancellable>()
    let subject1 = PassthroughSubject<Int, Never>()
    let subject2 = PassthroughSubject<Int, Never>()
    let subject3 = PassthroughSubject<Int, Never>()
    let subjects = PassthroughSubject<PassthroughSubject<Int, Never>, Never>()

    subjects.switchToLatest()
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
            
    subjects.send(subject1)
    subject1.send(1)
    subjects.send(subject2)
    subject1.send(2)
    subject2.send(3)
    subject2.send(4)
    subjects.send(subject3)
    subject2.send(5)
    subject2.send(6)
    subject3.send(7)
}

