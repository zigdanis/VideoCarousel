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

final class VideoFramesViewModel {

    private let disposeBag = DisposeBag()
    private let videoFrame: Observable<VideoFrame>
    
    let collectionView: UICollectionView
    let provider: VideoFrameProvider
    let layout = CarouselLayout()
    let selectedGenre: Observable<Genre>
    
    init() {
        let frames: [VideoFrame] = [
            VideoFrame(image: UIImage(named: "frame-horror"), genre: .Horror)!,
            VideoFrame(image: UIImage(named: "frame-comedy"), genre: .Comedy)!,
            VideoFrame(image: UIImage(named: "frame-action"), genre: .Action)!,
            VideoFrame(image: UIImage(named: "frame-drama"), genre: .Drama)!,
            VideoFrame(image: UIImage(named: "frame-thriller"), genre: .Thriller)!
        ]
        let myProvider = VideoFrameProvider(frames: frames)!
        provider = myProvider
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        videoFrame = layout.selectedIndexPath.asObservable()
            .filter{ $0 != nil }
            .distinctUntilChanged(==)
            .map{ indexPath -> VideoFrame in
                guard let ip = indexPath else { throw NSError.parsingError }
                return myProvider.itemAtIndex(index: ip.item)
            }
        selectedGenre = videoFrame.map{$0.genre}
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = provider
        collectionView.delegate = layout
        collectionView.backgroundColor = UIColor.black
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        collectionView.layer.cornerRadius = Rounding
        let nib = UINib(nibName: VideoFrameCellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: VideoFrameCellIdentifier)
    }
    
}
