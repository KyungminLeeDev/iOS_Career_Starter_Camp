# 2. Anatomy of a Constraint

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/anatomy-of-a-constraint/)
- [Auto Layout Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)

## Attributes (속성)

### Anatomy of a Constraint

Constraint는 수식으로 나타낼 수 있다.

![](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/Art/view_formula_2x.png)

RedView의 왼쪽이 BlueView의 오른쪽과 8pt 만큼 거리가 있는 것을 나타내는 수식 (y=mx+c 공식을 생각해보자)

### Auto Layout Attributes

![](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/Art/attributes_2x.png)

- Leading/Trailing: 글이 시작 또는 끝나는 방향이라는 의미
    - Left/Right라고도 쓰이지만 Leading/Trailing을 사용하는게 좋다.
    - 글자 쓰는 방향 (LTR 또는 RTL)에 대응하기위해서 Left/Right 보다는 Leading/Trailing을 사용한다.
- Top/Bottom
- Center X/Y
- Baseline: 글자의 밑바닥 라인 (Label안 텍스트의 바닥)
- Width/Height: 이 두개 속성만 크기를 나타내고 나머지 속성은 위치에 관한 속성이다.

<br/><br/><br/>



## Sample Equations

- attribute의 두가지 타입
    - Size attributes: Height, Width
    - location attributes: Leading, top...
  
규칙
- size attribute는 location attribute와 constraint를 만들 수 없음 (당연히 크기와 위치 속성을 같이 사용할 수 없음)
- location attribute에는 상수 값을 할당할 수 없음 (Size 처럼 상수를 딱 할당하는게 아니라, 특정 기준점에서 얼만큼 위치한다. 이런식으로 해야한다는 말)

흔히 사용되는 constraint의 샘플 방정식

~~~swift
// Setting a constant height
// View의 높이는 40pt
View.height = 0.0 * NotAnAttribute + 40.0
 
// Setting a fixed distance between two buttons
// 버튼2의 leading은 버튼1의 trailing에서 8만큼 떨어짐
Button_2.leading = 1.0 * Button_1.trailing + 8.0
 
// Aligning the leading edge of two buttons
// 버튼1과 버튼2의 leading 정렬을 맞춤
Button_1.leading = 1.0 * Button_2.leading + 0.0
 
// Give two buttons the same width
// 버튼1과 버튼2의 너비가 같다
Button_1.width = 1.0 * Button_2.width + 0.0
 
// Center a view in its superview
// View가 상위뷰의 정가운데 위치
View.centerX = 1.0 * Superview.centerX + 0.0
View.centerY = 1.0 * Superview.centerY + 0.0
 
// Give a view a constant aspect ratio
// aspect ration(가로세로 비율)설정
// View의 높이는 너비의 2배
View.height = 2.0 * View.width + 0.0
~~~

### Equality, Not Assignment

`=` 표시는 수학적 의미의 `같다, 동등`을 표현하는 것이며 프로그래밍적 의미인 할당을 의미하지 않은다는 것을 주의해야 함  
  
그러므로 위의 샘플을 반대로 표현하면 아래 샘플이 됨

~~~swift
// Setting a fixed distance between two buttons
Button_1.trailing = 1.0 * Button_2.leading - 8.0
 
// Aligning the leading edge of two buttons
Button_2.leading = 1.0 * Button_1.leading + 0.0
 
// Give two buttons the same width
Button_2.width = 1.0 * Button.width + 0.0
 
// Center a view in its superview
Superview.centerX = 1.0 * View.centerX + 0.0
Superview.centerY = 1.0 * View.centerY + 0.0
 
// Give a view a constant aspect ratio
View.width = 0.5 * View.height + 0.0
~~~

<br/><br/><br/>



## Creating Nonambiguous Layouts

모호하지 않은 레이아웃 만들기 -> 명확하게 지시하기
  
컴퓨터는 자의적 판단을 못하므로 완벽하게 지시해줘야 함
  
![](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/Art/constraint_examples_2x.png)

X축만 보자면 위 3가지는 모두 레이아웃을 문제 없이 만들 수 있다.  
  
X축의 위치와 너비를, Y축에서 위치와 너비를 알려주면 컴퓨터는 이 뷰를 그릴 수 있음  

<br/><br/><br/>



## Variety Solutions

![](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/Art/Blocks_Portrait_2x.png)
![](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/Art/Blocks_Landscape_2x.png)

