//
//  LodingViewController.swift
//  ExhibitionApp
//
//  Created by 이하연 on 2021/11/26.
//

import UIKit
import Lottie
import Then



class LodingViewController: UIViewController {

    lazy var animationView = AnimationView(name:"1873-foto-icon").then {
        $0.frame = CGRect(x:0, y:0, width: 200, height: 200)
        $0.center = self.view.center
        $0.contentMode = .scaleAspectFit
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimationView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playAnimationView()
    }
    
    //MARK: - Functions
    
    func setAnimationView(){
        self.view.addSubview(animationView)
    }
    
    func playAnimationView(){
        self.animationView.play()
        self.animationView.loopMode = .loop
        let time = DispatchTime.now() + .seconds(4)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.moveToTabBarVC()
        }
    }


}

extension LodingViewController: LodingViewControllerDelegate {
    func moveToTabBarVC() {
        let mainVC = TabBarViewController()
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC,animated: true,completion: nil)
    }
    
}
