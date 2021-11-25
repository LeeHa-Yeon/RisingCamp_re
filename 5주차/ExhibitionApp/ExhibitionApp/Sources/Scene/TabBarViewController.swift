//
//  TabBarViewController.swift
//  ExhibitionApp
//
//  Created by 이하연 on 2021/11/25.
//

import UIKit
import Then

class TabBarViewController: UITabBarController {
    
    private lazy var exhibitionVC = ExhibitionViewController().then {
        $0.tabBarItem = UITabBarItem(title: "전시회",image: UIImage(systemName: "squareshape.dashed.squareshape"),tag: 0)
        
    }
    
    private lazy var settingVC = SettingViewController().then {
        $0.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gearshape.2"), tag: 1)
        var overrideUserInterfaceStyle: UIUserInterfaceStyle
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        isDarkMode()
    }
    
    //MARK: - Functions
    func setTabBar(){
        let settingNV = UINavigationController(rootViewController: settingVC)
        // TabBar Tint Color는 appDelegate에서 설정이 가능하고
        // 만약 색상이 아닌 TabBar 경계만 나오도록 설정하고 싶다면 tabBar.isTranslucent = false을 사용하면 된다.
        tabBar.isTranslucent = false
        viewControllers = [exhibitionVC,settingNV]
    }
    
    func isDarkMode(){
        let isDarkMode: Bool = UserDefaults.standard.bool(forKey: "darkState")
        let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
        if isDarkMode {
            if #available(iOS 13.0, *) {
                sceneDelegate.window?.overrideUserInterfaceStyle = .dark
            }
                    
        }else {
            if #available(iOS 13.0, *) {
                sceneDelegate.window?.overrideUserInterfaceStyle = .light
            }
        }
        
    }
    
}
