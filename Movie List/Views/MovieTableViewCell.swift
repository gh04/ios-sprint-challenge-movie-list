//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Gerardo Hernandez on 6/19/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - Properties
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet var movieLabel: UILabel!
    
    
    // MARK: - IBActions
    @IBAction func seenButton(_ sender: UIButton) {
      

        if !sender.isSelected {
            sender.setTitle("Not Seen", for: .normal)
            movie?.seen = false

        } else if sender.isSelected {
            sender.setTitle("Seen", for: .normal)
            movie?.seen = true
        }
        
        updateViews()
    }
    
    // MARK: - Helper Methods
    private func updateViews() {
        
        guard let movieName = movie?.name else { return }
        
        movieLabel.text = movieName
    }

}
