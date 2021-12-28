//
//  CategoryResponse.swift
//  APITest
//
//  Created by 이하연 on 2021/12/28.
//

struct CategoryResponse: Decodable {
    let meta: MetaData
    let documents :[CategoryDocument]
}

struct CategoryDocument: Codable{
    let address_name: String
    let phone: String
    let place_name: String
    let place_url: String
    let x: String
    let y: String
}
