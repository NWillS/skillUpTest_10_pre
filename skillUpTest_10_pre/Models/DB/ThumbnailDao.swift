//
//  ThumbnailDao.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/29.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit
import RealmSwift

final class ThumbnailDao {
    static let daoHelper = RealmDaoHelper<ThumbnailDto>()
    
    static func addThumbnail(id: Int, image: UIImage) {
        let thumbnail = ThumbnailDto()
        
        thumbnail.trackID = id
        
        guard let data = UIImagePNGRepresentation(image) else {
            return
        }
        thumbnail.image = data as Data
        
        daoHelper.add(object: thumbnail)
    }
    
    static func findByName(id: Int) -> ThumbnailDto? {
        let thumbnail = daoHelper.findFirst(key: id as AnyObject)
        return thumbnail
    }
}
