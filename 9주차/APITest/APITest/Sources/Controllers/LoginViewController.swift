//
//  LoginViewController.swift
//  APITest
//
//  Created by 이하연 on 2021/12/28.
//

import UIKit
import Lottie
import KakaoSDKUser


class LoginViewController: UIViewController {
    
    let animationView = AnimationView(name:"global")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.frame = CGRect(x:0, y:0, width:200, height:200)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //애니메이션 시간 후에 작동하게끔.
        self.animationView.play()
        self.animationView.loopMode = .loop
    }
    
    @IBAction func kakaoLogin(_ sender: Any) {
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    UserDefaults.standard.set("KakaoLogin", forKey: "loginStatus")
                    
                    // 화면 이동
                    let board = UIStoryboard(name: "MeetPlaceSearch", bundle: nil)
                    let vc = board.instantiateViewController(withIdentifier: "TabSB")
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                    
                    print("login With KakaoAccount() success.")
                    
                    _ = oauthToken
                }
            }
        }
    }
    
    
}
