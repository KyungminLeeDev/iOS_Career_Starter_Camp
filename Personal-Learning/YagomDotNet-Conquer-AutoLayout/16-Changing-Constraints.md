# 16. Changing Constraints

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/changing-constraints/)
- [Auto Layout Guide - Chaning Constraints](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ModifyingConstraints.html#//apple_ref/doc/uid/TP40010853-CH29-SW1)

## Constraint를 바꿀 수 있는 4가지 방법

- Constraint 활성화 비활성화
- Constraint의 constant value 변경
- Constraint의 priority 변경
- 뷰 계층에서 뷰 제거
- 위 4가지 외에 Item, Attribute, Multiplier는 변경 불가

## Deferred Layout Pass

Constraint를 변경 또는 삭제해도 바로 뷰의 프레임에 반영되는 것이 아니라 잠시 미뤄둔다(Deffered). (사람은 거의 느낄 수 없음) 다음 업데이트 주기에 업데이트 됨
  
`setNeedsLayout` 또는 `setNeedsUpdateConstraints` 메서드로 레이아웃이 변경됐으니 다음 업데이트 주기에 업데이트 해달라고 요청할 수 있다.

## 실습

- [실습 프로젝트 - SelfSizing](./SelfSizing)
- 이전 프로젝트에 이어서 작업
- 셀의 postLabel을 탭하면 postLabel의 높이 constraint의 isActive 를 토글해서 셀 높이가 늘어낮다 줄어들었다 하는 액션을 구현

## 추가 참고

- WWDC 2015: Mysteries of Auto Layout
- WWDC 2018: High Performance Auto Layout
