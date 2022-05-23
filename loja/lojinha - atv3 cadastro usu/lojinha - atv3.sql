/**
	Lojinha
    @author Maria Fiori
    @version 1.0
*/

create database lojinhamaria;
use lojinhamaria;

-- timestamp default current_timestamp (data e hora automatica)
-- date (tipo de dados relacionados a data)
create table produtos(
	id int primary key auto_increment,
    barcode varchar(255),
	produto varchar(255) not null,
    descricao varchar(255) not null,
    fabricante varchar(255) not null,
    datacad timestamp default current_timestamp,
    dataval date,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(255) not null,
    localizacao varchar(255),
    custo decimal(10,2),
    lucro decimal(10,2),
    venda decimal(10,2)
);

alter table produtos add column marca varchar (255) after produto;

describe produtos;


insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (
'1234567890','Tinta Cinza chumbo','Tinta cinza chumbo 18L','Color',20250523,20,5,'UN','Setor 7, prateleleira 3',75.00,100,150.00
);


select * from produtos;

update produtos set produto='Bisnaga' , marca='Xadrez', quantidade='21', valor='5.90' where id=2;
update produtos set produto='Bisnaga verde' , marca='Xadrez', quantidade='21', valor='5.90' where id=2;

delete from produtos where id=7;

select produto,marca,quantidade,valor from produtos order by produto;

-- unique (não permitir valores duplicados)
create table usuarios(
	idusu int primary key auto_increment,
    usuario varchar(255) not null,
    login varchar(255) not null unique,
    senha varchar(255) not null,
    perfil varchar(255) not null
);

describe usuarios;

-- para inserir uma senha com criptografia usamos md5()
insert into usuarios (usuario,login,senha,perfil)
values ('Administrador','admin',md5('admin'),'admin');
insert into usuarios (usuario,login,senha,perfil)
values ('Maria','maria',md5('123456'),'user');

select * from usuarios;

-- acessando o sistema pela tela de login
-- and (função lógica onde todas as condições devem ser verdadeiras)
select * from usuarios where login='admin' and senha=md5('admin');

