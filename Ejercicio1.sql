drop database if exists DBEJERCICIO1;
create database DBEJERCICIO1;
Use DBEJERCICIO1;

-- TABLAS

Create table Proveedores(
	codigoProveedores int not null,
	nombreProveedores varchar(20),
	direccionProveedores varchar(40),
	primary key PK_codigoProveedores (codigoProveedores)
);

Create table Productos(
	codigoProductos int not null,
	nombreProductos varchar(20),
	precioProductos int not null,
	codigoProveedores int not null,
	primary key(codigoProductos),
	constraint FK_Productos_Proveedores foreign key (codigoProveedores)
		references Proveedores(codigoProveedores)
);
    
Create table Clientes(
	dpiClientes bigint not null,
	nombreClientes varchar(20),
	apellidoClientes varchar(20),
	direccionClientes varchar(40),
	telefonoClientes varchar(20),
	codigoProductos int not null,
	primary key(dpiClientes),
	constraint FK_Clientes_Productos foreign key (codigoProductos)
		references Productos(codigoProductos)
);

-- INSERT

Insert into Proveedores(codigoProveedores, nombreProveedores, direccionProveedores)
	values (1, 'LALA', '13 calle 4-45 zona 2, Guatemala'),
     (2, 'BAYER', '3 calle 6-23 zona 7, Guatemala'),
     (3, 'PROCASA', '12 calle 9-33 zona 5, Guatemala'),
     (4, 'INA', '5 calle 4-28 zona 4, Guatemala'),
     (5, 'MICHELLIN', '16 calle 8-53 zona 6, Guatemala');
    
Insert into Productos(codigoProductos, nombreProductos, precioProductos, codigoProveedores)
	 values (1, 'Yogurt', 13, 1),
     (2, 'Acetaminofen', 8, 2),
     (3, 'Carne de cerdo', 25, 3),
     (4, 'Pasta', 15, 4),
     (5, 'Llantas ring 15', 60, 5);
    
Insert into Clientes(dpiClientes, nombreClientes, apellidoClientes, direccionClientes, telefonoClientes, codigoProductos)
	 values (2348954890101, 'Eduardo','Rodriguez', '14 calle 7-54 zona 18, Guatemala', '5445-6798',2),
     (6796434450101, 'Eduardo','Rodriguez', '16 calle 7-34 zona 6, Guatemala', '6798-2354',3),
     (4686534560101, 'Gabriel','Marroquin', '20 calle 7-45 zona 3, Guatemala', '6756-3453',1),
     (1234233480101, 'Oscar','Martinez', '3 calle 5-55 zona 18, Guatemala', '5465-6556',4),
     (8637267540101, 'John','Smith', '14 calle 3-23 zona 10, Guatemala', '3454-2707',1);
     
     
-- SELECT

Select
	P.codigoProveedores,
    P.nombreProveedores,
    P.direccionProveedores
    from Proveedores P;
    
-- BUSQUEDA
    
Select
	P.codigoProveedores,
    P.nombreProveedores,
    P.direccionProveedores
	from Proveedores P where codigoProveedores = 3;

Select
	Pr.codigoProductos,
    Pr.nombreProductos,
    Pr.precioProductos,
    Pr.codigoProveedores
    from Productos Pr;
    
Select
	Pr.codigoProductos,
    Pr.nombreProductos,
    Pr.precioProductos,
    Pr.codigoProveedores
    from Productos Pr where codigoProductos = 3;
    
Select
	C.dpiClientes,
    C.nombreClientes,
    C.apellidoClientes,
    C.direccionClientes,
    C.telefonoClientes,
    C.codigoProductos
    from Clientes C;
    
Select
	C.dpiClientes,
    C.nombreClientes,
    C.apellidoClientes,
    C.direccionClientes,
    C.telefonoClientes,
    C.codigoProductos
    from Clientes C where dpiClientes = 8637267540101;
    
-- ALTER 
    
alter table Proveedores add telefonoProveedores varchar(20);

-- UPDATE

Update Proveedores
	set telefonoProveedores = '2345-8798'
    where codigoProveedores = 1;
    
Update Proveedores
	set telefonoProveedores = '8904-1256'
    where codigoProveedores = 2;
    
Update Proveedores
	set telefonoProveedores = '7423-1264'
    where codigoProveedores = 3;
    
Update Proveedores
	set telefonoProveedores = '1243-5609'
    where codigoProveedores = 4;
    
Update Proveedores
	set telefonoProveedores = '7955-4332'
    where codigoProveedores = 5;
    
Select * from Proveedores;

-- DELETE

Delete From Proveedores where codigoProveedores = 4;
Delete From Productos where codigoProductos = 2;
Delete From Clientes where dpiClientes = 1234233480101;