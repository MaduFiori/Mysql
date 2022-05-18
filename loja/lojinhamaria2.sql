/**
 Agenda de contatos
 @author Maria
 */
 
 create database loja;
 use loja;
 
 create table produtos(
	id int primary key auto_increment,
	nomeprod varchar (255) not null,
    estoque int (255) not null,
    setor varchar (255) not null,
    preco decimal(10,2) not null
 );
 
 alter table produtos modify column estoque int not null;
 describe produtos;
 

 