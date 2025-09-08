-- like 연산자

--고객 테이블에서 성이 김씨인 고객의 고객이름, 나이, 등급을 검색하시오.
select 고객이름, 나이, 등급 from 고객 where 고객이름 like '김%';

select * from 고객;

-- 고객 테이블에서 등급에 i문자가 포함된 고객의 고객이름, 등급, 직업을 검색하시오.
select 고객이름, 등급, 직업 from 고객 where 등급 like '%i%';

-- 고객 테이블에서 고객아이디에 a문자가 포함된 고객의 고객 아이디, 고객이름, 등급, 직업 검색
select 고객아이디, 고객이름, 등급, 직업 from 고객 where 고객아이디 like '%a%';

-- 고객 테이블에서 고객 아이디에 a문자가 포함되어 있고 등급에 i문자가 포함된 고객의 고객아이디, 고객이름, 등급, 직업 검색
select 고객아이디, 고객이름, 등급, 직업 from 고객 where 고객아이디 like '%a%' and 등급 like '%i%';

-- 고객테이블에서 고객아이디가 5글자인 고객의 고객아이디, 나이, 등급, 직업, 적립금을 검색하시오.
select 고객아이디, 나이, 등급, 직업, 적립금 from 고객 where 고객아이디 like '_____';

--고객 테이블에서 고객 아이디가 5글자이고 적립금이 3000원 이상인 고객의 고객아이디, 나이 ,등급, 직업, 적립금 검색
select 고객아이디, 나이, 등급, 직업, 적립금 from 고객 where 고객아이디 like '_____' and 적립금>=3000;

-- 고객 테이블에서 직업명이 사로 끝나는 고객의고객이름, 직업, 등급을 검색하시오
select 고객이름,직업,등급 from 고객 where 직업 like '%사';

-- 고객 테이블에서 직업명이 사로 끝나는 고객의고객이름, 직업, 등급을 검색하시오
select 고객이름,직업,등급 from 고객 where 직업 like '_사';



-- null을 이용한 검색
-- is null OR is not null 연산자

-- 고객 테이블에서 나이가 아직 입력되지 않은 고객의 고객이름, 나이를 검색하시오.
select 고객이름, 나이 from 고객 where 나이 is null;

-- 고객 테이블에서 나이가 입력된 고객의 고객이름, 나이를 검색하시오.
select 고객이름, 나이 from 고객 where 나이 is not null;

-- 입력된 값이 없는 컬럼(필드)은 비교연산 결과가 false라서 검색이 되지 않는다.

-- 고객 테이블에서 나이가 25세 미만인 고객의 고객이름, 나이를 검색하시오. 
select 고객이름, 나이 from 고객 where 나이<25;

-- 고객 테이블에서 나이가 25세 이상인 고객의 고객이름, 나이를 검색하시오. 
select 고객이름, 나이 from 고객 where 나이>=25;


-- ordere by 절 (정렬)
-- asc(오름차순:작은값에서 큰값 순서), desc(내림차순: 큰값에서 작은값 순서)
-- null: 오름차순 맨뒤, 내림차순 맨처음

-- 고객 테이블에서 고객이름, 나이를 검색하시오. 단 나이를 기준으로 오름차순 정렬하시오.
select 고객이름, 나이 from 고객 order by 나이 asc; --asc 생략 가능
-- 고객 테이블에서 고객이름, 나이를 검색하시오. 단 나이를 기준으로 오름차순 정렬하시오.
select 고객이름, 나이 from 고객 order by 나이 desc;

-- 고객테이블에서 등급이 gold 또는 vip인 고객의 고객이름, 나이, 등급, 직업을 검색하시오. 단, 고객의 등급을 기준으로 오름차순
select 고객이름, 나이, 등급, 직업 from 고객 where 등급='gold' or 등급='vip' order by 등급 asc;
select 고객이름, 나이, 등급 직업 from 고객 where 등급 in('gold', 'vip') order by 등급 asc;



