//
//  ResultModel.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//

import Foundation

// These models would be in their own classes but as they are very small I decided to place them all in one file

struct MainResult: Codable {
    static var shared: MainResult? = nil
    var sections: [Sections]
}

struct Sections: Codable {
    var name: String?
    var item: [ItemModel]?
    
    enum CodingKeys: String, CodingKey {
        case item = "itemData"
    }
}

struct ItemModel: Codable {
    var meta: MetaModel?
    var media: MediaModel?

    enum CodingKeys: String, CodingKey {
        case meta = "metaData"
        case media = "mediaData"
    }
}

struct MetaModel: Codable {
    var title: String?
    var duration: Int?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case duration = "videoDuration"
        case body = "body"
    }
}

struct MediaModel: Codable {
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "thumbnailUrl"
    }
}
