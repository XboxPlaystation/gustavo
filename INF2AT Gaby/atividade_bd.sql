drop database venda;
create database venda;
drop table paciente;

 create table clientes(
			pk_cod_cliente integer(8) auto_increment,
            nome varchar(50) not null,
            endereco varchar(40) not null,
            cidade varchar(30) not null,
            estado char(2) not null,
            cep numeric(10) not null,
            constraint primary key (pk_cod_cliente),
            constraint cep check (cep >= 1000)
);
select * from cliente;

create table produtos(
		pk_cod_produto integer(8) auto_increment,
        descricao varchar(50) not null,
        perecivel char(1) not null,
        validade date not null,
        detalhes varchar (250) not null
);

create table vendas(
		pk_cod_venda integer(8) not null,
        cod_cliente integer(8) not null,
        cod_produto integer(8) not null,
        quantidade numeric(10,3) not null
);

alter table produtos
add constraint validade_ck
check (perecivel = 'V' and validade is not null);