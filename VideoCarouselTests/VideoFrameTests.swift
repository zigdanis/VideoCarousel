//
//  VideoFrameTests.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import XCTest
@testable import VideoCarousel

class VideoFrameTests: XCTestCase {
    
    var videoFrame: VideoFrame!
    
    override func setUp() {
        super.setUp()
        videoFrame = VideoFrame(title: "Title", image: UIImage(named:"close-winter"), selected: false)
    }
    
    
    func testVideoFrameCanBeInitializedWithTestValues() {
        XCTAssertNotNil(videoFrame)
    }
    
    
}
