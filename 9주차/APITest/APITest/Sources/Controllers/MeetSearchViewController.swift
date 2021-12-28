//
//  MeetSearchViewController.swift
//  APITest
//
//  Created by 이하연 on 2021/12/28.
//

import UIKit

class MeetSearchViewController: UIViewController {
    
    let kakaoManager = KaKaoAPIManager.shared
    var subwayQuery = String()
    
    @IBOutlet var subwayTextField: UITextField! {
        didSet{
            subwayTextField.delegate = self
        }
    }
    
    @IBAction func testBtn(_ sender: Any) {
        guard let subwayQuery = subwayTextField.text else {
            return
        }
        
        kakaoManager.requestSubwayInfo(query: subwayQuery) { response in
            print(response.documents)
            self.kakaoManager.requestAroundCategory(category_group_code: "CE7", x: response.documents[0].x, y: response.documents[0].y) { response2 in
                print(response2.documents)
            }
        }
        
        
    }
    @IBOutlet weak var testLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension MeetSearchViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}
