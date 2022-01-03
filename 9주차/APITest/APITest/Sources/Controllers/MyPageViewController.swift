//
//  MyPageViewController.swift
//  APITest
//
//  Created by 이하연 on 2021/12/28.
//

import UIKit
import KakaoSDKUser
import Kingfisher

class MyPageViewController: UIViewController {
    
    var profileURL : String = ""
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        loadUserInfo()
        
    }
    
    @IBAction func logout(_ sender: Any) {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                let board = UIStoryboard(name: "Login", bundle: nil)
                let vc = board.instantiateViewController(withIdentifier: "LoginSB")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print("logout() success.")
            }
        }
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
                    self.emailLabel.text = "\((user?.kakaoAccount?.email)!)"
                    self.nicknameLabel.text = "\((user?.kakaoAccount?.profile?.nickname)!)"
                    self.profileURL = "\((user?.kakaoAccount?.profile?.profileImageUrl)!)"
                    DispatchQueue.main.async {
                        let url = URL(string: (self.profileURL))
                        self.profileImg.kf.setImage(with: url)
                    }
                    //do something
                    _ = user
                }
            }
        }else {
            print("저기야저기")
        }
        
    }
    
    func initViews(){
        profileImg.layer.cornerRadius = profileImg.frame.size.height/3
        profileImg.layer.masksToBounds = true
    }
    
    
    
}
