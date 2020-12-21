//
//  CollectionViewCell.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDesc: UILabel!
    @IBOutlet weak var videoDuration: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    public func setData(_ meta: MetaModel?, _ media: MediaModel?) {
        videoTitle.text = meta?.title ?? "No title"
        videoDesc.text = meta?.body ?? "No desc"
        videoDuration.text = SharedMethods.getTimeFromMinutes(meta?.duration ?? 0)
        
    }
}
