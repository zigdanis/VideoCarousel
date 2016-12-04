//
//  MovieTests.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import XCTest
@testable import VideoCarousel

class MovieTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testMovieAvengersBeforeTerminator() {
        let avengers = Movie(name: "Avengers", image: UIImage(named:"action-1"), genre: .Action)!
        let terminator = Movie(name: "Terminator", image: UIImage(named:"action-1"), genre: .Action)!
        XCTAssertTrue(avengers<terminator, "Avengers should be Sorted ascending to Terminator")
    }
    
}
