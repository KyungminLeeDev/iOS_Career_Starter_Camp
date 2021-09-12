# 1. Understanding Auto Layout

- [Auto Layout Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)
- 오토레이아웃은 size와 position을 constraints에 기반하여 계산한다.

## 뷰를 변화시키는 외부적 요인

- 유저가 윈도우의 사이즈를 조절 (OS X)
- 유저가 iPad의 스플릿 뷰에 들거가거나 나가거나 (iOS)
- 기기 회전 (iOS)
- call bar(전화할 때 보임), audio recording bar(녹화할 때 보임) 보이기, 안보이기 (iOS)
- 다양한 사이즈 클래스 지원해야할 때
- 다양한 스크린 사이즈 지원해야할 때
- 뷰를 변화시키는 내부적 요인

## 뷰를 변화시키는 내부적 요인

- 앱안에서 사용자가 버튼을 누르거나 했을때 사이즈가 변하는 등의 애니메이션
- 국제화 지원
- 다이나믹 타입 (텍스트 사이즈 조정)

## 오토 레이아웃 vs frame 기반 레이아웃

- Frame 기반으로 절대값을 주어서 하드 코딩 했음
- 오토 레이아웃은 상대적인 값 기반으로 여러 크기에 대응되게 함