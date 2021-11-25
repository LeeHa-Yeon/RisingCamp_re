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
