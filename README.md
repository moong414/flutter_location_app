# Flutter Location App

Flutter Location App은 사용자의 **현재 위치를 확인하고**, **해당 위치의 행정 주소를 검색하며**, **리뷰를 남길 수 있는**  위치 기반 앱입니다.  

## 주요 기능

- 현재 위치 가져오기 (`geolocator`)
- 위치 기반 행정 주소 검색 (`VWorld API`)
- 리뷰 작성 및 등록 (`Firebase Firestore`)
- 실시간 데이터 동기화 (`Firebase`)

---

## 기술 스택

| 기술          | 설명                           |
| ------------- | ------------------------------ |
| Flutter       | 크로스 플랫폼 앱 개발          |
| Riverpod      | 상태 관리                     |
| Firebase      | Firestore, Auth 사용           |
| Geolocator    | 현재 위치 가져오기             |
| VWorld API    | 좌표 → 행정 주소 변환          |
| Flutter Dotenv| 환경변수 관리 (`.env` 파일 사용) |

---

## 앱 실행 전 필수 설정

1. `google-services.json` 파일을 `android/app/` 디렉토리에 넣으세요.
2. `.env` 파일을 루트 디렉토리에 추가하세요.
