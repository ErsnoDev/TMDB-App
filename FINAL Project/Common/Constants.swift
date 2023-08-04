//
//  Constants.swift
//  FINAL Project
//
//  Created by Мариям on 09.05.2022.
//

import Foundation

struct Constants {
    
    struct UI {
        static let mainStoryboardIdentifier = "Main"
    }
    
    struct Network {
        static let baseURL = "https://api.themoviedb.org/3"
        static let moviePath = "/trending/tv/week"
        static let apiKey = "?api_key=f576a5d1d86a1443b5444626f445d6b2"
        static let actorPath = "/person/popular"
    }
}
