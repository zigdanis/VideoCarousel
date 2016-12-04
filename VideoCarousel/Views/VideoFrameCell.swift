//
//  VideoFrameCell.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

final class VideoFrameCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderPanel: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateRoundedBorders()
    }
    
    private func updateRoundedBorders() {
        borderPanel.layer.cornerRadius = Rounding
        borderPanel.layer.masksToBounds = false
        borderPanel.layer.borderColor = UIColor.appOrange.cgColor
        borderPanel.layer.borderWidth = 2
        imageView.layer.cornerRadius = Rounding
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        guard let myAtts = layoutAttributes as? CarouselLayoutAttributes else {
            assertionFailure("Should provide custom Attributes for layout changes")
            return
        }
        borderPanel.isHidden = !myAtts.selected
    }

}
