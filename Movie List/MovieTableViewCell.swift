//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Gerardo Hernandez on 11/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBAction func hasBeenSeenButton(_ sender: Any) {
    }
    @IBOutlet weak var movieLabel: UILabel!

    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let movie = movie else { return }
        
        movieLabel.text = "\(movie.name)"
    }
    
}
