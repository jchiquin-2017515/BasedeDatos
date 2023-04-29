/*
	Nombre: Jose Daniel Chiquin Montenegro
    Curso: Taller II
    Código Técnico: IN5AM
    Fecha de Creación: 26-01-2022
    Fecha de Modificación: 27-01-2022
*/
Drop database if exists Tarea1_2017515;
Create database Tarea1_2017515;

Use Tarea1_2017515;

Create table Vecinos(
	DPI bigint not null,
    nombres varchar(50) not null,
    domicilio varchar(150) not null,
    fechaNacimiento date not null,
    sexo char not null,
    primary key PK_DPI (DPI)
);

Create table Vehiculos(
	placa varchar(8) not null,
    marca varchar(20) not null,
    linea varchar(25) not null,
    modelo varchar(4) not null,
    color varchar(25) not null,
    VIN varchar(17) not null,
    DPI bigint not null,
    primary key PK_placa (placa),
	constraint FK_Vehiculos_Vecinos
			foreign key FK_DPI (DPI) references Vecinos (DPI)
);

Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (2309876730101, 'Daniel Montenegro','14 calle 7-54 zona 18, Guatemala',2004-05-28,'M');
Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (1234575650101, 'Andrea Gutierrez','16 calle 7-34 zona 6, Guatemala',2003-06-18,'F');
Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (4655325640101, 'Carla Muñoz','20 calle 7-45 zona 3, Guatemala',1998-11-08,'F');
Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (9573267560101, 'Gabriel Rodriguez','3 calle 5-55 zona 18, Guatemala',1999-03-26,'M');
Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (1567343450101, 'Valentina Lara','14 calle 3-23 zona 10, Guatemala',2004-04-18,'F');
Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (6532425430101, 'Carlos Hernandez','18 calle 7-4 zona 18, Guatemala',2000-07-14,'M');
Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (5672323560101, 'Jose Morales','19 calle 8-20 zona 5, Guatemala',1993-09-2,'M');
Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (4567890870101, 'Luis Escobar','5 calle 6-67 zona 9, Guatemala',2004-02-20,'M');
Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (9458945870101, 'Maria Jose Calderon','12 calle 4-4 zona 6, Guatemala',2003-09-3,'F');
Insert into Vecinos(DPI, nombres, domicilio, fechaNacimiento, sexo)
	values (2356789370101, 'Eduardo Cabrera','17 calle 6-9 zona 11, Guatemala',2000-12-24,'M');
    
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 234JKG', 'Kia', 'Rio','2015','Rojo','5J9YT3H48KF032487','2309876730101');
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 984SFG', 'Toyota', 'Corolla','2016','Gris','2L1PM8D78WT852645','1234575650101');
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 456LVN', 'Toyota', 'Tundra','2015','Negro','4S4VB2K25JG0128457','4655325640101');
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 197LKJ', 'Toyota', 'Prius','2015','Blanco','6F6VC5E78NN554341','9573267560101');
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 556NBN', 'Honda', 'City','2021','Blanco','9V3CF5J56TT776565','1567343450101');
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 892HGJ', 'Kia', 'Optima','2018','Rojo','3C1HJ5Z33XC894377','6532425430101');
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 104FGN', 'Kia', 'Sorento','2020','Rojo','9K3LM5B11RE235789','5672323560101');
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 222LNM', 'Kia', 'Sportage','2017','Gris','1U4IW2C34TY759345','4567890870101');
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 943ITC', 'Honda', 'Civic','2019','Rojo','2K5GH1C78ZZ233445','9458945870101');
Insert into Vehiculos(placa, marca, linea, modelo, color, VIN, DPI)
	values ('P 583GJM', 'Honda', 'Concerto','2017','Gris','3L4VX3N09VB452219','2356789370101');