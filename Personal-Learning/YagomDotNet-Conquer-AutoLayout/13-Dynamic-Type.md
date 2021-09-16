# 13. Dynamic Type

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/working-with-scroll-views/topic/the-basis/)
- [H.I.G - Visual Design - Typography](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/)에서 Dynamic Type Sizes 정보를 확인할 수 있다.

## 폰트 다이나믹 타입 설정

- UILabel의 `adjustFontForContentSizeCategory`를 true로 설정
    - 스토리보드에서 Dynamic Type: Automatically Adjust Font 체크박스를 선택한 것과 동일
- Xcode - Open Developer Tool - Accessibility Insepector 로 시뮬레이터를 테스트 할 수 있음

## 버튼의 텍스트에 다이나믹 타입 설정

- [에제 프로젝트 - ScrollView](./ScrollView)
- UIButton의 텍스트는 폰트를 다이나믹 타입으로 설정해도 시뮬레이터에서 바로 바뀌지 않음 (스토리보드에 Dynamic Type: Automatically Adjust Font 체크박스도 없음)
    - UIButton의 titleLable 프로퍼티에 코드로 접근하면 가능
    - 노티피케이션 센터에서 UIContentSizeCategory.didChangeNotification을 받아서 핸들링 할 수 있다.

야곰은 위 노티의 핸들링 메서드에서 버튼의 titlelabel의 adjustsFontForContentSizeCategory = ture로 계속 설정하는데 뭔가 이상한 예시인 것 같다.  
  
버튼을 구성할 때 미리 titleLabel의 adjustsFontForContentSizeCategory = ture로 해주면 사이즈 바뀔 때마다 이걸 true로 할 필요없다.
  
이 예시에서는 UIContentSizeCategory.didChangeNotification 노티가 있다는 것을 기억하면 될 것 같다. (바뀔때 텍스트가 아닌 이미지 뷰의 크기를 변경 하고 싶다든지 할 때 사용할 수 있지 않을까?)
