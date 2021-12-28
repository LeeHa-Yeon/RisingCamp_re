//
//  TestViewController.swift
//  APITest
//
//  Created by 이하연 on 2021/12/27.
//

import UIKit

class TestViewController: UIViewController {
    
    let coronaManager = CoronaAPIManager.shared
    
    @IBOutlet weak var seoulBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coronaManager.requestCoronaCountryInfo { response in
            self.seoulBtn.setTitle(response.seoul.newCase, for: .normal)
        }
        
    }

}
