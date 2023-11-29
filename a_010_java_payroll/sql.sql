-- Oracle 연결 확인
select sysdate from dual;

-- 인사 마스터(테이블 명 : hr_master)
create table hr_master (
   id          char(6)   primary key,  --사원번호
   name        varchar(30),            --성명
   jumin1      char(6),                --주민번호1
   jumin2      char(7),                --주민번호2
   department  char(4),                --소속
   grade       char(2),                --직급
   ho          number(2),              --호봉
   status      char(1),                --재직상태
   date_in     date,                   --입사일자
   date_out    date                    --퇴직일자
);

desc hr_master       -- 테이블 확인
drop table hr_master -- 테이블 삭제

-- 데이터 입력
insert into hr_master values ('201001', '김준비', '700101', '1037011', '2100', '10', 14, '1', '20010101', '22991231');
insert into hr_master values ('202001', '이태규', '710102', '1041011', '1100', '10', 11, '1', '20020101', '22991231');
insert into hr_master values ('202002', '김광태', '720103', '1057012', '3100', '10', 12, '1', '20020101', '22991231');
insert into hr_master values ('203001', '박민수', '730201', '1073013', '1130', '11', 13, '1', '20030101', '22991231');
insert into hr_master values ('204001', '홍해경', '740311', '2089014', '5100', '10', 11, '1', '20040101', '22991231');
insert into hr_master values ('204002', '유재두', '801101', '1105015', '5110', '21', 12, '1', '20040801', '22991231');
insert into hr_master values ('204003', '정나라', '800402', '2121016', '3110', '21', 13, '1', '20040801', '22991231');
insert into hr_master values ('204004', '손병기', '810104', '1137017', '1120', '31', 13, '1', '20040801', '22991231');
insert into hr_master values ('205001', '김정희', '810811', '2153018', '5110', '21', 12, '1', '20050501', '22991231');
insert into hr_master values ('205002', '박선영', '821021', '2169019', '5120', '31', 13, '1', '20050501', '22991231');
insert into hr_master values ('205003', '이만기', '830220', '1185020', '4100', '10', 12, '1', '20050501', '22991231');
insert into hr_master values ('206001', '정태준', '840205', '1201021', '1110', '11', 12, '1', '20061001', '22991231');
insert into hr_master values ('206002', '조승국', '840306', '1217022', '1120', '21', 13, '1', '20061001', '22991231');
insert into hr_master values ('206003', '최석금', '840407', '2233023', '1110', '31', 13, '1', '20061001', '22991231');
insert into hr_master values ('206004', '정선희', '840508', '2249024', '5120', '31', 12, '1', '20061001', '22991231');
insert into hr_master values ('206005', '박태준', '840609', '1265035', '3110', '31', 14, '1', '20061201', '22991231');
insert into hr_master values ('206006', '한나라', '840710', '1265005', '3120', '21', 14, '1', '20061201', '22991231');
insert into hr_master values ('206007', '명재남', '840811', '1275221', '1130', '31', 13, '1', '20061201', '22991231');
insert into hr_master values ('206008', '서민석', '840710', '1275231', '4110', '31', 14, '1', '20061201', '22991231');
insert into hr_master values ('206009', '김병석', '840811', '1201205', '4120', '21', 13, '9', '20061201', '20230630');

select * from hr_master; -- 전체 검색
commit; -- 데이터 실제 저장

-- 기준 적용 코드(테이블 명 : hr_standard_code)
create table hr_standard_code (
   std1      char(2),       --구분코드
   std2      char(6),       --코드
   name      varchar2(30),  --코드명
   std_won   number(8,1),   --금액
   std_rate1 number(4,1),   --지급기준율
   std_rate2 number(4,1),   --지급기준율
   std_rate3 number(4,1),   --지급기준율
   sys_in    date,          --등록일자
   primary key(std1, std2)
);

desc hr_standard_code;       -- 테이블 확인
drop table hr_standard_code; -- 테이블 삭제

