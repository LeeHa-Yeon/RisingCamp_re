//
//  SettingViewController.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/12/05.
//

import UIKit
import Then
import SnapKit
import AVFoundation

class SettingViewController: UIViewController {
    
    // AVAudioPlayer 인스턴스 참조체 저장
    var BGM: AVAudioPlayer?
    
    //MARK: - Components
    private lazy var confirmBtn = UIButton().then {
        $0.setTitle("적용", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(confirmBtnTapped), for: .touchUpInside)
    }
    
    private lazy var volumeControl = UISlider(frame: CGRect(x:0, y:0, width:200, height:30)).then {
        $0.minimumValue = 0
        $0.maximumValue = BGM?.volume ?? 1
        $0.value = BGM?.volume ?? 1
        $0.minimumTrackTintColor = UIColor.lightGray
        $0.maximumTrackTintColor = UIColor.black
        $0.addTarget(self, action: #selector(volumeUpDown), for: .valueChanged)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        playAudio()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.frame = CGRect(x: 70, y: 300, width: 300 , height: 300)
    }
    
    //MARK: - Functions
    
    func setUI(){
        view.layer.cornerRadius = 20
        view.backgroundColor = .gray
        view.addSubview(volumeControl)
        view.addSubview(confirmBtn)
        
        volumeControl.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(40)
            $0.bottom.equalTo(confirmBtn.snp.top).inset(-30)
        }
        
        confirmBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    func playAudio() {
        let url = Bundle.main.url(forResource: "배경음악", withExtension: "mp3")
        if let url = url{
            do {
                BGM = try AVAudioPlayer(contentsOf: url)
                guard let sound = BGM else { return }
                sound.play()
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("file not found")
        }
    }
    
    //MARK: - objc Functions
    
    @objc func confirmBtnTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func volumeUpDown(){
        if BGM != nil {
            BGM?.volume = volumeControl.value
        }
    }
    
}
