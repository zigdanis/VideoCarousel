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
    let offset: CGFloat = 20
    
    override init() {
        super.init()
        itemSize = CGSize(width: 100, height: 100)
        scrollDirection = .horizontal
        minimumLineSpacing = 20
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
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let colCenter = collectionView?.center.x else { return proposedContentOffset }
        let horizontalOffset = proposedContentOffset.x
        let theCenter = colCenter + horizontalOffset
        guard let width = collectionView?.bounds.size.width else { return proposedContentOffset }
        guard let height = collectionView?.bounds.size.height else { return proposedContentOffset }
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width:width , height: height)
        guard let atts = layoutAttributesForElements(in: targetRect) else { return proposedContentOffset }
        var offsetAdjsutment = CGFloat.greatestFiniteMagnitude
        for att in atts {
            let itemOffset = att.center.x
            if abs(itemOffset - theCenter) < abs(offsetAdjsutment) {
                offsetAdjsutment = itemOffset - theCenter
            }
        }
        print("proposedContentOffset \(proposedContentOffset)")
        print("offsetAdjsutment \(offsetAdjsutment)")
        return CGPoint(x: proposedContentOffset.x + offsetAdjsutment, y: proposedContentOffset.y)
        
        /*
        var offsetAdjsutment = CGFloat.greatestFiniteMagnitude
        let horizontalOffset = proposedContentOffset.x + offset
        guard let width = collectionView?.bounds.size.width else { return proposedContentOffset }
        guard let height = collectionView?.bounds.size.height else { return proposedContentOffset }
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width:width , height: height)
        guard let atts = layoutAttributesForElements(in: targetRect) else { return proposedContentOffset }
        for att in atts {
            let itemOffset = att.frame.origin.x
            if abs(itemOffset - horizontalOffset) < abs(offsetAdjsutment) {
                offsetAdjsutment = itemOffset - horizontalOffset
            }
        }
        return CGPoint(x: proposedContentOffset.x + offsetAdjsutment, y: proposedContentOffset.y)
 */
    }
    
}
