//
//  MoviesProvider.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

final class MoviesProvider: NSObject, UICollectionViewDataSource {
    
    var movies: [Movie]
    var selectedMovies: [Movie]
    
    init(movies: [Movie], genre: Genre) {
        self.movies = movies
        selectedMovies = []
        super.init()
        updateSelectedMovies(for: genre)
    }
    
    func updateSelectedMovies(for genre: Genre) {
        let selected = movies.filter{$0.genre == genre}.sorted(by: <)
        selectedMovies = selected
    }
    
    //MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCellIdentifier, for: indexPath) as! MovieCell
        let movie = selectedMovies[indexPath.item]
        cell.updateCell(with: movie)
        return cell
    }
    
}
