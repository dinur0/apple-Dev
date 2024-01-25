import SwiftUI

struct NewsView: View {
    
    @State var model: [News] = []
    private var networkService = NetworkServiceClass()
    
    var body: some View {
        List (model) { model in
            VStack {
                Text(DateConverter().convertData(date: model.date))
                Text(model.title)
            }
        }
        .onAppear{
            networkService.downloadNews{ (model)
                in
                self.model = model
            }
        }
        
    }
}
#Preview {
    NewsView()
}
