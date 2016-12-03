//
//  Color+helper.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(_ r: UInt8, _ g: UInt8 , _ b: UInt8) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha:1)
    }
    
    static let appOrange = UIColor(247,167,0)
    static let appPink = UIColor(198,100,199)
}
