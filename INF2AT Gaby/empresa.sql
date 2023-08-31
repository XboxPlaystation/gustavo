create database empresa;
create table deposito (
cod_dep char(3),
regiao char(3) not null,
cidade varchar(20) not null,
constraint primary key(cod_dep)
);

create table item(
cod_item int(3) auto_increment,
nome varchar(20) not null,
marca varchar(20) not null,
constraint primary key (cod_item)
);

create table estoque(
cod_dep char(3) not null,
cod_item int(3) not null,
qntd int(6) not null,
fator decimal (2, 1) not null,
estq_min int(3),
constraint cod_dep_fk foreign key(cod_dep)
references deposito (cod_dep)
on delete cascade
on update cascade,
constraint cod_item_fk foreign key(cod_item)
references item (cod_item)
on delete cascade
on update cascade
);

insert into item (cod_item, nome, marca)
values ('001' , 'Faca' , 'Tramontina'
insert into item
values ('002' , 'Tesoura' , 'Tramontina'
insert into item
values ('003' , 'Copo' , 'Tramontina'
insert into item
values ('111' ,  'Cadeira' ,  'MSA'
insert into item
values ('112' , 'Ventilador' , 'MSA'
insert into item
values ('113' ,  'Mesa' ,  'MSA'
insert into item
values ('221' ,  'Copo' ,  'Hering'
insert into item
values ('222' , 'Taça' , 'Hering' 
insert into item
values ('337' , 'Skate' , 'Caloi'
insert into item
values ('338' , 'Bicicleta' , 'Caloi'