-- 데이터 입력
insert into hr_standard_code values ('11', '1100', 'HR팀',                0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '1110', 'HR팀 기획',            0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '1120', 'HR팀 급여',            0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '1130', 'HR팀 교육',            0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '2100', '기획팀',               0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '3100', 'SI팀',                0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '3110', 'SI팀 공공',            0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '3120', 'SI팀 금융',            0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '4100', 'SM팀',                0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '4110', 'SM팀 솔루션',           0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '4120', 'SM팀 공금/금융',        0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '5100', '홍보팀',               0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '5110', '홍보팀 국내',           0,0,0,0,sysdate);
insert into hr_standard_code values ('11', '5120', '홍보팀 국외',           0,0,0,0,sysdate);

insert into hr_standard_code values ('21', '10', '팀장',              500000,0,0,0,sysdate);
insert into hr_standard_code values ('21', '11', '팀원',                  0,0,0,0,sysdate);
insert into hr_standard_code values ('21', '21', '팀원',              100000,0,0,0,sysdate);
insert into hr_standard_code values ('21', '31', '팀원',              200000,0,0,0,sysdate);

insert into hr_standard_code values ('91', '11', '평일지급율',       100,150,150,200,sysdate);
insert into hr_standard_code values ('91', '12', '공휴지급율',       150,150,150,200,sysdate);
insert into hr_standard_code values ('91', '13', '월차수당',         100,150,0,0,sysdate);
insert into hr_standard_code values ('91', '14', '년차수당',         100,150,0,0,sysdate);
insert into hr_standard_code values ('91', '15', '생리수당',         100,100,0,0,sysdate);

insert into hr_standard_code values ('99', '1', '재직',             0,0,0,0,sysdate);
insert into hr_standard_code values ('99', '9', '퇴직',             0,0,0,0,sysdate);

insert into hr_standard_code values ('00', '00', '구분',             0,0,0,0,sysdate);
insert into hr_standard_code values ('00', '11', '소속',             0,0,0,0,sysdate);
insert into hr_standard_code values ('00', '21', '직급',             0,0,0,0,sysdate);
insert into hr_standard_code values ('00', '91', '지급기준',             0,0,0,0,sysdate);
insert into hr_standard_code values ('00', '99', '재직상태',             0,0,0,0,sysdate);

select * from hr_standard_code; -- 전체 검색
commit; -- 데이터 실제 저장

-- 호봉 코드(테이블 명 : hr_hobong_code)
create table hr_hobong_code (
   grade       char(2),        --직급
   ho          number(2),      --호봉
   ho_won      number(7),      --금액
   sys_in      date,           --등록일자
   primary key(grade, ho)
);

desc hr_hobong_code;       -- 테이블 확인
drop table hr_hobong_code; -- 테이블 삭제

-- 데이터 입력
insert into hr_hobong_code values ('10', 11, 4500000, sysdate);
insert into hr_hobong_code values ('10', 12, 5000000, sysdate);
insert into hr_hobong_code values ('10', 13, 6000000, sysdate);
insert into hr_hobong_code values ('10', 14, 7000000, sysdate);

insert into hr_hobong_code values ('11', 11, 3100000, sysdate);
insert into hr_hobong_code values ('11', 12, 3300000, sysdate);
insert into hr_hobong_code values ('11', 13, 3800000, sysdate);
insert into hr_hobong_code values ('11', 14, 4000000, sysdate);

insert into hr_hobong_code values ('21', 11, 3000000, sysdate);
insert into hr_hobong_code values ('21', 12, 3200000, sysdate);
insert into hr_hobong_code values ('21', 13, 3700000, sysdate);
insert into hr_hobong_code values ('21', 14, 3900000, sysdate);

insert into hr_hobong_code values ('31', 11, 3300000, sysdate);
insert into hr_hobong_code values ('31', 12, 3600000, sysdate);
insert into hr_hobong_code values ('31', 13, 4000000, sysdate);
insert into hr_hobong_code values ('31', 14, 4300000, sysdate);

