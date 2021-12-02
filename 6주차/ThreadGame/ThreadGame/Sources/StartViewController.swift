//
//  StartViewController.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/12/01.
//

import UIKit
import SnapKit
import Then

class StartViewController: UIViewController {
    
    //MARK: - Conponents
    
    private lazy var bgImg = UIImageView().then {
        $0.image = UIImage(named: "시작화면")
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var gameBtn = UIButton().then {
        $0.setTitle("게임시작", for: .normal)
        $0.addTarget(self, action: #selector(moveToMakeNicVC), for: .touchUpInside)
        $0.backgroundColor = #colorLiteral(red: 0.9808887839, green: 0.5895134807, blue: 0.1317638457, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    private lazy var howBtn = UIButton().then {
        $0.setTitle("게임방법", for: .normal)
        $0.addTarget(self, action: #selector(moveToHowVC), for: .touchUpInside)
        $0.backgroundColor = #colorLiteral(red: 0.8250104189, green: 0.6552423239, blue: 0.4125419259, alpha: 1)
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
        self.view.addSubview(bgImg)
        self.view.addSubview(gameBtn)
        self.view.addSubview(howBtn)
        
        bgImg.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        gameBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview().inset(100)
            $0.top.equalToSuperview().inset(570)
        }
        
        howBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview().inset(100)
            $0.top.equalTo(gameBtn.snp.bottom).inset(-50)
            
        }
    }
    
    //MARK: - objc Functions
    
    @objc func moveToMakeNicVC(){
        let makeNicNameVC = MakeNicNameViewController()
        makeNicNameVC.modalPresentationStyle = .fullScreen
        self.present(makeNicNameVC,animated: true,completion: nil)
        Constatns.isStart = true
    }
    
    @objc func moveToHowVC(){
        let howToPlayVC = HowToPlayViewController()
        howToPlayVC.modalPresentationStyle = .fullScreen
        self.present(howToPlayVC,animated: true,completion: nil)
    }
    
}
