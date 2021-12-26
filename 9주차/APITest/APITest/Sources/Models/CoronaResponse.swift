//
//  CoronaRequest.swift
//  APITest
//
//  Created by 이하연 on 2021/12/26.
//


struct CoronaResponse: Decodable {
    let korea: countryInfo
    let seoul: countryInfo
    let busan: countryInfo
    let daegu: countryInfo
    let incheon: countryInfo
    let gwangju: countryInfo
    let daejeon: countryInfo
    let ulsan: countryInfo
    let sejong: countryInfo
    let gyeonggi: countryInfo
    let gangwon: countryInfo
    let chungbuk: countryInfo
    let chungnam: countryInfo
    let jeonbuk: countryInfo
    let jeonnam: countryInfo
    let gyeongbuk: countryInfo
    let gyeongnam: countryInfo
    let jeju: countryInfo
}

struct countryInfo: Decodable {
    let countryName : String
    let newCase : String
    let totalCase : String
    let recovered : String
    let death : String
    let percentage : String
    let newCcase : String
    let newFcase : String
}
