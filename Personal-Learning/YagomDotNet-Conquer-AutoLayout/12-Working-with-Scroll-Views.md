# 12. Working with Scroll Views

- [야곰닷넷 강좌 바로가기](hhttps://yagom.net/courses/autolayout/lessons/working-with-scroll-views/topic/the-basis/)
- [Auto Layout Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithScrollViews.html#//apple_ref/doc/uid/TP40010853-CH24-SW1)

## The basics

- 스크롤뷰를 오토레이아웃 환경에서 사용할 때 고려해야 할 사항이 있음
- [에제 프로젝트 - ScrollView](./ScrollView)

### 스크롤 뷰 사용하기

1. 씬에 스크롤 뷰를 추가한다
2. 스크롤 뷰를 다른 뷰 처럼 오토레이아웃을 해본다.
3. 스클로 뷰에 뷰를 넣고 이름을 Content View로해준다. (실제론 이름 변경하지 않아도 되지만 명확하게하기위해 바꿔주는 듯)
4. Content View를 스크롤 뷰의 각 엣지에정렬해준다.
5. 수평 스크롤을 끄려면(수직 스크롤을 하려면)Content View의 너비를 스크롤 뷰의 너비와 같게제약을 준다
6. 수직 스크롤을 끄려면(수평 스크롤을 하려면)Content View의 높이를 스크롤 뷰의 높이와 같게제약을 준다
7. Content View안에 원하는 뷰를 넣고 제약을주면 제약에 맞게 스크롤뷰의 레이아웃이 드디어 완성됨 (스크롤 뷰의 크기는 컨텐츠의 크기이기 때문에컨텐츠의 크기가 지정되야 스크롤 뷰의 크기가 정해지는것)

### 특정 뷰를 스크롤되지 않고 고정하고 싶으면

- Content Layout Guide가 아닌 Frame Layout Guide와 제약을 주면 됨 
