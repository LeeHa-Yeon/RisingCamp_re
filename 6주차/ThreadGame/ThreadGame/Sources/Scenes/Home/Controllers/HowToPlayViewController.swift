//
//  HowToPlayViewController.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/12/01.
//

import UIKit
import Then
import SnapKit

class HowToPlayViewController: UIViewController {
    
    //MARK: - UIComponents
    
    private lazy var pageControl = UIPageControl().then {
        $0.numberOfPages = howToImges.count
        
    }
    
    private lazy var scrollView = UIScrollView().then {
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
    }
    
    private lazy var scrollContentsView = UIView().then {
        $0.backgroundColor = .black
    }
    
    var howToImges = [UIImageView]()
    
    private lazy var firstImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "첫번째방법")
        $0.clipsToBounds = true
        howToImges.append($0)
    }
    
    private lazy var secondImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "두번째방법")
        $0.clipsToBounds = true
        howToImges.append($0)
    }
    
    private lazy var thiredImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "세번째방법")
        $0.clipsToBounds = true
        howToImges.append($0)
    }
    
    private lazy var footerView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private lazy var confirmBtn = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.addTarget(self, action: #selector(moveToStartVC), for: .touchUpInside)
        $0.backgroundColor = #colorLiteral(red: 0.8204259872, green: 0.6554511786, blue: 0.4127198458, alpha: 1)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setScrollView()
    }
    
    //MARK: - Functions
    
    func setUI(){
        view.backgroundColor = .black
        let viewFrameWidth = view.frame.width
        let viewFrameHeight = view.frame.height - 130
        
        scrollContentsView.addSubview(firstImg)
        scrollContentsView.addSubview(secondImg)
        scrollContentsView.addSubview(thiredImg)
        scrollView.addSubview(scrollContentsView)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        self.view.addSubview(footerView)
        footerView.addSubview(confirmBtn)
        
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview().offset(0)
        }
        
        firstImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0.0)
            $0.leading.equalToSuperview().inset(viewFrameWidth*CGFloat(0))
            $0.width.equalTo(viewFrameWidth)
            $0.height.equalTo(viewFrameHeight)
        }
        
        secondImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0.0)
            $0.leading.equalToSuperview().inset(viewFrameWidth*CGFloat(1))
            $0.width.equalTo(viewFrameWidth)
            $0.height.equalTo(viewFrameHeight)
        }
        
        thiredImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0.0)
            $0.leading.equalToSuperview().inset(viewFrameWidth*CGFloat(2))
            $0.width.equalTo(viewFrameWidth)
            $0.height.equalTo(viewFrameHeight)
        }
        
        scrollContentsView.snp.makeConstraints{
            $0.edges.equalTo(0)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalTo(viewFrameWidth * CGFloat(howToImges.count))
            $0.height.equalTo(viewFrameHeight)
        }
        
        pageControl.snp.makeConstraints{
            $0.bottom.equalTo(footerView.snp.top).inset(-10)
            $0.centerX.equalToSuperview()
        }
        
        self.footerView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(0.0)
            $0.height.equalTo(80.0)
        }
        
        confirmBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview().inset(130)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setScrollView(){
        scrollView.delegate = self
    }
    
    private func setPageControlSelectedPage(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
    
    
    //MARK: - objc Functions
    
    @objc func moveToStartVC(){
        let transition = CATransition()
        transition.duration = 1.0
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
}

extension HowToPlayViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x / scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}
