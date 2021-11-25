//
//  ExhibitionVC + CollectionView.swift
//  ExhibitionApp
//
//  Created by 이하연 on 2021/11/26.
//

import UIKit
import Kingfisher

//MARK: - DataSource
extension ExhibitionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return documents.count
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
        cell.dummyData() // 임시
        if let url: URL = URL(string: self.documents[indexPath.row].image_url){
            cell.exhibitionImgView.kf.indicatorType = .activity
            cell.exhibitionImgView.kf.setImage(with:url)
        }
        return cell
    }
    
    
}

//MARK: - Delegate
extension ExhibitionViewController: UICollectionViewDelegate {
    
}

//MARK: - DelegateFlowLayout
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
