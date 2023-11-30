## 급여작업 프로젝트 - 인사 급여 시스템 🏆
***JAVA를 활용한 BATCH 프로그램(일괄 작업 / 급여 관리)*** -  인사 급여 시스템
> 정리한 노션 사이트 : <a href="https://dlclfh.notion.site/55fd23b481534c0b88d218f1c81bb423?pvs=4">Notion</a>
## 제작 순서 🔨
> 정리 노션 : <a href="https://dlclfh.notion.site/460b40edce084ec495ffc9143df18546?pvs=4">Notion</a>
#### 1. DB(DataBase) package 부분
- DB 연결 :  _DB_connect.java_ 
#### 2. Main package 부분
- 메인 메뉴 페이지 생성 :  _Pay_MainMenu.java_
- 인사 마스터 검색 생성 : _Pay_Master_List.java_
- 기준 정보 검색 생성   : _Pay_StandardCode_List.java_
- 호봉 정보 검색 생성   : _Pay_HobongCode_List.java_
- 급여 마스터 검색 생성 : _Pay_Hobong_List.java_
- 월 근태 정보 검색 생성 : _Pay_MonthWork_List.java_
#### 3. DB 설계 부분
> 정리 노션 : <a href="https://dlclfh.notion.site/CREATE-INSERT-6a71b27ca3f74941aae6482e89aab591?pvs=4">Notion</a>
- 1 인사 마스터 (테이블 명 : hr_master)
- 2 기준 적용 코드 (테이블 명 : hr_standard_code) 
- 3 호봉 코드 (테이블 명 : hr_hobong_code) 
- 4 월 근태 (테이블 명 : hr_month_work)
- 5 급여 지급 자료 (테이블 명 : hr_month_payroll)
---
### 실행 순서 🛒
1. _Pay_MainMenu.java_ 에서 번호를 입력 받아서 각 번호에 해당하는 _class_ 에 메인으로 넘어간다.
2. 기능부분 페이지를 작성을하고, 각 부분에 맞는 해당 sql 조회문을 작성한다.
3. 인사 급여 시스템을 작성한다.
---
### _Language_ : _Java, Sql(Oracle)_
