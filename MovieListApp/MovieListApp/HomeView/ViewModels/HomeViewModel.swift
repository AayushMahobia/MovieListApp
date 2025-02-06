//
//  HomeViewModel.swift
//  MovieListApp
//
//  Created by Admin on 04/02/25.
//

import Foundation

class HomeViewModel: ObservableObject{
    let categoryList: [String] = ["Action", "Mystery", "Comedy"]
    var data: Welcome?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchData(category: String) async {
        let apiURL = "https://imdb236.p.rapidapi.com/imdb/search?type=movie&genre=\(category)&rows=20&sortOrder=DESC&sortField=numVotes"
        
        guard let url = URL(string: apiURL) else {
            self.errorMessage = "Invalid URL"
            print(self.errorMessage ?? "some error (url)")
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
            self.data = decodedData

        } catch {
            self.errorMessage = "Error: \(error.localizedDescription)"
            print(self.errorMessage ?? "some error (data)")
        }

        await MainActor.run {
            isLoading = false
        }
    }
    
    func getNavBarModel (rightAction: (() -> Void)?) -> NavBarModel{
        let model: NavBarModel = NavBarModel(leftIcon: "person.fill", rightIcon: "magnifyingglass", rightIconAction:  {
            rightAction?()
        })
        return model
    }
}
