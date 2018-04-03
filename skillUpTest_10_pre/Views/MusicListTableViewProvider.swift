//
//  MusicListTableViewProvider.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/30.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit

class MusicListTableViewProvider: NSObject {
    var musicList: TrackList?
    
    func set(musicList: TrackList) {
        self.musicList = musicList
    }
}

extension MusicListTableViewProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = musicList?.resultCount else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicListTableViewCell.identifier)
            as? MusicListTableViewCell else {
            fatalError("MusicListTableViewCellがありません")
        }
        cell.item = musicList?.results[indexPath.row]
        
        return cell
    }
    
}
