//
//  TabBarViewController.swift
//  ExhibitionApp
//
//  Created by 이하연 on 2021/11/25.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private lazy var exhibitionViewController: UIViewController = {
        let viewController = ExhibitionViewController()
        let tabBarItem = UITabBarItem(title: "전시회",image: UIImage(systemName: "squareshape.dashed.squareshape"),tag: 0)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var settingViewController: UIViewController = {
        let viewController = SettingViewController()
        let tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gearshape.2"), tag: 1)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    //MARK: - Functions
    func setTabBar(){
        // TabBar Tint Color는 appDelegate에서 설정이 가능하고
        // 만약 색상이 아닌 TabBar 경계만 나오도록 설정하고 싶다면 tabBar.isTranslucent = false을 사용하면 된다.
        viewControllers = [exhibitionViewController,settingViewController]
    }
    
}
