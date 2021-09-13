# 6. Stack Views

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/stack-views/)


## Understanding Stack View

- [Getting Started - Auto Layout Without Constraints](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/AutoLayoutWithoutConstraints.html#//apple_ref/doc/uid/TP40010853-CH8-SW1)

### 스택 뷰에서 알아야할 개념

- axis: 스택 뷰는 가로/세로 2가지
- spacing: 요소간의 거리
- Distribution: 스택 뷰 안의 요소들의 사이즈를 어떻게 분배할 것인가 (요소에 사이즈에 대한 프로퍼티)
    - fill: 스택 뷰 안에 최대한 채움
        - 요소의 Content Hugging Priority가 중요 (낮은 순서대로 늘어날 것)
    - fillEqually: 같은 크기로 채움
    - fillProportionally: 요소의 컨텐츠 비율대로
    - equalSpacing: 같은 거리로 띄움
    - equalCentering: 요소의 센터간의 거리가 같게 (가로 스택뷰면 요소의 x축 센터가 기준)
- Alignmnet: 요소의 위치에 관한 프로퍼티
    - fill: 채우기 (수평 스택뷰면 세로방향을 꽉 채움)
    - leading: leading을 맞춤 (수직 스택 뷰)
    - top: topd을 맞춤 (수평 스택 뷰)
    - firstBaseline: 텍스트의 첫 줄 (텍스트 아랫 부분 기준)
    - lastBaseline: 텍스트의 맨 아랫줄 (텍스트 아랫 부분 기준)
    - center
    - trailing
    - bottom

<br/><br/><br/>



## Simple Stack View

- [Auto Layout Cookbook - Stack Views](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html#//apple_ref/doc/uid/TP40010853-CH11-SW1)
- 위 문서의 예제 실습

<br/><br/><br/>



## Profile View with Stack Views (Challange)

실습했던 프로필 뷰를 스택뷰로 구현해보기
- 스택 뷰를 중첩할 수 있으므로 작은 단위부터 가로/세로를 스택뷰로 묶는다 (Nested Stack View)
- 스택 뷰 안의 뷰도 외부와 constraint를 줄 수 있다.
    - 스택뷰안의 이미지 뷰가 화면 너비의 30% 너비라는 constraint 지정
