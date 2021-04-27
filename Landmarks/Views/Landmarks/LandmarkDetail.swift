import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var viewModel: LandmarkListViewModel
    var landmark: Landmark

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $viewModel.state.landmarks[viewModel.getLandmarkIndex(id: landmark.id)].isFavorite)
                }

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static private let viewModel = LandmarkListViewModel(
        state: LandmarkState(landmarks: [], showingFavoritesOnly: false),
        service: LandmarkService()
    )

    static var previews: some View {
        LandmarkDetail(landmark: viewModel.state.landmarks[0])
            .environmentObject(viewModel)
    }
}
