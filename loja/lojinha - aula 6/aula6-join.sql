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
    venda decimal(10,2),
    idfor int not null,
    foreign key(idfor) references fornecedores(idfor)
);
drop table produtos;

alter table produtos add column marca varchar (255) after produto;
alter table produtos modify column barcode varchar(255) unique;

describe produtos;


insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (
'1234567890','Tinta Cinza chumbo','Tinta cinza chumbo 18L','Color',20250523,20,5,'UN','Setor 7, prateleleira 3',75.00,100,150.00
);
insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (13579,'Impermeabilizante','Impermeabilizante Vedacit 1L transparente','Quartizoliti','20220429',7,5,'UN','Setor 2, fileira 8',15.00,100,30.00);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (246810,'Solvente','Solvente Suvinil 900ml','Suvinil','20250621',8,4,'UN','Setor 6, fileira 8',13.50,100,27.90);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (974211,'Verniz','Verniz Eucatex 3,6L','Eucatex','20280217',0,6,'UN','Setor 9',29.00,100,60.00);

insert into produtos (barcode,produto,descricao,fabricante,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (086424,'Espátula','Espátula aço cromádo com cabo plástico Atlas','Atlas',0,8,'UN','Prateleira 2',7.50,100,14.00);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (223344,'Massa acrílica','Massa acrílica Coral 25Kg','Coral','20230924',0,6,'UN','Setor 6, ao lado da massa corrida',70.00,100,150.00);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda,idfor)
values (556677,'Massa Corrida','Massa corrida Luckscolor 3.6L','Luckscolor','20220429',7,5,'UN','Setor 6, ao lado da massa acrílica',13.90,100,27.00,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (889900,'Tinta Spray','Tinta Spray Chemicolor 100ml','Chemicolor','20291210',7,5,'UN','Setor 3',3.50,100,7.00);

insert into produtos (barcode,produto,descricao,fabricante,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (112233,'Kit para pintura','Kit para pintura 3 peças Tigre','Tigre',9,3,'UN','Prateleira 3',10.00,100,20.00);

insert into produtos (barcode,produto,descricao,fabricante,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (454342,'Rolo de lã','Rolo de lã anti respingo 15cm Tigre','Tigre',9,3,'UN','Prateleira 3',2.50,100,5.00);

insert into produtos (barcode,produto,descricao,fabricante,estoque,estoquemin,unidade,
localizacao,custo,lucro,venda)
values (313233,'Folha de lixa d´agua','Folha de lixa d´agua Famastil','Famastil',10,25,'UN','Prateleira 1',1.50,100,3.00);

select * from produtos;

update produtos set produto='Bisnaga' , marca='Xadrez', quantidade='21', valor='5.90' where id=2;
update produtos set produto='Bisnaga verde' , marca='Xadrez', quantidade='21', valor='5.90' where id=2;

delete from produtos where id=7;

select produto,marca,quantidade,valor from produtos order by produto;

/* relatórios */
-- inventário do estoque (patrimônio do dono) 
-- sum() função de soma no banco de dados
select sum(estoque*custo) as total from produtos;

-- relatório de reposição de estoque 1
select * from produtos where estoque < estoquemin;

-- relatório de reposição de estoque 2
-- date_format() (função usada para formatar a data)
-- %d/%m/Y% = dia/mês/aaaa ou %d/%m/%y = dia/mês/aa

select id as ID,produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
estoque,estoquemin as estoque_mínimo
from produtos where estoque < estoquemin;

-- relatório de validade de produtos 1
select id as ID,produto,
date_format(dataval,'%d/%m/%Y') as data_validade
from produtos;

-- relatório de validade de produtos 2
-- datediff() calcula a diferença em dias
-- curdate() obtém a data atual
select id as ID,produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
datediff(dataval,curdate()) as dias_faltantes
from produtos; 

-- --------------------------------------------------------------------------------------------
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
-- --------------------------------------------------------------------------------------------

create table clientes(
	idcli int primary key auto_increment,
    nome varchar(255) not null,
    telefone varchar(255) not null,
    cpf varchar(255),
    email varchar(255),
    marketing varchar(255) not null,
    cep varchar(255),
    endereco varchar(255),
    bairro varchar(255),
    cidade varchar(255),
    uf char(2)
);
use clientes;

 alter table clientes add column datanasc date not null after nome;
 
 insert into clientes (nome,datanasc,telefone,cpf,email,marketing,cep,bairro,cidade,uf)
 values ('Gustavo Rene',20030412,11997785647,54678920509,'gustarene@email.com','Sim',08495890,'jardim palmeiras','São Paulo','SP');
 
 insert into clientes (nome,datanasc,telefone,cpf,email,marketing,cep,bairro,cidade,uf)
 values ('Renan rs',20040731,1199647389,52267845990,'renanzinho@email.com','Não',08254678,'Itaim bibi','São Paulo','SP');
 
  insert into clientes (nome,datanasc,telefone,cpf,email,marketing,cep,endereco,bairro,cidade,uf)
 values ('Gui Ramires',20040223,11932456812,50917824598,'guiramires@email.com','Sim',08123456,'rua jogador caro','jardim perna de pau','São Paulo','SP');
 
  insert into clientes (nome,datanasc,telefone,cpf,email,marketing,cep,endereco,bairro,cidade,uf)
 values ('Fernando',20040216,11992645098,52780966590,'touroferdinando@email.com','Sim',08267890,'rua tourinho guaianases','jardim dos bailes','São Paulo','SP');
 
  insert into clientes (nome,datanasc,telefone,cpf,email,marketing,cep,endereco,bairro,cidade,uf)
 values ('Maria',20030422,119977925986,56789012356,'mariamaria@email.com','Não',08150190,'rua toquinho da silva','jardim robru','São Paulo','SP');
 
  insert into clientes (nome,datanasc,telefone,cpf,email,marketing,cep,endereco,bairro,cidade,uf)
 values ('Katinha do sus',19790815,11978901256,50987652401,'katinhasus2019@email.com','Não',08765243,'rua enfermeiras do sus','jardim das enfermeiras','São Paulo','SP');
 
 update clientes set telefone='986574848' where idcli=1;
 update clientes set email='' where idcli=2;
 update clientes set email='' where idcli=5;
 update clientes set email='' where idcli=6;
 
 delete from clientes where idcli=2;
 
 -- relatório aniversáriantes
 select idcli as ID,Nome,
date_format(datanasc,'%d/%m/%Y') as Data_Nasc
from clientes;

-- relatório contatos
 select idcli as ID,Nome,Telefone,email
from clientes;

-- relatório marketing
 select email from clientes where marketing=('Sim');
 
 select * from clientes;
describe clientes;

-- ----------------------------------------------------------------------------------------------
-- foreign key(FK) Chave estrangeira que cria o relacionamento 
-- do tipo 1-N com a tabela clientes
-- FK(pedidos)____PK(clientes)
-- Observação: Usar o mesmo nome e tipo de dados nas chaves (PK e FK) 
create table pedidos(
	pedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    total decimal (10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)
); 

-- abertura de pedido (Insert (inserir no carrinho), Select (excluir), Update(trocar))
insert into pedidos(idcli) values(1);

-- verificar pedidos 
select * from pedidos where pedido;

-- verificar pedidos junto com o nome dos clientes
-- inner join (unir informarções de 2 ou mais tabelas)
-- IMPORTANTE!!! indicar as chaves FK e PK
select * from pedidos inner join clientes on pedidos.idcli = clientes.idcli;

-- verificar pedidos junto vom o nome do cliente (relatório simplificado)
-- %h:%i exibir o horário formatado
select pedidos.pedido, date_format(pedidos.dataped,'%d%/%m/%Y - %H:%i') as data_ped,
clientes.nome as clientes, clientes.telefone as telefone
from pedidos inner join clientes on pedidos.idcli = clientes.idcli;

-- ----------------------------------------------------------------------------------------------

create table fornecedores(
	idfor int primary key auto_increment,
    cnpj varchar(255) not null unique,
    ie varchar(255) unique,
    im varchar(255) unique,
    razao varchar(255) not null,
    fantasia varchar(255) not null,
    site varchar(255),
    telefone varchar(255),
    conatato varchar(255),
    email varchar(255),
    cep varchar(255) not null,
    endereco varchar(255) not null,
    numero varchar(255)not null,
    complemento varchar(255),
    bairro varchar(255) not null,
    cidade varchar(255) not null,
    uf varchar(255) not null,
    obs varchar(255)
);

alter table fornecedores drop column conatato;
alter table fornecedores add column contato varchar(255) after telefone;

insert into fornecedores(cnpj,ie,im,razao,fantasia,telefone,email,cep,numero,bairro,cidade,uf)
values(536478928390,5674,7483,'Faber Castell','Faber Castell Oficial','253467890','fabercastell@email.com',
08150190,314, 'jardim brasil','SP','SP');

update fornecedores set razao='Lukscolor', fantasia='Lukscolor tintas', email='lukscolortintas@email.com' where idfor=1;

select * from fornecedores;

-- relatório

select 
	produtos.id as Produtos,
    produtos.produto as Produto,
    date_format(produtos.datacad,'%d%/%m/%Y - %H:%i') as Data_cad,
	fornecedores.fantasia as Fornecedores, 
	fornecedores.telefone as Telefone
	from fornecedores inner join produtos on fornecedores.idfor = produtos.idfor;

