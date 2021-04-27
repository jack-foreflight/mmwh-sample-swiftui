import Foundation
import Combine

class LandmarkListViewModel: ObservableObject {
    @Published var state: LandmarkState
    @Published var displayedLandmarks: [Landmark]
    
    let service: LandmarkService
    init(state: LandmarkState, service: LandmarkService) {
        self.state = state
        self.service = service
        
        self.displayedLandmarks = []
        self.state.landmarks = service.load("landmarkData.json")
        showFavoritesOnly(setting: state.showingFavoritesOnly)
    }
    
    func getLandmarkIndex(id: Int) -> Int {
        return self.state.landmarks.firstIndex(where: { $0.id == id })!
    }
    
    func showFavoritesOnly(setting: Bool) {
        self.displayedLandmarks = self.state.landmarks.filter { landmark in
            (!self.state.showingFavoritesOnly || landmark.isFavorite)
        }
    }
}
