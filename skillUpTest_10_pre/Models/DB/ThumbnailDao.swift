//
//  ThumbnailDao.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/29.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import RealmSwift
import UIKit

final class ThumbnailDao {
    static let daoHelper = RealmDaoHelper<ThumbnailDto>()
    
    static func addThumbnail(trackID: Int, image: UIImage) {
        let thumbnail = ThumbnailDto()
        
        thumbnail.trackID = trackID
        
        guard let data = UIImagePNGRepresentation(image) else {
            return
        }
        thumbnail.image = data as Data
        
        daoHelper.add(object: thumbnail)
    }
    
    static func findByName(trackID: Int) -> ThumbnailDto? {
        let thumbnail = daoHelper.findFirst(key: trackID as AnyObject)
        return thumbnail
    }
}
