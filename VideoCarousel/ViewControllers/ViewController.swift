//
//  ViewController.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 03/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import UIKit
import RxSwift

final class ViewController: UIViewController {

    var topCarousel: UICollectionView!
    var bottomCarousel: UICollectionView!
    let videoFramesVM = VideoFramesViewModel()
    var moviesVM: MoviesViewModel!
    var didInitialScroll = false
    var arrow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appPink
        moviesVM = MoviesViewModel(videoFramesVM: videoFramesVM)
        setupTopCarousel()
        setupArrow()
        setupBottomCarousel()
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
    
    private func setupArrow() {
        let arrowImage = UIImage(named: "arrow")
        arrow = UIImageView(image: arrowImage)
        arrow.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(arrow)
        let consts = [
            arrow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            arrow.topAnchor.constraint(equalTo: topCarousel.bottomAnchor, constant: 36)
        ]
        NSLayoutConstraint.activate(consts)
    }
    
    private func setupBottomCarousel() {
        bottomCarousel = moviesVM.collectionView
        
        view.addSubview(bottomCarousel)
        let consts = [
            bottomCarousel.topAnchor.constraint(equalTo: arrow.bottomAnchor, constant: 36),
            bottomCarousel.leadingAnchor.constraint(equalTo: topCarousel.leadingAnchor),
            bottomCarousel.trailingAnchor.constraint(equalTo: topCarousel.trailingAnchor),
            bottomCarousel.heightAnchor.constraint(equalTo: topCarousel.heightAnchor)
        ]
        NSLayoutConstraint.activate(consts)
    }

}

