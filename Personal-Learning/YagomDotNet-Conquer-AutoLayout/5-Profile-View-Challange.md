# 5. Profile View (Challange)

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/challenge-profile-view/)

## 세로 화면

- Image View는 이미지가 셋팅되기 전에는 Intrinsic Content Size가 없다.
- 조건
- 이미지 뷰의 너비는 상위뷰의 30%, 하지만 최대 너비는 150pt

## 가로 화면

- 가로로 눕히면 이미지 뷰의 너비 constraint 두개가 충돌되는데, 최대 너비 150 constraint의 priority를 더 높게 두어 해결한다.


