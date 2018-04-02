//
//  Track.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/29.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import ObjectMapper

class Track: Mappable {
    var trackID = 0
    var trackName = ""
    var artistName = ""
    var artworkUrl100 = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        trackID <- map["trackId"]
        trackName <- map["trackName"]
        artistName <- map["artistName"]
        artworkUrl100 <- map["artworkUrl100"]
    }
}
