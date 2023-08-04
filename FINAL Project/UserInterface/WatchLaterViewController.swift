//
//  WatchLaterViewController.swift
//  FINAL Project
//
//  Created by Мариям on 26.04.2022.
//

import UIKit
import RealmSwift

class WatchLaterViewController: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [MovieUI] = []
    
    override func viewDidLoad() {
        title = "Watch later"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.movies = DataManager().getMovies()
        tableView.reloadData()
        
    }
}


extension WatchLaterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = movies[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let editingRow = self.movies[indexPath.row]
            self.movies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
        
    }
}

extension WatchLaterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: Constants.UI.mainStoryboardIdentifier, bundle: nil)
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            let movieUI = movies[indexPath.row]
            detailsViewController.movie = movieUI
            
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

