// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Movie: Codable, Hashable {
    let id: String
    let url: String
    let primaryTitle, originalTitle, type, description: String
    let primaryImage: String
    let contentRating: String
    let startYear: Int
    let releaseDate: String
    let interests, countriesOfOrigin: [String]
    let externalLinks: [String]
    let spokenLanguages, filmingLocations: [String]
    let productionCompanies: [ProductionCompany]
    let budget, grossWorldwide: Int
    let genres: [String]
    let isAdult: Bool
    let runtimeMinutes: Int
    let averageRating: Double
    let numVotes: Int
    let directors, writers: [Director]
    let cast: [Cast]
}

// MARK: - Cast
struct Cast: Codable, Hashable {
    let id: String?
    let url: String?
    let fullName, job: String?
    let characters: [String]?
}

// MARK: - Director
struct Director: Codable, Hashable {
    let id: String
    let url: String
    let fullName: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable, Hashable {
    let id, name: String
}
