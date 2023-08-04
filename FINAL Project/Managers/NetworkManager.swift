//
//  NetworkManager.swift
//  FINAL Project
//
//  Created by Мариям on 21.04.2022.
//

import Foundation
import Alamofire

struct NetworkManager{
    
    static let shared = NetworkManager()
    
    private init() { }
    
    // Метод запрашивает список фильмов и обновляет tableView
    func requestTrendingMovies(completion: @escaping( ([Movie])->() ))   {
        
        let url = Constants.Network.baseURL + Constants.Network.moviePath + Constants.Network.apiKey
        
        AF.request(url).responseJSON { responce in
            
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(JSONResponce.self, from: responce.data!) {
            completion(data.results ?? [])
            }
        }
    }
    
    // Метод запрашивает список актеров и обновляет коллекцию
    func requestTrendingActors(completion: @escaping( ([Actor])->() )) {
        
        let url = Constants.Network.baseURL + Constants.Network.actorPath + Constants.Network.apiKey
        
        AF.request(url).responseJSON { responce in
            
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(Json4Swift_Base.self, from: responce.data!) {
            completion(data.results ?? [])
               
            }
        }
    }
}
