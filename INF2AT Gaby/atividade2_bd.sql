CREATE database clinica;
-- DROP database clinica;

-- CREATE DATABASE CLINICA;
-- RG, CPF e CNPJ - iremos utilizar varchar pois
-- se possui 0 a esquerda e a direita serão omitidos no INT

CREATE TABLE paciente(
pk_cod_pac int(4) PRIMARY KEY AUTO_INCREMENT,
nome varchar(30) NOT NULL,
dt_nasc date NOT NULL,
rg char(10) NOT NULL ,
sexo char(1) NOT NULL,
fone varchar(14) NOT NULL,
est_civil varchar(10) NOT NULL,
endereco varchar(50) NOT NULL,
cidade varchar(30) NOT NULL,
estado char(2) NOT NULL,
CONSTRAINT sexo_ck CHECK (sexo  in ('M','F','f','m')),
CONSTRAINT rg_uk UNIQUE (rg)
);

CREATE TABLE medico (
pk_cod_med int(4) PRIMARY KEY,
nome varchar(30) NOT NULL,
crm char(10) NOT NULL,
especialidade varchar(30) NOT NULL,
fone varchar(14) NOT NULL
);
-- valor e desconto não serão NOT NULL pois quero gerer
-- um problema e apresentar uma solução
CREATE TABLE atendimento (
pk_cod_atendimento int(4) PRIMARY KEY,
fk_cod_pac int(4) NOT NULL,
fk_cod_med int(4) NOT NULL,
dt_atendimento date NOT NULL,
diagnostico varchar(50),
valor decimal(10,2),
desconto decimal(10,2)
);

CREATE TABLE plano_saude (
pk_cod_plano int(4) PRIMARY KEY,
nome_plano varchar(30) NOT NULL,
desconto decimal(10,2)
);

CREATE TABLE exame (
pk_cod_exame int(4) PRIMARY KEY,
fk_cod_atendimento int(4) NOT NULL,
exame varchar(50) NOT NULL,
dt_exame date NOT NULL,
resultado varchar(50),
valor decimal(10,2),
desconto decimal(10,2)
);

CREATE TABLE paciente_plano (
fk_cod_pac int(4) NOT NULL,
fk_cod_plano int(4) NOT NULL,
CONSTRAINT cod_pac_fk FOREIGN KEY(fk_cod_pac)
REFERENCES paciente (pk_cod_pac)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT cod_plano_fk FOREIGN KEY(fk_cod_plano)
REFERENCES plano_saude (pk_cod_plano)
ON DELETE CASCADE
ON UPDATE CASCADE
);

ALTER TABLE atendimento
ADD CONSTRAINT cod_med_fk
FOREIGN KEY(fk_cod_med)
REFERENCES medico(pk_cod_med)
ON DELETE CASCADE
;

ALTER TABLE atendimento
ADD CONSTRAINT cod_pac_ate_fk
FOREIGN KEY(fk_cod_pac)
REFERENCES paciente(pk_cod_pac)
ON DELETE CASCADE
;

ALTER TABLE exame
ADD CONSTRAINT cod_atendimento_fk
FOREIGN KEY(fk_cod_atendimento)
REFERENCES atendimento(pk_cod_atendimento)
ON DELETE CASCADE
;

---------------------------------------------------------------------------------------------------------------
-- INSERTS --
----------------------------------------------------------------------------------------------------------------
INSERT INTO paciente (pk_cod_pac, nome, dt_nasc, rg, sexo, fone, est_civil, endereco, cidade,estado)
VALUES (1, 'PEDRO BIAL PEREIRA', '1964-08-15', '1234567890', 'M', '2131111587','Solteiro','RUA BARATA RIBEIRO, 320','Rio de Janeiro', 'RJ');
INSERT INTO paciente
VALUES (2, 'BILL GATES', '1955-10-28', '7784512393', 'M', '55854789651','Casado','Rua Ms. Office', 'SAN DIEGO', 'CA' );
INSERT INTO paciente
VALUES (3, 'Steve Jobs', '1955-02-24', '8745874582', 'M', '08008008000','Casado','RUA Macintosh', 'LOS ANGELES', 'CA');
INSERT INTO paciente
VALUES (4, 'LUANA PIOVANI', '1976-08-29', '7845784541', 'F', '2188694545','Solteira','RUA BARATA RIBEIRO, 321', 'Rio de Janeiro', 'RJ');
INSERT INTO paciente
VALUES (5, 'MARLON M MINUSSI', '1975-10-03', '7064476299', 'M', '5197389225','Casado','Av. Leo Kraether', 'Santa Cruz do Sul', 'RS');

-- INSERTS em lotes --
INSERT INTO plano_saude
VALUES     (1,'IPE',10),
        (2,'UNIMED',15),
        (3,'CASSI',20);

INSERT INTO paciente_plano
VALUES     (1,1),
        (2,2),
        (1,3),
        (4,1),
        (5,1);

-- ADD um campo esquecido
ALTER TABLE medico ADD salario DECIMAL(10,2) NOT NULL
;

INSERT INTO medico
VALUES (1, 'Ray Pinto', '0116668966', 'Urologia','5487578874', 5000);
INSERT INTO medico
VALUES (2, 'Ivo Heart', '0326689543',  'Cardiologia','5499847458', 8000);
INSERT INTO medico
VALUES (3, 'Dr. Jekyll', '666874500', 'Cirurgia Geral','5581814545', 4875.25);

