//
//  MoviesViewController.swift
//  Movie List
//
//  Created by Gerardo Hernandez on 11/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewConroller: UIViewController {



    @IBOutlet weak var tableView: UITableView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "AddMovieSegue" {
               if let addMovieVC = segue.destination as? AddMoviesViewController {
                addMovieVC.delegate = self
            }
        }
    }
}



extension MovieTableViewConroller: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movies.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
            
            let movie = movies[indexPath.row]
            cell.movie = movie
            cell.delegate = self
            
            return cell
        }
        
        
    }


extension MovieTableViewConroller: AddMovieDelegate {
    
    func movieWasAdded(_ movie: Movie) {
        movies.append(movie)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
        
    }
}

extension MovieTableViewConroller: ToggleSeen {
    func isToggleTapped(cell: MovieTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell)  else { return }
        var movie = movies[indexPath.row]
        movie.hasBeenSeen = !movie.hasBeenSeen
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}
