//
//  SubwayResponse.swift
//  APITest
//
//  Created by 이하연 on 2021/12/28.
//


struct SubwayResponse: Decodable {
    let meta: MetaData
    let documents : [SubwayDocument]
    
}

struct MetaData: Codable{
    let total_count: Int  // 검색된 문서 수
    let pageable_count: Int  // total_count 중 노출 가능 문서 수
    let is_end: Bool  // 마지막 페이지 여부
}

struct SubwayDocument: Codable{
    let category_group_code: String
    let place_name: String
    let x: String
    let y: String
}
