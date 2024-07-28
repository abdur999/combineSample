//
//  Prepend.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine
/*
 Prepend
 
 This operator prepends or adds values at the beginning of your original publisher.
 
 Here, the result must be the same type as the items i.e if you have the publisher of Integer, you can not get String as a result.

 Similarly, we have the Append operator which works the same as Prepend with the difference that it appends values after the original publisher.
 */
func usePrepend() {
var subscriptions = Set<AnyCancellable>()
let publisher = [5, 6].publisher
    publisher.prepend(3,4)
        .sink(receiveValue: {
            print($0)
        })
        .store(in: &subscriptions)    
}

