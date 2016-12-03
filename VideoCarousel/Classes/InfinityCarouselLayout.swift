//
//  InfinityCarouselLayout.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

class InfinityCarouselLayout: UICollectionViewFlowLayout {
    
    let increaseMultiplier: CGFloat = 1.4
    let verticalPadding: CGFloat = 15
    let distanceToGrow: CGFloat = 100
    
    override init() {
        super.init()
        itemSize = CGSize(width: 100, height: 100)
        scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        itemSize = normalItemSize()
    }
    
    private func centerItemSize() -> CGSize {
        let normal = normalItemSize()
        return CGSize(width: normal.width*increaseMultiplier, height: normal.height*increaseMultiplier)
    }
    
    private func normalItemSize() -> CGSize {
        guard let totalWidth = collectionView?.bounds.width else { return .zero }
        let side = totalWidth / (5 + increaseMultiplier)
        return CGSize(width: side, height: side)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let atts = super.layoutAttributesForElements(in: rect) else { return nil }
        guard let colCenter = collectionView?.center.x else { return atts }
        guard let offset = collectionView?.contentOffset.x else { return atts }
        let theCenter = colCenter + offset
        var copyAtts = [UICollectionViewLayoutAttributes]()
        for origAtt in atts {
            let att = origAtt.copy() as! UICollectionViewLayoutAttributes
            let center = att.center.x
            let diff = abs(theCenter - center)
            if diff <= distanceToGrow {
                let percentage = 1 - diff/distanceToGrow // 0..100%
                let mult = 1 + ((increaseMultiplier - 1) * percentage)
                var size = att.size
                size.width *= mult
                size.height *= mult
                att.size = size
            }
            copyAtts.append(att)
        }
        return copyAtts
    }
}
