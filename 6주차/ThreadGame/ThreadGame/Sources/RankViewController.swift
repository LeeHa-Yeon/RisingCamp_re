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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()
        setNavigationItem()
        setTableView()
        setUI()
        
    }
    
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
    
    func setUI(){
        view.backgroundColor = .brown
        view.addSubview(backBtn)
        
        backBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(120)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(50)
        }
    }
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
        }
    }
    
    func setNavigationItem(){
        navigationItem.title = "랭킹정보"
    }
    
    @objc func backBtnTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension RankViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankCell.identifier, for: indexPath) as? RankCell else {
            return UITableViewCell()
        }
        let sortedDitionary = tempDict.sorted{ $0.1 > $1.1}
        
        cell.setUI()
        if indexPath.row >= 0 && indexPath.row <= 2 {
            cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            cell.rankNum.textColor = .red
        }
        cell.rankNum.text = "\(indexPath.row+1)위"
        cell.nameLabel.text = sortedDitionary[indexPath.row].key
        cell.scoreLabel.text = "\(sortedDitionary[indexPath.row].value)점"
        
        if sortedDitionary[indexPath.row].key == currentUserNicName {
            cell.checkIng.image = UIImage(named: "체크")
        }
        
        return cell
    }
    
    
}

class RankCell : UITableViewCell {
    static let identifier: String = "rankCell"
    
    lazy var rankNum = UILabel().then {
        $0.text = "순위"
        $0.font = .systemFont(ofSize: 18.0, weight: .semibold)
        $0.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
    
    lazy var nameLabel =  UILabel().then {
        $0.text = "이름"
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.textColor = .black
    }
    
    lazy var scoreLabel = UILabel().then {
        $0.text = "점수"
        $0.font = .systemFont(ofSize: 15.0, weight: .semibold)
        $0.textColor = .systemGray
    }
    
    lazy var checkIng = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    func setUI(){
        [rankNum,nameLabel,scoreLabel,checkIng].forEach { addSubview($0) }
        
        rankNum.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(24.0)
        }
        
        nameLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(rankNum.snp.trailing).inset(-30.0)
        }
        
        scoreLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(nameLabel.snp.trailing).inset(-24.0)
        }
        
        checkIng.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20.0)
            $0.width.height.equalTo(40)
        }
        
    }
    
}

