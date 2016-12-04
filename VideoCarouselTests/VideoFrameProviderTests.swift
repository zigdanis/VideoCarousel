//
//  VideoFrameProvider.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import XCTest
@testable import VideoCarousel

class VideoFrameProviderTests: XCTestCase {
    
    var provider: VideoFrameProvider!
    var videoFrame: VideoFrame!
    
    override func setUp() {
        super.setUp()
        videoFrame = VideoFrame(image: UIImage(named:"close-winter"), genre: .Action)
        provider = VideoFrameProvider(frames: [videoFrame!])
    }

    func testCanMakeVideoFrameProviderWith1Frame() {
        XCTAssertNotNil(provider, "Provider should be created with valid videoFrame")
    }
    
    func testFailingToCreateProviderWIthoutVideoFrames() {
        let provider = VideoFrameProvider(frames: [])
        XCTAssertNil(provider, "Provider should not be created with empty array")
    }
    
    func testReturningExistingVideoFrameForIndex0() {
        let index = 0
        let frame = provider.itemAtIndex(index: index)
        XCTAssertEqual(frame.title, videoFrame.title, "Items should be Equal")
    }
    
    func testReturningExistingVideoFrameForIndexMinus9() {
        let index = -9
        let frame = provider.itemAtIndex(index: index)
        XCTAssertEqual(frame.title, videoFrame.title, "Items should be Equal")
    }
    
    func testReturningSecondFrameForIndexMinus3() {
        let index = -3
        let secondFrame = VideoFrame(image: videoFrame.image, genre: .Action)
        let frames = [videoFrame!, secondFrame!]
        provider = VideoFrameProvider(frames: frames)
        let frame = provider.itemAtIndex(index: index)
        XCTAssertEqual(frame.title, secondFrame!.title, "Items should be Equal")
    }
}
