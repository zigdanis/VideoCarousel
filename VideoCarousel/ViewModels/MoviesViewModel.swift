//
//  GenresViewModel.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class MoviesViewModel {
    
    let collectionView: UICollectionView
    let videoFramesVM: VideoFramesViewModel
    
    private let provider: MoviesProvider
    private let layout: MoviesLayout
    private let db = DisposeBag()
    
    init(videoFramesVM: VideoFramesViewModel) {
        self.videoFramesVM = videoFramesVM
        let movies: [Movie] = [
            Movie(name: "Deadpool", image: UIImage(named:"action-1"), genre: .Action)!,
            Movie(name: "Iron man 2", image: UIImage(named:"action-2"), genre: .Action)!,
            Movie(name: "Tron", image: UIImage(named:"action-3"), genre: .Action)!,
            Movie(name: "Race", image: UIImage(named:"action-4"), genre: .Action)!,
            Movie(name: "Avengers", image: UIImage(named:"action-5"), genre: .Action)!,
            Movie(name: "Star Wars", image: UIImage(named:"action-6"), genre: .Action)!,
            Movie(name: "Saw 6", image: UIImage(named:"horror"), genre: .Horror)!,
            Movie(name: "Lego Movie", image: UIImage(named:"comedy"), genre: .Comedy)!,
            Movie(name: "The Revenant", image: UIImage(named:"drama"), genre: .Drama)!,
            Movie(name: "The Rite", image: UIImage(named:"thriller"), genre: .Thriller)!
        ]
        provider = MoviesProvider(movies: movies, genre: .Action)
        layout = MoviesLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        setupCollectionView()
        
        videoFramesVM.selectedGenre
            .subscribe(onNext: { genre in
                self.provider.updateSelectedMovies(for: genre)
                self.collectionView.reloadData()
            })
            .disposed(by: db)
    }
    
    func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = provider
        collectionView.backgroundColor = UIColor.clear
        collectionView.layer.cornerRadius = Rounding
        let nib = UINib(nibName: MovieCellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MovieCellIdentifier)
    }    
}
