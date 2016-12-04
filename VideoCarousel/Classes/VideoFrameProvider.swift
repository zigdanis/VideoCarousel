//
//  VideoFrameProvider.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

final class VideoFrameProvider: NSObject, UICollectionViewDataSource {
    var frames: [VideoFrame]
    
    init?(frames: [VideoFrame]) {
        guard frames.count >= 1 else { return nil }
        self.frames = frames
    }
    
    func itemAtIndex(index: Int) -> VideoFrame {
        let totalCount = frames.count
        let offset = abs(index % totalCount)
        let value = frames[offset]
        return value
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BigNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoFrameCellIdentifier, for: indexPath) as! VideoFrameCell
        let videoFrame = itemAtIndex(index: indexPath.item)
        cell.updateCell(with: videoFrame)
        return cell
    }
    
}
