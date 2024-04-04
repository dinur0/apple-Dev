//
//  DoctorView.swift
//  Medicine
//
//  Created by хех on 02.04.2024.
//

import SwiftUI

struct DoctorView: View {
    
    var doctor: Doctor
    var body: some View {
        HStack( spacing: 10, content: {
            AsyncImage(url: doctor.avatar)
            { image in image.resizable()
                .aspectRatio(contentMode: .fit) }
        placeholder: {
            ProgressView()
        }
        .frame(width: 50, height: 50)
        .cornerRadius(100)
            
            VStack (alignment: .leading, content: {
                Text(doctor.lastName)
                Text(doctor.firstName + " " + doctor.patronymic)
                
            })
            .fontWeight(.semibold)
            Spacer()
        })
        HStack {
            VStack (alignment: .leading, spacing: 5, content: {
                Label("Категория: \(doctor.category)", systemImage: "cross.case.fill")
                Label("Рейтинг: \(doctor.rank)", systemImage: "star.leadinghalf.fill")
            })
            .font(.subheadline)
        .foregroundColor(.secondary)
            Spacer()
        }
        HStack {
            Text("Стоймость услуг:")
            Spacer()//раздвигает в разные стороны
            Text("От \(doctor.price) ₽")
//            Text(doctor.price)
//                .padding(.horizontal)
//                .aspectRatio(contentMode: .fit)
        }
//        .foregroundColor(Color.white)
//        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
        
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.0, brightness: 0.924)/*@END_MENU_TOKEN@*/))
//        .cornerRadius(10)
        .bold()
        Spacer()
//        .overlay(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Overlay Content@*/Text("Placeholder")/*@END_MENU_TOKEN@*/)
//        .contentMargins(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
        
    }
        
}

//struct DoctorView_Preview: PreviewProvider {
//    static var previews: some View{
//        DoctorView(doctor: <#Doctor#>)
//    }
//}
#Preview {
    ContentView()
}
