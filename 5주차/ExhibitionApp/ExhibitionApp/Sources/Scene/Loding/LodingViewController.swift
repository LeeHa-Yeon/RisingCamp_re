//
//  LodingViewController.swift
//  ExhibitionApp
//
//  Created by 이하연 on 2021/11/26.
//

import UIKit
import Lottie



class LodingViewController: UIViewController {

    let animationView = AnimationView(name:"")
    
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
        animationView.frame = CGRect(x:0, y:0, width: 200, height: 200)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
    }
    
    func playAnimationView(){
        self.animationView.play()
        self.animationView.loopMode = .loop
        let time = DispatchTime.now() + .seconds(1)
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