INSERT INTO atendimento  (pk_cod_atendimento, fk_cod_pac, fk_cod_med, dt_atendimento, diagnostico,valor,desconto)
VALUES (1, 1, 3, '2019-08-01','Infeção urinária, necessita fazer exame urina', 70.50, 7.5);
INSERT INTO atendimento VALUES (2, 2, 1, CURDATE() , '', 100, 15);
INSERT INTO atendimento VALUES (3, 3, 3, '2019-08-15', 'Exame de sangue e urina', 70.50, 7.5);
INSERT INTO atendimento VALUES (4, 4, 2, '2019-08-14', '', 100, null);
INSERT INTO atendimento VALUES (5, 2, 3, CURDATE(), 'Necessitando fazer exame de sangue', 70.50, 11.32);

INSERT INTO exame VALUES (1, 1, 'Exame de urina','2019-07-03', 'Normal',  70.50, 7.5);
INSERT INTO exame VALUES (2, 3, 'Exame de urina','2019-08-01', 'Normal', 70.50, 7.5);
INSERT INTO exame VALUES (3, 3, 'Exame de sangue','2019-08-02', 'Alterado', 70.50, 7.5);
INSERT INTO exame VALUES (4, 3, 'Exame de sangue','2019-08-02', 'Alterado', 100, NULL);
INSERT INTO exame VALUES (5, 5, 'Exame de sangue', CURDATE(), 'Alterado', 70.50, 11.32);

---------------------------------------------------------------------------------------------------------------
-- INSERINDO COM AUTOINCREMENT --
----------------------------------------------------------------------------------------------------------------
-- INSERT COM AUTO_INCREMENT
INSERT INTO paciente
VALUES (pk_cod_pac,'Renato Gaucho', '1962-09-09', '7711847579', 'M', '5188979651','Casado','Porto Alegre,RS', 'Porto Alegre', 'RS');
INSERT INTO paciente
VALUES (pk_cod_pac,'DANRLEI', '1973-04-18', '0075123654', 'M', '5132589745','Solteiro','Porto Alegre, RS', 'Porto Alegre', 'RS');
INSERT INTO paciente
VALUES (pk_cod_pac,'Joaquin', '1977-11-18', '4473545454', 'M', '5132789749','Solteiro','Rua Silva Só, Nº 236', 'Porto Alegre', 'RS');
INSERT INTO paciente
VALUES (pk_cod_pac,'Vitor', '1973-04-15', '0177474474', 'M', '51325747403','Casado','Rua Independência, Nº 456', 'Porto Alegre', 'RS');
INSERT INTO paciente
VALUES (pk_cod_pac,'Roth', '1960-11-24', '0478474324', 'M', '5134754744','Casado','Rua 24 de outubro, Nº 1402', 'Porto Alegre', 'RS');


INSERT INTO paciente_plano
VALUES (6,2);
INSERT INTO paciente_plano
VALUES (7,3);
INSERT INTO paciente_plano
VALUES (8,1);


INSERT INTO atendimento (pk_cod_atendimento, fk_cod_pac, fk_cod_med, dt_atendimento, diagnostico, valor )
VALUES (6, 5, 1, CURDATE(), 'Seguir orientações do médico', 100);
INSERT INTO atendimento VALUES (7, 6, 1, CURDATE(), 'Seguir orientações do médico', 100, NULL);
INSERT INTO atendimento VALUES (8, 2, 3, CURDATE(), 'Seguir orientações do médico', 75.5, NULL);

INSERT INTO paciente_plano
VALUES (7,1);
INSERT INTO paciente_plano
VALUES (4,3);
INSERT INTO paciente_plano
VALUES (10,2);



select * from paciente;
select * from medico;
select * from atendimento;

INSERT INTO medico
VALUES(4,'Gabriella Gomes','6666666666',
        'Psiquiatria', '999999999999', 10000.50);

INSERT INTO paciente
VALUES (pk_cod_pac,'Alana Adams', '2006-02-19',
 '1234567891', 'F', '5188979653','Casada',
 'Osvaldo Aranha,666', 'Venâncio Aires', 'RS');
 
INSERT INTO paciente
VALUES (pk_cod_pac,'Ruan Gabriel Bueno', '2006-02-19',
 '1234567892', 'M', '5188979653','Solteiro',
 'Interior,669', 'Mato Leitão', 'RS');

SET sql_safe_updates=0;

UPDATE paciente
SET nome = 'Alana Adams Marquetto'
WHERE pk_cod_pac=12;

UPDATE paciente
SET pk_cod_pac=11
WHERE pk_cod_pac=12;

select * from paciente;

insert into paciente
values (pk_cod_pac, 'Gabryelle Elize Liserro', '2005-10-24', '1298776666', 'f', '51980402453', 'solteira', 'Edmundo Feix, 1685',
'Venâncio Aires', 'RS');

update paciente
set nome = 'Leon Kennedy'
where pk_cod_pac=11;

update paciente
set nome = 'Ada Wong'
where pk_cod_pac=9

set sql_safe_updates=0;
set autocommit=0;