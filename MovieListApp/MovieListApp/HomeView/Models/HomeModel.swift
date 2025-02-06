//
//  HomeModel.swift
//  MovieListApp
//
//  Created by Admin on 04/02/25.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let rows, numFound: Int
    let results: [Result]
    let nextCursorMark: String
}

// MARK: - Result
struct Result: Codable {
    let id, primaryTitle, originalTitle: String
    let type: TypeEnum
    let description: String
    let primaryImage: String
    let contentRating: ContentRating
    let isAdult: Bool
    let releaseDate: String
    let startYear: Int
//    let endYear: JSONNull?
    let runtimeMinutes: Int
    let genres, interests, countriesOfOrigin: [String]
    let externalLinks: [String]
    let spokenLanguages, filmingLocations: [String]
    let productionCompanies: [ProductionCompany]
    let budget, grossWorldwide: Int
    let averageRating: Double
    let numVotes: Int
}

enum ContentRating: String, Codable {
    case pg = "PG"
    case pg13 = "PG-13"
    case r = "R"
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id, name: String
}

enum TypeEnum: String, Codable {
    case movie = "movie"
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//            return true
//    }
//
//    public var hashValue: Int {
//            return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//            let container = try decoder.singleValueContainer()
//            if !container.decodeNil() {
//                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//            }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//            var container = encoder.singleValueContainer()
//            try container.encodeNil()
//    }
//}
