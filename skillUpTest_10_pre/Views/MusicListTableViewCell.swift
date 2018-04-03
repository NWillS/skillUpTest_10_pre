//
//  MusicListTableViewCell.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/30.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Kingfisher
import UIKit

class MusicListTableViewCell: UITableViewCell {
    @IBOutlet weak private var thumbnailImageView: UIImageView?
    @IBOutlet weak private var trackNameLabel: UILabel?
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var item: Track? {
        didSet {
            set(track: item)
        }
    }
    
    private func set(track: Track?) {
        trackNameLabel?.text = track?.trackName
        guard let track = track else {
            return
        }
        
        if let thumbnail = ThumbnailDao.findByName(trackID: track.trackID) {
            guard  let image: UIImage = UIImage(data: thumbnail.image as Data) else {
                return
            }
            thumbnailImageView?.image = image
            return
        }
        
        let url = URL(string: track.artworkUrl100)
        DispatchQueue.main.async {
            self.thumbnailImageView?.kf.setImage(with: url)
        }
        guard let image = thumbnailImageView?.image else {
            return
        }

        ThumbnailDao.addThumbnail(trackID: track.trackID, image: image)
    }
}

extension Kingfisher where Base: ImageView {
    @discardableResult
    public func setCircleMaskedImage(with resource: Resource?,
                                     placeholder: Placeholder? = nil,
                                     options: KingfisherOptionsInfo? = nil,
                                     progressBlock: DownloadProgressBlock? = nil,
                                     completionHandler: CompletionHandler? = nil) -> RetrieveImageTask {
        let scale = UIScreen.main.scale
        let size = base.bounds.size.applying(CGAffineTransform(scaleX: scale, y: scale))
        let resizing = ResizingImageProcessor(referenceSize: size, mode: .aspectFill)
        let roundCorner = RoundCornerImageProcessor(cornerRadius: size.width / 2.0,
                                                    targetSize: size,
                                                    roundingCorners: .all,
                                                    backgroundColor: base.backgroundColor)
        let imageProcess = DefaultImageProcessor().append(another: resizing).append(another: roundCorner)
        let items: KingfisherOptionsInfo = [.processor(imageProcess)]
        return setImage(with: resource,
                        placeholder: placeholder,
                        options: items + (options ?? []),
                        progressBlock: progressBlock,
                        completionHandler: completionHandler)
    }
}
