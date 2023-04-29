/*
	Nombre: Jose Daniel Chiquin Montenegro
    Curso: Taller II
    Código Técnico: IN5AM
    Fecha de Creación: 25-01-2022
    Fecha de Modificación: 26-01-2022
*/
Drop database if exists DBEmpresaMultinacional;
Create database DBEmpresaMultinacional;

Use DBEmpresaMultinacional;

Create table Categorias(
	categoriaId int not null,
    nombreCategoria varchar(45) not null,
    sueldoBase decimal(6,2) not null,
    bonificacion decimal(6,2) not null,
    bonificacionEmpresa decimal (6,2) not null,
    tipoCategoria varchar(20) not null,
    primary key PK_categoriaId (categoriaId)
);

Create table Regiones(
	regionId int not null,
    nombreRegion varchar(20) not null,
    primary key PK_regionId (regionId)
);

Create table Departamentos(
	departamentoId int not null,
	departamento varchar(20) not null,
	regionId int not null,
	primary key PK_departamentoId (departamentoId),
	constraint FK_Departamentos_Regiones foreign key (regionId)
		references Regiones(regionId)
);

Create table Oficinas(
	oficinaId int not null,
	direccion varchar(256) not null,
	departamentoId int not null,
	primary key PK_oficinaId (oficinaId),
	constraint FK_Oficinas_Departamentos foreign key (departamentoId)
		references Departamentos(departamentoId)
);

Create table Telefonos(
	telefonoId int not null,
	numeroTelefono varchar(15) not null,
	oficinaId int not null,
	primary key PK_telefonoId (telefonoId),
	constraint FK_Telefonos_Oficinas foreign key (oficinaId)
		references Oficinas(oficinaId)
);

Create table Secciones (
	seccionId int not null,
    nombreSeccion varchar(30) not null,
    oficinaId int not null,
    primary key PK_seccionId (seccionId),
    constraint FK_Secciones_Oficinas foreign key (oficinaId)
		references Oficinas(oficinaId)
);

Create table Empleados(
	empleadoId int not null,
    nombre varchar(45) not null,
    fechaDeNacimiento date not null,
    edad int,
    telefonoPersonal varchar (10) not null,
    fechaDeContratacion date not null,
    categoriaId int not null,
    seccionId int not null,
    primary key PK_empleadoId (empleadoId),
    constraint FK_Empleados_Categorias foreign key (categoriaId)
		references Categorias(categoriaId),
	constraint FK_Empleados_Secciones foreign key (seccionId)
		references Secciones(seccionId)
);

Insert into Regiones (regionID,nombreRegion) values (1,'Metropolitana');
Insert into Regiones (regionID,nombreRegion) values (2,'Nororiente');
Insert into Regiones (regionID,nombreRegion) values (3,'Central');
Insert into Regiones (regionID,nombreRegion) values (4,'Norte');
Insert into Regiones (regionID,nombreRegion) values (5,'Suroriente');
Insert into Regiones (regionID,nombreRegion) values (6,'Noroccidente');
Insert into Regiones (regionID,nombreRegion) values (7,'Suroccidente');
Insert into Regiones (regionID,nombreRegion) values (8,'Petén');

Insert into Departamentos (departamentoID,departamento,regionID) values (1001,'Ciudad de Guatemala',1);
Insert into Departamentos (departamentoID,departamento,regionID) values(1002,'El Progreso',2);
Insert into Departamentos (departamentoID,departamento,regionID) values (1003,'Chimaltenango', 3);
Insert into Departamentos (departamentoID,departamento,regionID) values (1004,'Chiquimula', 2);
Insert into Departamentos (departamentoID,departamento,regionID) values (1005,'Baja Verapaz', 4);
Insert into Departamentos (departamentoID,departamento,regionID) values (1006,'Alta Verapaz', 4);
Insert into Departamentos (departamentoID,departamento,regionID) values (1007,'Santa Rosa', 5);
Insert into Departamentos (departamentoID,departamento,regionID) values (1008,'Quiche', 6);
Insert into Departamentos (departamentoID,departamento,regionID) values (1009,'Izabal', 2);
Insert into Departamentos (departamentoID,departamento,regionID) values (1010,'Retalhuleu',7);
Insert into Departamentos (departamentoID,departamento,regionID) values (1011,'Zacapa', 2);
Insert into Departamentos (departamentoID,departamento,regionID) values (1012,'Suchitepequez', 5);
Insert into Departamentos (departamentoID,departamento,regionID) values (1013,'Peten', 8);
Insert into Departamentos (departamentoID,departamento,regionID) values (1014,'Jutiapa', 5);
Insert into Departamentos (departamentoID,departamento,regionID) values (1015,'Huehuetenango',6);

