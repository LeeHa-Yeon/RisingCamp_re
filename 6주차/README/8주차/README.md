# 📌  주제

🎮 **전 주에 만든 스레드게임에 애니메이션 효과 적용**

# 🤔 기획

---

- 로딩 화면 Lottie 이용하여 애니메이션 적용  → ok
- 화면 전환 시 애니메이션 효과 적용  → ok
- 게임 속 애니메이션 효과 적용
    - 점수 오를때 효과 적용하기 → ( 색 변화, 점수 오르는 것을 표현하기 위해 올라감 ) ok
    - 아이템 선택했을 때 효과 적용 ( 살짝 크게, 돌면서 )  ok
    - 재배할 때 효과 적용 → ( 밝기 조절로 나타나기 ) ok
    - 수확했을 때 효과 적용 → ( 크기가 커지면서 수확하듯 위로 올라간다. ) ok
- 효과음 적용
    
    [https://www.freesoundeffects.com/free-sounds/drum-loops-10031/](https://www.freesoundeffects.com/free-sounds/drum-loops-10031/)
    
    - 게임 수확시 애니메이션 소리(효과음) 적용 - ok
    - 아이템 선택시 효과음 적용 - ok
    - 아이템 순서가 틀렸을 때 효과음 적용 -ok

# 📱  화면

- 전체 실행
이미지 클릭하면 시연영상으로 넘어감 <br>
<a href="https://www.youtube.com/watch?v=161LKRKNdEE"> <img width="358" alt="스크린샷 2021-12-17 오후 12 45 14" src="https://user-images.githubusercontent.com/55241258/146485568-06e225db-41be-48c9-b182-c7c7d1b146e2.png">
</a> <br>

- 로딩화면 애니메이션 효과
- 화면 전환
- 게임 속 애니메이션 적용
- 아이템 순서 틀렸을 때 효과음

# 📝  구현 내용

---

---

**요약**

- 앱에 다양한 애니메이션 효과를 적용하기 ( 핵심 )
    - 로딩화면 :  lottie를 이용하여 로딩화면을 애니메이션으로 동작
    - 게임화면 : CGAffineTransform를 이용하여 "점수가 오를때, 재배할 때, 수확할 때, 아이템 선택시 효과 적용"
    - 화면 전환 : flipHorizontal, crossDissolve, coverVertical, partialCurl, custom을 이용하여 화면 전환
- 아이템 순서가 틀렸을 때의 효과음 적용
- StoryBoard 를 사용하지 않고 SnapKit, Then 을 사용
    - SnapKit을 이용하여 Constraint 제약 조건을 설정
    - Then을 이용하여 `UI 생성부분`과 `그에 대한 속성을 정의하는 부분` 분리됨을 방지하여 가독성을 높임

**역할**

- 개인 실습
- 프로젝트 기획, UI설계, 개발 등 모든 부분

**Skills**

- 개발 환경 : Xcode
- Swift, SnapKit, Then , Github
- lottie-ios
- 다양한 애니메이션 효과( CGAffineTransform 등 )
- AVFoundation

**성과**

- lottie 라이브러리를 이용하여 JSON 기반 애니메이션 파일 형식실시간으로 애니메이션을 랜더링하여 띄어줌
- 화면 전환시
    - coverVertical : 아래에서 위로올라오는 기본적인 애니메이션 ( 나머지 )
    - crossDissolve : 뷰가 점점 투명해지면서 자연스럽게 넘어가는 애니메이션 ( 닉네임 설정 → 게임 )
    - flipHorizontal : 수직축을 기준으로 돌아가는 애니메이션 ( 로딩 → 메인 )
    - partialCurl : 페이지를 넘기는 것처럼 넘어가는 애니메이션 ( 메인 → 게임설명 )
    - custom : dismiss할 때 오른쪽에서 왼쪽으로 넘어가도록 ( 게임설명 → 메인 )
- 다양한 애니메이션 효과
    - CGAffineTransform 내의 회전,크기,이동 등의 효과를 활용하여 앱에 다양한 효과를 적용하였음
    - 색 변화, 크기 변화, 회전 효과, 이동, 밝기 조절 등
- 효과음 추가
    - 아이템 순서가 틀렸을 때 Toast와 함께 효과음을 적용하여 알려줌

**진행** **시기**

- 2021.12.03 ~ 2021.12.10

# 🔗  링크
<a href="https://github.com/LeeHa-Yeon/RisingCamp_re/tree/main/6%EC%A3%BC%EC%B0%A8/ThreadGame"> 코드보기 </a>
