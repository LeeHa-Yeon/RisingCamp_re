# 📌  주제

🎮 **전 주에 만든 스레드게임에 User Defaults로 앱을 고도화**

# 🤔 기획

---

- 랭킹 화면 - 성공
    - 게임 시작 전 닉네임을 지정 → 해당 닉네임으로 게임 참여 → 게임 종료 후 얻은 점수가 랭킹에 등록 → 랭킹 리스트 화면에 나의 점수와 등수 확인 ( 체크 표시되어 있음 )
    - 랭킹 리스트는 모든 유저의 점수를 불러와 띄워줌
- 설정 화면
    - 배경음악,효과음 설정 - 성공
    - 음악 on/off 상태변경 - 성공
    - 소리볼륨 조절 - 성공
    - 화면 밝기 조절 - 실패
- 게임 화면
    - 설정값을 불러와 BGM이 ON일 경우 배경음악 틀고 OFF일 경우 배경음악 없음
        - 설정된 배경음악 볼륨의 크기로 BGM 소리가 남
    - 효과음 역시 설정값을 불러와 효과음이
        - ON
            - 설정된 효과음을 볼륨의 크기로 효과음 소리를 냄
            - 아이템을 눌렀을 경우 딸깍 효과음 소리가 난다.
            - 수확했을 경우 버블 효과음 소리가 난다
        - OFF
            - 소리가 안남

---

- mp3 다운로드 → [https://soundcloud.com/](https://soundcloud.com/) → url 따기
- [https://sclouddownloader.net/](https://sclouddownloader.net/) → url을 이용해 mp3 다운

# 📱  화면

주의 ) 싱크가 조금 안맞아서,, 영상에 조금의 딜레이가 존재합니다. 
이미지 클릭하면 시연영상으로 넘어감 <br>
<a href="https://www.youtube.com/watch?v=lGhUco6HqUE"> <img width="361" alt="스크린샷 2021-12-17 오후 12 40 16" src="https://user-images.githubusercontent.com/55241258/146485172-84c984ae-baf3-4d75-836a-d966fdbc0c0b.png">
</a> <br>

<img width="734" alt="스크린샷 2021-12-17 오후 12 41 25" src="https://user-images.githubusercontent.com/55241258/146485266-ba3ac906-46fd-4d7a-9395-d5a3adc8adce.png">

<img width="737" alt="스크린샷 2021-12-17 오후 12 41 34" src="https://user-images.githubusercontent.com/55241258/146485272-bf6edb5b-6de2-490b-a831-e0a4036dd7fe.png">
# 📝  구현 내용

---

**요약**

- User Defaults 이용하여 6주차 과제 앱을 고도화 ( 핵심 )
    - 설정화면을 통해 효과음, 배경음악을 ON/OFF 할 수 있으며, ON일 경우 볼륨을 조절할 수 있습니다. UserDefaults를 이용하여 앱을 종료 후 다시 켜도 설정된 상태 그대로 적용되어 있습니다.
    - 게임시작 전 닉네임을 설정하면 현재 닉네임이 내부저장소에 저장이 됩니다. 게임이 끝나면 나의 점수가 랭킹리스트에 기록이 되고 나의 위치를 알 수 있도록 체크로 표시가 되어있습니다.
    ( 랭킹리스트 불러올 때 모든 유저의 점수도 불러와 띄워줍니다 )
- AVFoundation를 이용하여 오디오 부분 구현
- StoryBoard 를 사용하지 않고 SnapKit, Then 을 사용
    - SnapKit을 이용하여 Constraint 제약 조건을 설정
    - Then을 이용하여 `UI 생성부분`과 `그에 대한 속성을 정의하는 부분` 분리됨을 방지하여 가독성을 높임

**역할**

- 개인 실습
- 프로젝트 기획, UI설계, 개발 등 모든 부분

**Skills**

- 개발 환경 : Xcode
- Swift, SnapKit, Then , Github
- UserDefaults 활용
- AVFoundation

**성과**

- SnapKit, Then 으로 UI들의 레이아웃 설정
- 설정화면을 view의 frame 조정으로 팝업창처럼 만듬
- UserDefaults를 사용하여 배경음악, 효과음 설정을 하였고 또한 현재 유저의 닉네임과 모든 유저들의 점수들을 저장하여 랭킹 시스템을 구축
    - Constatns 파일을 따로 만들어 상수값들을 저장하고 사용 → 오타 발생을 방지
- AVFoundation을 이용하여 오디오 파일을 재생하고 중지하며, 해당 오디오의 볼륨을 조절
    - UISlider()를 통해 오디오 볼륨 조절
    - UISwitch()를 통해 오디오 재생 on/off 조절
    - UISwitch가 off로 설정되어 있다면 해당 UISlider가 비활성화되며 오디오 재생이 중지됨

**진행** **시기**

- 2021.12.03 ~ 2021.12.10

# 🔗  링크
<a href="https://github.com/LeeHa-Yeon/RisingCamp_re/tree/main/6%EC%A3%BC%EC%B0%A8/ThreadGame"> 코드보기 </a>
