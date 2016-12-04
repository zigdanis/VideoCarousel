//
//  VideoFramesViewModel.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class VideoFramesViewModel {

    private let disposeBag = DisposeBag()
    private let videoFrame: Observable<VideoFrame>
    
    let framesProvider: VideoFrameProvider
    let topLayout = CarouselLayout()
    let selectedGenre: Observable<Genre>
    
    init() {
        let frame = VideoFrame(title: "Horror", image: UIImage(named: "close-winter"), genre: .Horror)
        let provider = VideoFrameProvider(frames: [frame!])!
        framesProvider = provider
        videoFrame = topLayout.selectedIndexPath.asObservable()
            .filter{ $0 != nil }
            .distinctUntilChanged(==)
            .map{ indexPath -> VideoFrame in
                guard let ip = indexPath else { throw NSError.parsingError }
                return provider.itemAtIndex(index: ip.item)
            }
        selectedGenre = videoFrame.map{$0.genre}
    }
    
}
