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
        NavigationStack {
            List (model) { model in
                
             NavigationLink(destination: DoctorView(doctor: model), label: {
                 HStack {
                     AsyncImage(url: model.avatar)
                     { image in image.resizable()
                         .aspectRatio(contentMode: .fit) }
                 placeholder: {
                     ProgressView()
                 }
                 .frame(width: 50, height: 50)
                 .cornerRadius(100)
                     Text(model.firstName)
                     Text(model.patronymic)
                 }
             })
            }
            .onAppear{
                viewModel.downloadDoctors{ (model)
                    in
                    self.model = model
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
