import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var landmarkListViewModel = LandmarkListViewModel(
        state: LandmarkState(landmarks: [], showingFavoritesOnly: false),
        service: LandmarkService()
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(landmarkListViewModel)
        }
    }
}
