create database clinica;
create table paciente(
cod_pac integer primary key,
nome varchar(30) not null,
dt_nasc date not null,
rg numeric(10) not null,
fone numeric(12) not null,
est_civil varchar(10) not null,
endereco varchar(50) not null,
cidade varchar(50) not null,
estado char(2) not null,
cep numeric(10) not null);

select * from paciente;

show tables;

alter table paciente
add sexo char(1);

alter table paciente
modify sexo char(1) not null;

alter table paciente
change sexo sexo_paciente char(1);

alter table paciente
add cpf int(11) not null;
alter table paciente
modify rg varchar(10) not null;
alter table paciente
modify cpf varchar(1) not null;
alter table paciente
modify cep int(8) not null;
alter table paciente
modify fone char(11) not null;

drop table paciente;