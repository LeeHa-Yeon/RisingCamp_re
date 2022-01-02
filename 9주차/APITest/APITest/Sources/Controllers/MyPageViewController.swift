//
//  MyPageViewController.swift
//  APITest
//
//  Created by 이하연 on 2021/12/28.
//

import UIKit
import KakaoSDKUser


class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()

    }
    
    func loadUserInfo(){
        if "KakaoLogin" == UserDefaults.standard.string(forKey: "loginStatus") {
            print("여기야여기")
            UserApi.shared.me() {(user, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("me() success.")
                    print("카카오유저이메일\(user?.kakaoAccount?.email)")
                    print("카카오유저\(user?.kakaoAccount?.profile)")
                    //do something
                    _ = user
                }
            }
        }else {
            print("저기야저기")
        }
    }
    
}
