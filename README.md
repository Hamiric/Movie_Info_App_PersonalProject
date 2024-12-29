# Movie Info App
개인 과제 - 영화 정보 앱

## 프로젝트 소개
아래의 기능들이 있는 영화 정보 앱

## 실행 영상
[[프로젝트 실행 영상]](https://youtu.be/OFab2P-uKIw)

<br>

| HomePage | DetailPage | RecommendPage | AiPage |
| --- | --- | --- | --- |
| <img src='readme/HomePage.png'> | <img src='readme/DetailPage.png'> | <img src='readme/RecommendPage.png'> | <img src='readme/AiPage.png'> |

<br>

< 필수 기능 > 
1. 화면 구현 (HomePage, DetailPage)
2. Hero 위젯을 사용한 애니메이션 효과
3. 클린 아키텍쳐를 활용해 TMDB API 가져오기

< 도전 기능 >
1. 테스트 코드 작성하기
2. 나만의 기능 추가
    
## 적용 기능
#### < 필수 기능 >
>* 화면 구현 (HomePage, DetailPage) : 
<br>영화 정보앱 UI 화면 구현<br><br>
>* Hero 위젯을 사용한 애니메이션 효과 : 
<br>페이지 전환시 같은 태그의 위젯끼리 연결되는듯한 Hero 애니메이션 효과 적용<br><br>
>* 클린 아키텍쳐를 활용해 TMDB API 가져오기 : 
<br>TMDB API 를 사용해, 현재 상영중, 인기순, 평점 높은순, 개봉예정, 영화 상세 관련 데이터를 가져오기. 구현시 클린 아키텍처를 활용해, 데이터레이어, 도메인레이어, 프레젠레이어를 나눠 코드 작성하기<br><br>
#### < 도전 기능 >
>* 테스트 코드 작성하기 :
<br>각각의 로직이 정상적으로 작동하는지 확인할 수 있는 테스트 코드를 작성하기<br><br>
#### < 자유 구현 >
>* 입력된 태그를 기반으로, AI가 영화를 추천해주는 기능 : 
<br>태그를 입력하여, AI에게 태그에 맞는 영화를 5개정도 추천해주도록 한다. 태그 입력은, 추천 태그중 하나를 눌러서 넣어도 되고, + 버튼을 눌러 직접 작성해도 된다. 다만, 너무 터무니 없는 태그를 넣었을 경우 AI가 엉뚱한 답변을 할 수도 있으니 주의!<br><br>
>* AI가 추천해주는 영화를 검색하는 기능 : <br>AI가 영화를 추천해 주면, 자동으로 해당 영화의 제목을 TMDB에 검색하여, 해당 영화의 정보를 받아온다.<br><br>

## 🚨 Trouble Shooting

<details>
<summary>📚[ Go_router의 트렌지션 효과, Hero 위젯 1대다 매칭법 ]</summary>
<div markdown="1">

### [ TIL - Go_router의 트렌지션 효과, Hero 위젯 1대다 매칭법 ](https://hamiric.tistory.com/99)

 <br>
</div>
</details>

## 📝Technologies & Tools (FE)

| 기술스택 | 배지 |
| --- | --- |
| Language | ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=Dart&logoColor=white) |
| Framework | ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=Flutter&logoColor=white) |
| Code Editor | ![VSCode](https://img.shields.io/badge/VSCode-0175C2?style=flat-square) |
| Library | ![RiverPod](https://img.shields.io/badge/RiverPod-6DB33F?style=flat-square) ![Go_router](https://img.shields.io/badge/Go_router-007396?style=flat-square) ![Dio](https://img.shields.io/badge/Dio-F8A000?style=flat-square) ![googlegemini](https://img.shields.io/badge/dotenv-512BD4?style=flat-square) ![Gemini](https://img.shields.io/badge/Gemini-8E75B2?style=flat-square&logo=googlegemini&logoColor=white) ![themoviedatabase](https://img.shields.io/badge/TMDB-01B4E4?style=flat-square&logo=themoviedatabase&logoColor=white) |
| Version Control | ![Git](https://img.shields.io/badge/Git-F05032?style=flat-square&logo=Git&logoColor=white) ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white) |