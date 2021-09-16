# 7. Debugging Auto Layout

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/debugging-auto-layout/)
- [Debugging Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/TypesofErrors.html#//apple_ref/doc/uid/TP40010853-CH17-SW1)


## 에러의 종류

- Unsatisfiable Layout: 주어진 Constraint 만으로 레이아웃할 수 없을 때
- Ambiguous Layouts: 중복된 Constraint이 많아서 애매함
- Logical Errors: 논리적 오류

## Unsatisfiable Layout

만족하지 않는 제약 방지하기
- 뷰를 코드로 추가하는 경우 자주 발생 
    - translatesAutoresizingMaskIntoConstraints 프로퍼티를 false로 해제 해야하는데 까먹고 안한 경우
- 부모 뷰가 너무 작아서 뷰가 표현될 화면이 좁을 때
    - 미리 부모뷰에 충분한 크기를 준다

## Ambiguous Layout

애매한 레이아웃 발견하는 방법 (lldb 명령어로 확인)

## Debugging Tricks and Tips

### 로그 이해하기

- [WTF Auto Layout 사이트](https://www.wtfautolayout.com/)

위 사이트에 아래 로그를 입력해보면 결과 확인할 수있음

~~~
// 아래 로그 입력해보기
(
    "<NSLayoutConstraint:0x7a87b000 H:[UILabel:0x7a8724b0'Name'(>=400)]>",
    "<NSLayoutConstraint:0x7a895e30 UILabel:0x7a8724b0'Name'.leading == UIView:0x7a887ee0.leadingMargin>",
    "<NSLayoutConstraint:0x7a886d20 H:[UILabel:0x7a8724b0'Name']-(NSSpace(8))-[UITextField:0x7a88cff0]>",
    "<NSLayoutConstraint:0x7a87b2e0 UITextField:0x7a88cff0.trailing == UIView:0x7a887ee0.trailingMargin>",
    "<NSLayoutConstraint:0x7ac7c430 'UIView-Encapsulated-Layout-Width' H:[UIView:0x7a887ee0(320)]>"
)
~~~

### 로그에 identifier 추가하기

- Accessibility identifier를 지정해두면 로그에 같이 출력된다.
- Constraint에도 identifier를 지정할 수 있음

### view와 constraint를 시각적으로 보기

- 브레이크포인트 걸린 상태에서 Xcode - Debug - View Debugging -> Show Alignment Rectangles 누르면 시뮬레이터에서 확인할 수 있다
