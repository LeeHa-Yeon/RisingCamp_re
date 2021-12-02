//
//  MakeNicNameViewController.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/12/02.
//

import UIKit
import Then
import SnapKit

class MakeNicNameViewController: UIViewController {

    //MARK: - UIComponents
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        namingAlert()
        print("반가워")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("안녕")
    }
    
    
    //MARK: - Functions
    
    func namingAlert(){
        let alert = UIAlertController(title: "닉네임 작성", message: "게임 입장하기전 닉네임을 써주세요.", preferredStyle: .alert)
        alert.addTextField { myTextField in
            myTextField.placeholder = "이름없음"
        }
        let okBtn = UIAlertAction(title: "결정", style: .default) { _ in
            UserDefaults.standard.set(alert.textFields?[0].text, forKey: Constatns.USER_NICNAME)
            let gameVC = GameViewController()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC,animated: true,completion: nil)
        }
        let cancleBtn = UIAlertAction(title: "취소", style: .cancel) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okBtn)
        alert.addAction(cancleBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
