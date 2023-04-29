/*
	Nombre Completo: Jose Daniel Chiquin Montenegro
    Código Técnico: IN5AM
    Fecha de Creación: 02/02/2022
    Fechas de modificación: 03/02/2022 - 04/02/2022 - 09/02/2022
*/

Drop database if exists DBSportStore20181518;
Create database DBSportStore20181518;

Use DBSportStore20181518;

Create table Categorias(
	codigoCategoria int not null auto_increment,
    descripcion varchar(150) not null,
    primary key PK_codigoCategoria (codigoCategoria)
);

Create table Marcas(
	codigoMarca int not null auto_increment,
    descripcion varchar(150) not null,
    primary key PK_codigoMarca (codigoMarca)
);

Create table Tallas(
	codigoTalla int not null auto_increment,
    descripcion varchar(150) not null,
    primary key PK_codigoTalla (codigoTalla)
);

Create table Productos(
	codigoProducto int not null auto_increment,
    descripcion varchar(150) not null,
    existencia int not null,
    precioUnitario decimal (10,2) not null default 0.00,-- 40%
    precioPorDocena decimal (10,2) not null default 0.00,-- 35%
    precioPorMayor decimal (10,2) not null default 0.00, -- 25%
    codigoCategoria int not null,
    codigoMarca int not null,
    codigoTalla int not null,
    primary key PK_codigoProducto (codigoProducto),
    constraint FK_Productos_Categorias foreign key (codigoCategoria)
		references Categorias(codigoCategoria),
	constraint FK_Productos_Marcas foreign key (codigoMarca)
		references Marcas(codigoMarca),
	constraint FK_Productos_Tallas foreign key (codigoTalla)
		references Tallas(codigoTalla)
);
-- --------------------------- DDL CATEGORIAS ---------------------------
-- --------------------------- INSERT ---------------------------
INSERT INTO Categorias (descripcion)
	values ('Ropa de niño'),
     ('Ropa de niña'),
     ('Ropa deportiva'),
     ('Ropa de baño');
     
-- --------------------------- SELECT ---------------------------
Select
	C.descripcion
    from Categorias C;

-- --------------------------- BÚSQUEDA ---------------------------
Select
	C.descripcion
	from Categorias C where codigoCategoria = 3;
    
-- --------------------------- ALTER ---------------------------
alter table Categorias add seccionCategoria varchar(20);

-- --------------------------- UPDATE ---------------------------
Update Categorias
	set seccionCategoria = 'Sección Invierno'
    where codigoCategoria = 1;
    
-- --------------------------- DELETE ---------------------------
Delete From Categorias where codigoCategoria = 3;




-- --------------------------- DDL MARCAS ---------------------------
-- --------------------------- INSERT ---------------------------
INSERT INTO Marcas (descripcion)
	values  ('Adidas'),
			('Puma'),
			('Levis'),
			('Jordan');
-- --------------------------- SELECT ---------------------------
Select
	M.descripcion
    from Marcas M;

-- --------------------------- BÚSQUEDA ---------------------------
Select
	M.descripcion
	from Marcas M where codigoMarca = 1;
    
-- --------------------------- ALTER ---------------------------
alter table Marcas add proveedorMarca varchar(20);

-- --------------------------- UPDATE ---------------------------
Update Marcas
	set proveedorMarca = 'Empresa Nike'
    where codigoMarca = 4;
    
-- --------------------------- DELETE ---------------------------
Delete From Marcas where codigoMarca = 3;




-- --------------------------- DDL TALLAS ---------------------------
-- --------------------------- INSERT ---------------------------
INSERT INTO Tallas (descripcion)
	values  ('S'),
			('M'),
			('L'),
			('XL');
-- --------------------------- SELECT ---------------------------
Select
	T.descripcion
    from Tallas T;

-- --------------------------- BÚSQUEDA ---------------------------
Select
	T.descripcion
	from Tallas T where codigoTalla = 2;
    
-- --------------------------- ALTER ---------------------------
alter table Tallas add numeroTalla varchar(20);

-- --------------------------- UPDATE ---------------------------
Update Tallas
	set numeroTalla = '28'
    where codigoTalla = 3;
    
-- --------------------------- DELETE ---------------------------
Delete From Tallas where codigoTalla = 2;




-- --------------------------- DDL PRODUCTOS ---------------------------
-- --------------------------- INSERT ---------------------------
INSERT INTO Productos (descripcion, existencia, precioUnitario, codigoCategoria, codigoMarca, codigoTalla)
	values  ('Pantalon de tela', 20,30.20,2,1,3),
			('Calcetines', 16,15.50,1,1,3),
			('Camisas', 25,30.40,4,4,3),
			('Pantaloneta', 6,50.34,4,4,1);
-- --------------------------- SELECT ---------------------------
Select
	P.descripcion, 
    P.existencia, 
    P.precioUnitario, 
    P.codigoCategoria, 
    P.codigoMarca, 
    P.codigoTalla
    from Productos P;

