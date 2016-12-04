//
//  GenresViewModel.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

class MoviesViewModel {
    
    let provider: MoviesProvider
    
    init() {
        let movie = Movie(name: "Terminator", image: UIImage(named:"close-winter"))
        provider = MoviesProvider(movies: [movie!])
    }
}
