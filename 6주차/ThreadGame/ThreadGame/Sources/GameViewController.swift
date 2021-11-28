//
//  GameViewController.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/11/28.
//

import UIKit
import Then
import SnapKit

// final을 붙이는 이유 : 상속이 불가능하도록
final class GameViewController: UIViewController {
    
    //MARK: - UIComponents
    // 상단
    private lazy var headerView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private lazy var logoImg = UIImageView().then {
        $0.image = UIImage(named: "logo2")
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var settingBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "gearshape.2"), for: .normal)
        $0.tintColor = .black
    }
    
    // 내용
    private lazy var contentView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 0.7058739662, green: 0.4313936234, blue: 0.03146447241, alpha: 1)
    }
    
    //TODO: - 이부분을 label로할지, slider로 할지 고민중
    private lazy var timeLabel = UILabel().then {
        $0.text = "시간"
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.textColor = .black
    }
    
    private lazy var scoreLabel = UILabel().then {
        $0.text = "점수"
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.textColor = .black
    }
    
    private lazy var doneLabel = UILabel().then {
        $0.text = "완성된 아이들"
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.textColor = .black
    }
    
    // stackView distribution(x축정렬), alignment(y축정렬)
    lazy var contentStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 30.0
        $0.addArrangedSubview(timeLabel)
        $0.addArrangedSubview(scoreLabel)
        $0.addArrangedSubview(doneLabel)
    }
    
    
    lazy var gardenImgView = UIImageView().then{
        $0.image = UIImage(named: "initGarden")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 30.0
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var entireStackView = UIStackView().then{
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 0.0
        $0.addArrangedSubview(topStackView)
        $0.addArrangedSubview(middleStackView)
        $0.addArrangedSubview(bottomStackView)
    }
    
    // stackView distribution(x축정렬), alignment(y축정렬)
    lazy var topStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.distribution = .equalCentering
        $0.spacing = 0.0
        $0.alignment = .center
        $0.addArrangedSubview(firstPartBtn)
        $0.addArrangedSubview(secondPartBtn)
        $0.addArrangedSubview(thirdPartBtn)
    }
    
    lazy var firstPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "텃밭"), for: .normal)
        $0.setImage(UIImage(named: "새싹"), for: .selected)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var secondPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "텃밭"), for: .normal)
        $0.setImage(UIImage(named: "새싹"), for: .selected)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var thirdPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "텃밭"), for: .normal)
        $0.setImage(UIImage(named: "새싹"), for: .selected)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var middleStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.spacing = 0.0
        $0.addArrangedSubview(fourthPartBtn)
        $0.addArrangedSubview(fifthPartBtn)
        $0.addArrangedSubview(sixthPartBtn)
    }
    
    lazy var fourthPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "텃밭"), for: .normal)
        $0.setImage(UIImage(named: "새싹"), for: .selected)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var fifthPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "텃밭"), for: .normal)
        $0.setImage(UIImage(named: "새싹"), for: .selected)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var sixthPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "텃밭"), for: .normal)
        $0.setImage(UIImage(named: "새싹"), for: .selected)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    
    lazy var bottomStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.spacing = 0.0
        $0.addArrangedSubview(seventhPartBtn)
        $0.addArrangedSubview(eighthPartBtn)
        $0.addArrangedSubview(ninthPartBtn)
    }
    
    lazy var seventhPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "텃밭"), for: .normal)
        $0.setImage(UIImage(named: "새싹"), for: .selected)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var eighthPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "텃밭"), for: .normal)
        $0.setImage(UIImage(named: "새싹"), for: .selected)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var ninthPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "텃밭"), for: .normal)
        $0.setImage(UIImage(named: "새싹"), for: .selected)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var targetImgView = UIImageView().then{
        $0.image = UIImage(named: "양파")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var targetLabel = UILabel().then {
        $0.text = "수확해야하는 갯수 : 3개"
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.textColor = .black
    }
    
    
    // 하단
    private lazy var footerView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
    }
    
    lazy var itemStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.spacing = 0.0
        $0.addArrangedSubview(itemShovel)
        $0.addArrangedSubview(itemSeed)
        $0.addArrangedSubview(itemWater)
        $0.addArrangedSubview(itemHand)
        $0.addArrangedSubview(itemPesticide)
    }
    
    let itemShovel = UIButton().then{
        $0.setImage(UIImage(named: "삽"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    let itemSeed = UIButton().then{
        $0.setImage(UIImage(named: "씨앗"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    let itemWater = UIButton().then{
        $0.setImage(UIImage(named: "물뿌리개"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    let itemHand = UIButton().then{
        $0.setImage(UIImage(named: "수확"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    let itemPesticide = UIButton().then{
        $0.setImage(UIImage(named: "해충제"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    //MARK: - Functions
    
    func setUI(){
        self.view.addSubview(headerView)
        headerView.addSubview(logoImg)
        headerView.addSubview(settingBtn)
        
        self.view.addSubview(contentView)
        contentView.addSubview(contentStackView)
        contentView.addSubview(gardenImgView)
        contentView.addSubview(entireStackView)
        contentView.addSubview(targetImgView)
        contentView.addSubview(targetLabel)
        
        self.view.addSubview(footerView)
        footerView.addSubview(itemStackView)
        
        
        // 상단, 내용, 하단뷰의 제약조건을 설정
        self.headerView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().offset(0.0)
            $0.height.equalTo(120.0)
        }
        
        // headerView안에 존재하는 Component 설정
        logoImg.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200.0)
            $0.height.equalTo(120.0)
        }
        
        settingBtn.snp.makeConstraints{
            $0.leading.equalTo(logoImg.snp.trailing).offset(50.0)
            $0.bottom.equalTo(logoImg.snp.bottom)
            $0.width.height.equalTo(50.0) // 시스템 이미지라 크기 지정이 안먹음
        }
        
        self.contentView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom)
            $0.bottom.equalTo(footerView.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        // contentView안에 존재하는 Component 설정
        contentStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(40.0)
            $0.centerX.equalToSuperview()
        }
        
        
        gardenImgView.snp.makeConstraints{
            $0.top.equalTo(contentStackView.snp.bottom).offset(30.0)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(300.0)
        }
        
        entireStackView.snp.makeConstraints{
            $0.top.equalTo(gardenImgView.snp.top)
            $0.leading.equalTo(gardenImgView.snp.leading)
            $0.width.equalTo(300.0)
            $0.height.equalTo(300.0)
        }
        
        firstPartBtn.snp.makeConstraints{
            $0.width.height.equalTo(100.0)
        }
        secondPartBtn.snp.makeConstraints{
            $0.width.height.equalTo(100.0)
        }
        thirdPartBtn.snp.makeConstraints{
            $0.width.height.equalTo(100.0)
        }
        fourthPartBtn.snp.makeConstraints{
            $0.width.height.equalTo(100.0)
        }
        fifthPartBtn.snp.makeConstraints{
            $0.width.height.equalTo(100.0)
        }
        sixthPartBtn.snp.makeConstraints{
            $0.width.height.equalTo(100.0)
        }
        seventhPartBtn.snp.makeConstraints{
            $0.width.height.equalTo(100.0)
        }
        eighthPartBtn.snp.makeConstraints{
            $0.width.height.equalTo(100.0)
        }
        ninthPartBtn.snp.makeConstraints{
            $0.width.height.equalTo(100.0)
        }
        
        targetImgView.snp.makeConstraints{
            $0.top.equalTo(entireStackView.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview().offset(-70.0)
            $0.width.height.equalTo(60.0)
        }
        targetLabel.snp.makeConstraints{
            $0.bottom.equalTo(targetImgView.snp.bottom).offset(-20.0)
            $0.leading.equalTo(targetImgView.snp.trailing).offset(15.0)
        }
        
        self.footerView.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.trailing.equalToSuperview().offset(0.0)
            $0.height.equalTo(200.0)
        }
        
        itemStackView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.width.equalTo(300.0)
            $0.height.equalTo(50.0)
        }
        
        itemShovel.snp.makeConstraints{
            $0.width.height.equalTo(50.0)
        }
        
        itemSeed.snp.makeConstraints{
            $0.width.height.equalTo(50.0)
        }
        
        itemWater.snp.makeConstraints{
            $0.width.height.equalTo(50.0)
        }
        
        itemHand.snp.makeConstraints{
            $0.width.height.equalTo(50.0)
        }
        
        itemPesticide.snp.makeConstraints{
            $0.width.height.equalTo(50.0)
        }
        
        
        
        
    }
    
}
