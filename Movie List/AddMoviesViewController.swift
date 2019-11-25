//
//  AddMoviesViewController.swift
//  Movie List
//
//  Created by Gerardo Hernandez on 11/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol AddMovieDelegate {
    func movieWasAdded(_ movie: Movie)
}

class AddMoviesViewController: UIViewController {
    
    @IBOutlet weak var newMovieTextField: UITextField!
    
    var delegate: AddMovieDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newMovieTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMovieButton(_ sender: UIButton) {
        guard let newMovie = newMovieTextField.text,
            !newMovie.isEmpty else { return }
        
        var movie = Movie(name: newMovie, hasBeenSeen: false)
     
        delegate?.movieWasAdded(movie)
    }
    
}

extension AddMoviesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty {
            newMovieTextField.becomeFirstResponder()
            
        }
        return false
    }
}
