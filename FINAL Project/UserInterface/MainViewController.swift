import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var moviesList: [Movie] = []
    var actorsList: [Actor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIU()
    }
    
    
    private func setupIU() {
        let MovieCell = String(describing: TrendingMovieTableViewCell.self)
        self.tableView.register(UINib(nibName: MovieCell, bundle: nil), forCellReuseIdentifier: MovieCell)
        
        let ActorCell = String(describing: ActorsCollectionViewCell.self)
        self.collectionView.register(UINib(nibName: ActorCell, bundle: nil), forCellWithReuseIdentifier: ActorCell)
   
        title = "Movies list"
        
        // Добавить Content insert в UITableView
        self.tableView.contentInset.top = 170
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        NetworkManager.shared.requestTrendingMovies { moviesList in
            self.moviesList = moviesList
            self.tableView.reloadData()
        }
        
       
        NetworkManager.shared.requestTrendingActors { actorsList in
            self.actorsList = actorsList
            self.collectionView.reloadData()
        }
        
    }

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingMovieTableViewCell", for: indexPath) as? TrendingMovieTableViewCell {
            
            cell.configureWith(moviesList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}


extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: Constants.UI.mainStoryboardIdentifier, bundle: nil)
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            
                let movie = moviesList[indexPath.row]
                
                let movieUI = MovieUI(name: movie.name ?? "",
                                      popularity: movie.popularity ?? 0,
                                      overview: movie.overview ?? "",
                                      id: movie.id ?? 0,
                                      backdropPath: movie.backdropPath ?? "",
                                      mediaType: movie.mediaType ?? "",
                                      posterPath: movie.posterPath ?? "")
                detailsViewController.movie = movieUI
            
            
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}


extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.actorsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = String(describing: ActorsCollectionViewCell.self)
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ActorsCollectionViewCell {
            cell.configure(actor: actorsList[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}



