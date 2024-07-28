//
//  CombineLatest.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

/*
 
 It combines different publishers of different value types. The emitted output is a tuple with the latest values of all publishers whenever any of them emit a value.
 
 Before .combineLatest emits something, each publisher must emit at least a value.

 Let’s understand it with an example.
 
 As shown here, the original publisher combines with the latest value of another publisher and makes combinations accordingly.

 Consider a real-world example where we have a phone number and country name UITextFields and a button to allow us to go ahead with the process. We want to disable that button until we have enough digits of a phone number and the correct country. We can easily achieve this by using the .combineLatest operator.
 
 */
func combineLatest() {
    var subscriptions = Set<AnyCancellable>()
    let subject1 = PassthroughSubject<Int, Never>()
    let subject2 = PassthroughSubject<String, Never>()

    subject1
        .combineLatest(subject2)
        .sink(receiveValue: { print("\($0) = \($1)") })
        .store(in: &subscriptions)
    subject1.send(1)
    subject1.send(2)
    subject2.send("A")
    subject2.send("B")
    subject1.send(3)
    subject2.send("C")
}
