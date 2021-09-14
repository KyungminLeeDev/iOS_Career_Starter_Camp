# 11. Safe Area & Layout margins

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/size-classes/
- WWDC 2019 - Session 235 - UIKit: Apps for Every Size And Shape 에서 더 자세히 알 수 있다

## Safe Area

- [Positionaing Content Relative to the Safe Area](https://developer.apple.com/documentation/uikit/uiview/positioning_content_relative_to_the_safe_area)
- Safe Area: 컨텐츠를 안전하게 보여주는 영역
- 하단 바, 상단 바 등 컨텐츠가 완전하게 보여질 수 없는 부분을 제외한 영역을 safe area로 표현
- 필요에 의해 변경할 수 있다.
    - `additionalSafeAreaInsets`프로퍼티를 수정하여 조절

## Layout Margins

- [Positioning Content Within Layout Margins](https://developer.apple.com/documentation/uikit/uiview/positioning_content_within_layout_margins)
- 스토리보드에서 Add New Constraints 핀메뉴에서 Constraint to marigins 체크박스에서 볼 수 있었음
    - view에 속해있는 margins에 대해서 constraint를 추가하겠다는 의미
    - 체크하면 마진에 대해 제약을 주고, 안하면 마진이 아닌 엣지에 제약을 줌
- Layout Margins: 컨텐츠와 뷰의 엣지 사이의 거리를 의미
- Layout Margins은 left/rifht, top/bottom이 있고, 언어 방향에 따라 조절하려면 directionalLayoutMargins을 사용하면 된다. leading/trailing, top/bottom.
