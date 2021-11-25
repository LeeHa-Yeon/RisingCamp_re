//
//  ExhibitionCell.swift
//  ExhibitionApp
//
//  Created by 이하연 on 2021/11/25.
//
import UIKit
import SnapKit
import Then

final class ExhibitionCell: UICollectionViewCell {
    static let identifier: String = "exhibitionCell"
    
    lazy var exhibitionImgView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        // 이미지뷰보다 이미지가 클 때 벗어나기에 설정해둔 것
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12.0
        $0.backgroundColor = #colorLiteral(red: 1, green: 0.7379342914, blue: 1, alpha: 1)
    }
    
    lazy var subTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.textColor = .white
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.textColor = .gray
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .brown
    }
    
    
    //MARK: - Functions
    
    func dummyData(){
        titleLabel.text = "포메라니안"
        descriptionLabel.text = "설명설명"
    }
    
    
    func setUI(){
        setShadow()
        // 이 부분 순서대로 계층적으로 쌓이는듯
        [exhibitionImgView,titleLabel, subTitleLabel, descriptionLabel].forEach { addSubview($0) }
        
        exhibitionImgView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.top.equalToSuperview().inset(24.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(subTitleLabel)
            $0.trailing.equalTo(subTitleLabel)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(4.0)
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.bottom.equalToSuperview().inset(24.0)
        }
        
    }
    
    func setShadow(){
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 10

    }
}

private extension ExhibitionCell {
    
}
