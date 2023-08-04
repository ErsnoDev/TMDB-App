//
//  DataManager.swift
//  FINAL Project
//
//  Created by Мариям on 01.05.2022.
//

import Foundation
import RealmSwift
import UIKit

class DataManager {
    
    let realm = try? Realm()
    
    func getMovies() -> [MovieUI] {
        
        var movies = [MovieUI]()
        guard let moviesResults = realm?.objects(MovieRealm.self) else {
            return []}
        
        for movie in moviesResults {
            var movieUI = MovieUI(name: movie.name,
                                  popularity: movie.popularity,
                                  overview: movie.overview,
                                  id: movie.id,
                                  backdropPath: movie.backdropPath,
                                  mediaType: movie.mediaType,
                                  posterPath: movie.posterPath)
            movies.append(movieUI)
        }
        
        return movies
    }
    
    func saveMovie(movie: MovieUI?) {
        
        let MovieRealm = MovieRealm()
        
        MovieRealm.name = movie?.name ?? ""
        MovieRealm.popularity = movie?.popularity ?? 0
        MovieRealm.overview = movie?.overview ?? ""
        MovieRealm.id = movie?.id ?? 0
        MovieRealm.backdropPath = movie?.backdropPath ?? ""
        MovieRealm.mediaType = movie?.mediaType ?? ""
        MovieRealm.posterPath = movie?.posterPath ?? ""
        
        try? realm?.write {
            realm?.add(MovieRealm, update: .modified) 
        }
    }
}
