/**
 Agenda de contatos
 @author Maria
 */
 
 -- Verificar bancos de dados 
 show databases;
 
 -- Criar um nono banco de dados
 create database teste;
 create database agendaMaria;
 
 -- Deletar banco de dados
 drop database teste;
 
 -- selecionar o banco de dados que quer adicionar informações
 use agendaMaria;
 
 -- criando uma tabela
 -- int -> tipo de dados - número inteiro
 -- decimal(10,2) -> tipo de dados - nímeros não inteiros
 -- (10,2) 10 dígitos com 2 casas decimais
 -- primary key (transforma o campo em chave primária)
 -- auto_incremente (númeração automática)
 -- varchar(255) -> tipo de dados string (com variação)
 -- char(255) ->  tipo de dados string (sem variação)
 -- 255 - máximo de caracteres
-- not null (obrigatório o preenchimento)

 create table contatos (
	id int primary key auto_increment,
    nome varchar (255) not null,
    telefone varchar (255) not null,
    email varchar (255) not null
 );
 
-- verificar tabelas do banco
show tables; 

-- descrever a tabela
describe contatos;

-- adicionando uma coluna a tabela
alter table contatos add column obs varchar (255);
alter table contatos add column telefone2 varchar (255);

-- alterando uma coluna a tebela após um campo
alter table contatos add column cel varchar (255) after telefone;

-- modificando uma propriedadeda da coluna tabela
alter table contatos modify column cel varchar (255) not null;
alter table contatos modify column email varchar(255);

 -- excluir uma coluna da tabela
alter table contatos drop column obs;
alter table contatos drop column telefone2;
alter table contatos drop column cel;

-- excluir tabela (drop table ***)

/***** CRUD *****/

-- CRUD CREATE
-- inserir um registro na tabela
-- tipo varchar ou usar 'aspas simples'

insert into contatos (nome, telefone, email)
values ('Maria', '99798-6940', 'maria@email.com');
insert into contatos (nome,telefone)
values ('Dudinha', '94002-8922');
insert into contatos (nome,telefone,email)
values ('Jotinha','99999-9999','jotinha@email.com');
insert into contatos (nome,telefone,email)
values ('João','96854-5869','joão@email.com');
insert into contatos (nome,telefone,email)
values ('Renan','90909-0909','renanzinho@email.com');
insert into contatos (nome,telefone,email)
values ('Gustavo','98989-9898','gutavo@email.com');
insert into contatos (nome,telefone,email)
values ('Fernando','97568-8590','fernando@email.com');
insert into contatos (nome,telefone,email)
values ('Katia','93547-8976','katia@email.com');

-- CRUD READ
-- seleção de todos os registros da tabela

select * from contatos;

-- seleção de um registro epecífico

select * from contatos where id=2;
select * from contatos where nome='jotinha';
select * from contatos where nome like 'j%';

-- seleção de campos específicos
select nome,telefone from contatos;

-- ordem alfabética
select nome,telefone,email from contatos order by nome;
-- ordem de z-a
select nome,telefone,email from contatos order by nome desc; 

-- criar apelido para os campos
select nome as Contato, telefone as Telefone, email as Email
from contatos order by nome;

-- CRUD UPDATE
-- altera informações (não esquecer de dizer qual id)

update contatos set email='dudinha@email.com' where id=2;
update contatos set nome='Renanzinho' where id=4;
update contatos set nome='Katinha', telefone='99999-0000', email='katinha@bol.com' where id=7;

-- CRUD DELETE

delete from contatos where id=7;