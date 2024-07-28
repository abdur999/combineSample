//
//  Map.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

/*
 
 As the name suggests, this operator maps or transforms the elements a publisher emits
 
 It uses a closure to transform each element it receives from the upstream publisher. We can use map(_:) to transform from one kind of element to another.
 
 */
func map() {
    [10, 20, 30]
       .publisher
       .map { $0 * 2 }
       .sink { print($0) }
}

/*
 
 Output:
 20
 40
 60
 
 */
