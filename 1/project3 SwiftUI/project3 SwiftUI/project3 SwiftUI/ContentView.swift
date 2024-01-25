//
//  ContentView.swift
//  project3 SwiftUI
//
//  Created by хех on 24.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink("NewsView", destination: {
                NewsView()
            })
        }
        
    }
}

#Preview {
    ContentView()
}