Insert into Oficinas (oficinaID,direccion,departamentoID) values (7001, 'Blv. Los Próceres 13-50 zona 10, Ciudad Capital', 1001);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7002, '16 Av. 15 calle "A" zona 1, El Progreso', 1002);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7003, '18 calle zona 3, Chimaltenango', 1003);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7004, '28 calle zona 4, Chiquimula ', 1004);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7005, '16 Av. entre 26 y 27 calle zona 5, Baja Verapaz', 1005);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7006, '11 Avenida, zona 6 Alta Verapaz', 1006);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7007, '11 Av. y 27 calle zona 7, Santa Rosa', 1007);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7008, '0 Avenida 11-04 zona 1, Quiche', 1008);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7009, 'Barrio el Estrecho, Puerto Barrios, Izabal', 1009);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7010, '8va. Calle final Colonia Concepción Zona 3 Retalhuleu.', 1010);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7011, 'Calzada Miguel García Granados, Zacapa', 1011);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7012, 'carretera al pacífico, Cuyotenango, Suchitepéquez', 1012);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7013, 'Santa Elena de la Cruz, Flores,El Petén', 1013);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7014, 'KM. 189 CARRETERA A CHAMPERICO ZONA 4 DE Jalapa', 1014);
Insert into Oficinas (oficinaID,direccion,departamentoID) values (7015, '5 Calle 7-96 Zona 1 Huehuetenango', 1015);

Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (501,'7589-6523',7001);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (502,'7485-9623',7002);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (503,'8594-7859',7003);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (504,'2659-8456',7004);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (505,'8597-4859',7005);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (506,'2598-6421',7006);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (507,'1526-9854',7007);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (508,'6958-7485',7008);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (509,'3659-8264',7009);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (510,'9586-7485',7010);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (511,'9658-9325',7011);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (512,'8596-2358',7012);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (513,'8597-4826',7013);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (514,'9568-4752',7014);
Insert into Telefonos (telefonoID,numeroTelefono,oficinaID) values (515,'1023-9586',7015);

Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5001,'Ventas', 7001);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5002,'TICS', 7002);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5003,'Contabilidad', 7003);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5004,'Atención al Cliente', 7004);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5005,'Mantenimiento', 7005);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5006,'Seguridad', 7006);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5007,'Producción', 7007);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5008,'Compras', 7008);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5009,'Recursos Humanos', 7009);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5010,'Marketing',7010);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5011,'Administración', 7011);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5012,'Finanzas', 7012);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5013,'Auditoría', 7013);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5014,'Desarrollo', 7014);
Insert into Secciones (seccionID,nombreSeccion,oficinaID) values (5015,'Mecánica',7015);

Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4041,'Conserje',2000.09,250.00, 50.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4042,'Secretaria', 8296.77,250.00, 300.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4043,'Vendedor', 8007.76,250.00, 200.00,'Comercial');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4044,'Jefe de sección', 8206.29,250.00, 600.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4045,'Recepcionista', 4092.33,250.00, 500.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4046,'Contador', 9499.12,250.00, 350.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4047,'Técnico', 5978.87,250.00, 300.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4048,'Director', 4157.39,250.00, 750.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4049,'Recepcionista', 6474.35,250.00,300.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4050,'Auditor', 3654.16,250.00, 600.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4051,'Programador', 6259.51,250.00, 600.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4052,'Mecánico', 7549.52,250.00, 1200.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4053,'Diseñador', 7807.12,250.00, 700.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4054,'Policía', 2500.7,250.00, 50.00,'Administrativo');
Insert into Categorias(categoriaID, nombreCategoria,sueldoBase,bonificacion,bonificacionEmpresa,tipoCategoria) values (4055,'Auxiliar', 5207.79,250.00, 500.00,'Administrativo');

Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (101,'Carny Ferrie Marns Suarez','1995-12-05','6808-4302','2015-12-28',4041,5005);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (102,'Felipa Antinia McBrier Ferry','1990-03-11','4950-2900', '2012-01-01',4044,5007);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (103,'Alexandra Sofia Bartelli Guzman','1996-05-12','6804-7186', '2008-04-18',4042,5009);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (104,'Jose Andres Roskilly Rosales','1992-02-14','6089-9070', '2006-03-16',4043,5001);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (105,'Pierson Galileo Perez Gillio','1992-6-15','4934-9837', '2013-08-16',4044,5001);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (106,'Jose Pedro Massingberd Zannoti','1994-03-20','1057-8055', '2012-10-13',4044,5002);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (107,'Verin Carlo Auditore Calcutt','1992-10-14','0378-6727', '2009-09-30',4048,5002);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (108,'Kessi Fry Gozales Fritschel','1970-12-01','0527-1537', '2014-01-06',4047,5002);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (109,'Jessica Alejandra Connold Guzman','1972-08-10','6586-2142', '2013-11-17',4044,5003);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (110,'Kacie Abigail Doren Abbis','1985-04-12','1512-7957','2008-07-08',4049,5004);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (111,'Jose Poul Fawltey Salay','1984-08-15','6822-0089', '2007-09-29',4046,5003);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (112,'Terri Isabel Prickly Pridgeon','1980-06-14','1007-4882', '2005-12-21',4048,5003);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (113,'Humfrid Jose Budgie Cokly','1980-12-14','4934-6854', '2012-11-24',4044,5004);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (114,'Myrta Ana Plowes Jade','1960-07-10','0378-6060','2005-01-05',4054,5006);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (115,'Bernardina Olga Juarez Nolda','1970-08-12','6217-5580', '2015-07-07',4044,5006);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (116,'Goldie Sadina Dunn Volpe','1990-05-15','4193-6317', '2014-05-29',4042,5007);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (117,'Kania Guisela Montenegro Moores','1969-01-15','5545-5578', '2011-11-25',4048,5007);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (118,'Drusy Freddy Frostick Avila','1985-09-16','7253-3902', '2014-02-06',4042,5008);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (119,'Mead Giancarlo Abadam Casinos','1990-04-18','4508-5318', '2012-01-01',4048,5008);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (120,'Carly Anai Mcurdy Batkin','1962-11-15','8982-2262', '2005-09-21',4044,5009);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (121,'Manfred Jose Muckle Kennedy','1970-10-12','8769-5506', '2012-03-25',4053,5010);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (122,'Jose Kyle Trinke Rougue','1975-06-18','9734-6020', '2013-01-08',4044,5010);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (123,'Celesta Valery Gittus Roche','1978-06-19','6121-9681', '2006-03-02',4055,5011);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (124,'Peyton Madison Aers Godinez','1978-09-17','2497-9770', '2012-12-16',4044,5011);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (125,'Bryan Kristopher Martinez Molina','1975-03-26','9401-9245', '2013-08-16',4046,5012);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (126,'Riordan Zacari Akid Matias','1960-12-15','9837-7547', '2010-05-27',4048,5012);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (127,'Hirsch Bruno Couch Muss','1962-09-14','99549921', '2007-03-26',4044,5014);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (128,'Jose Conor Struijs Satij','1978-08-15','17790641', '2011-06-05',4048,5014);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (129,'Ginnifer Sofia Lawrence Cornillot','1975-03-12','43946419', '2013-08-30',4051,5014);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (130,'Jose Red Oakey Manrique','1960-02-18','38249248', '2011-03-27',4048,5005);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (131,'Javier Alejandro Barahona Pasan','1990-11-13','5563-7813','2010-02-15',4044,5005);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (132,'Brandon Tony Rosenfield Vasquez', '1997-04-26', '3992-1162', '2016-01-28',4048,5001);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (133,'Britany Luisa Estrada Marisol', '1970-03-23', '4093-0234', '2018-06-07',4048,5004);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (134,'Denys Steve Holley Donnan', '1974-12-21', '2756-5999', '2017-09-16',4048,5006);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (135,'Rafa Alexander Colo Gonzales', '1989-07-11', '4603-5587', '2016-09-13',4044,5008);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (136,'Abygail Jenilee Guyonnet Armas', '1996-03-03', '3857-2699', '2017-05-08',4048,5009);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (137,'Peter Adolfo Alfaro Noguera', '1989-01-09', '8088-9644', '2015-11-19',4048,5010);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (138,'Olivia Fernanda Quiñones Salazar', '1996-09-16', '2534-1777', '2018-01-19',4048,5011);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (139,'Alejandro Emanuel Salazar Barrera', '1970-10-31', '3365-1077', '2018-12-07',4044,5012);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (140,'Emmy Andrea Velasquez Avila', '1994-07-03', '3793-4587', '2018-09-28',4050,5013);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (141,'Karol Gabriela Fajardo Callen', '1982-03-14', '3949-2949', '2018-11-23',4044,5013);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (142,'Jose Adolfo Suarez Acevedo', '1977-02-09', '2223-1010', '2015-08-31',4048,5013);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (143,'Joaquin Fernando Williment Lemus', '1994-01-05', '6754-3230', '2017-11-10',4052,5015);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (144,'Dina Guisela Valle Carrillo', '1983-05-20', '2308-2261', '2018-01-09',4044,5015);
Insert into Empleados (empleadoID,nombre,fechaDeNacimiento,telefonoPersonal,fechaDeContratacion,categoriaID,seccionID) values (145,'Brayan Alexander Pineda Prichard', '1990-06-19', '4081-2076', '2017-06-23',4048,5015);