select * from hr_hobong_code; -- 전체 검색
commit; -- 데이터 실제 저장

-- 월 근태(테이블 명 : hr_month_work)
create table hr_month_work (
   w_ym        char(6),      --근태년월
   id          char(6),      --사원번호
   month_std   number(2),    --월 기준일수
   month_work  number(2),    --월 지급일수
   month_minus number(3,1),  --제외 일 수
   m13         number(1),    --생리 수당
   m14         number(1),    --월차 수당
   not11_2     number(4,1),  --평일OT
   nnt11_3     number(4,1),  --평일NT
   hol12_1     number(3,1),  --공휴지급 일 수
   hol12_2     number(3,1),  --공휴지급OT
   hol12_3     number(3,1),  --공휴지급NT
   sys_in      date,         --등록일자
   primary key(w_ym, id)
);

desc hr_month_work;       -- 테이블 확인
drop table hr_month_work; -- 테이블 삭제

-- 데이터 입력
-- 2023/01월 월 근태
insert into hr_month_work values ('202301', '201001', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '202001', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '202002', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '203001', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '204001', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '204002', 30, 30, 1, 0, 0, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '204003', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '204004', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '205001', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '205002', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '205003', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '206001', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '206002', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '206003', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '206004', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '206005', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '206006', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '206007', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '206008', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202301', '206009', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');

