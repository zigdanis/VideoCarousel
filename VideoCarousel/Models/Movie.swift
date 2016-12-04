//
//  Movie.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

struct Movie {
    let name: String
    let image: UIImage
    let genre: Genre
    
    init?(name: String, image: UIImage?, genre: Genre) {
        guard let img = image else { return nil }
        self.name = name
        self.image = img
        self.genre = genre
    }
}
