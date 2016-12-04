//
//  InfinityCarouselLayout.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class CarouselLayout: UICollectionViewFlowLayout, UICollectionViewDelegate {
    
    private let increaseMultiplier: CGFloat = 1.6
    private let verticalPadding: CGFloat = 15
    private let distanceToGrow: CGFloat = 100
    private let interItemGap: CGFloat = 35
    private let increasedAspectRatio: CGFloat = 1.25
    private let normalAspectRatio: CGFloat = 1.1
    
    let selectedIndexPath = Variable<IndexPath?>(nil)
    
    override init() {
        super.init()
        itemSize = CGSize(width: 100, height: 100/normalAspectRatio)
        scrollDirection = .horizontal
        minimumLineSpacing = 0
        minimumInteritemSpacing = CGFloat.greatestFiniteMagnitude
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        itemSize = normalItemSize()
    }
    
    private func normalItemSize() -> CGSize {
        guard let totalWidth = collectionView?.bounds.width else { return .zero }
        let side = (totalWidth - minimumLineSpacing * 2) / (5 + increaseMultiplier)
        return CGSize(width: side, height: side/normalAspectRatio)
    }
    
    // MARK: - ScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let width = collectionView?.bounds.size.width else { return }
        guard let height = collectionView?.bounds.size.height else { return }
        let targetRect = CGRect(x: scrollView.contentOffset.x, y: 0, width:width , height: height)
        guard let atts = layoutAttributesForElements(in: targetRect) as? [CarouselLayoutAttributes] else { return }
        let selected = atts.filter{ $0.selected }.first
        selectedIndexPath.value = selected?.indexPath
    }
    
    // MARK: - Layout
    
    override class var layoutAttributesClass: Swift.AnyClass {
        get {
            return CarouselLayoutAttributes.self
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let atts = super.layoutAttributesForElements(in: rect) else { return nil }
        guard let colCenter = collectionView?.center.x else { return atts }
        guard let offset = collectionView?.contentOffset.x else { return atts }
        let theCenter = colCenter + offset
        var copyAtts = [CarouselLayoutAttributes]()
        for origAtt in atts {
            let att = origAtt.copy() as! CarouselLayoutAttributes
            let center = att.center.x
            let diff = center - theCenter
            let absDiff = abs(diff)
            if diff > distanceToGrow {
                att.center.x = att.center.x + interItemGap
            } else if absDiff <= distanceToGrow {
                let percentage = 1 - absDiff/distanceToGrow // 0..100%
                let mult = 1 + ((increaseMultiplier - 1) * percentage)
                var size = att.size
                size.width *= mult
                size.height = max(size.height, size.width / increasedAspectRatio)
                att.size = size
                
                // 1..0..-1
                let signPercentage = diff/distanceToGrow
                att.center.x = att.center.x + interItemGap * signPercentage
            } else {
                att.center.x = att.center.x - interItemGap
            }
            att.selected = absDiff<1
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
        guard let atts = super.layoutAttributesForElements(in: targetRect) else { return proposedContentOffset }
        var offsetAdjsutment = CGFloat.greatestFiniteMagnitude
        for att in atts {
            let itemOffset = att.center.x
            if abs(itemOffset - theCenter) < abs(offsetAdjsutment) {
                offsetAdjsutment = itemOffset - theCenter
            }
        }
        return CGPoint(x: proposedContentOffset.x + offsetAdjsutment, y: proposedContentOffset.y)
    }
}
