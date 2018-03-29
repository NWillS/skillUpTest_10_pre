//
//  ThumbnailDto.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/29.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import RealmSwift

class ThumbnailDto: Object {
    @objc dynamic var trackID = 0
    @objc dynamic var image: Data?
    
    override static func primaryKey() -> String? {
        return "trackID"
    }
}
