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
    
    static let appOrange = #colorLiteral(red: 0.968627451, green: 0.6549019608, blue: 0, alpha: 1) // UIColor(247,167,0)
    static let appGray = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) 
}
