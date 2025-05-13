-- productTBL 출력 
SELECT * FROM shopdb.productTBL;

-- memberTBL의 memberName,memberAddress 출력 
SELECT memberName, memberAddress FROM memberTBL;

-- memberTBL의 '지운이'만 출력
SELECT memberName FROM memberTBL WHERE memberName = '지운이';

-- 위의 번개 표시를 누르면 하나씩 순차적으로 실행된다.