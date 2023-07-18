create database if not exists mysudent;
create table mysudent.classes
(
    classId   varchar(20) not null
        primary key,
    stuNum    int         not null,
    className varchar(20) not null
)
    charset = utf8;

create table mysudent.administrator
(
    tcId       varchar(20) not null
        primary key,
    tcName     varchar(20) not null,
    tcClassId  varchar(20) not null,
    tcSex      varchar(20) not null,
    tcPassword varchar(20) not null,
    constraint tc_class_id_fk
        foreign key (tcClassId) references mysudent.classes (classId)
)
    charset = utf8;

create table mysudent.course
(
    CourseId   varchar(20) not null
        primary key,
    CourseTime varchar(20) not null,
    credit     int         not null,
    CourseName varchar(20) not null
)
    comment '¿Î³Ì±í' charset = utf8;

create table mysudent.student
(
    stuId       varchar(20) not null
        primary key,
    stuName     varchar(20) not null,
    stuSex      varchar(20) not null,
    stuClassId  varchar(20) not null,
    stuPassword varchar(20) not null,
    constraint stu_class_id
        foreign key (stuClassId) references mysudent.classes (classId)
)
    charset = utf8;

create table mysudent.grade
(
    gradeId     int auto_increment
        primary key,
    stuId       varchar(20) not null,
    stuName     varchar(20) not null,
    courseId    varchar(20) not null,
    tcId        varchar(20) not null,
    courseGrade varchar(20) not null,
    classId     varchar(20) not null,
    constraint class_id_fk
        foreign key (classId) references mysudent.classes (classId),
    constraint course_id_fk
        foreign key (courseId) references mysudent.course (CourseId),
    constraint stu_id_fk
        foreign key (stuId) references mysudent.student (stuId),
    constraint tc_name_fk
        foreign key (tcId) references mysudent.administrator (tcId)
)
    charset = utf8;

create table mysudent.user
(
    id       int auto_increment
        primary key,
    username varchar(20) not null,
    password varchar(20) not null,
    identity varchar(20) not null
)
    charset = utf8;

