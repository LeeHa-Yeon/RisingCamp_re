//
//  KakaoAPIManager.swift
//  APITest
//
//  Created by 이하연 on 2021/12/28.
//

import Foundation
import Alamofire

protocol KakaoAPIDataSource{
    var HTTP_HEADERS: HTTPHeaders { get }
}

class KaKaoAPIManager: KakaoAPIDataSource {
    static let shared = KaKaoAPIManager()
    private init() {}
    
    var HTTP_HEADERS: HTTPHeaders = ["Authorization":"KakaoAK dfe7e29afa82d94f4df6fabe8556f2c9"]

    // 검색한 지하철역에 대한 위치 정보
    func requestSubwayInfo(query:String,completion: @escaping (SubwayResponse)->(Void)){
        let requestURL = "https://dapi.kakao.com/v2/local/search/keyword.json?"
        let para = [
            "query" : query,
            "category_group_code" : "SW8",
            "size" : 1
        ] as [String : Any]
        
        AF.request(requestURL, method: .get, parameters: para, headers: HTTP_HEADERS).validate().responseDecodable(of: SubwayResponse.self) { (response) in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print("requestSubwayInfo 에러발생 : ",error.localizedDescription)
            }
        }
    }
    
    // 해당 위치의 주변 oo을 검색
    func requestAroundCategory(category_group_code:String,x:String,y:String,completion: @escaping (CategoryResponse)->(Void)){
        let requestURL = "https://dapi.kakao.com/v2/local/search/category.json?"
        let para = [
            "category_group_code" : category_group_code,
            "x" : x,
            "y" : y,
            "radius" : "20000",
            "size" : "15"
        ] as [String : Any]
        
        AF.request(requestURL, method: .get, parameters: para, headers: HTTP_HEADERS).validate().responseDecodable(of: CategoryResponse.self) { (response) in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print("requestAroundCategory 에러발생 : ",error.localizedDescription)
            }
        }
    }

}