-- --------------------------- BÚSQUEDA ---------------------------
Select
	P.descripcion, 
    P.existencia, 
    P.precioUnitario, 
    P.codigoCategoria, 
    P.codigoMarca, 
    P.codigoTalla
	from Productos P where codigoProducto = 4;
    
-- --------------------------- ALTER ---------------------------
alter table Productos add materialProducto varchar(20);

-- --------------------------- UPDATE ---------------------------
Update Productos
	set materialProducto = 'Algodón'
    where codigoProducto = 2;
    
-- --------------------------- DELETE ---------------------------
Delete From Productos where codigoMarca = 3;




-- --------------------------- PROCEDIMIENTOS DE CATEGORIAS ---------------------------
-- --------------------------- AGREGAR ---------------------------
Delimiter //
	Create procedure sp_AgregarCategoria (in descripcion varchar (150))
		begin 
			insert into Categorias (descripcion) values (descripcion);
        end //
Delimiter ;

call sp_AgregarCategoria ('Ropa de caballero');

-- --------------------------- LISTAR ---------------------------
Delimiter //
	Create procedure sp_ListarCategorias()
		Begin
			Select 
				C.codigoCategoria,
                C.descripcion
				From Categorias C;
        End//
Delimiter ;

call sp_ListarCategorias();

-- --------------------------- BUSCAR -------------------------- 
Delimiter //
	Create procedure sp_BuscarCategoria (in codCat int)
		Begin
			Select 
            C.codigoCategoria,
            C.descripcion
            From Categorias C where codigoCategoria = codCat;
		End//
Delimiter ;

call sp_BuscarCategoria(3);

-- --------------------------- ELIMINAR --------------------------
Delimiter //
	Create procedure sp_ELiminarCategoria (in codCat int)
		Begin 
			Delete from Categorias
				where codigoCategoria = codCat;
		End//
Delimiter ;

call sp_EliminarCategoria (3);
call sp_ListarCategorias ();

-- --------------------------- EDITAR --------------------------
Delimiter //
	Create procedure sp_EditarCategoria (in codCat int, in descrip varchar (150))
		Begin 
			Update Categorias C
				set descripcion = descrip
					where codigoCategoria = codCat;
		End//
Delimiter ;

call sp_EditarCategoria (3, 'Ropa para dama');
call sp_ListarCategorias();




-- --------------------------- PROCEDIMIENTOS DE MARCAS --------------------------
-- --------------------------- AGREGAR --------------------------
Delimiter //
	Create procedure sp_AgregarMarca (in descripcion varchar (150))
		Begin 
			insert into Marcas (descripcion) values (descripcion);
		End//
Delimiter ;

call sp_AgregarMarca ('Nike');

-- --------------------------- LISTAR ---------------------------
Delimiter $$
	Create procedure sp_ListarTalla1()
		begin
			Select 
				T.codigoTalla,
                T.descripcion
                from Tallas T;
		end $$
Delimiter ;

call sp_ListarTalla1();

-- --------------------------- BUSCAR -------------------------- 
Delimiter //
	Create procedure sp_BuscarMarca (in codCat int)
		Begin
			Select 
            M.codigoMarca,
            M.descripcion
            From Marcas M where codigoMarca = codCat;
		End//
Delimiter ;

call sp_BuscarMarca(3);

-- --------------------------- ELIMINAR --------------------------
Delimiter //
	Create procedure sp_ELiminarMarca (in codCat int)
		Begin 
			Delete from Marcas
				where codigoMarca = codCat;
		End//
Delimiter ;

call sp_EliminarMarca (2);
call sp_ListarCategorias ();

-- --------------------------- EDITAR --------------------------
Delimiter //
	Create procedure sp_EditarMarca (in codCat int, in descrip varchar (150))
		Begin 
			Update Marcas M
				set descripcion = descrip
					where codigoMarca = codCat;
		End//
Delimiter ;

call sp_EditarCategoria (4, 'Zara');
call sp_ListarCategorias();




-- --------------------------- PROCEDIMIENTOS DE TALLAS --------------------------
-- --------------------------- AGREGAR --------------------------
Delimiter //
	Create procedure sp_AgregarTalla(in descripcion varchar (150))
		Begin 
			insert into Tallas (descripcion) values (descripcion);
		End//
Delimiter ;

call sp_AgregarTalla ('XS');

-- --------------------------- LISTAR ---------------------------
Delimiter //
	Create procedure sp_ListarTalla()
		Begin
			Select 
				T.codigoTalla,
                T.descripcion
				From Tallas T;
        End//
Delimiter ;

call sp_ListarTalla();

-- --------------------------- BUSCAR -------------------------- 
Delimiter //
	Create procedure sp_BuscarTalla (in codCat int)
		Begin
			Select 
            T.codigoTalla,
            T.descripcion
            From Tallas T where codigoTalla = codCat;
		End//
Delimiter ;

call sp_BuscarTalla(1);

-- --------------------------- ELIMINAR --------------------------
Delimiter //
	Create procedure sp_ELiminarTalla (in codCat int)
		Begin 
			Delete from Tallas
				where codigoTalla = codCat;
		End//
