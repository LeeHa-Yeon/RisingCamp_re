//
//  RankViewController.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/12/02.
//

import UIKit
import Then
import SnapKit

class RankViewController: UIViewController {
    
    var rankDict = [String:Any]()
    var nameArr = [String]()
    var scoreArr = [Int]()
    var tempDict = [String:Int]()
    
    var currentUserNicName = String()
    
    //MARK: - UIComponents
    
    private lazy var tableView = UITableView(frame: CGRect.zero, style: .insetGrouped).then {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .brown
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(RankCell.self, forCellReuseIdentifier: RankCell.identifier)
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 60
    }
    
    private lazy var backBtn = UIButton().then {
        $0.setTitle("홈으로가기", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()
        setNavigationItem()
        setTableView()
        setUI()
        
    }
    
    //MARK: - Functions
    
    func loadUserInfo(){
        if UserDefaults.standard.dictionary(forKey: Constatns.RANK_INFO) == nil {
            rankDict = [String:Any]()
        } else {
            rankDict = UserDefaults.standard.dictionary(forKey: Constatns.RANK_INFO) as! [String:Int]
            
            // 각각 이름배열, 점수배열 -> 이 둘을 합친 임시배열 만드는 과정
            nameArr = Array(rankDict.keys)
            for value in rankDict.values {
                scoreArr.append(value as! Int)
            }
            for i in 0..<nameArr.count {
                tempDict[nameArr[i]] = scoreArr[i]
            }
        }
        currentUserNicName = UserDefaults.standard.string(forKey: Constatns.USER_NICNAME) ?? "값이없음"
    }
    
    func setNavigationItem(){
        navigationItem.title = "랭킹정보"
    }
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
        }
    }
    
    func setUI(){
        view.backgroundColor = .brown
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(120)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(50)
        }
    }

    //MARK: - objc Functions
    
    @objc func backBtnTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
