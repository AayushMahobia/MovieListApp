//
//  MovieDetailsViewModel.swift
//  MovieListApp
//
//  Created by Admin on 06/02/25.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    var movieDetails: Movie?
    @Published var isLoading = false
    
    func fetchMovieData(movieId: String) async {
        isLoading = true
        
        let headers = [
            "x-rapidapi-key": "ecb465cf87msh04f2d770d060c77p185af0jsncdefda892e92",
            "x-rapidapi-host": "imdb236.p.rapidapi.com",
        ]
        
        guard let url = URL(string: "\(Urls.baseUrl + movieId)") else {
            print("Invalid URL")
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Request failed")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(Movie.self, from: data) {
                movieDetails = decodedResponse
            } else {
                print("Unexpected Data Format:")
            }
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
        
        await MainActor.run {
            isLoading = false
        }
    }
    
    func getNavBarModel (leftAction: (() -> Void)?) -> NavBarModel {
        let model = NavBarModel(leftIcon: "chevron.left", rightIcon: "ellipsis", leftIconAction:  {
            leftAction?()
        })
        return model
    }
}
