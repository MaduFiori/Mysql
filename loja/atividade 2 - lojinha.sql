/**
	Lojinha
    @author Maria Fiori
    @version 1.0
*/

create database lojinhamaria;
use lojinhamaria;

create table produtos(
	id int primary key auto_increment,
	produto varchar(255) not null,
    quantidade int not null,
    valor decimal(10,2) 
);

alter table produtos add column marca varchar (255) after produto;

describe produtos;

insert into produtos (produto,marca,quantidade,valor)
values ('Tinta azul 18L', 'Suvinil', 7, '189.00');
insert into produtos (produto,marca,quantidade,valor)
values ('Tinta cinza 3,6L', 'Coral', 13, '56,80');
insert into produtos (produto,marca,quantidade,valor)
values ('Tinta Branco gelo 1L', 'Quartizoliti', 21, '35,60');
insert into produtos (produto,marca,quantidade,valor)
values ('Tinta Spray Preto fosco', 'Tech Bond', 14, '13,40');
insert into produtos (produto,marca,quantidade,valor)
values ('Kit para pintura 10 peças','Tigre',23,'23,90');
insert into produtos (produto,marca,quantidade,valor)
values ('Bisnaga Rosa','Xadrez',35,'5.90');
insert into produtos (produto,marca,quantidade,valor)
values ('Massa Corrida','Coral',8,'55.90');


select * from produtos;

update produtos set produto='Bisnaga' , marca='Xadrez', quantidade='21', valor='5.90' where id=2;
update produtos set produto='Bisnaga verde' , marca='Xadrez', quantidade='21', valor='5.90' where id=2;

delete from produtos where id=7;

select produto,marca,quantidade,valor from produtos order by produto;

