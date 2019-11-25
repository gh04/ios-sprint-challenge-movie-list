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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        .
        let normalImage = UIImage(named: "normal.png")
        let selectedImage = UIImage(named: "selected.png")
        
        toggleButton.setImage(normalImage, for: .normal)
        toggleButton.setImage(selectedImage, for: .selected)

    
    var movie: Movie? {
        didSet {
            updateViews()
        }
}


    private func updateViews() {
        guard let movie = movie else { return }
        
        movieLabel.text = movie.name
        hasBeenSeenButton = mo
    }
}
