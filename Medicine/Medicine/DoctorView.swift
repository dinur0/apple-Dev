import SwiftUI

struct DoctorView: View {
    @Environment(\.dismiss) private var dismiss
    var doctor: Doctor
    var body: some View {
        HStack( spacing: 10, content: {
            AsyncImage(url: doctor.avatar)
            { image in image.resizable()
                .aspectRatio(contentMode: .fill) }
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
        .padding()
        
        VStack (alignment: .leading, spacing: 5, content: {
            Label("Категория: \(doctor.category)", systemImage: "cross.case.fill")
            Label("Рейтинг: \(doctor.rank)", systemImage: "star.leadinghalf.fill")
        })
        .frame(minWidth: 20, maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .font(.subheadline)
        .foregroundColor(.secondary)
        
        HStack {
            Text("Стоймость услуг:")
            Spacer()
            Text("От \(doctor.price) ₽")
        }.bold()
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.0, brightness: 0.924)/*@END_MENU_TOKEN@*/))
            .padding()
        
        Text("В запросе JSON не было описания врачей, поэтому я вставил сюда такой текст.\nВ запросе JSON не было описания врачей, поэтому я вставил сюда такой текст.\nВ запросе JSON не было описания врачей, поэтому я вставил сюда такой текст")
        
        Spacer()
        Button("Записаться", action: {print("Успешная запись к \(doctor.firstName+" "+doctor.patronymic)")})
        
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color(red: 0.967, green: 0.326, blue: 0.485))
            .clipShape(Rectangle())
            .cornerRadius(5)
            .padding()
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            .bold()
        
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                    .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                }
            }
        
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Подробнее")
                        .font(.title)
                        .accessibilityAddTraits(.isHeader)
                        .bold()
                }
            }
    }
}

#Preview {
    ContentView()
}
