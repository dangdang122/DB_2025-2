--제품 테이블에 데이터 행들을 추가

INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
INSERT INTO 제품 VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
INSERT INTO 제품 VALUES ('p04', '맛난초콜릿', 1250, 2500, '한빛제과');
INSERT INTO 제품 VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');
INSERT INTO 제품 VALUES ('p06', '동동우동', 1000, 1550, '민국푸드');
INSERT INTO 제품 VALUES ('p07', '달콤비스킷', 1650, 4500, '한빛제과');


select *from 제품 order by 제품번호;

INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구','2022-01-01');
INSERT INTO 주문 VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구','2022-01-10');
INSERT INTO 주문 VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시','2022-01-11');
INSERT INTO 주문 VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구','2022-02-01');
INSERT INTO 주문 VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시','2022-02-20');
INSERT INTO 주문 VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군','2022-03-02');
INSERT INTO 주문 VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구','2022-03-15');
INSERT INTO 주문 VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시','2022-04-10');
INSERT INTO 주문 VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시','2022-04-11');
INSERT INTO 주문 VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '2022-05-22');


insert into 고객 values('apple', '정소화', 20, 'gold', '학생', 1000);
insert into 고객 values('banana', '김선우', 25, 'vip', '간호사', 2500);
insert into 고객 values('carrot', '고명석', 28, 'gold', '교사', 4500);
insert into 고객 values('orange', '김용욱', 22, 'silver', '학생', 0);
insert into 고객 values('melon', '성원용', 35, 'gold', '회사원', 5000);
insert into 고객(고객아이디, 고객이름, 등급, 직업, 적립금) values('peach', '오형준', 'gold', '교사', 4500);
insert into 고객 values('pear', '채광주', 31, 'silver', '회사원', 500);
--오류 원인 : 무결성 제약조건에 위배(존재하지않은 제품번호 사용)


--모든 컬럼을 조회(검색)
select * from 주문;
select 고객아이디, 고객이름, 나이, 등급, 직업, 적립금 from 고객;

--중복형을 허용한 결과행(모든행을 조회)
select 주문고객 from 주문;
select all 주문고객 from 주문;

--중복형을 허용하지 않는 결과행
select distinct 주문고객 from 주문;

-- 고객 아이디, 고객이름, 등급 컬럼만 고객테이블에서 조회(검색)하시오.
select 고객아이디, 고객이름, 등급 from 고객;

--주문고객, 주문제품, 배송지, 주문일자를 주문테이블에서 조회(단, 주문고객은 고객아이디, 주문제품은 제품번호로 출력)
--as 또는 공백문자
select 주문고객 as 고객아이디, 주문제품 제품번호, 배송지, 주문일자 from 주문;
select 주문고객, 주문제품, 배송지, 주문일자 from 주문;

--제품명, 단가 속성을 제품테이블에서 조회 (단가 +500, 단가 => 조정 단가라는 가상컬럼명 사용
select 제품명, 단가 +500 "조정단가" from 제품;


--제품테이블에서 한빛제과가 제조한 제품의 제품명, 재고량, 단가를 검색하시오.
select 제품명, 재고량, 단가 from 제품 where 제조업체='한빛제과';
--고객테이블에서 직업이 회사원인 고객의 고객이름, 나이, 직업을 검색하시오.
select 고객이름, 나이, 직업 from 고객 where 직업= '회사원';

--고객 테이블에서 직업이 회사원인 고객의 나이가 33세 미만인 고객의 고객 아이디, 고객이름, 나이, 직업을 검색하시오.
select 고객아이디, 고객이름, 나이, 직업 from 고객 where 직업= '회사원' and 나이<33;

--고객 테이블에서 등급이 gold 이거나 직업이 의사인 고객의 고객이름, 등급, 직업을 검색하시오.
select 고객이름, 등급, 직업 from 고객 where 등급= 'gold' or 직업 = '간호사';

-- 고객 테이블에서 나이가 20세 이상이고 30세 이하인 고객이면서 등급이 gold 또는 silver인 고객의 나이, 등급, 직업을 검색하시오.
select 나이, 등급, 직업 from 고객 where (나이 >=20 and 나이<=30) and (등급='gold' or 등급= 'silver') and 직업= '학생';









