//
//  HomeViewModel.swift
//  MovieListApp
//
//  Created by Admin on 04/02/25.
//

import Foundation
import Compression
//import BrotliKit

@MainActor
class HomeViewModel: ObservableObject{
    let categoryList: [String] = ["Action", "Mystery", "Comedy"]
    var categoryDict: [String: Welcome] = [:]
    var apiCount: Int = 0
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchData(category: String) async {
        isLoading = true
        apiCount += 1
        
        let headers = [
            "x-rapidapi-key": "ecb465cf87msh04f2d770d060c77p185af0jsncdefda892e92",
            "x-rapidapi-host": "imdb236.p.rapidapi.com",
        ]
        
        guard let url = URL(string: "\(Urls.baseUrl + Urls.getCategoryUrl)\(category)&rows=20&sortOrder=DESC&sortField=numVotes") else {
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
            
            if let decodedResponse = try? JSONDecoder().decode(Welcome.self, from: data) {
                categoryDict[category] = decodedResponse
            } else {
                print("Unexpected Data Format:")
            }
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            isLoading = false
        }
        
        if apiCount == categoryList.count{
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



