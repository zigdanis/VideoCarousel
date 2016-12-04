//
//  MoviesLayout.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

class MoviesLayout: UICollectionViewFlowLayout {
    
    private let aspectRatio: CGFloat = 1.68
    
    override func prepare() {
        scrollDirection = .horizontal
        minimumLineSpacing = 20
        minimumInteritemSpacing = CGFloat.greatestFiniteMagnitude
        guard let totalWidth = collectionView?.bounds.width else { return }
        let side = (totalWidth - minimumLineSpacing * 4) / 3
        itemSize = CGSize(width: side, height: side/aspectRatio)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let atts = super.layoutAttributesForElements(in: rect) else { return nil }
        var copyAtts = [UICollectionViewLayoutAttributes]()
        for origAtt in atts {
            let att = origAtt.copy() as! UICollectionViewLayoutAttributes
            att.center.x += minimumLineSpacing
            copyAtts.append(att)
        }
        return copyAtts
    }
    
}
