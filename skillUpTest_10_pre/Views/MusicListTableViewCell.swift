//
//  MusicListTableViewCell.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/30.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit

class MusicListTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var item: Track? {
        didSet {
            set(track: item)
        }
    }
    
    private func set(track: Track?) {
        trackNameLabel.text = track?.trackName
    }


}
