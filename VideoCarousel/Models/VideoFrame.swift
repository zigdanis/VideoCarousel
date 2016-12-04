//
//  VideoFrame.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

struct VideoFrame {
    var title: String {
        get {
            return genre.rawValue
        }
    }
    let image: UIImage
    let genre: Genre
    
    init?(image: UIImage?, genre: Genre) {
        guard let img = image else { return nil }
        self.image = img
        self.genre = genre
    }
}
