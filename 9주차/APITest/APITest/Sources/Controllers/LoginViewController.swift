//
//  LoginViewController.swift
//  APITest
//
//  Created by 이하연 on 2021/12/28.
//

import UIKit
import KakaoSDKUser


class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
