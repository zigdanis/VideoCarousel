//
//  VideoFramesViewModel.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit

class VideoFramesViewModel {

    let framesProvider: VideoFrameProvider
    
    init() {
        let frame = VideoFrame(title: "Horror", image: UIImage(named: "close-winter"))
        let provider = VideoFrameProvider(frames: [frame!])!
        framesProvider = provider
    }
    
}
