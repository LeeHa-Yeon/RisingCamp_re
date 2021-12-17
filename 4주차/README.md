# 📌  주제

🧊 **나의 냉장고 관리 프로젝트**

# 🤔 기획

---

- 장바구니
    - 앞으로 사야할 재료들을 등록
    - 클릭하여 삭제하도록 구현 - 알림창으로 재차확인
- 냉장고 상태
    - 재료 등록 - 이름, 종류, 보관상태, 수량, 유통기한  **C**
        - 종류,보관상태 - PickerView를 이용하여 선택
        - 수량 - UIStepper를 이용하여 지정
        - 유통기한 - DatePicker를 이용하고 소비기한도 계산하여 저장
    - 재료 확인 및 수정  **R, U**
        - 확인 - 원하는 재료를 클릭하면 해당 정보가 보임
        - 수정 - 정보를 수정하고 SAVE 버튼을 누르면 업데이트됨
    - 정렬 기능 - 이름, 종류, 만료일순
    - 재료 삭제 - 스와이프로 삭제  **D**
- 소비기한 임박한 재료 리스트 - 몇일 남았는지 표시
- 기한 만료된 재료 리스트

# 📱  화면

[화면 기록 2021-12-03 오전 4.59.22.mov](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/da38155b-4f83-43b9-b030-f7117436de13/화면_기록_2021-12-03_오전_4.59.22.mov)

<img width="727" alt="스크린샷 2021-12-17 오전 10 33 13" src="https://user-images.githubusercontent.com/55241258/146474132-54277e62-40d8-45c4-8098-ec31e1e97fe1.png">
<img width="732" alt="스크린샷 2021-12-17 오전 10 33 03" src="https://user-images.githubusercontent.com/55241258/146474136-b3ca4e18-c91a-4488-ad0d-76d7e3a41125.png">
<img width="728" alt="스크린샷 2021-12-17 오전 10 33 08" src="https://user-images.githubusercontent.com/55241258/146474138-5a79221a-4311-486c-a7c8-7be7b0dba9c3.png">


# 📝  구현 내용

---

**요약**

- 테이블뷰를 활용한 메모장 앱 프로그래밍 with CRUD 구현하기
    - 주제 : `나의 냉장고 관리 프로젝트`
    - 나의 냉장고 속을 핸드폰으로 한 눈에 파악하여 관리할 수 있다.
- CRUD : Create(생성), Read(읽기), Update(갱신), Delete(삭제)

**역할**

- 개인 실습
- 프로젝트 기획, UI설계, 개발 등 모든 부분

**Skills**

- 개발 환경 : Xcode
- Swift, Firebase,  Github
- EASegments, SSCustomTabbar, CircleBar

**성과**

- TableView, CollectionView 두가지를 이용하여 화면 구성
    - CRUD를 적용하여 등록, 읽고 수정, 삭제 구현
    - 테이블뷰의 cell 재사용성에 발생하는 오류 해결
- Firebase 를 이용한 재료 데이터 저장 및 관리
- 데이터 전달방식
    - SegueAction을 이용하여 데이터 전달
    - Delegate을 이용하여 DataPassing
- 파일 관리
    - Cell, Extension, 상수값 등 따로 빼서 관리
- !를 사용하지 않고 옵셔널 처리를 신경써서 코드 작성
- AwesomeUI를 적용해 UI 보완
- datePicker를 이용하여 날짜 계산

**진행** **시기**

- 2021.11.12 ~ 2021.11.18

# 🔗  링크
<a href= "https://github.com/LeeHa-Yeon/RisingCamp_re/tree/main/4%EC%A3%BC%EC%B0%A8/RefrigeratorManagement" >이동하기 </a>
