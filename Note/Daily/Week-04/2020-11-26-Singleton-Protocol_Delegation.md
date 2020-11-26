# iOS 스타터 캠프 - 2020.11.26 목요일

# 강의 노트

## 면담 의견 피드백

- 리뷰를 빨리 해주면 좋겠다
    - 현직자기에 느린 점은 양해바란다
- 리뷰마다 피드백이 다른 경우가 있다
    - 사람마다 코딩 스타일이 다르며, 다각도로 바라볼 수 있다

## Singleton, Delegation 디자인 패턴

- Delegation, Delegate 구분 되는 것인가?
    - Delegation 패턴에서 위임받는 것을 Delegate라고 칭한다

## Singleton 디자인 패턴

- 타입을 인스턴스화 하는 과정을 디자인한 패턴
- 타입의 인스턴스가 단 하나만 생성되도록 디자인한 패턴
- 코코아 터치 프레임워크의 싱글턴들
    - FileManager.default
    - NotificationCenter.default
- 싱글턴의 이름으로 shared는 현업에서 잘사용하지않음 (보안 관련)

~~~swift 
// 다른 인스턴스도 만들 수는 있는 변형된 싱글턴
struct Sun {
    // type property
    static let shared: Sun = Sun()
}

// 하나의 인스턴스
let sunA = Sun.shared
let sunB = Sun.shared
let sunC = Sun.shared

// 각기 다른 인스턴스
let sun1 = Sun()
let sun2 = Sun()
let sun3 = Sun()
~~~

~~~swift 
// 하나의 인스턴스만 강제하는 싱글턴
struct Sun {
    // type property
    static let shared: Sun = Sun()

    private init() {
    }
}

// 하나의 인스턴스
// 하지만 struct는 값타임이므로 값만 복사될 뿐이다
// 이후 A, B, C 프로퍼티에 다른 값을 넣으면 각각 달라진다
let sunA = Sun.shared
let sunB = Sun.shared
let sunC = Sun.shared

// 각기 다른 인스턴스 생성 불가
//let sun1 = Sun()
//let sun2 = Sun()
//let sun3 = Sun()
~~~

~~~swift 
// 싱글턴은 클래스로 만들자
class Sun {
    // type property
    static let shared: Sun = Sun()
    private init() {
    }
}
~~~

## Protocol

- 기능의 요구사항 (자바의 interface 개념과 비슷), 청사진
- 프로토콜을 이름을 지을 때는 보통 "~을 할 수 있다" 느낌으로 짓는다.
- 기능 구현을 직접 하지는 않고 어떤 기능이 필요한지 알려 준다.
- 프로토콜의 모든 요소를 구현해야 되는 것은 아니다.optional 키워드가 붙은 것은 구현하지 않아도 된다.
    - swift자체에서는 optional 사용을 못하므로 사용하려면 @objc를 붙여줘야 한다.


~~~swift
protocol Flyable {
    var name: String { get }
    var wings: Int { get set }
    func fly()
}

protocol Walkable {
    func walk()
}

struct Duck: Flyabl, Walkable {
    var name: String = "오리"
    var wings: Int = 2
    func fly() {
        print("푸드득")
    }
    func walk() {
        print("뒤뚱뒤뚱")
    }
}

struct Chicken: Flyable {
    var name: String { 
        return "치킨" 
    }
    var wings: Int = 4
    flry() {
        print("꼬꼬댁")
    }
}
~~~

~~~swift
protocol Makealbe {
    func makeSomething(withRecipe: String)
}

class JuiceMaker: Makeable {
    func makeSomething(withRecipe recipe: String) {
        print(recipe + "를 가지고 쥬스를 만든다")
    }
}

class CoffeeMaker: Makeable {
    func makeSomething(withRecipe recipe: String) {
        print(recipe + "를 가지고 커피를 만든다")
    }
}

class Shop {
    // Makeable 프로토콜을 준수한 어떤 타입도 가능하다
    var maker: Makeable

    intit(maker: Makeable) {
        self.maker = maker
    }
}

let juiceShop = Shop(maker: JuiceMaer())
juiceShop.maker.makeSomething(withRecipe: "오렌지 2개")

// 겨울되서 쥬스말고 다른것을 팔고자하면?
let coffeeShop = Shop(maker: CoffeeMaker())
coffeeShop.maker.makeSomething(withRecipe: "커피 1스푼")
~~~

타입간의 결합도를 낮춘다



## Delegation 디자인 패턴

- 프로토콜을 응용한 디자인 패턴


~~~swift
// CEODelegate로 이름지을 수 있다
protocol CEODelegate {
    func manageSchedule()
    func makeDocuments()
    func sayHello()
    func drive()
    var typingSpeed: Int { get }
    var grade: String { get }
}

struct 비서왕: CEODelegate {
    func manageSchedule() {
        print{"척척 스케쥴링"}
    }
    func makeDocuments() {
        print("척척 문서링")
    }
    func sayHello() {
        print("아침 문안인사 드립니다")
    }
    func drive() {
        print("레이싱 부웅~~")
    }
    var typingSpeed: Int = 700
    var grade: String = "A+"
}

struct 초보비서: CEODelegate {
    func manageSchedule() {
        print{"자꾸 빼먹네 스케쥴링"}
    }
    func makeDocuments() {
        print("허둥지둥 문서링")
    }
    func sayHello() {
        print("하이")
    }
    func drive() {
        print("가긴 합니다")
    }
    var typingSpeed: Int = 200
    var grade: String = "C-"
}

struct CEO {
    var delegate: CEODelegate?
}

var jinie: CEO = CEO()
var yagom: 초보비서 = 초보비서()
jinie.delegate = yagom
jinie.delegate?.drive()

// 운전을 너무 못해서 비서를 바꾼다
let 이승기 = 비서왕()
jinie.delegate = 이승기
jinie.delegate?.drive()
~~~

CEO의 비서는 Helpale 프로토콜만 충족하면 누구든 채용될 수 있다.


# 프로젝트

get을 잘 안 쓴다는 것을 알면서도 습관적으로 쓰게 되었어요. Swift의 네이밍에 관해 더 학습해야겠어요 ㅎㅎ

UInt를 Int로 변형하면서까지 하려 하다니 부끄럽네요 다른 간단한 방법이 있는지 더 찾아봤어야 했는데 어제는 이상하게 이쪽으로만 생각이 가더라고요

코멘트 감사합니다! 머지 부탁드려요~!!

