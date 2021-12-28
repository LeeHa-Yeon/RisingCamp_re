//
//  CoronaAPIManager.swift
//  APITest
//
//  Created by 이하연 on 2021/12/27.
//

import UIKit
import Alamofire

class CoronaAPIManager{
    static let shared = CoronaAPIManager()
    private init() {}
    
    func requestCoronaCountryInfo(completion: @escaping (CoronaResponse)->(Void)){
        let requestURL = "https://api.corona-19.kr/korea/country/new/"
        let para = [
            "serviceKey" : "swSRfKpvFH2VADokn5XWhrBItUg9C4b6q"
        ]
        
        AF.request(requestURL, method: .get, parameters: para).validate().responseDecodable(of: CoronaResponse.self) { (response) in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}