위 샘플을 직접 해본다.  
[예제 프로젝트](./AutoLayoutExamples)  
- 같은 레이아웃도 다양한 방식으로 구현할 수 있다.
- 레이아웃 확인하기
    - Xcode -> Editor -> Preview 에서 다양한 기기와 방향의 레이아웃을 프리뷰할 수 있다.
    - 다양한 기기 화면을 동시에 가능

<br/><br/><br/>



## Constraints on Storyboard

- 스토리보드의 Size inspector에서 constraint를 확인할 수 있다.
- 위의 두 방법중 정답은 없다. (개별 constraint주는 방법과 align으로 주는 방법)
- 다만 뷰의 관계에 따라 더 나은 방법을 생각해야 함

<br/><br/><br/>



## Constraint Priorities

부등호로 최소, 최대를 정할 수 있다.

~~~swift
// Setting the minimum width
// 최소 너비 지정
View.width >= 0.0 * NotAnAttribute + 40.0
 
// Setting the maximum width
// 최대 너비 지정
View.width <= 0.0 * NotAnAttribute + 280.0
~~~

> View는 너비는 40보다 크거나 280보다 작다

그럼 View 너비는 대체 몇이라는 건가?  
연관된 다른 View부터 계산된 뒤에 View의 너비가 40~280범위에서 계산될 것임  

### Constraint Priorities: 제약 우선도

- 두 제약이 충돌한다면 우선도가 낮은 것이 무시된다.
- 우선도는 1~1000 을 줄 수 있다. (1이라도 높으면 더 강하다)
- low(250), medium(500), high(750), required(1000) 우선도 값이 열거형으로 정의되있고, 직접 값을 줄 수 도 있다.
- 제약이 충돌하지 않는다면 우선도는 상관없어진다.

<br/><br/><br/>



## Intrinsic Content Size: 고유 컨텐트 사이즈

- UIView: Intrinsic Content Size 없음
- Slider: iOS에서는 높이만 정의
- Labels, buttons, switches, text fields: 고유의 컨텐트로 높이와 너비를 정의함
- Text view, image view: Intrinsic Content Size가 다양하게 측정될 수 있음

Intrinsic Content Size는 뷰의 현재 컨텐츠의 사이즈에 기반한다.  
  
Text view의 Intrinsic Content Size
- 스크롤이 켜져있으면 없음
- 스크롤이 꺼져있으면 텍스트의 길이에 따라 결정
  
실습
- Label: leading, top 제약만으로 완성
- View: trailing, top 제약만으로는 않됨, 사이즈 제약이 없기 때문
- Button: Label과 동일
- Slide: Intrinsic Content Size의 높이만 정의되므로 leading, top 제약만으로는 않됨, 너비 지정해줘야함

### Intrinsic Content Size가 없는 View에 직접 지정해주려면?

Placeholder로 임시적인 Intrinsic Content Size를 지정해줄 수 있다.
- 하지만 스토리보드에서만 임시로 적용되는 것이고, 실행중에는 적용되지 않음

UiView의 커스텀 클래스를 만들고 intrinsicContentSize를 override하여 지정할 수 있다
  
@IBDesignable 어노테이션을 추가하면 스토리보드에서 사용가능

~~~swift
@IBDesignable
class MyView: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 50, height: 50)
    }
}
~~~

<br/><br/><br/>


## CHCR

![](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/Art/intrinsic_content_size_2x.png)

- Content (compression) resistance: 외뷔에서 안쪽으로 누를때 줄어들지 않으려고 버티는 힘
- Content hugging: compression과 반대되는 개념이 아님, intrinsicContentSize에 맞게 줄여들려고 하는 힘 (늘어나지 않으려고 버티는 힘)
- CRCH을 Intrinsic Content Size를 기준으로 priority를 가지고 동작

~~~swift
// Compression Resistance
View.height >= 0.0 * NotAnAttribute + IntrinsicHeight
View.width >= 0.0 * NotAnAttribute + IntrinsicWidth
 
// Content Hugging
View.height <= 0.0 * NotAnAttribute + IntrinsicHeight
View.width <= 0.0 * NotAnAttribute + IntrinsicWidth
~~~

- Label이 늘어나지 않으면 좋겠다: CH를 지정
- Lable이 줄어들지 않으면 좋겠다: CR을 지정
