//
//  Zip.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

/*
 
 It works similarly to the .combineLatest but in this case, it emits a tuple of paired values in the same indexes only after each publisher has emitted a value at the current index.
 Let’s understand it with an example.
 
 As shown here, only two zipped items are emitted from the resulting publisher as subject1 has only 3 items. That’s why the Awesome value is not printed, because there’s no item to pair it with in subject1.
 
 */

func zip() {
    var subscriptions = Set<AnyCancellable>()
    let subject1 = PassthroughSubject<String, Never>()
    let subject2 = PassthroughSubject<String, Never>()

    subject1
        .zip(subject2)
        .sink(receiveValue: { (string1, string2) in
            print("String1: \(string1), String2: \(string2)")
        })
        .store(in: &subscriptions)
    subject1.send("Hello")
    subject1.send("World")
    subject2.send("Nice")
    subject1.send("Cool")
    subject2.send("Rock")
    subject2.send("Cool")
    subject2.send("Awesome")

}

/*
 Output:
 String1: Hello, String2: Nice
 String1: World, String2: Rock
 String1: Cool, String2: Cool
 */
