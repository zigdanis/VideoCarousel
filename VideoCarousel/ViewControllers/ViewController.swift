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
    let videoFramesVM = VideoFramesViewModel()
    var didInitialScroll = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appPink
        setupTopCarousel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !didInitialScroll {
            let ip = IndexPath(item: BigNumber/2, section: 0)
            topCarousel.scrollToItem(at: ip, at: .centeredHorizontally, animated: false)
            topCarousel.contentOffset = videoFramesVM.topLayout.targetContentOffset(forProposedContentOffset: topCarousel.contentOffset, withScrollingVelocity: .zero)
            didInitialScroll = true
        }
    }
    
    private func setupTopCarousel() {
        topCarousel = UICollectionView(frame: .zero, collectionViewLayout: videoFramesVM.topLayout)
        topCarousel.translatesAutoresizingMaskIntoConstraints = false
        topCarousel.dataSource = videoFramesVM.framesProvider
        topCarousel.delegate = videoFramesVM.topLayout
        topCarousel.backgroundColor = UIColor.black
        topCarousel.decelerationRate = UIScrollViewDecelerationRateFast
        topCarousel.layer.cornerRadius = Rounding
        let nib = UINib(nibName: VideoFrameCellIdentifier, bundle: nil)
        topCarousel.register(nib, forCellWithReuseIdentifier: VideoFrameCellIdentifier)
        
        view.addSubview(topCarousel)
        let consts = [
            topCarousel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 25),
            topCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            topCarousel.widthAnchor.constraint(equalTo: topCarousel.heightAnchor, multiplier: 4.3)
        ]
        NSLayoutConstraint.activate(consts)
    }

}

