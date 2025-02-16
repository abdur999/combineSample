//
//  ContentView.swift
//  combineSwiftUI
//
//  Created by Abdur Rahim on 28/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var showStuff = false
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Toggle(isOn: $showStuff) {
              
            }
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
      ContentView()
}