-- 2023/02월 월 근태
insert into hr_month_work values ('202302', '201001', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '202001', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '202002', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '203001', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '204001', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '204002', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '204003', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '204004', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '205001', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '205002', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '205003', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '206001', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '206002', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '206003', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '206004', 30, 30, 0, 1, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '206005', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '206006', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '206007', 30, 30, 2, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '206008', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');
insert into hr_month_work values ('202302', '206009', 30, 30, 0, 0, 1, 0, 0, 0, 0, 0, '20230125');

select * from hr_month_work; -- 전체 검색
commit; -- 데이터 실제 저장

-- 급여지급자료(테이블 명 : hr_month_payroll)
create table hr_month_payroll (
   pay_ym             char(6),       -- 지급년월
   id                 char(6),       -- 사원번호
   name               varchar(30),   -- 성명
   jumin1             char(6),       -- 주민번호1
   jumin2             char(7),       -- 주민번호2
   department         char(4),		 -- 소속
   grade              char(2),		 -- 직급
   ho                 number(2),	 -- 호봉
   status             char(1),       -- 재직상태
   month_std          number(2),     -- 월 기준일 수
   month_work         number(2),	 -- 월 지급 일 수
   month_minus        number(3,1),   -- 제외 일 수
   m13                number(1),     -- 생리 수당
   m14                number(1),     -- 월차 수당
   not11_2            number(4,1),   -- 평일 OT
   nnt11_3            number(4,1),   -- 평일 NT
   hol12_1            number(3,1),   -- 공휴지급 일 수
   hol12_2            number(3,1),   -- 공휴지급 OT
   hol12_3            number(3,1),   -- 공휴지급 NT
   pay_ho             number(9),     -- 호봉
   pay_month_std      number(9),     -- 월 기준일 수
   pay_month_work     number(9),     -- 월 지급일 수
   pay_month_minus    number(7),     -- 제외 일 수
   pay_m13            number(7),     -- 생리 수당
   pay_m14            number(7),     -- 월차 수당
   pay_not11_2        number(7),     -- 평일 OT
   pay_nnt11_3        number(7),     -- 평일 NT
   pay_hol12_1        number(7),     -- 공휴지급 일 수
   pay_hol12_2        number(7),     -- 공휴지급 OT
   pay_hol12_3        number(7),     -- 공휴지급 NT
   pay_process_tol    number(9),     -- 계산된 전체 금액
   pay_process_min    number(9),     -- 계산된 공제 금액
   pay_process        number(9),     -- 차인 지급액
   sys_in             date,          -- 등록일자
   primary key(pay_ym, id)
);

desc hr_month_payroll;       -- 테이블 확인
drop table hr_month_payroll; -- 테이블 삭제

select sum(ho) from hr_master; -- 테스트 검색

-- 인사 마스터 검색 조회문 (Pay_Master_List.java)

-- 검색할 때 기본 포맷
select id, name, jumin1, jumin2, department, grade, ho, status,
       to_char(date_in, 'yyyy-mm-dd') date_in, 
       to_char(date_out, 'yyyy-mm-dd') date_out 
  from hr_master;
  
-- 1을 입력 받을 시 조회문 - id(사원번호) 순으로 정렬
select id, name, jumin1, jumin2, department, grade, ho, status,
       to_char(date_in, 'yyyy-mm-dd') date_in, 
       to_char(date_out, 'yyyy-mm-dd') date_out 
  from hr_master order by id;
  
-- 소속번호를 입력 받을 시 조회문 - 소속(department)을 입력받아서 조회
select id, name, jumin1, jumin2, department, grade, ho, status,
       to_char(date_in, 'yyyy-mm-dd') date_in, 
       to_char(date_out, 'yyyy-mm-dd') date_out 
  from hr_master
    where department = ;
    
-- 사원번호를 입력 받을 시 조회문 - 사원번호(id)를 입력받아서 조회
select id, name, jumin1, jumin2, department, grade, ho, status,
       to_char(date_in, 'yyyy-mm-dd') date_in, 
       to_char(date_out, 'yyyy-mm-dd') date_out 
  from hr_master
    where id = ;

-- 기준 정보 검색 조회문 (Pay_StandardCode_List.java)

-- 검색할 때 기본 포맷
select std1, std2, std_won, std_rate1,
       std_rate2, std_rate3, name
  from hr_standard_code;

-- 1을 입력 받을 시 조회문 - std1(구분) 순으로 정렬
select std1, std2, std_won, std_rate1,
       std_rate2, std_rate3, name
  from hr_standard_code order by std1;
  
-- 구분을 입력 받을 시 조회문 - std1를 입력받아서 조회
select std1, std2, std_won, std_rate1,
       std_rate2, std_rate3, name
  from hr_standard_code
    where std1 = ;

-- 호봉 정보 검색 조회문 (Pay_HobongCode_List.java)

-- 검색할 때 기본 포맷
select grade, ho, ho_won
   from hr_hobong_code;

-- 1을 입력 받을 시 조회문 - grade(직급) 순으로 정렬
select grade, ho, ho_won
   from hr_hobong_code
     order by grade;
        
-- 직급(2자리)를 입력 받을 시 조회문 - grade(직급)을 입력받아서 조회
select grade, ho, ho_won
   from hr_hobong_code
     where grade = ;
     
-- 급여 마스터 검색 조회문 (Pay_Hobong_List.java)
     
-- 검색할 때 기본 포맷
select a.id, a.name, a.jumin1, a.jumin2,
	   (select b.name from hr_standard_code b where a.grade = b.std2 and b.std1 = '21') grade, 
	   (select c.ho_won from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_won, 
	   (select c.ho_won*12 from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_year, 
	   (select b.name from hr_standard_code b where a.status = b.std2 and b.std1 = '99') status,
	   to_char(date_in,  'yyyy-mm-dd') date_in, 
	   COALESCE(NULLIF(TO_CHAR(date_out, 'yyyy-mm-dd'), '2299-12-31'), ' ') date_out, 
	   a.department,
	   (select b.name from hr_standard_code b where a.department = b.std2 and b.std1 = '11') department_name
  from hr_master a;

-- 1을 입력 받을 시 조회문 - ho_year(연봉) 순으로 정렬
select a.id, a.name, a.jumin1, a.jumin2,
	   (select b.name from hr_standard_code b where a.grade = b.std2 and b.std1 = '21') grade, 
	   (select c.ho_won from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_won, 
	   (select c.ho_won*12 from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_year, 
	   (select b.name from hr_standard_code b where a.status = b.std2 and b.std1 = '99') status,
	   to_char(date_in,  'yyyy-mm-dd') date_in, 
	   COALESCE(NULLIF(TO_CHAR(date_out, 'yyyy-mm-dd'), '2299-12-31'), ' ') date_out, 
	   a.department,
	   (select b.name from hr_standard_code b where a.department = b.std2 and b.std1 = '11') department_name
  from hr_master a
   order by ho_year desc;

-- 2를 입력 받을 시 조회문 - department(소속) 순으로 정렬
select a.id, a.name, a.jumin1, a.jumin2,
	   (select b.name from hr_standard_code b where a.grade = b.std2 and b.std1 = '21') grade, 
	   (select c.ho_won from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_won, 
	   (select c.ho_won*12 from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_year, 
	   (select b.name from hr_standard_code b where a.status = b.std2 and b.std1 = '99') status,
	   to_char(date_in,  'yyyy-mm-dd') date_in, 
	   COALESCE(NULLIF(TO_CHAR(date_out, 'yyyy-mm-dd'), '2299-12-31'), ' ') date_out, 
	   a.department,
	   (select b.name from hr_standard_code b where a.department = b.std2 and b.std1 = '11') department_name
  from hr_master a
   order by grade;
	   
-- 3을 입력 받을 시 조회문 - date_in(입사일) 순으로 정렬
select a.id, a.name, a.jumin1, a.jumin2,
	   (select b.name from hr_standard_code b where a.grade = b.std2 and b.std1 = '21') grade, 
	   (select c.ho_won from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_won, 
	   (select c.ho_won*12 from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_year, 
	   (select b.name from hr_standard_code b where a.status = b.std2 and b.std1 = '99') status,
	   to_char(date_in,  'yyyy-mm-dd') date_in, 
	   COALESCE(NULLIF(TO_CHAR(date_out, 'yyyy-mm-dd'), '2299-12-31'), ' ') date_out, 
	   a.department,
	   (select b.name from hr_standard_code b where a.department = b.std2 and b.std1 = '11') department_name
  from hr_master a
   order by date_in;
   
-- id(사번)을 입력 받을 시 조회문 
select a.id, a.name, a.jumin1, a.jumin2,
	   (select b.name from hr_standard_code b where a.grade = b.std2 and b.std1 = '21') grade, 
	   (select c.ho_won from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_won, 
	   (select c.ho_won*12 from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_year, 
	   (select b.name from hr_standard_code b where a.status = b.std2 and b.std1 = '99') status,
	   to_char(date_in,  'yyyy-mm-dd') date_in, 
	   COALESCE(NULLIF(TO_CHAR(date_out, 'yyyy-mm-dd'), '2299-12-31'), ' ') date_out, 
	   a.department,
	   (select b.name from hr_standard_code b where a.department = b.std2 and b.std1 = '11') department_name
  from hr_master a
   where id = ;
   
-- department(소속)을 입력 받을 시 조회문
select a.id, a.name, a.jumin1, a.jumin2,
	   (select b.name from hr_standard_code b where a.grade = b.std2 and b.std1 = '21') grade, 
	   (select c.ho_won from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_won, 
	   (select c.ho_won*12 from hr_hobong_code c where a.ho = c.ho and a.grade = c.grade) ho_year, 
	   (select b.name from hr_standard_code b where a.status = b.std2 and b.std1 = '99') status,
	   to_char(date_in,  'yyyy-mm-dd') date_in, 
	   COALESCE(NULLIF(TO_CHAR(date_out, 'yyyy-mm-dd'), '2299-12-31'), ' ') date_out, 
	   a.department,
	   (select b.name from hr_standard_code b where a.department = b.std2 and b.std1 = '11') department_name
  from hr_master a
   where department = ;
   
-- 월 근태정보 검색 조회문 (Pay_MonthWork_List.java)
   
-- 검색할 때 기본 포맷
select w_ym, id, month_std, month_work,
       month_minus, m13, m14, not11_2, nnt11_3,
       hol12_1, hol12_2, hol12_3
  from hr_month_work
   where w_ym = ;