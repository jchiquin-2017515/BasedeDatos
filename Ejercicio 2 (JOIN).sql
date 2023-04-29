Drop database if exists DBInnerJoin;
Create database DBInnerJoin;

Use DBInnerJoin;

Create table Clientes(
	codigoCliente int not null auto_increment,
    nombreCliente varchar(60) not null,
    telefonoCliente varchar (8) not null,
    primary key PK_codigoCliente (codigoCliente)
);

Create table Pedidos(
	codigoPedido int not null,
	numeroFactura int not null,
	codigoCliente int not null,
	primary key PK_codigoPedido (codigoPedido),
	constraint FK_Pedidos_CLientes foreign key (codigoCliente)
		references Clientes(codigoCliente)
);

Insert into Clientes (nombreCliente, telefonoCliente)
	values ('Daniel Montenegro', '25478908');
Insert into Clientes(nombreCliente, telefonoCliente)
	values ('Jose Mancilla', '58742360');
Insert into Clientes(nombreCliente, telefonoCliente)
	values ('Carlos González', '66985120');
Insert into Clientes(nombreCliente, telefonoCliente)
	values ('Sofía Rodriguez', '24587412');
    
select * from Clientes;

Insert into Pedidos (codigoPedido, numeroFactura, codigoCliente)
	values (105,140,4);
Insert into Pedidos(codigoPedido, numeroFactura, codigoCliente)
	values (106,45,2);
Insert into Pedidos(codigoPedido, numeroFactura, codigoCliente)
	values (107,90,3);
Insert into Pedidos(codigoPedido, numeroFactura, codigoCliente)
	values (108,52,4);

select * from Pedidos;

-- --------------------------- INNER JOIN

Select * from Clientes C Inner Join Pedidos P
	on C.codigoCliente = P.codigoCliente;

Select Clientes.nombreCliente, Pedidos.codigoPedido
	From Clientes Inner Join Pedidos
		on Clientes.codigoCliente = Pedidos.codigoCliente;
        
-- --------------------------- LEFT JOIN

select * from Clientes Left Join Pedidos 
	on Clientes.codigoCliente = Pedidos.codigoCliente;
    
Select Clientes.nombreCliente, Pedidos.codigoPedido
	from CLientes Left Join Pedidos
		on Clientes.codigoCliente = Pedidos.codigoCliente;

-- --------------------------- RIGHT JOIN

Select * from Clientes Right Join Pedidos 
	on Clientes.codigoCliente = Pedidos.codigoCliente;
    
Select Clientes.nombreCliente, Pedidos.codigoPedido
	from Clientes Right Join Pedidos
		on Clientes.codigoCliente = Pedidos.codigoCliente;
        
-- --------------------------- OUTER JOIN (NO FUNCIONA EN MYSQL)

Select * from Clientes Full Join Pedidos
	on Clientes.codigoCliente = Pedidos.codigoCliente;