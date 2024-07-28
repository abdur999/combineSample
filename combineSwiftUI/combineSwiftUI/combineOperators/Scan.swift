//
//  Scan.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import Foundation
import Combine

func scan() {
    Timer.publish(every: 1, on: .main, in: .default)
        .autoconnect()
        .scan((prev:Optional<Date>.none, now:Optional<Date>.none)) {
            (prev:$0.now, now:$1)
        }
        .map { (prev:$0.prev, now:$0.now!)
            print($0.prev ?? "")
            print($0.now ?? "")
        }
}
