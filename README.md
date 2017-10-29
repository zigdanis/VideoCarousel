[![Build Status](https://travis-ci.org/zigdanis/VideoCarousel.svg?branch=master)](https://travis-ci.org/zigdanis/VideoCarousel)

Video Carousel
==============
App shows predefined list of genres that is implemented as infinte looped scrollable collection. Selected Genre item controls which movie previews will be shown underneath genres list.

To edit list of genres:
--------
* Open `VideoFramesViewModel.swift` file
* In the `init()` add or remove `VideoFrame` entries to the `frames` array. There should be at least 1 entry.

To edit list of movies:
--------
* Open `MoviesViewModel.swift` file
* In the `init()` add or remove `Movie` entries to the `movies` array.