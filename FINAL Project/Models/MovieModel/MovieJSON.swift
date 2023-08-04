
import Foundation
struct Movie : Codable {
	let id : Int?
	let posterPath : String?
	let name : String?
	let original_name : String?
	let origin_country : [String]?
	let overview : String?
	let voteCount : Int?
	let backdropPath : String?
	let voteAverage : Double?
	let genre_ids : [Int]?
	let firstAirDate : String?
	let original_language : String?
	let popularity : Double?
	let mediaType : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case posterPath = "poster_path"
		case name = "name"
		case original_name = "original_name"
		case origin_country = "origin_country"
		case overview = "overview"
		case voteCount = "vote_count"
		case backdropPath = "backdrop_path"
		case voteAverage = "vote_average"
		case genre_ids = "genre_ids"
		case firstAirDate = "first_air_date"
		case original_language = "original_language"
		case popularity = "popularity"
		case mediaType = "media_type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
		origin_country = try values.decodeIfPresent([String].self, forKey: .origin_country)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
		genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
        firstAirDate = try values.decodeIfPresent(String.self, forKey: .firstAirDate)
		original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        mediaType = try values.decodeIfPresent(String.self, forKey: .mediaType)
	}

}