Delimiter ;

call sp_EliminarTalla (4);
call sp_ListarTalla ();

-- --------------------------- EDITAR --------------------------
Delimiter //
	Create procedure sp_EditarTalla (in codCat int, in descrip varchar (150))
		Begin 
			Update Tallas T
				set descripcion = descrip
					where codigoMarca = codCat;
		End//
Delimiter ;

call sp_EditarCategoria (5, 'XXL');
call sp_ListarTalla();




-- --------------------------- PROCEDIMIENTOS DE PRODUCTOS --------------------------
-- --------------------------- AGREGAR --------------------------
Delimiter //
	Create procedure sp_AgregarProducto (in descripcion varchar (150), in existencia int,in precioUnitario decimal (10,2), in codigoCategoria int, codigoMarca int, in codigoTalla int)
		Begin 
			insert into Productos (descripcion, existencia, precioUnitario, codigoCategoria, codigoMarca, codigoTalla) values (descripcion, existencia, precioUnitario, codigoCategoria, codigoMarca, codigoTalla);
		End//
Delimiter ;

call sp_AgregarProducto ('Pantalon de lona', 10,40.50,1,4,1);

-- --------------------------- LISTAR --------------------------
Delimiter //
	Create procedure sp_ListarProducto ()
		Begin 
			Select 
            P.codigoProducto,
            P.descripcion, 
            P.existencia,
            P.precioUnitario,
            P.precioPorDocena,
            P.precioPorMayor,
            P.codigoCategoria, 
            P.codigoMarca, 
            P.codigoTalla
			from Productos P;
		End//
Delimiter ;

call sp_ListarProducto(); 

-- --------------------------- BUSCAR -------------------------- 
Delimiter //
	Create procedure sp_BuscarProducto (in codCat int)
		Begin
			Select 
            P.codigoProducto,
            P.descripcion, 
            P.existencia,
            P.precioUnitario,
            P.precioPorDocena,
            P.precioPorMayor,
            P.codigoCategoria, 
            P.codigoMarca, 
            P.codigoTalla
            From Productos P where codigoProducto = codCat;
		End//
Delimiter ;

call sp_BuscarProducto(3);

-- --------------------------- ELIMINAR --------------------------
Delimiter //
	Create procedure sp_ELiminarProducto (in codCat int)
		Begin 
			Delete from Productos
				where codigoProducto = codCat;
		End//
Delimiter ;

call sp_EliminarProducto (5);
call sp_ListarProducto ();

-- --------------------------- EDITAR --------------------------
Delimiter //
	Create procedure sp_EditarProducto (in codCat int, in descrip varchar (150),precioUnitario decimal(10,2))
		Begin 
			Update Productos P
				set descripcion = descrip
					where codigoProducto = codCat;
		End//
Delimiter ;

call sp_EditarProducto (3,'Falda', 38.30);
call sp_ListarProducto();

-- --------------------------- CALCULAR EN PROCEDIMIENTOS ALMACENADOS --------------------------
-- --------------------------- PRECIO UNITARIO --------------------------
Delimiter $$
	Create function fn_PrecioUnitario (precioUnitario float, existencia int) Returns float
		READS SQL DATA DETERMINISTIC
			Begin
				declare result float;
                set result = (preciounitario)/((1)-((existencia)*(0.40)));
                Return result;
            End$$
Delimiter ;

Select fn_PrecioUnitario (precioUnitario, existencia) from Productos as PrecioUnitario;

-- --------------------------- PRECIO POR DOCENA --------------------------

Delimiter $$
	Create function fn_PrecioPorDocena (precioUnitario float, existencia int) Returns float
		READS SQL DATA DETERMINISTIC
			Begin
				declare result float;
                set result = ((precioUnitario)*(12))/((12)-((existencia)*(0.35)));
                Return result;
            End$$
Delimiter ;

Select fn_PrecioPorDocena (precioUnitario, existencia) from Productos as PrecioPorDocena;

-- --------------------------- PRECIO POR MAYOR --------------------------

Delimiter $$
	Create function fn_PrecioPorMayor (precioUnitario float, existencia int) Returns float
		READS SQL DATA DETERMINISTIC
			Begin
				declare result float;
                set result = ((precioUnitario)*(30))/((30)-((existencia)*(0.25)));
                Return result;
            End$$
Delimiter ;

Select fn_PrecioPorMayor (precioUnitario, existencia) from Productos as PrecioPorMayor;

-- --------------------------- UPDATE --------------------------
Delimiter $$
Create procedure sp_UpdateProductos (in codCat int)
	Begin
		Update Productos P
			Set precioUnitario = fn_PrecioUnitario (P.precioUnitario, P.existencia),
				precioPorDocena = fn_PrecioPorDocena (P.precioUnitario, P.existencia),
                precioPorMayor = fn_PrecioPorMayor (P.precioUnitario, P.existencia)
					where codigoDato = codCat;
	End$$
Delimiter ;