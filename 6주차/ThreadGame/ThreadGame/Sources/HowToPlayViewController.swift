//
//  HowToPlayViewController.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/12/01.
//

import UIKit

class HowToPlayViewController: UIViewController {

    //MARK: - UIComponents
    private lazy var contentView = UIView().then {
        $0.backgroundColor = .brown
    }
    
    private lazy var footerView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private lazy var confirmBtn = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.addTarget(self, action: #selector(moveToStartVC), for: .touchUpInside)
        $0.backgroundColor = #colorLiteral(red: 0.8204259872, green: 0.6554511786, blue: 0.4127198458, alpha: 1)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK: - Functions
    func setUI(){
        self.view.addSubview(contentView)
        self.view.addSubview(footerView)
        footerView.addSubview(confirmBtn)
        
        self.contentView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(0.0)
            $0.bottom.equalTo(footerView.snp.top)
        }
        
        self.footerView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(0.0)
            $0.height.equalTo(80.0)
        }
        
        confirmBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview().inset(130)
            $0.centerY.equalToSuperview()
        }
    }
    
    //MARK: - objc Functions
    
    @objc func moveToStartVC(){
        self.dismiss(animated: true, completion: nil)
    }
 
}
