//
//  ModalViewController.swift
//  APITest
//
//  Created by 이하연 on 2022/01/02.
//

import UIKit
import PanModal


class ModalViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var nameValue = String()
    var phoneValue = String()
    var addressValue = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameValue
        phoneLabel.text = phoneValue
        addressLabel.text = addressValue
        
    }

}

extension ModalViewController: PanModalPresentable {

    // 스크롤되는 tableview 나 collectionview 가 있다면 여기에 넣어주면 PanModal 이 모달과 스크롤 뷰 사이에서 팬 제스처를 원활하게 전환합니다.
    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(280)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(0)
    }
}
