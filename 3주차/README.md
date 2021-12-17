# 📌  주제

🎮 **메모장 앱 만들기**



# 📱  화면
이미지 클릭하면 시연영상으로 넘어감 <br>
<a href="https://www.youtube.com/watch?v=p9N-o8kmWxY"><img width="367" alt="스크린샷 2021-12-17 오후 12 19 15" src="https://user-images.githubusercontent.com/55241258/146483501-761b5d85-253c-46f8-9772-915cfc16ad39.png"> </a> <br>
<img width="505" alt="스크린샷 2021-12-17 오전 10 25 41" src="https://user-images.githubusercontent.com/55241258/146473513-419c157c-4ddf-4d91-8722-53dee3897640.png">
<img width="512" alt="스크린샷 2021-12-17 오전 10 25 46" src="https://user-images.githubusercontent.com/55241258/146473516-cbd7fd77-15e2-4435-9c51-a9dc9ddf026f.png">
<img width="503" alt="스크린샷 2021-12-17 오전 10 25 50" src="https://user-images.githubusercontent.com/55241258/146473521-8667ab84-2eef-4463-a4a0-7227d6912dc9.png">

# 📝  구현 내용

---

**요약**

- 메모장 앱 프로그래밍
- Life Cycle 활용
- 화면 전환과 데이터 전달
- CRUD : Create(생성), Read(읽기), Update(갱신), Delete(삭제)

**역할**

- 개인 프로젝트

**Skills**

- 개발 환경 : Xcode
- Swift , Github, Singleton Pattern

**성과**

- 화면 전환 - `Modal, Navigation으로 페이지 전환`
- TableView로 전체 메모 띄어주기
- Navigation, Modal로 화면 전환하기
- **Singleton Pattern**를 사용하여 메모 데이터 관리
    - 여러번 호출하지 않은 점으로 메모리 아낄 수 있음
    - 정해진 값을 여러곳에서 공유해서 사용
- Life Cylce
    - viewDidLoad - 처음 호출해야 할 부분만 사용함
    - viewWillAppear - 새 메모를 등록하고 ***table* *reloadData***()
- CRUD
    - Create
        
        새 메모를 등록 (제목, 내용, 시간)
        
    - Read
        
        메모 리스트 - 전체 메모가 리스트 형태로 보여줌 
        
        메모 상세페이지 - 해당 메모를 클릭하면 상세 페이지로 이동 후 내용 표시
        
    - Update
        
        메모 리스트 - TableView editing을 활용하여 순서 바꿈
        
        메모의 내용을 수정하고 Save 버튼을 누르면 저장이 되고 알림창으로 알려줌
        
        전역 변수를 사용하여 내용 업데이트를 쉽게 관리
        
    - Delete
        
        삭제하고자 하는 메모의 왼쪽으로 스와이프 시 삭제 
        
        TableView editing을 활용하여 - 버튼 아이콘을 눌러 delete 
        
    

**아쉬운 점**

- Life Cylce를 많이 활용 못했음 → 다음 주차에 이용할 예정

**진행** **시기**

- 2021.11.05 ~ 2021.11.12

# 🔗  링크
<a href="https://github.com/LeeHa-Yeon/RisingCamp_re/tree/main/3%EC%A3%BC%EC%B0%A8/YeonMemo"> 코드보기 </a>
