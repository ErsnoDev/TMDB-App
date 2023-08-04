//
//  ActorsCollectionViewCell.swift
//  FINAL Project
//
//  Created by Мариям on 30.04.2022.
//

import UIKit
import SDWebImage

class ActorsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var actorImageView: UIImageView!
    @IBOutlet weak var actorNameLabel: UILabel!
    
    
    func configure(actor: Actor) {
        
        actorImageView.layer.cornerRadius = 45
        actorNameLabel.text = actor.name ?? "No name"
        
        let baseImageURL = "https://image.tmdb.org/t/p/w500"
        
        if let path = actor.profile_path {
            let imageURL = URL(string: baseImageURL + path)
            
            actorImageView.sd_setImage(with: imageURL, completed: nil)
        }
        
        
    }
}
