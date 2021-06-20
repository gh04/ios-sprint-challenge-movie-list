//
//  MovieViewController.swift
//  Movie List
//
//  Created by Gerardo Hernandez on 6/19/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    // MARK: - Properties
    var movies = [Movie]()
    
    // MARK: - IBOulets
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddMovieShowSegue" {
            guard let addMovieVC = segue.destination as? AddMovieViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let movie = movies[indexPath.row]
            addMovieVC.movie = movie
            
        }
    }

}

// MARK: - Class Tableview Protocols
extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else { fatalError("Early Crash")}
        
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        return cell
     
    }
    
    
    
}

