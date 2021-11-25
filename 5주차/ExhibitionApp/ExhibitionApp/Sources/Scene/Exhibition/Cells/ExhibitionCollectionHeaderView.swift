//
//  ExhibitionCollecionHeaderView.swift
//  ExhibitionApp
//
//  Created by 이하연 on 2021/11/26.
//

import UIKit
import SnapKit
import Then

final class ExhibitionCollectionHeaderView: UICollectionReusableView {
    
    static let identifier: String = "exhibitionCollectionHeaderViewCell"
    
    private lazy var dateLabel = UILabel().then {
        $0.text = strformatter.string(from: Date())
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.textColor = .secondaryLabel
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "전시회"
        $0.font = .systemFont(ofSize: 36.0, weight: .black)
        $0.textColor = .label
    }
    
    //MARK: - Functions
    
    fileprivate let strformatter = DateFormatter().then {
        $0.dateFormat = "yyyy-MM-dd"
    }
    
    func setUI() {
        [dateLabel,titleLabel].forEach { addSubview($0) }
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(32.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8.0)
        }
    }
}
