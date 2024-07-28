//
//  MergeWith.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine
/*

 merge(with:)

 This operator combines two Publishers as if we’re receiving values from just one.
 
 As shown here, we can see that all values print as a single-stream publisher.

 Note: Here, it requires that both publishers must be of the same type.
 
 */

func mergeWith() {
    var subscriptions = Set<AnyCancellable>()
    let stringSubject1 = PassthroughSubject<String, Never>()
    let stringSubject2 = PassthroughSubject<String, Never>()
    stringSubject1
        .merge(with: stringSubject2)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    stringSubject1.send("Hello")
    stringSubject2.send("World")
    stringSubject2.send("Good")
    stringSubject1.send("Morning")

}
