//
//  CarouselLayoutAttribute.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

final class CarouselLayoutAttributes: UICollectionViewLayoutAttributes {
    var selected = false
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let obj = super.copy(with: zone) as! CarouselLayoutAttributes
        obj.selected = selected
        return obj
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        let sup = super.isEqual(object)
        let obj = object as? CarouselLayoutAttributes
        return sup && obj?.selected == selected
    }
}
