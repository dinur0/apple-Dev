//
//  ContentView.swift
//  Medicine
//
//  Created by хех on 01.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var model: [Doctor] = []
    var viewModel = DoctorsView()
    
    var body: some View {
        List (model) { model in
            VStack {
                Text(model.firstName)
                Text("dfhdh")
            }
        }
        .onAppear{
            viewModel.downloadDoctors{ (model)
                in
                self.model = model
            }
        }
        
    }
}

#Preview {
    ContentView()
}