Select * from Empleados;
 
-- --------------------------- CONSULTAS

-- 1) Nombre y edad de los empleados
Select Empleados.nombre, 2022-year(fechaDeNacimiento) as Edad from Empleados;

-- 3) Fecha de contratación de cada empleado
Select Empleados.nombre, Empleados.fechaDeContratacion from Empleados;

-- 4) Edades de los empleados
Select 2022-year(fechaDeNacimiento) as Edades_Empleados from Empleados;

-- 5) Número de empleados que hay para cada una de las edades
Select 2022-year(fechaDeNacimiento) as Edad, count(*) from Empleados group by 2022-year(fechaDeNacimiento) order by Edad ASC;

-- 6) Edad media de los empleados por departamento
Select departamento, avg(2022-year(fechaDeNacimiento)) as Promedio from Empleados E Inner Join Secciones S
	on S.SeccionId = E.SeccionId
		Inner Join Oficinas O on O.oficinaId = S.oficinaId
			Inner Join Departamentos D on D.departamentoId = O.departamentoId Group by departamento;

-- 8) Datos del empleado número x
Select * from Empleados where empleadoId = 132;

-- 9) Empleados del departamento X
Select departamento, empleadoID, nombre, fechaDeNacimiento, 2022-year(fechaDeNacimiento) as Edad, telefonoPersonal, fechaDeContratacion, categoriaId from Empleados E Inner Join Secciones S
	on S.seccionId = E.seccionId
		Inner Join Oficinas O on O.oficinaId = S.oficinaId
			Inner Join Departamentos D on D.departamentoId = O.departamentoId where D.departamento = 'Chimaltenango';

