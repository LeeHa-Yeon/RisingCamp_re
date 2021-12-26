//
//  CoronaRequest.swift
//  APITest
//
//  Created by 이하연 on 2021/12/26.
//


struct CoronaResponse: Decodable {
    let localName: korea
}

struct korea: Decodable {
    let countryName : String
    let newCase : String
    let totalCase : String
    let recovered : String
    let death : String
    let percentage : String
    let newCcase : String
    let newFcase : String
}
