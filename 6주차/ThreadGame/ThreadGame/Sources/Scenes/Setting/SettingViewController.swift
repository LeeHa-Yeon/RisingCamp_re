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
    var soundEffect: AVAudioPlayer?
    
    //MARK: - Components
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "설정"
        $0.font = .systemFont(ofSize: 25.0, weight: .semibold)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //TODO: - 밝기 조절 구현실패..
    private lazy var brightnessLabel = UILabel().then {
        $0.text = "밝기 조절"
        $0.font = .systemFont(ofSize: 13.0, weight: .semibold)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private lazy var brightnessControl = UISlider(frame: CGRect(x:0, y:0, width:200, height:30)).then {
        $0.minimumValue = 0
        $0.maximumValue = 1
        $0.value = Float(UIScreen.main.brightness)
        $0.minimumTrackTintColor = UIColor.lightGray
        $0.maximumTrackTintColor = UIColor.black
        $0.addTarget(self, action: #selector(brightnessUpDown), for: .valueChanged)
    }
    
    private lazy var soundEffectLabel = UILabel().then {
        $0.text = "효과음"
        $0.font = .systemFont(ofSize: 13.0, weight: .semibold)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private lazy var soundEffectControl = UISlider(frame: CGRect(x:0, y:0, width:200, height:30)).then {
        $0.minimumValue = 0
        $0.maximumValue = 1
        $0.minimumTrackTintColor = UIColor.lightGray
        $0.maximumTrackTintColor = UIColor.black
        $0.addTarget(self, action: #selector(soundEffectUpDown), for: .valueChanged)
    }
    
    private lazy var soundEffectSwitch = UISwitch().then {
        $0.layer.cornerRadius = $0.frame.height / 2
        $0.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        $0.onTintColor = UIColor.orange
        $0.addTarget(self, action: #selector(onClickSoundSwitch(sender:)), for: .valueChanged)
    }
    
    private lazy var volumeLabel = UILabel().then {
        $0.text = "BGM"
        $0.font = .systemFont(ofSize: 13.0, weight: .semibold)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private lazy var volumeControl = UISlider(frame: CGRect(x:0, y:0, width:200, height:30)).then {
        $0.minimumValue = 0
        $0.maximumValue = 1
        $0.minimumTrackTintColor = UIColor.lightGray
        $0.maximumTrackTintColor = UIColor.black
        $0.addTarget(self, action: #selector(volumeUpDown), for: .valueChanged)
    }
    
    private lazy var volumeSwitch = UISwitch().then {
        $0.layer.cornerRadius = $0.frame.height / 2
        $0.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        $0.onTintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        $0.addTarget(self, action: #selector(onClickBGMSwitch(sender:)), for: .valueChanged)
    }
    
    private lazy var confirmBtn = UIButton().then {
        $0.setTitle("적용", for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(confirmBtnTapped), for: .touchUpInside)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserDefaults()
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // This call sets the brightness
        UIScreen.main.brightness = 1.0
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.frame = CGRect(x: 70, y: 300, width: 300 , height: 300)
    }
    
    //MARK: - Functions
    
    func setUserDefaults(){
        volumeSwitch.isOn = UserDefaults.standard.bool(forKey: Constatns.BGM_STATUS)
        soundEffectSwitch.isOn = UserDefaults.standard.bool(forKey: Constatns.SOUNDEFFECT_STATUS)
        volumeControl.value = UserDefaults.standard.float(forKey: Constatns.BGM_VOLUME)
        soundEffectControl.value = UserDefaults.standard.float(forKey: Constatns.SOUNDEFFECT_VOLUME)
        if !volumeSwitch.isOn {
            volumeControl.isEnabled = false
        }
        if !soundEffectSwitch.isOn {
            soundEffectControl.isEnabled = false
        }
    }
    
    func setUI(){
        view.layer.cornerRadius = 20
        view.backgroundColor = .gray
        view.addSubview(titleLabel)
        view.addSubview(brightnessLabel)
        view.addSubview(brightnessControl)
        view.addSubview(soundEffectLabel)
        view.addSubview(soundEffectControl)
        view.addSubview(soundEffectSwitch)
        view.addSubview(volumeLabel)
        view.addSubview(volumeControl)
        view.addSubview(volumeSwitch)
        view.addSubview(confirmBtn)
        
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(35)
        }
        
        brightnessLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(40)
            $0.bottom.equalTo(soundEffectLabel.snp.top).inset(-30)
        }

        brightnessControl.snp.makeConstraints{
            $0.leading.equalTo(brightnessLabel.snp.trailing).inset(-10)
            $0.trailing.equalToSuperview().inset(40)
            $0.bottom.equalTo(soundEffectControl.snp.top).inset(-15)
        }
        
        soundEffectLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(40)
            $0.bottom.equalTo(volumeLabel.snp.top).inset(-30)
        }
        
        soundEffectControl.snp.makeConstraints{
            $0.leading.equalTo(soundEffectLabel.snp.trailing).inset(-10)
            $0.bottom.equalTo(volumeControl.snp.top).inset(-15)
        }
        
        soundEffectSwitch.snp.makeConstraints{
            $0.leading.equalTo(soundEffectControl.snp.trailing).inset(-10)
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(volumeControl.snp.top).inset(-15)
        }
        
        volumeLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(40)
            $0.bottom.equalTo(confirmBtn.snp.top).inset(-35)
        }
        
        volumeControl.snp.makeConstraints{
            $0.leading.equalTo(volumeLabel.snp.trailing).inset(-10)
            $0.bottom.equalTo(confirmBtn.snp.top).inset(-30)
        }
        
        volumeSwitch.snp.makeConstraints{
            $0.leading.equalTo(volumeControl.snp.trailing).inset(-10)
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(confirmBtn.snp.top).inset(-30)
        }
        
        confirmBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    func soundEffectAudio() {
        let url = Bundle.main.url(forResource: "jungle", withExtension: "wav")
        if let url = url{
            do {
                soundEffect = try AVAudioPlayer(contentsOf: url)
                guard let sound = soundEffect else { return }
                sound.play()
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("file not found")
        }
    }
    
    func pauseSoundEffect(){
        if let player = soundEffect {
            player.stop()
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
    
    func pauseAudio(){
        if let player = BGM {
            player.stop()
        }
    }
    
    //MARK: - objc Functions
    
    @objc func onClickBGMSwitch(sender: UISwitch) {
        if sender.isOn {
            volumeControl.isEnabled = true
            playAudio()
            UserDefaults.standard.set(true, forKey: Constatns.BGM_STATUS)
        } else {
            volumeControl.isEnabled = false
            pauseAudio()
            pauseSoundEffect()
            sender.layer.cornerRadius = sender.frame.height / 2
            sender.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            UserDefaults.standard.set(false, forKey: Constatns.BGM_STATUS)
        }
    }
    
    @objc func onClickSoundSwitch(sender: UISwitch) {
        if sender.isOn {
            soundEffectControl.isEnabled = true
            soundEffectAudio()
            UserDefaults.standard.set(true, forKey: Constatns.SOUNDEFFECT_STATUS)
        } else {
            soundEffectControl.isEnabled = false
            pauseAudio()
            pauseSoundEffect()
            sender.layer.cornerRadius = sender.frame.height / 2
            sender.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            UserDefaults.standard.set(false, forKey: Constatns.SOUNDEFFECT_STATUS)
        }
    }

    
    //TODO: - 밝기 조절 구현 실패
    @objc func brightnessUpDown(){
        UIScreen.main.brightness = CGFloat(0.2)
    }
    
    @objc func soundEffectUpDown(){
        pauseAudio()
        soundEffectAudio()
        if soundEffect != nil {
            soundEffect?.volume = soundEffectControl.value
        }
    }
    
    @objc func volumeUpDown(){
        pauseSoundEffect()
        playAudio()
        if BGM != nil {
            BGM?.volume = volumeControl.value
        }
    }
    
    @objc func confirmBtnTapped(){
        UserDefaults.standard.set(volumeControl.value, forKey: Constatns.BGM_VOLUME)
        UserDefaults.standard.set(soundEffectControl.value, forKey: Constatns.SOUNDEFFECT_VOLUME)
        self.dismiss(animated: true, completion: nil)
    }

}
