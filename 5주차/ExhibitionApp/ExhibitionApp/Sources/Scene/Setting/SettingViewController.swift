//
//  SettingViewController.swift
//  ExhibitionApp
//
//  Created by 이하연 on 2021/11/25.
//

import UIKit
import SnapKit
import Then

final class SettingViewController: UIViewController {
    
    private lazy var darkModeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .semibold)
        $0.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        $0.text = "ModeSetting"
    }
    
    lazy var darkModeSwitch = UISwitch().then {
        $0.isOn = UserDefaults.standard.bool(forKey: "darkState")
        $0.addTarget(self, action: #selector(modeSwitchPressed(_:)), for: .valueChanged)
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setNavigation()
    }
    
    //MARK: - Objc Functions
    @objc func modeSwitchPressed(_ sender: UISwitch) {
        UserDefaults.standard.set(darkModeSwitch.isOn,forKey: "darkState")
        darkMode()
    }
    
    
    //MARK: - Functions
    
    func setNavigation(){
        navigationItem.title = "설정"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func setUI(){
        self.view.addSubview(darkModeLabel)
        self.view.addSubview(darkModeSwitch)
        
        self.darkModeLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        self.darkModeSwitch.snp.makeConstraints {
            $0.top.equalTo(darkModeLabel).inset(-5.0)
            $0.leading.equalTo(self.darkModeLabel.snp.trailing).offset(30.0)
        }
    }
    
    func darkMode(){
        let isDarkMode: Bool = UserDefaults.standard.bool(forKey: "darkState")
        let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
        if isDarkMode {
            if #available(iOS 13.0, *) {
                darkModeLabel.text = "DarkMode"
                sceneDelegate.window?.overrideUserInterfaceStyle = .dark
            }
                    
        }else {
            if #available(iOS 13.0, *) {
                darkModeLabel.text = "LightMode"
                sceneDelegate.window?.overrideUserInterfaceStyle = .light
            }
        }
    }
    
}
