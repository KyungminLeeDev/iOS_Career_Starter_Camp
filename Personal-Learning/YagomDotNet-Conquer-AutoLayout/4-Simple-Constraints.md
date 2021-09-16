# 4. Simple Constraints

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/simple-constraints/)
- [Auto Layout Cookbook - Simple Constraints](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSimpleConstraints.html#//apple_ref/doc/uid/TP40010853-CH12-SW1)



## Two Different-Width Views

오른쪽 뷰가 왼쪽 뷰의 2배 너비로 만들기: Equal Width constraint의 Multiplier를 2로 변경  
  
2.0, 200%, 2:1, 2/1 등 다양한 표현방식 사용 가능



## Two Views with Complex Widths

조건
- 빨간 뷰 너비는 파란 뷰 너비의 2배
- 파란 뷰 너비는 최소 150pt 이상 (이게 우선도 높음)
