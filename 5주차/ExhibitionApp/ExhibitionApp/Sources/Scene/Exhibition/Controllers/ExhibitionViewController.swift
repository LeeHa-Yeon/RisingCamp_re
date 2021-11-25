//
//  ExhibitionViewController.swift
//  ExhibitionApp
//  색상 쓰는 방법 #colorLiteral(
//  Created by 이하연 on 2021/11/25.
//

import UIKit
import SnapKit
import Then

final class ExhibitionViewController: UIViewController {
    
    private let layout = UICollectionViewFlowLayout().then{
        $0.minimumLineSpacing = 10 // 위아래 간격 최소값
        $0.minimumInteritemSpacing = 10 // 좌우 간격 최소값
    }

    private lazy var collecionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .clear
        $0.register(ExhibitionCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ExhibitionCollectionHeaderView.identifier)
        $0.register(ExhibitionCell.self, forCellWithReuseIdentifier: ExhibitionCell.identifier)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollecionView()
    }
    
    //MARK: - Functions
    func setCollecionView(){
        view.addSubview(collecionView)
        collecionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension ExhibitionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    // Header ,Footer의 뷰를 리턴해주는 메소드
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader, let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ExhibitionCollectionHeaderView.identifier, for: indexPath) as? ExhibitionCollectionHeaderView else {
             return UICollectionReusableView()
        }
        header.setUI()
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exhibitionCell", for: indexPath) as? ExhibitionCell else {
            return UICollectionViewCell()
        }
        cell.setUI()
        cell.dummyData()
        return cell
    }
    
    
}

extension ExhibitionViewController: UICollectionViewDelegate {
    
}

extension ExhibitionViewController: UICollectionViewDelegateFlowLayout {
    
    // CollectionHeader Size를 직접 정해줘야됨
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let margin = 16.0
        let width = collectionView.frame.width - (2 * margin)
        let height = 100.0
        
        return CGSize(width: width, height: height)
    }
    
    // CollecionHeader와 Cell 사이의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let value: CGFloat = 16.0
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin = 16.0
        let width = collectionView.frame.width - (2 * margin)
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
}
