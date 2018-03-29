//
//  TrackList.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/29.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import ObjectMapper

class TrackList: Mappable {
    var resultCount = 0
    var results = [Track]()
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results <- map["results"]
    }
}
