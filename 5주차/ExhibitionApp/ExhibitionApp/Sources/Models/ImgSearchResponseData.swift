//
//  ImgSearchResponseData.swift
//  ExhibitionApp
//
//  Created by 이하연 on 2021/11/26.
//

import UIKit

struct ImgSearchResponseData: Codable {
    let documents: [Document]
}

struct Document: Codable{
    let image_url: String
    let thumbnail_url: String
}
