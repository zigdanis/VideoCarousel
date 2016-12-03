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
    let title: String
    let image: UIImage
    var selected: Bool
    
    init?(title: String, image: UIImage?, selected: Bool = false) {
        guard let img = image else { return nil }
        self.title = title
        self.image = img
        self.selected = selected
    }
}
