-- 데이터 모두 출력
SELECT * FROM shopdb.tbl_board;

-- tbl_board에서 no, title, writer만 출력
SELECT no, title, writer FROM tbl_board;

-- tbl_board의 데이터 중 작성자 한명의 글만 출력
SELECT content FROM tbl_board WHERE writer = 'che';

-- 위의 번개 표시를 누르면 하나씩 순차적으로 실행된다.