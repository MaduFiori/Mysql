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

 -- excluir uma coluna da tabela
alter table contatos drop column obs;
alter table contatos drop column telefone2;
alter table contatos drop column cel;

-- excluir tabela (drop table ***)