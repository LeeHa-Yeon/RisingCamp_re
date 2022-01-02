//
//  TestViewController.swift
//  APITest
//
//  Created by 이하연 on 2021/12/27.
//

import UIKit

class CoronaViewController: UIViewController {
    
    let coronaManager = CoronaAPIManager.shared
    
    @IBOutlet weak var seoulBtn: UIButton!
    @IBOutlet weak var gangwonBtn: UIButton!
    @IBOutlet weak var incheonBtn: UIButton!
    @IBOutlet weak var gyeonggiBtn: UIButton!
    @IBOutlet weak var chungbukBtn: UIButton!
    @IBOutlet weak var chungnamBtn: UIButton!
    @IBOutlet weak var sejongBtn: UIButton!
    @IBOutlet weak var gyeongbukBtn: UIButton!
    @IBOutlet weak var daeguBtn: UIButton!
    @IBOutlet weak var jeonbukBtn: UIButton!
    @IBOutlet weak var gyeongnamBtn: UIButton!
    @IBOutlet weak var daejeonBtn: UIButton!
    @IBOutlet weak var jeonnamBtn: UIButton!
    @IBOutlet weak var ulsanBtn: UIButton!
    @IBOutlet weak var busanBtn: UIButton!
    @IBOutlet weak var gwangjuBtn: UIButton!
    @IBOutlet weak var jejuBtn: UIButton!
    
    @IBOutlet weak var newCnt: UILabel!
    @IBOutlet weak var totalCnt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coronaManager.requestCoronaCountryInfo { response in
            self.seoulBtn.setTitle(response.seoul.newCase, for: .normal)
            self.gangwonBtn.setTitle(response.gangwon.newCase, for: .normal)
            self.incheonBtn.setTitle(response.incheon.newCase, for: .normal)
            self.gyeonggiBtn.setTitle(response.gyeonggi.newCase, for: .normal)
            self.chungbukBtn.setTitle(response.chungbuk.newCase, for: .normal)
            self.chungnamBtn.setTitle(response.chungnam.newCase, for: .normal)
            self.sejongBtn.setTitle(response.sejong.newCase, for: .normal)
            self.gyeongbukBtn.setTitle(response.gyeongbuk.newCase, for: .normal)
            self.daeguBtn.setTitle(response.daegu.newCase, for: .normal)
            self.jeonbukBtn.setTitle(response.jeonbuk.newCase, for: .normal)
            self.daejeonBtn.setTitle(response.daejeon.newCase, for: .normal)
            self.jeonnamBtn.setTitle(response.jeonnam.newCase, for: .normal)
            self.ulsanBtn.setTitle(response.ulsan.newCase, for: .normal)
            self.busanBtn.setTitle(response.busan.newCase, for: .normal)
            self.gwangjuBtn.setTitle(response.gwangju.newCase, for: .normal)
            self.jejuBtn.setTitle(response.jeju.newCase, for: .normal)
            
            self.gyeongnamBtn.setTitle(response.gyeongnam.newCase, for: .normal)
                
            self.newCnt.text = response.korea.newCase + "명"
            self.totalCnt.text = response.korea.totalCase + "명"
            
        }
        
    }

}
