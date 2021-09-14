# 8. Constraints with Code

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/constraints-with-code/)
- [Programmatically Creating Constraints](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ProgrammaticallyCreatingConstraints.html#//apple_ref/doc/uid/TP40010853-CH16-SW1)
- 코드로 레이아웃 만드는 3가지 방법
    - Visual Format 방식은 추천하지 않음
    - Layout Anchor로 Constraint 만들기
        - Attribute 마다 닻을 다는 느낌?!
        - 코드로 레이아웃 만드는 가장 좋은 방법이라 생각함 (NSLayoutConstraint를 직접 사용하는 것에 비해서 조금의 한계는 잇음)
    - NSLayoutConstraint


## 버튼 예제

- 화면 하단 버튼에 leading, trailing, bottom으로 20pt 제약을 줌
- 홈버튼 기기에서는 괜찮은데 아닌 기기에서는 하단 여백이 더 많이 보임 (Safe Area에서 20pt이기 때문)
- bottom을 safe area와 0pt로 변경
- bottom 제약 추가: 상위뷰 기준으로 20보다 작거나 크게 변경, 홈버튼 기기에서는 safe area 기준으로 20pt여야하므로 이 제약 priory를 더 낮게 변경

## Layout Anchors

위 예제를 Layout Anchor를 사용한 코드로 해보자.
- [BottomButton-AnchorViewController](./BottomButton/BottomButton/AnchorViewController.swift)
- 스토리보드로 할 때 보다 constant의 음수 양수에 대해 주의해야 한다. (스토리보드에선 알아서 방향에 따라 주는 듯)
    - 스토리보드에선 버튼의 bottom과 view의 bottom 제약이 20과 같거나 크게
    - 앵커에선 버튼의 bottom과 view의 bottom 제약이 -20과 같거나 작게이다.
- Anchor 사용의 장점
    - 코드 간결
    - 잘못된 제약을 주려할 때 컴파일 단계에서 미리 오류 발견

## NSLayoutConstraint

위 예제를 NSLayoutConstraint를 사용한 코드로 해보자.
- [BottomButton-ConstraintViewController](./BottomButton/BottomButton/ConstraintViewController.swift)
- 단점은 Anchor와 다르게 실수해도 컴파일 단계에서 오류 발견 불가
- 장점은 Anchor에서 불가능한 제약도 가능
