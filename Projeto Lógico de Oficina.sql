show databases;

create database if not exists oficina;
use oficina;


-- tabela cliente
create table clients(
       idClients int auto_increment primary key,
       Fname varchar(15) not null,
       Mname char(3),
       Lname varchar(20),
       Payment_Form enum('Cartão de credito', 'Cartão de debito','Dinheiro') default 'Dinheiro' not null,
       CPF char(9) not null,
       Addrees varchar(45) not null

);

-- valores clients 
insert into clients (Fname, Mname, Lname, Payment_Form ,  CPF , Addrees)
            values('Paulo','M','Silva','Cartão de credito',123456789,' Rua Silva de prata 29, São Paulo'),
                  ('Matheus','O','Pimentel','Dinheiro', 987654321,' Rua Alemeda 289, Rio de Janeiro'),
                  ('Ricardo','F','Silva', 'Cartão de debito',45678913,' Rua Alemeda vinha 1009, São Paulo'),
                  ('Julia','S','França', 'Dinheiro',789123456,' Rua Lareijras 861, Salvador'),
                  ('Roberta','G','Assis', 'Cartão de credito',98745631,' Avenida Koller 19, Brasilia'),
                  ('Isabela','M','Cruz', 'Cartão de credito',654789123,' Rio Grande do Sul');
                  
                  
alter table clients auto_increment = 1;

-- tabela Equipe de Mecanicos

create table mecanic(
    idMecanic int auto_increment primary key,
    mecName varchar(30) not null ,
    mecAddrees varchar(45) not null,
    specialty enum('Mecanico de Automoveis' , 'Mecanico de Reparação') not null

);
-- valores mecanico
insert into mecanic(mecName , mecAddrees , specialty)values
          ('Equipe do Jorge ', 'Avenida Parada inglesa , 177 - São Paulo' , 'Mecanico de Automoveis'), 
          ('Equipe da Maria ', 'Avenida Brasil , 198 - Rio de Janeiro' , 'Mecanico de Automoveis') ,
          ('Equipe do Paulo ', 'Avenida Maria Salvador , 458 - Salvador' , 'Mecanico de Reparação'),
		  ('Equipe do Douglas ', 'Avenida Paulo Augusto,899-Rio Grande do Sul' , 'Mecanico de Reparação') ;


alter table mecanic auto_increment = 1;


-- tabela OS

create table OS(
     idOS int auto_increment primary key,
     idOS_clients int,
     dateEmissão varchar(45) not null,
     price float not null ,
     statusOS enum('Concluido' , 'Em andamento' , 'Em aguardo') default 'Em aguardo',
     dateConclusão varchar(45),
     constraint fk_OS_clients foreign key(idOS_Clients) references clients(idClients)
);

-- valores OS

insert into OS(idOS_clients, dateEmissão, price , statusOS , dateConclusão)values
             (1, 03-25-2022 , 1800, 'Concluido' , 04-16-2022),
             (3, 04-12-2022 , 1500, 'Em andamento' , null),
             (2, 04-17-2022 , 5000, 'Em andamento' , null),
             (4, 05-23-2022 , 500, 'Em aguardo' , null),
             (6, 03-29-2022 , 750, 'Concluido' , 05-03-2022),
             (5, 06-25-2022 , 900, 'Em aguardo' , null);
             
			
alter table OS auto_increment = 1;

-- tabela cars
create table cars(
      idCars int auto_increment primary key,
      idCars_Clients int,
      idCars_Mecanic int ,
      typeCar varchar(25) not null,
      plate char(7) not null,
      problem varchar(255),
	  constraint fk_cars_clients foreign key(idCars_Clients) references clients(idClients) ,
	  constraint fk_cars_mecanic foreign key(idCars_Mecanic) references mecanic(idMecanic) 
);

-- valores cars

insert into cars(idCars_Clients , idCars_Mecanic , typeCar , plate, problem)values
             (1, 2 , 'Onix' , 'ABC-789' 'Problema no motor'),
             (2, 2 , 'Camaro' , 'CAB-897' 'Problema no escapamento'),
             (3, 1 , 'Ferrari' , 'BHJ-989' 'Problema no motor'),
             (4, 3, 'Onix' , 'SHJ-148' 'Problema no vidro'),
             (5, 4 , 'Palio' , 'KLJ-667' 'Problema nos bancos'),
             (6, 1 , 'Uno' , 'BRL-989' 'Perda total no carro');
             
alter table cars auto_increment = 1;
-- tabela preencher a OS
create table preenche_OS(
      idOS_Mecanic int,
      idOS_preenche int,
      constraint fk_OS_Mecanic foreign key(idOS_Mecanic) references mecanic(idMecanic),
      constraint fk_OS_preenche foreign key(idOS_preenche) references OS(idOS)
);

-- valores preencheOS

insert into preenche_OS(idOS_Mecanic , idOS_preenche)values
                   (1, 2),
                   (2, 2),
                   (3, 1),
                   (4 ,3),
                   (5, 4),
                   (6, 1);

show tables;
 select * from clients;
 select * from mecanic;


















