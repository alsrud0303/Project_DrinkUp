# DrinkUp

## 앱 소개
DrinkUp은 사용자가 하루 물 섭취량을 기록하고 목표 달성 여부를 확인할 수 있는 건강 관리 앱입니다.

## 주요 기능
- 하루 목표 물 섭취량 설정
- 물 섭취 기록 추가
- 총 섭취량 확인 및 진행률 표시
- 하루 기록 초기화
- 섭취 기록 리스트 확인

## 기술 스택
- Swift 5
- SwiftUI
- Combine (ObservableObject, @Published)

## 개발 환경
- Xcode 15 이상
- macOS 13 이상

## Swift 프로젝트 구조
- DrinkUp/                  <- Xcode 프로젝트 최상위 폴더
  - DrinkUp.xcodeproj      <- Xcode 프로젝트 파일
  - DrinkUp/               <- 실제 코드 파일 폴더
    - ContentView.swift
    - SettingView.swift
    - WaterDataManager.swift
    - DailyWaterData.swift
    - WaterRecord.swift
  - Assets.xcassets         <- 앱 아이콘, 이미지 등
  - Preview Content/        <- SwiftUI 미리보기 관련
  - README.md               <- GitHub 제출용 README
