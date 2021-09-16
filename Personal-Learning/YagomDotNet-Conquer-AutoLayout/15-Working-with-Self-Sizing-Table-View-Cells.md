# 15. Working with Self-Sizing Table View Cells

- [야곰닷넷 강좌 바로가기](https://yagom.net/courses/autolayout/lessons/working-with-self-sizing-table-view-cells/)
- [Working with Self-Sizing Table View Cells](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSelf-SizingTableViewCells.html#//apple_ref/doc/uid/TP40010853-CH25-SW1)

## The Basics

- iOS에서 오토레이아웃을 사용하면 테이블 뷰의 셀의 높이를 오토레이아웃이 알아서 정의해준다. (문서에서는 이 기능이 기본값이 아니라고 쓰여있지만, 아카이브된 문서이고, 이제는 기본값으로 지원한다.)  

~~~swift
tableView.estimatedRowHeight = 85.0
tableView.rowHeight = UITableViewAutomaticDimension
~~~

- 이전에는 위 코드를 작성해야했는데 이제는 안해도 된다!!  
- 셀에 미리 정의된 컨텐트(textLabel, detailTextLabel 등)이 레이아웃은 변경 불가 (컨텐트와 다른 서브뷰의 위치 제약은 가능)
- 미리 정의된 imageView에 이미지를 넣으면 이 사이즈에 제약을 줄 수 없다. (그러므로 딱 맞는 이미지 파일의 사이즈를 원하는 사이즈로 넣어야 함) -> 결국 셀을 커스텀 해야 함

## Self-Sizing Table View Cell Practice

- [예제 프로젝트 - SelfSizing](./SelfSizing)
- Cell에 컨텐츠를 넣을때는 contentView에 넣는것이 좋다
    - 악세서리 뷰 등에 침범받지 않기 위해
    - 그래야 셀프 사이징 됨

