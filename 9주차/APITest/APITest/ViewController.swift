//
//  ViewController.swift
//  APITest
//
//  Created by 이하연 on 2021/12/18.
//

import UIKit

class ViewController: UIViewController {
    
    let coronaManager = CoronaAPIManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        coronaManager.requestCoronaCountryInfo { response in
            print(response)
        }
    }


}

