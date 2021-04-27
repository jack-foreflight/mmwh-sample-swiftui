import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var viewModel: LandmarkListViewModel

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $viewModel.state.showingFavoritesOnly) {
                    Text("Favorites only")
                }
                .onChange(of: viewModel.state.showingFavoritesOnly, perform: { value in
                    viewModel.showFavoritesOnly(setting: value)
                })

                ForEach(viewModel.displayedLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static private let viewModel = LandmarkListViewModel(
        state: LandmarkState(landmarks: [], showingFavoritesOnly: false),
        service: LandmarkService()
    )
    static var previews: some View {
        LandmarkList()
            .environmentObject(viewModel)
    }
}
