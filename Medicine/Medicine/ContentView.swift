

import SwiftUI

struct ContentView: View {
    
    @State var model: [Doctor] = []
    var viewModel = DoctorsViewModel()
    
    var body: some View {
        NavigationStack {
            List(model) { doctor in
                NavigationLink(destination: DoctorView(doctor: doctor), label: {
                    VStack(alignment: .leading) {
                        AsyncImage(url: doctor.avatar) { phase in
                            switch phase {
                            case .empty:
                                Image(systemName: "person.crop.circle.badge.exclamationmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50.0, height: 50.0)
                                    .imageScale(.large)

                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(25)

                            case .failure:
                                Image(systemName: "person.crop.circle.badge.exclamationmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(25)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)

                        
                        Text(doctor.firstName + " " + doctor.lastName + " " + doctor.patronymic)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                                            
                        ForEach(doctor.specializations) { specialization in
                            Text(specialization.name)
                                .font(.subheadline)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.736))
                        }
                    }
                })
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Врачи")
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                }
            }
            .onAppear{
                viewModel.downloadDoctors { downloadedDoctors in
                    self.model = downloadedDoctors
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
