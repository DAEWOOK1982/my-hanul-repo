create table tblBook(
     title varchar2(30),
     name VARCHAR(20),
     isbn VARCHAR(20) PRIMARY KEY not null,
     com  VARCHAR(20),
     cost number,
     qty  number,
     price number
);

select *
from tblbook;

alter table tblbook rename column com to comp;