-- 주문테이블에서 주문제품이 p03 또는 p06의 제품을 주문하고 배송지가 경기도인 행을 검색하시오.단 주문수량을 기준으로 내림차순 정렬하시오.
select * from 주문 where (주문제품 ='p03' or 주문제품 ='p06') and 배송지 like '%경기도%' order by 수량 desc; --?????

select * from 주문 where 주문제품 in('p03', 'p06') and 배송지 like '%경기도$' order by 수량 desc; --아 안에 데이터가 없구나

insert into 주문 values('o01', 'apple', 'p03', 10, '서울시 마포구', '2022-01-01');
insert into 주문 values('o02', 'melon', 'p01', 5, '인천시 계양구', '2022-01-01');
insert into 주문 values('o03', 'banana', 'p06', 45, '경기도 부천시', '2022-01-11');
insert into 주문 values('o04', 'carrot', 'p02', 8, '부산시 금정구', '2022-02-01');
insert into 주문 values('o05', 'melon', 'p06', 36, '경기도 용인시', '2022-02-20');
insert into 주문 values('o06', 'banana', 'p01', 19, '충청북도 보은군', '2022-03-02');
insert into 주문 values('o07', 'apple', 'p03', 22, '서울시 영등포구', '2022-03-15');
insert into 주문 values('o08', 'pear', 'p02', 50, '강원도 춘천시', '2022-04-10');
insert into 주문 values('o09', 'banana', 'p04', 15, '전라남도 목포시', '2022-04-11');
insert into 주문 values('o010', 'carrot', 'p03', 20, '경기도 안양시', '2022-05-22');

-- 주문테이블에서 수량이 10개 이상인 주문의 주문고객, 주문제품, 수량, 주문일자를 검색하시오.
-- 단, 주문제품을 기준으로 오름차순 정렬하고 동일 주문제품은 수량을 기준으로 내림차순 정렬하시오.
select 주문고객, 주문제품, 수량, 주문일자 from 주문 where 수량 >= 10 order by 주문제품 asc, 수량 desc;

-- 주문테이블에서 a 또는 b로 시작하고 수량이 10개 이상인 주문의 주문고객, 주문제품, 수량, 배송지를 검색하시오.
-- 단, 주문고객을 기준으로 내림차순 정렬하고 동일 주문고객은 주문제품을 기준으로 내림차순 정렬하시오.
select 주문고객, 주문제품, 수량, 배송지 from 주문 where (주문고객 like 'a%' or 주문고객 like 'b%') and 수량 >=10 order by 주문고객 asc, 주문제품 desc;

-- 집계함수
-- count(), max(), min(), sum(), avg()
-- select절, having절에서만 사용할 수 있다.
-- null값이 들어 있는 컬럼의 값은 제외하고 계산한다.

-- 제품테이블에서 단가의 평균을 검색하시오.
-- 소수점 둘째자리에서 반올림, round(avg(단가),2)
select * from 제품;
select avg(단가) as 단가평균 from 제품; --as 생략 가능!!
select round (avg(단가),0) as 단가평균 from 제품;
select round (avg(단가),2) as 단가평균 from 제품;

-- 올림함수
select ceil(avg(단가)) 단가평균 from 제품;
-- 내림함수
select floor (avg(단가)) 단가평균 from 제품;

-- 한빛제과에서 제조한 제품의 재고량 합계를 제품테이블에서 검색하시오.
select sum(재고량) as "재고량 합계" from 제품 where 제조업체 = '한빛제과';

-- 단가가 2500원 이상인 제품의 단가의 합계를 제품테이블에서 검색하시오.
select sum(단가) as "2500원 이상인 단가 합계" from 제품 where 단가 >=2500;

-- 고객 수 구하기
-- 1. 고객아이디(PK)
select count (고객아이디) 고객수 from 고객;
-- 2. 나이 (null 값이 있는 컬럼인 경우)
select count(나이) 고객수 from 고객; --6
-- 3. * 사용
select count(*) 고객수 from 고객; --7

select * from 고객;