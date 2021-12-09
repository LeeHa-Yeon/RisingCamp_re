//
//  Constatns.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/11/30.
//

struct Constatns {
    // 게임에 관련된 부분
    static let GAME_TIME:Int = 60
    static let PART_TIME:Int = 10
    
    // UserDefaults
    static let USER_NICNAME:String = "userNicName"
    static let RANK_INFO: String = "rankInfo"
    
    static let BGM_STATUS: String = "bgmStatus"
    static let SOUNDEFFECT_STATUS: String = "soundEffectStatus"
    
    static let BGM_VOLUME: String = "bgmVolume"
    static let SOUNDEFFECT_VOLUME: String = "soundEffectVolume"
    
    static let BGM_NAME: String = "배경음악"
    static let SOUNDEFFECT_NAME_ONE: String = "효과음1" // 딸깍
    static let SOUNDEFFECT_NAME_TWO: String = "효과음2" // 버블
    static let SOUNDEFFECT_NAME_THREE: String = "효과음3" // 찌지직
    
    // 게임창에서 dismiss할 때 닉네임 알림창이 안나타나기 위한 구분
    static var isStart: Bool = false
}
