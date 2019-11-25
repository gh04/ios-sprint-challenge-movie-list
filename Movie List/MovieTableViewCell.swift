//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Gerardo Hernandez on 11/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol  ToggleSeen {
    func isToggleTapped(cell: MovieTableViewCell)
}

class MovieTableViewCell: UITableViewCell {

    
    var delegate: ToggleSeen?
    
    @IBAction func hasBeenSeenButton(_ sender: UIButton) {
        
        delegate?.isToggleTapped(cell: self)
        
        if movie?.hasBeenSeen == true {
            sender.setTitle("Seen", for: .highlighted)
        } else {
            sender.setTitle("Not Seen", for: .normal)
        }
    }
    
    @IBOutlet weak var movieLabel: UILabel!

    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let movie = movie else { return }
        
        movieLabel.text = ("\(movie.name)")
    }
    
}
