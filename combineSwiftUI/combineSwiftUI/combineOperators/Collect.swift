//
//  Collect.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

/*
 
 It is a powerful operator that allows us to receive all items at once from a publisher. It collects all received elements and emits a single array of the collection when the upstream publisher finishes.
 
 Here, we can see that publisher values are displayed as a single element.

 Note: If we don’t use .collect() operator here then it will simply print as a separate element in a new line instead of a single array.


 
 */

func collect() {
    var subscriptions = Set<AnyCancellable>()
    [1, 2, 3, 4].publisher
        .collect()
        .sink { (output) in
            print(output)
        }.store(in: &subscriptions)
    
}

/*
 
 Output:
 [1, 2, 3, 4]
 
 */
