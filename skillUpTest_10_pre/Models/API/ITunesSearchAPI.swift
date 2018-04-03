//
//  ITunesSearchAPI.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/29.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ITunesSearchAPIDelegate: class {
    func received(trackList: TrackList)
    func offline()
}

final class ITunesSearchAPI {
    weak var delegate: ITunesSearchAPIDelegate?
    
    func search(term: String) {
        if !APIClient.isReachable() {
            delegate?.offline()
            return
        }
        let router = Router.search(ITunesSearchAPIParamsBuilder.create(term: term))
        APIClient().request(router: router) { [weak self] response in
            switch response {
            case .success(let result):
                guard let trackList = Mapper<TrackList>().map(JSONObject: result) else {
                    return
                }
                self?.delegate?.received(trackList: trackList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
