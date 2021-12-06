//
//  SettingViewController.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/12/05.
//

import UIKit

class SettingViewController: UIViewController {
    
    //MARK: - Components
    private lazy var confirmBtn = UIButton().then {
        $0.setTitle("적용", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(confirmBtnTapped), for: .touchUpInside)
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.frame = CGRect(x: 70, y: 300, width: 300 , height: 300)
    }
    
    //MARK: - Functions
    
    func setUI(){
        view.backgroundColor = .gray
        view.addSubview(confirmBtn)
        
        confirmBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    
    //MARK: - objc Functions
    
    @objc func confirmBtnTapped(){
        self.dismiss(animated: true, completion: nil)
    }

}
