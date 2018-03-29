//
//  ITunesSearchAPIParamsBuilder.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/29.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

class ITunesSearchAPIParamsBuilder {
    static func create(term: String) -> [String: Any] {
        var params = [String: Any]()
        params["term"] = term
        params["media"] = "music"
        
        return params
    }
}
