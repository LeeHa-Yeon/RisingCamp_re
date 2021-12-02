//
//  RankCell.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/12/03.
//
import UIKit

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
