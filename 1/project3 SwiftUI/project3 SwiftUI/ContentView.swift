//
//  ContentView.swift
//  project3 SwiftUI
//
//  Created by хех on 24.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink("Перейти", destination: NewsView())
        }
        
    }
}

#Preview {
    ContentView()
}
