//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Gerardo Hernandez on 6/19/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import UIKit

protocol AddMovieDelegate {
    func movieWasAdded(_ movie: Movie)
}

class AddMovieViewController: UIViewController {
    
    // MARK: - Properties
    var delegate: AddMovieDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet var movieTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    @IBAction func addMovieButton(_ sender: Any) {
        
        guard let movieName = movieTextField.text else { return }
        
        let movie = Movie(name: movieName)
        delegate?.movieWasAdded(movie)
        navigationController?.popViewController(animated: true)
    }

}
