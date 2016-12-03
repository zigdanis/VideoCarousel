//
//  VideoFrameProvider.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation

class VideoFrameProvider {
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
    
}
