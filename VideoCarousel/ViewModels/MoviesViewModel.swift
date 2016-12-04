//
//  GenresViewModel.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

final class MoviesViewModel {
    
    let provider: MoviesProvider
    let layout: MoviesLayout
    
    init() {
        let movie1 = Movie(name: "Terminator", image: UIImage(named:"close-winter"), genre: .Action)
        let movie2 = Movie(name: "Saw 6", image: UIImage(named:"close-winter"), genre: .Horror)
        let movie3 = Movie(name: "Home Alone", image: UIImage(named:"close-winter"), genre: .Comedy)
        let movie4 = Movie(name: "Man In Black", image: UIImage(named:"close-winter"), genre: .Action)
        let movie5 = Movie(name: "Jason", image: UIImage(named:"close-winter"), genre: .Horror)
        let movie6 = Movie(name: "Ice Age", image: UIImage(named:"close-winter"), genre: .Comedy)
        provider = MoviesProvider(movies: [movie1!, movie2!, movie3!, movie4!, movie5!, movie6!])
        layout = MoviesLayout()
    }
    
    func indexPath(for genre: Genre) -> IndexPath {
        let index = provider.movies.index{ $0.genre == genre }
        guard let i = index else {
            return IndexPath(item: 0, section: 0)
        }
        let ip = IndexPath(item: i, section: 0)
        return ip
    }
    
}
