import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static private var viewModel = LandmarkListViewModel(
        state: LandmarkState(landmarks: [], showingFavoritesOnly: false),
        service: LandmarkService()
    )
    
    static var previews: some View {
        ContentView()
            .environmentObject(viewModel)
    }
}
