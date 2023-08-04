//
//  TrendingMovieTableViewCell.swift
//  FINAL Project
//
//  Created by Мариям on 21.04.2022.
//

import UIKit
import SDWebImage

class TrendingMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieVoteArevage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        moviePosterImageView.layer.cornerRadius = 8
    }

    func configureWith(_ item: Movie) {
        
        movieTitleLabel.text = item.name
        
        movieVoteArevage.text = String(item.voteAverage!) ?? "non"
        
        var imageURLString = ""
        if let backdropPath = item.backdropPath {
            imageURLString = "https://image.tmdb.org/t/p/w500/" + backdropPath
        }
        
        let imageURL = URL(string: imageURLString)
        
        moviePosterImageView.sd_setImage(with: imageURL)
    }
    
}
