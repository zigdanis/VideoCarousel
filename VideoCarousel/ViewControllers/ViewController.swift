//
//  ViewController.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var topCarousel: UICollectionView!
    var topLayout: InfinityCarouselLayout!
    var framesProvider: VideoFrameProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appPink
        setupFramesProvider()
        setupTopCarousel()
    }
    
    private func setupFramesProvider() {
        guard let frame = VideoFrame(title: "Horror", image: UIImage(named: "close-winter")) else {
            assertionFailure("Should be able to create frame with provided image")
            return
        }
        framesProvider = VideoFrameProvider(frames: [frame])
    }
    
    private func setupTopCarousel() {
        topLayout = InfinityCarouselLayout()
        topCarousel = UICollectionView(frame: .zero, collectionViewLayout: topLayout)
        topCarousel.translatesAutoresizingMaskIntoConstraints = false
        topCarousel.dataSource = framesProvider
        topCarousel.backgroundColor = UIColor.black
        topCarousel.decelerationRate = UIScrollViewDecelerationRateFast
        let nib = UINib(nibName: "VideoFrameCell", bundle: nil)
        topCarousel.register(nib, forCellWithReuseIdentifier: VideoFrameCellIdentifier)
        
        view.addSubview(topCarousel)
        let consts = [
            topCarousel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 25),
            topCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            topCarousel.heightAnchor.constraint(equalToConstant: 165)
        ]
        NSLayoutConstraint.activate(consts)
    }

}

