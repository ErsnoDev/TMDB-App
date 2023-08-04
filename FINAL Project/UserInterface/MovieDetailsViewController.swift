//
//  MovieDetailsViewController.swift
//  FINAL Project
//
//  Created by Мариям on 21.04.2022.
//

import UIKit
import SDWebImage
import RealmSwift
import youtube_ios_player_helper
import Alamofire


class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var videoPlayerView: YTPlayerView!
    
    
    // Создаём объект реалм
       let realm = try? Realm()
    
    var movie: MovieUI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var imageURLString = ""
        if let backdropPath = self.movie?.backdropPath {
            imageURLString = "https://image.tmdb.org/t/p/w500/" + backdropPath
        
        let imageURL = URL(string: imageURLString)
        
        self.posterImageView.sd_setImage(with: imageURL)
        
        }
        
        self.titleLabel.text = movie?.name
        self.overviewLabel.text = movie?.overview
        
        
        // загружаем youtube плеер
        guard let id = movie?.id else { return }
        requestVideoDetails(id) { videos in
            guard let key = videos.first?.key else { return }
        
            self.videoPlayerView.load(withVideoId: key)
        }
    }
    
    
    func requestVideoDetails(_ id: Int, completion: @escaping( ([VideoResults])->() )) {
        
        let url = "https://api.themoviedb.org/3/tv/\(id)/videos?api_key=f576a5d1d86a1443b5444626f445d6b2"
        
        AF.request(url).responseJSON { responce in
            
            let decoder = JSONDecoder()
            guard let responceData = responce.data else { return }
            guard let data = try? decoder.decode(VideoJSON.self, from: responceData) else { return }
            
            guard let videos = data.results else { return }
            completion(videos)
                
//                self.actorsList = data.results ?? []
//
//                self.collectionView.reloadData()
            
        }
    }
   
    @IBAction func addToListButtonPressed(_ sender: Any) {
        
        DataManager().saveMovie(movie: self.movie!)
        
    }
}
