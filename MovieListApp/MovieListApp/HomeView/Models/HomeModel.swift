import Foundation

struct Welcome: Codable, Hashable {
    let results: [Result]
}

struct Result: Codable, Hashable {
    let id: String?
    let primaryTitle: String?
    let description: String?
    let primaryImage: String?
    let contentRating: String?
    let releaseDate: String?
    let runtimeMinutes: Int?
    let averageRating: Double?
    let numVotes: Int?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decodeIfPresent(String.self, forKey: .id)
        primaryTitle = try values.decodeIfPresent(String.self, forKey: .primaryTitle)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        primaryImage = try values.decodeIfPresent(String.self, forKey: .primaryImage)
        contentRating = try values.decodeIfPresent(String.self, forKey: .contentRating)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        runtimeMinutes = try values.decodeIfPresent(Int.self, forKey: .runtimeMinutes)
        averageRating = try values.decodeIfPresent(Double.self, forKey: .averageRating)
        numVotes = try values.decodeIfPresent(Int.self, forKey: .numVotes)
    }
}


