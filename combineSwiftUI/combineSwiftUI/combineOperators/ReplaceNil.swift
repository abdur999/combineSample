//
//  ReplaceNil.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

/*
 ReplaceNil
 It replaces nil items with the values we specify.
 
 As a result, we can see that the nil value is replaced with the given number 5.

 An important difference between ?? and replaceNil(with:) is that the former can return another optional, while the latter can’t.
 
 */
func replaceNil() {
    var subscriptions = Set<AnyCancellable>()
    [1, 2, nil, 6].publisher
        .replaceNil(with: 5)
        .sink(receiveValue: { print($0!) })
        .store(in: &subscriptions)
}


