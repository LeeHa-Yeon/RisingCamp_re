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
    
    var rankDict = [String:Any]()
    
    var orderItemArr = ["시작","삽","씨앗","물뿌리개","수확"]
    var vegetables = ["양파","당근","무","배추","호박","대파"]
    var statusArr = ["초기","초기","초기","초기","초기","초기","초기","초기","초기"]
    var btnStatus = [UIButton]()
    
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
        $0.addTarget(self, action: #selector(settingBtnPressed(_:)), for: .touchUpInside)
    }
    
    // 내용
    private lazy var contentView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 0.7058739662, green: 0.4313936234, blue: 0.03146447241, alpha: 1)
    }
    
    private lazy var nicNameLabel = UILabel().then {
        $0.text = "이름없음"
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.textColor = .black
    }
    
    // 시간
    //TODO: - 나중에 UIProgressView로 바꿀지 고민해보자. ( NO )
    private lazy var timeLabel = UILabel().then {
        $0.text = "\(startTimerNum)초"
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.textColor = .black
    }
    var mainTimer : Timer = Timer()  // 게임 시간
    var startTimerNum: Int = Constatns.GAME_TIME  // 게임 시작 시간
    var isRunning = false // 게임 실행중인지
    
    var partTimer: [Timer] = [Timer(),Timer(),Timer(),Timer(),Timer(),Timer(),Timer(),Timer(),Timer()]
    var partTimerNum:[Int] = [Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME]
    var isTimming:[Bool] = [false,false,false,false,false,false,false,false,false]
    
    private lazy var scoreLabel = UILabel().then {
        $0.text = "\(scoreNum)점"
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.textColor = .black
    }
    var scoreNum: Int = 0
    
    private lazy var doneLabel = UILabel().then {
        $0.text = "내가 수확한 \(harvestTarget) 개수 : \(doneCnt)"
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.textColor = .black
    }
    var doneTarget = ["양파":0,"당근":0,"무":0,"배추":0,"호박":0,"대파":0] // 사용x
    var doneCnt: Int = 0  // 수확한 갯수
    
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
        $0.setImage(UIImage(named: "초기"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.tag = 1
        $0.addTarget(self, action: #selector(partBtnPressed(_:)), for: .touchUpInside)
        btnStatus.append($0)
    }
    
    lazy var secondPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "초기"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.tag = 2
        $0.addTarget(self, action: #selector(partBtnPressed(_:)), for: .touchUpInside)
        btnStatus.append($0)
    }
    
    lazy var thirdPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "초기"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.tag = 3
        $0.addTarget(self, action: #selector(partBtnPressed(_:)), for: .touchUpInside)
        btnStatus.append($0)
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
        $0.setImage(UIImage(named: "초기"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.tag = 4
        $0.addTarget(self, action: #selector(partBtnPressed(_:)), for: .touchUpInside)
        btnStatus.append($0)
    }
    
    lazy var fifthPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "초기"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.tag = 5
        $0.addTarget(self, action: #selector(partBtnPressed(_:)), for: .touchUpInside)
        btnStatus.append($0)
    }
    
    lazy var sixthPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "초기"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.tag = 6
        $0.addTarget(self, action: #selector(partBtnPressed(_:)), for: .touchUpInside)
        btnStatus.append($0)
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
        $0.setImage(UIImage(named: "초기"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.tag = 7
        $0.addTarget(self, action: #selector(partBtnPressed(_:)), for: .touchUpInside)
        btnStatus.append($0)
    }
    
    lazy var eighthPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "초기"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.tag = 8
        $0.addTarget(self, action: #selector(partBtnPressed(_:)), for: .touchUpInside)
        btnStatus.append($0)
    }
    
    lazy var ninthPartBtn = UIButton().then{
        $0.setImage(UIImage(named: "초기"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.tag = 9
        $0.addTarget(self, action: #selector(partBtnPressed(_:)), for: .touchUpInside)
        btnStatus.append($0)
    }
    
    lazy var targetImgView = UIImageView().then{
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    var harvestTarget = String() // 수확 대상
    
    lazy var targetLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.textColor = .black
    }
    var targetCnt = Int() // 수확 개수
    
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
        $0.addTarget(self, action: #selector(itemBtnPressed(_:)), for: .touchUpInside)
        $0.tag = 10
    }
    
    let itemSeed = UIButton().then{
        $0.setImage(UIImage(named: "씨앗"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(itemBtnPressed(_:)), for: .touchUpInside)
        $0.tag = 11
    }
    
    let itemWater = UIButton().then{
        $0.setImage(UIImage(named: "물뿌리개"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(itemBtnPressed(_:)), for: .touchUpInside)
        $0.tag = 12
    }
    
    let itemHand = UIButton().then{
        $0.setImage(UIImage(named: "수확"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(itemBtnPressed(_:)), for: .touchUpInside)
        $0.tag = 13
    }
    
    let itemPesticide = UIButton().then{
        $0.setImage(UIImage(named: "해충제"), for: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(itemBtnPressed(_:)), for: .touchUpInside)
        $0.tag = 14
    }
    
    var selectItem = String()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        startGameTimer()
        randomTarget()
        loadUserInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Functions
    
    func setUI(){
        self.view.addSubview(headerView)
        headerView.addSubview(logoImg)
        headerView.addSubview(settingBtn)
        
        self.view.addSubview(contentView)
        contentView.addSubview(nicNameLabel)
        contentView.addSubview(contentStackView)
        contentView.addSubview(gardenImgView)
        contentView.addSubview(entireStackView)
        contentView.addSubview(targetImgView)
        contentView.addSubview(targetLabel)
        
        self.view.addSubview(footerView)
        footerView.addSubview(itemStackView)

        nicNameLabel.text =  UserDefaults.standard.string(forKey: Constatns.USER_NICNAME)
        
        
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
        
        nicNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(30.0)
            $0.centerX.equalToSuperview()
        }
        
        // contentView안에 존재하는 Component 설정
        contentStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50.0)
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
        
    } // setUI end
    
    // 유저 정보 로드
    func loadUserInfo(){
        if UserDefaults.standard.dictionary(forKey: Constatns.RANK_INFO) == nil {
            rankDict = [String:Any]()
        } else {
            rankDict = UserDefaults.standard.dictionary(forKey: Constatns.RANK_INFO) as! [String:Int]
        }
    }
    
    // 게임 초기화
    func initGame(){
        pauseTimer()
        partTimerNum = [Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME,Constatns.PART_TIME]
        isTimming = [false,false,false,false,false,false,false,false,false]
        statusArr = ["초기","초기","초기","초기","초기","초기","초기","초기","초기"]
        timeLabel.text = "\(Constatns.GAME_TIME)초"
        scoreNum = 0
        scoreLabel.text = "\(scoreNum)점"
        randomTarget()
        doneCnt = 0
        doneLabel.text = "내가 수확한 \(harvestTarget) 개수 : \(doneCnt)"
        for i in 0..<9 {
            btnStatus[i].setImage(UIImage(named: "초기"), for: .normal)
        }
        
    }
    
    // 게임 시작시 타이머 설정
    func startGameTimer() {
        DispatchQueue.global().async { [self] in
            isRunning = true
            let runLoop = RunLoop.current
            
            //타이머 사용값 초기화
            startTimerNum = Constatns.GAME_TIME
            //1초 간격 타이머 시작
            mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
            
            while isRunning {
                runLoop.run(until: Date().addingTimeInterval(0.1))
            }
        }
        
    }
    
    // 랜덤으로 수확대상, 갯수 설정
    func randomTarget(){
        let randomIdx = Int.random(in: 0..<vegetables.count)
        harvestTarget = vegetables[randomIdx]
        targetImgView.image = UIImage(named: harvestTarget)
        
        targetCnt = Int.random(in: 1...4)
        targetLabel.text = "\(harvestTarget) 수확 갯수 : \(targetCnt)"
        
    }
    
    // 점수출력 알림창
    func scoreAlert(){
        rankDict[nicNameLabel.text ?? "이름없음"] = scoreNum
        UserDefaults.standard.set(rankDict, forKey: Constatns.RANK_INFO)
        let alert = UIAlertController(title: "나의 점수", message: "👏🏻 축하합니다 \(scoreNum)점을 획득하셨습니다. 👏🏻", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.alertGameOver()
        }
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    // 게임 종료시 알림창
    func alertGameOver(){
        //타이머 종료 후 알림창 띄우기
        let alert = UIAlertController(title: "게임오버", message: "게임을 다시 시작하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "YES", style: .default) { (action) in
            //TODO: - 게임초기화시켜주는 부분 -> 함수 만들어서 넣어주기
            self.initGame()
            self.startGameTimer()
        }
        let cancleAction = UIAlertAction(title: "NO", style: .cancel) { (action) in
            //TODO: - 게임 처음 화면으로 돌아가기
            Constatns.isStart = false
            self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        }
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        present(alert, animated: false, completion: nil)
    }
    
    // 설정 알림창
    func alertSetting(){
        //타이머 종료 후 알림창 띄우기
        pauseTimer()
        let alert = UIAlertController(title: "게임중단", message: "게임을 계속 플레이 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let resetAction = UIAlertAction(title: "다시시작", style: .default) { (action) in
            //TODO: - 게임초기화시켜주는 부분 -> 함수 만들어서 넣어주기
            self.initGame()
            self.startGameTimer()
        }
        let continueAction = UIAlertAction(title: "계속하기", style: .default) { (action) in
            //TODO: - 게임 이어서하게 만드는 부분 -> 함수 만들어서 넣어주기
            self.rePlayTimer()
        }
        let endAction = UIAlertAction(title: "게임 종료", style: .cancel) { (action) in
            //TODO: - 게임 처음 화면으로 돌아가기
            Constatns.isStart = false
            self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        }
        alert.addAction(resetAction)
        alert.addAction(continueAction)
        alert.addAction(endAction)
        present(alert, animated: false, completion: nil)
    }
    
    // 일시중지일때 타이머 모두 비활성화
    func pauseTimer(){
        mainTimer.invalidate()
        isRunning = false
        
        for i in 0..<9 {
            if isTimming[i] {
                partTimer[i].invalidate()
            }
        }
    }
    
    // 계속하기 눌렀을 때 타이머 다시 재생
    func rePlayTimer(){
        DispatchQueue.global().async { [self] in
            isRunning = true
            let runLoop = RunLoop.current
            
            //1초 간격 타이머 시작
            mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
            
            while isRunning {
                runLoop.run(until: Date().addingTimeInterval(0.1))
            }
        }
        
        for i in 0..<9 {
            if isTimming[i] {
                DispatchQueue.global().async { [self] in
                    isTimming[i] = true
                    
                    let runLoop = RunLoop.current
                    
                    partTimer[i] = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(partTimerCallback(_:)), userInfo: i, repeats: true)
                    
                    while isRunning {
                        runLoop.run(until: Date().addingTimeInterval(0.1))
                    }
                    
                }
            }
        }
    }
    
    // 텃밭 이미지 변경 및 타이머 설정
    func changeImg(status: String, part: Int){
        if (!isTimming[part]){
            // 처음 시작할 경우와 끝이 난 경우
            if status == "초기" && selectItem == "삽" {
                btnStatus[part].setImage(UIImage(named: "텃밭"), for: .normal)
                statusArr[part] = "텃밭"
                
                DispatchQueue.global().async { [self] in
                    isTimming[part] = true
                    
                    let runLoop = RunLoop.current
                    
                    partTimer[part] = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(partTimerCallback(_:)), userInfo: part, repeats: true)
                    
                    while isRunning {
                        runLoop.run(until: Date().addingTimeInterval(0.1))
                    }
                    
                }
                
            } else if status == "두더지" && selectItem == "해충제" {
                btnStatus[part].setImage(UIImage(named: "초기"), for: .normal)
                statusArr[part] = "초기"
                scoreNum -= 30
                showToast(message: "점수가 \(30)점 깎였습니다.")
                scoreLabel.text = "\(scoreNum)점"
                if scoreNum < 0 {
                    alertGameOver()
                }
            }
        }else {
            if status == "텃밭" && selectItem == "씨앗" {
                btnStatus[part].setImage(UIImage(named: "새싹"), for: .normal)
                statusArr[part] = "새싹"
            } else if status == "새싹" && selectItem == "물뿌리개" {
                btnStatus[part].setImage(UIImage(named: harvestTarget), for: .normal)
                statusArr[part] = "채소"
            } else if status == "채소" && selectItem == "수확" {
                partTimer[part].invalidate()
                partTimerNum[part] = Constatns.PART_TIME
                isTimming[part] = false
                
                btnStatus[part].setImage(UIImage(named: "초기"), for: .normal)
                statusArr[part] = "초기"
                doneCnt+=1
                if targetCnt > doneCnt {
                    doneLabel.text = "내가 수확한 \(harvestTarget) 개수 : \(doneCnt)"
                }else {
                    doneCnt = 0
                    scoreNum+=(targetCnt*10)
                    showToast(message: "점수가 \(targetCnt*10)점 올랐습니다.")
                    scoreLabel.text = "\(scoreNum)점"
                    randomTarget()
                    doneLabel.text = "내가 수확한 \(harvestTarget) 개수 : \(doneCnt)"
                }
            }  else {
                showToast(message: "아이템 순서가 틀렸습니다.")
            }
        }
        
    }
    
    //토스트 메시지
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)){
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in toastLabel.removeFromSuperview()})
        
    }
    
    //MARK: - objc Functions
    
    // 메인 타이머 동작
    @objc func timerCallback() {
        startTimerNum-=1
        DispatchQueue.main.async() {
            if self.startTimerNum <= Constatns.GAME_TIME && self.startTimerNum >= 0 {
                self.timeLabel.text = "\(self.startTimerNum)초"
                if self.startTimerNum <= 5 {
                    self.timeLabel.textColor = .red
                }
            }else if self.startTimerNum == -1 {
                self.mainTimer.invalidate()
                self.isRunning = false
                self.scoreAlert()
            }
        }
    }
    
    // 텃밭 타이머 동작
    @objc func partTimerCallback(_ timer: Timer) {
        let idx: Int = timer.userInfo as! Int
        
        partTimerNum[idx]-=1
        DispatchQueue.main.async() {
            if self.partTimerNum[idx] >= 0 && self.partTimerNum[idx] <= Constatns.PART_TIME {
                
            }else {
                self.statusArr[idx] = "두더지"
                self.btnStatus[idx].setImage(UIImage(named: "두더지"), for: .normal)
                self.partTimer[idx].invalidate()
                self.isTimming[idx] = false
                self.partTimerNum[idx] = Constatns.PART_TIME
                
            }
        }
    }
    
    // 설정 버튼 누르면 알림창 나옴
    @objc func settingBtnPressed(_ sender: UIButton) {
        alertSetting()
    }
    
    // 텃밭을 눌렀을때 실행
    @objc func partBtnPressed(_ sender: UIButton) {
        let idx = sender.tag - 1
        changeImg(status: statusArr[idx],part: idx)
    }
    
    // 아이템을 눌렀을때 실행
    @objc func itemBtnPressed(_ sender: UIButton) {
        if sender.tag >= 10 && sender.tag <= 13 {
            selectItem = orderItemArr[sender.tag-9]
        }else if sender.tag == 14 {
            selectItem = "해충제"
        }
    }
}
