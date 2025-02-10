//
//  SearchViewModel.swift
//  MovieListApp
//
//  Created by Admin on 10/02/25.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var isLoading = false
    
    // Result is in HomeModel
    var searchData: [Result]?
    
    func fetchData(searchText: String) async {
        await MainActor.run {
            isLoading = true
        }
        
        let headers = [
            "x-rapidapi-key": "ecb465cf87msh04f2d770d060c77p185af0jsncdefda892e92",
            "x-rapidapi-host": "imdb236.p.rapidapi.com",
        ]
        
        guard let url = URL(string: "\(Urls.baseUrl + Urls.getSearchUrl + searchText)") else {
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
            
            if let decodedResponse = try? JSONDecoder().decode([Result].self, from: data) {
                searchData = decodedResponse
            } else {
                print("Unexpected Data Format:")
            }
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            await MainActor.run {
                isLoading = false
            }
        }
        
        await MainActor.run {
            isLoading = false
        }
    }
}
