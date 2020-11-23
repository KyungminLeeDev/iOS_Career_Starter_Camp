---
title: "iOS 스타터 캠프 TIL #2 - 2020.11.03 화요일"

categories:
  - TIL
tags:
  - TIL/iOSCamp
last_modified_at: 2020-11-03T18:20:00+09:00

published: true
---

# 학습내용

## Git과 GitHub 연습

### 1. 로컬 저장소 생성

- 폴더를 만들고 그 폴더 안으로 이동
- $ git init (git 저장소 생성)
- $ touch test.txt (해당 파일 생성)
- $ open test.txt (해당 파일 열기)
- text.txt에 아무 내용이나 적기
- $ git add test.txt (해당 파일 스테이징) / git add * (모든 파일 스테이징)
- $ git commit -m "커밋 메시지 입력" (커밋 남기기)

## 2. 브랜치 생성

- $ git checkout -b feature-1 (해당 브랜치 만들고 이동)
- $ git checkout master (master 브랜치로 이동)
- $ git checkout -b feature-2 (해당 브랜치 만들고 이동)

### 3. 충돌 만들기

- master, feature-1 브랜치에서 test.txt의 같은 라인에 다른 내용을 입력후 각각 커밋
- master에 feature-1 브랜치를 merge 시도 -> 충돌 발생
- master의 test.txt에 충돌된 내용이 모두 보임 
- test.txt에 남길 내용만 정리후 스테이징한 후 커밋 -> 충돌 해결 완료

### 4. 원격 저장소 생성

- Github에서 원격 저장소 생성
- $ git remote add origin 원격서버주소 (로컬과 원격 저장소를 연동)
- $ git push origin master (원격 저장소에 master를 push)

### 5. 원격 저장소 충돌 만들기

- 짝꿍의 원격 저장소를 clone해서 가져오기
- 3번의 충돌 만들기 다시 해보기
- PR로 충돌 만들기는 못해봄

### 6. 캠프 샘플 저장소에 PR 보내기

1. fork 
    - 원본 저장소에서 fork하면 내 계정의 저장소로 복사됨
2. clone
    - fork통해 복사된 저장소에서 code 버튼을 눌러 URL 복사
    - $ git clone URL (저장소를 내 컴퓨터로 받아온다)
3. 로컬 저장소로 이동
4. checkout
    - $ git checkout -t origin/1-jacob (내 닉네임 브랜치를 추적하는 브랜치를 생성, 추적 옵션은 저장소 복제 후 한 번만 해주면 됨)
    - $ git checkout -b start-game (기능 구현을 위한 브랜치 생성)
5. add, commit
    - 작업한 파일들을 스테이지에 추가하고 커밋
6. push
    - git push --set-upstream origin start-game (개인 저장소에 푸쉬)
7. pull request
    - 푸시되면 개인 저장소에 "Compare & pull request" 버튼 활성화 됨
    - 클릭해서 PR 생성

## 팀 그라운드 룰과 스크럼 방법 정하기

이번주 같은 7조인 Green과 협의하여 그라운드 룰 정립



<br/><br/><br/>

# 문제점 / 해결방법

## "Compare & pull request" 버튼 활성화 않됨

캠프 샘플 저장소에 PR 보내기 실습을 문서 내용 그대로 진행하는데 
"Compare & pull request" 버튼이 활성화 되지 않았다. 

내가 잘못 따라했나 싶어서 fork된 저장소를 지우고 다시 해봐도 그대로다. 
매니저 지니에게 질문하니 GitHub의 문제로 "Compare & pull request" 버튼이 활성화되지 않을 수도 있으나 
"New pull request"버튼으로 직접 하면 된다고 하셨다.

내 개인 저장소에서 "New pull request"버튼을 눌러서 base에 원본 저장소의 내 닉네임 브랜치를,
comapre에 개인 저장소의 기능 브랜치를 설정하니 변경된 내용이 보였고 PR을 보낼 수 있었다.



<br/><br/><br/>

# 느낀점

## 예습은 꼭 하자

야곰이 미리 올려주신 git 강의를 10분 정도만 듣고 교육에 참여했더니 처음 해보는 내용이라서 
중간 중간 강의를 보면서 진행하느라 많이 더뎠다.

혼자 하는 게 아니라 팀으로 교육이 진행되니 내가 버벅이면 짝궁이 날 기다려야 하므로 마음이 불편했다.
죄송합니다. 꼭 예습 하겠습니다.

## 터미널로 git/github 사용 해보니

지금까지는 터미널 명령어가 익숙하지 않아서 Xcode나 VCS의 git 기능을 사용했었다.

터미널로 git/github을 실습하면서 자주 사용하는 명령어를 자연스럽게 익히게 됐고, 
모르는 것은 찾아보면서 git 기능에 대해 더 알게 되었다.

Xcode의 git 기능이 편리하긴 하지만 git 기능을 이해하는데는 터미널이 더 효과적인 것 같다.



<br/><br/><br/>

## 참고 링크

- [누구나 쉽게 이해할 수 있는 git 입문](https://backlog.com/git-tutorial/kr/intro/intro1_1.html)
- [git 책](https://git-scm.com/book/ko/v2)
- [git 간편 안내서](https://rogerdudler.github.io/git-guide/index.ko.html)
- [git을 게임처럼 연습할 수 있는 사이트 - 리나 공유](https://learngitbranching.js.org/?locale=ko)