-- 10) Empleados cuya contratación se produjo en el año x
Select * from Empleados where year(fechaDeContratacion) = 2017;

-- 11) Empleados que no sean jefe de sección de la Categoría x
Select nombreSeccion as Seccion,nombreCategoria as Puesto, empleadoID as Codigo, nombre as Nombre, fechaDeNacimiento, 2022-year(fechaDeNacimiento) as Edad, telefonoPersonal, fechaDeContratacion from Empleados E
	Inner Join Categorias C on C.categoriaId = E.categoriaId
		Inner Join Secciones S on S.seccionId = E.seccionId
			where not C.nombreCategoria = 'Jefe de seccion';

-- 15) Empleados de nombre Jose
Select empleadoId as Codigo, nombre as Nombre, fechaDeNacimiento, 2022-year(fechaDeNacimiento) as Edad, telefonoPersonal, fechaDeContratacion from Empleados 
	where nombre like '%Jose%';
    
-- 17) Empleados que no pertenecen al departamento X
Select departamento as Departamento, empleadoID as Codigo, nombre as Nombre, fechaDeNacimiento, 2022-year(fechaDeNacimiento) as Edad, telefonoPersonal, fechaDeContratacion, categoriaId from Empleados E Inner Join Secciones S
	on S.seccionId = E.seccionId
		Inner Join Oficinas O on O.oficinaId = S.oficinaId
			Inner Join Departamentos D on D.departamentoId = O.departamentoId where not D.departamento = 'Zacapa';

-- 20) Nombre del empleado y de la categoria en la que trabaja
Select nombreCategoria as Puesto, nombre as Nombre from Empleados E
	Inner Join Categorias C on C.categoriaId = E.categoriaId;