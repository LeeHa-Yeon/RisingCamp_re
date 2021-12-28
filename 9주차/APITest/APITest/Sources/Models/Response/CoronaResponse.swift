//
//  CoronaRequest.swift
//  APITest
//
//  Created by 이하연 on 2021/12/26.
//


struct CoronaResponse: Decodable {
    let korea: CountryInfo
    let seoul: CountryInfo
    let busan: CountryInfo
    let daegu: CountryInfo
    let incheon: CountryInfo
    let gwangju: CountryInfo
    let daejeon: CountryInfo
    let ulsan: CountryInfo
    let sejong: CountryInfo
    let gyeonggi: CountryInfo
    let gangwon: CountryInfo
    let chungbuk: CountryInfo
    let chungnam: CountryInfo
    let jeonbuk: CountryInfo
    let jeonnam: CountryInfo
    let gyeongbuk: CountryInfo
    let gyeongnam: CountryInfo
    let jeju: CountryInfo
}

struct CountryInfo: Decodable {
    let countryName : String
    let newCase : String
    let totalCase : String
    let recovered : String
    let death : String
    let percentage : String
    let newCcase : String
    let newFcase : String
}
