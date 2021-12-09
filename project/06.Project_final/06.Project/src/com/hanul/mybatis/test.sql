-- 응시자 정보 입력 테이블
create table Student (
  code    number primary key not null,
  name    varchar2(20) not null,
  subject varchar2(30) not null,
  score   number,
  pass    varchar2(20),
  day     varchar2(20)
);

select * from Student;

commit;

-- 정답 테이블
create table Answer(
  subject 	varchar2(30) primary key not null,
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

--시험과목과 정답
insert into answer (subject, answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9, answer10) 
values('정보처리기사', 4, 2, 2, 3, 3, 4, 4, 1, 3, 2);

insert into answer (subject, answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9, answer10)
values ('전기기능사', 4, 3, 1, 1, 3, 2, 3, 2, 5, 2);

insert into answer (subject, answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9, answer10)
values ('자동차정비기능사', 2, 3, 1, 4, 3, 4, 2, 5, 1, 3);


-- 응시자 입력 테이블
create table testAnswer(
  code	  number primary key not null,
  subject varchar2(30) not null,
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










