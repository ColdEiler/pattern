create table student (
                         id          int PRIMARY KEY auto_increment,
                         lastname   varchar(128) not null,
                         firstname  varchar(128) not null,
                         father_name varchar(128) not null,
                         phone       varchar(20) null,
                         telegram    varchar(100) null,
                         email       varchar(100) null,
                         git         varchar(100) null,

);