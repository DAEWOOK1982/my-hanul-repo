-- 응시자 정보 입력 테이블
create table Student (
  code    number primary key not null,
  name    varchar2(10) not null,
  subject varchar2(20) not null,
  score number,
  pass  varchar2(5),
  day     varchar2(20)
);

select * from Student;

commit;

-- 정답 테이블
create table Answer(
  subject varchar2(20) primary key not null,
  answer1   number,
  answer2   number,
  answer3   number,
  answer4   number,
  answer5   number,
  answer6   number,
  answer7   number,
  answer8   number,
  answer9   number,
  answer10  number
);

select * from Answer;

commit;

-- 응시자 입력 테이블
create table testAnswer(
  subject varchar2(20) primary key not null,
  test1   number,
  test2   number,
  test3   number,
  test4   number,
  test5   number,
  test6   number,
  test7   number,
  test8   number,
  test9   number,
  test10  number
);

select * from testAnswer;

commit;










