//
//  MeetSearchViewController.swift
//  APITest
//
//  Created by 이하연 on 2021/12/28.
//

import UIKit

class MeetSearchViewController: UIViewController {
    
    let kakaoManager = KaKaoAPIManager.shared
    var subwayQuery:String = ""
    var selectedCategory = String()
    
    @IBOutlet var subwayTextField: UITextField! {
        didSet{
            subwayTextField.delegate = self
        }
    }
    
    @IBOutlet weak var categoryOneBtn: UIButton!
    @IBOutlet weak var categoryTwoBtn: UIButton!
    @IBOutlet weak var categoryThreeBtn: UIButton!
    @IBOutlet weak var categoryFourBtn: UIButton!
    
    
    @IBAction func AD5Tapped(_ sender: Any) {
        categoryOneBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8455840945, blue: 0.6024163365, alpha: 1)
        categoryTwoBtn.backgroundColor = .clear
        categoryThreeBtn.backgroundColor = .clear
        categoryFourBtn.backgroundColor = .clear
        selectedCategory = "AD5"
        print("pq",selectedCategory)
    }
    
    @IBAction func FD6Tapped(_ sender: Any) {
        categoryTwoBtn.backgroundColor =  #colorLiteral(red: 1, green: 0.8455840945, blue: 0.6024163365, alpha: 1)
        categoryOneBtn.backgroundColor = .clear
        categoryThreeBtn.backgroundColor = .clear
        categoryFourBtn.backgroundColor = .clear
        selectedCategory = "FD6"
        print("gp",selectedCategory)
    }
    
    @IBAction func CE7Tapped(_ sender: Any) {
        categoryThreeBtn.backgroundColor =  #colorLiteral(red: 1, green: 0.8455840945, blue: 0.6024163365, alpha: 1)
        categoryOneBtn.backgroundColor = .clear
        categoryTwoBtn.backgroundColor = .clear
        categoryFourBtn.backgroundColor = .clear
        selectedCategory = "CE7"
        print("wp",selectedCategory)
    }
    
    @IBAction func AT4(_ sender: Any) {
        categoryFourBtn.backgroundColor =  #colorLiteral(red: 1, green: 0.8455840945, blue: 0.6024163365, alpha: 1)
        categoryOneBtn.backgroundColor = .clear
        categoryTwoBtn.backgroundColor = .clear
        categoryThreeBtn.backgroundColor = .clear
        selectedCategory = "AT4"
        print("qqq",selectedCategory)
    }
    
    
    
    @IBAction func nextBtn(_ sender: Any) {
        guard let subwayQuery = subwayTextField.text else {
            return
        }
        if subwayQuery == "" {
            blackAlarm(messageStr: "만날 장소를 입력해주세요.")
        }else {
            
            if selectedCategory != "" {
                kakaoManager.requestSubwayInfo(query: subwayQuery) { response in
                    print(response.documents)
                    self.kakaoManager.requestAroundCategory(category_group_code: self.selectedCategory, x: response.documents[0].x, y: response.documents[0].y) { response2 in
                        print(response2.documents)
                    }
                }
            }else {
                blackAlarm(messageStr: "카테고리를 선택해주세요.")
            }
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func blackAlarm(messageStr: String){
        let alert = UIAlertController(title: "빈칸", message: messageStr, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
}

extension MeetSearchViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}
