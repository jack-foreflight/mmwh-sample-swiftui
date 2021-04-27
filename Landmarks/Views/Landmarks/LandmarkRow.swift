import SwiftUI

struct LandmarkRow: View {
    @EnvironmentObject var viewModel: LandmarkListViewModel
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()

            if viewModel.state.landmarks[viewModel.getLandmarkIndex(id: landmark.id)].isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static private let viewModel = LandmarkListViewModel(
        state: LandmarkState(landmarks: [], showingFavoritesOnly: false),
        service: LandmarkService()
    )
    static private let landmarks = viewModel.state.landmarks

    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
