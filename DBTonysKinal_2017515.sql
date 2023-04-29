Drop Database if exists DBTonysKinal_2017515;
Create Database DBTonysKinal_2017515;

Use DBTonysKinal_2017515;

Create table Empresas (
	codigoEmpresa int not null,
	nombreEmpresa varchar(150),
    direccion varchar (150),
    telefono varchar(150),
    primary key PK_codigoEmpresa (codigoEmpresa)
);

Create table TipoEmpleado (
	codigoTipoEmpleado int not null,
    descripcion varchar (100),
    primary key PK_codigoTipoEmpleado (codigoTipoEmpleado)
);

Create table TipoPlato (
	codigoTipoPlato int not null,
    descripcion varchar (100),
    primary key PK_codigoTipoPlato (codigoTipoPlato)
);

Create table Productos (
	codigoProducto int not null,
    nombreProducto varchar (150),
    cantidad int not null,
    primary key PK_codigoProducto (codigoProducto)
);

Create table Empleados (
	codigoEmpleado int not null,
    numeroEmpleado int not null,
    apellidosEmpleado varchar (150),
    nombresEmpleado varchar (150),
    direccionEmpleado varchar (150),
    telefonoContacto varchar (150),
    gradoCocinero varchar (50),
    codigoTipoEmpleado int not null,
    primary key PK_codigoEmpleado (codigoEmpleado),
    constraint FK_Empleados_TipoEmpleado foreign key (codigoTipoEmpleado)
		references TipoEmpleado (codigoTipoEmpleado)
);
    
Create table Presupuesto (
	codigoPresupuesto int not null,
    fechaSolicitud date not null,
    cantidadPresupuesto decimal(10,2),
    codigoEmpresa int not null,
    primary key PK_codigoPresupuesto (codigoPresupuesto),
    constraint FK_Presupuestos_Empresas foreign key (codigoEmpresa)
		references Empresas (codigoEmpresa)
);

Create table Servicios (
	codigoServicio int not null,
    fechaServicio date not null,
    tipoServicio varchar (100),
    horaServicio Time not null,
    lugarServicio varchar (100),
    telefonoContacto varchar (10),
    codigoEmpresa int not null,
    primary key PK_codigoServicio (codigoServicio),
    constraint FK_Servicios_Empresas foreign key (codigoEmpresa)
		references Empresas (codigoEmpresa)
);

Create table Platos (
	codigoPlato int not null,
	cantidad int not null,
    nombrePlato varchar (50),
    descripcionPlato varchar (150),
    precioPlato decimal (10,2),
    codigoTipoPlato int not null,
    primary key PK_codigoPlato (codigoPlato),
    constraint FK_Platos_TipoPlato foreign key (codigoTipoPlato)
		references TipoPlato (codigoTipoPlato)
);

Create table Productos_has_Platos (
	Productos_codigoProducto int not null,
	codigoPlato int not null,
    codigoProducto int not null,
	primary key PK_Productos_codigoProducto (Productos_codigoProducto),
    constraint FK_Productos_has_Platos_Productos1 foreign key (codigoProducto) references Productos (codigoProducto),
    constraint FK_Productos_has_Platos_Platos2 foreign key (codigoPlato) references Platos (codigoPlato)
);

Create table Servicios_has_Platos (
	Servicios_codigoServicio int not null,
    codigoPlato int not null,
    codigoServicio int not null,
    primary key PK_Servicios_codigoServicio (Servicios_codigoServicio),
    constraint FK_Servicios_has_Platos_Servicio1 foreign key (codigoServicio) references Servicios (codigoServicio),
    constraint FK_Productos_has_Platos_Platos1 foreign key (codigoPlato) references Platos (codigoPlato)
);

Create table Servicios_has_Empleados (
	Servicios_codigoServicio int not null,
    Empleados_codigoEmpleado int not null,
    codigoEmpleado int not null,
    codigoServicio int not null,
    fechaEvento date not null,
    horaEvento time not null,
    lugarEvento varchar (150),
    primary key PK_Servicios_codigoServicio (Servicios_codigoServicio),
    constraint FK_Servicios_has_Empleados_Empleados1 foreign key (codigoEmpleado) references Empleados (codigoEmpleado),
    constraint FK_Servicios_has_Empleados_Servicios2 foreign key (codigoServicio) references Servicios (codigoServicio)
);

-- -------------------- PROCEDIMIENTOS ALMACENADOS --------------------

-- -------------------- EMPRESAS --------------------
-- --------------- AGREGAR ---------------
Delimiter $$
	Create procedure sp_AgregarEmpresa (in codigoEmpresa int, in nombreEmpresa varchar (150), in direccion varchar(150), in telefono varchar(150))
		begin
			Insert into Empresas (codigoEmpresa, nombreEmpresa, direccion, telefono)
				values (codigoEmpresa, nombreEmpresa, direccion, telefono);
		end $$
Delimiter ;

call sp_AgregarEmpresa (256, 'Alimentos S.A.', 'Ciudad de Guatemala', '23861818');
call sp_AgregarEmpresa (453, 'Suministros & Alimentos', 'Ciudad de Guatemala', '24271600');

-- --------------- LISTAR ---------------
Delimiter $$
	Create procedure sp_ListarEmpresas()
		begin
			Select 
				E.codigoEmpresa,
                E.nombreEmpresa,
                E.direccion,
                E.telefono
                from Empresas E;
		end $$
Delimiter ;

call sp_ListarEmpresas();

-- --------------- BUSCAR ---------------
Delimiter $$
	Create procedure sp_BuscarEmpresa (in codCat int)
		begin 
			select
				E.codigoEmpresa,
                E.nombreEmpresa,
                E.direccion,
                E.telefono
                from Empresas E where codigoEmpresa = codCat;
		End$$
Delimiter ;

call sp_BuscarEmpresa(453);

-- --------------- EDITAR ---------------
Delimiter $$
	create procedure sp_EditarEmpresa (in codCat int, in nombr varchar (150))
		Begin
			update Empresas 
				set nombreEmpresa = nombr
				where codigoEmpresa = codCat;
		End$$
Delimiter 

call sp_EditarEmpresa(256, 'Corproinsa');
call sp_ListarEmpresas();

-- --------------- ELIMINAR ---------------
Delimiter $$
		Create procedure sp_EliminarEmpresa (in codCat int)
			begin
				delete from Empresas
					where codigoEmpresa = codCat;
			end$$
Delimiter ;
call sp_EliminarEmpresa(256);
call sp_ListarEmpresas();




-- -------------------- TIPO DE EMPLEADO --------------------
-- --------------- AGREGAR ---------------
Delimiter $$
	Create procedure sp_AgregarTipoEmpleado (in codigoTipoEmpleado int, in descripcion varchar(100))
		begin
			Insert into TipoEmpleado (codigoTipoEmpleado, descripcion)
				values  (codigoTipoEmpleado, descripcion);
		end $$
Delimiter ;

call sp_AgregarTipoEmpleado (12, 'Cocinero');
call sp_AgregarTipoEmpleado (14, 'Mesero');

-- --------------- LISTAR ---------------
Delimiter $$
	Create procedure sp_ListarTipoEmpleado()
		begin
			Select 
				T.codigoTipoEmpleado,
                T.descripcion
                from TipoEmpleado T;
		end $$
Delimiter ;

call sp_ListarTipoEmpleado();

-- --------------- BUSCAR ---------------
Delimiter $$
	Create procedure sp_BuscarTipoEmpleado (in codCat int)
		begin 
			select
				T.codigoTipoEmpleado,
                T.descripcion
                from TipoEmpleado T where codigoTipoEmpleado = codCat;
		End$$
Delimiter ;

call sp_BuscarTipoEmpleado(12);

-- --------------- EDITAR ---------------
Delimiter $$
	create procedure sp_EditarTipoEmpleado (in codCat int, in descrip varchar (150))
		Begin
			update TipoEmpleado 
				set descripcion = descrip
				where codigoTipoEmpleado = codCat;
		End$$
Delimiter 

call sp_EditarTipoEmpleado(14,'Ayudante del chef');
call sp_ListarTipoEmpleado();

-- --------------- ELIMINAR ---------------
Delimiter $$
		Create procedure sp_EliminarTipoEmpleado (in codCat int)
			begin
				delete from TipoEmpleado
					where codigoTipoEmpleado = codCat;
			end$$
Delimiter ;
call sp_EliminarTipoEmpleado(14);
call sp_ListarTipoEmpleado();




-- -------------------- TIPO DE PLATO --------------------
-- --------------- AGREGAR ---------------
Delimiter $$
	Create procedure sp_AgregarTipoPlato (in codigoTipoPlato int, in descripcion varchar(100))
		begin
			Insert into TipoPlato (codigoTipoPlato, descripcion)
				values  (codigoTipoPlato, descripcion);
		end $$
Delimiter ;

call sp_AgregarTipoPlato (23, 'Entrada');
call sp_AgregarTipoPlato (56, 'Almuerzos');

-- --------------- LISTAR ---------------
Delimiter $$
	Create procedure sp_ListarTipoPlato()
		begin
			Select 
				TP.codigoTipoPlato,
                TP.descripcion
                from TipoPlato TP;
		end $$
Delimiter ;

call sp_ListarTipoPlato();

-- --------------- BUSCAR ---------------
Delimiter $$
	Create procedure sp_BuscarTipoPlato (in codCat int)
		begin 
			select
				TP.codigoTipoPlato,
                TP.descripcion
                from TipoPlato TP where codigoTipoPlato = codCat;
		End$$
Delimiter ;

call sp_BuscarTipoPlato(23);

-- --------------- EDITAR ---------------
Delimiter $$
	create procedure sp_EditarTipoPlato (in codCat int, in descrip varchar (150))
		Begin
			update TipoPlato 
				set descripcion = descrip
				where codigoTipoPlato = codCat;
		End$$
Delimiter 

call sp_EditarTipoPlato(56,'Postres');
call sp_ListarTipoPlato();

-- --------------- ELIMINAR ---------------
Delimiter $$
		Create procedure sp_EliminarTipoPlato (in codCat int)
			begin
				delete from TipoPlato
					where codigoTipoPlato = codCat;
			end$$
Delimiter ;
call sp_EliminarTipoPlato(56);
call sp_ListarTipoPlato();




-- -------------------- PRODUCTOS --------------------
-- --------------- AGREGAR ---------------
Delimiter $$
	Create procedure sp_AgregarProductos (in codigoProducto int, in nombreProducto varchar (150), in cantidad int)
		begin
			Insert into Productos (codigoProducto, nombreProducto, cantidad)
				values (codigoProducto, nombreProducto, cantidad);
		end $$
Delimiter ;

call sp_AgregarProductos (324, 'Cafe', 34);
call sp_AgregarProductos (325, 'Arroz', 30);

-- --------------- LISTAR ---------------

Delimiter $$
	Create procedure sp_ListarProductos()
		begin
			Select 
				P.codigoProducto,
                P.nombreProducto,
                P.cantidad
                from Productos P;
		end $$
Delimiter ;

call sp_ListarProductos();

-- --------------- BUSCAR ---------------

Delimiter $$
	Create procedure sp_BuscarProductos (in codCat int)
		begin 
			select
				P.codigoProducto,
                P.nombreProducto,
                P.cantidad
                from Productos P where codigoProducto = codCat;
		End$$
Delimiter ;

call sp_BuscarProductos(324);

-- --------------- EDITAR ---------------

Delimiter $$
	create procedure sp_EditarProductos (in codCat int, in nombr varchar (150))
		Begin
			update Productos 
				set nombreProducto = nombr
				where codigoProducto = codCat;
		End$$
Delimiter 

call sp_EditarProductos(324, 'Frijol');
call sp_ListarProductos();

-- --------------- ELIMINAR ---------------

Delimiter $$
		Create procedure sp_EliminarProductos (in codCat int)
			begin
				delete from Productos
					where codigoProducto = codCat;
			end$$
Delimiter ;
call sp_EliminarProductos(324);
call sp_ListarProductos();




-- -------------------- EMPLEADOS  --------------------
-- --------------- AGREGAR ---------------
Delimiter $$
	Create procedure sp_AgregarEmpleado (in codigoEmpleado int, in numeroEmpleado int, in apellidosEmpleado varchar (150), in nombresEmpleado varchar (150),
										in direccionEmpleado varchar (150), in telefonoContacto varchar (150), in gradoCocinero varchar (50), in codigoTipoEmpleado int)
		begin
			Insert into Empleados (codigoEmpleado, numeroEmpleado, apellidosEmpleado, nombresEmpleado, direccionEmpleado,
						telefonoContacto, gradoCocinero, codigoTipoEmpleado)
				values  (codigoEmpleado, numeroEmpleado, apellidosEmpleado, nombresEmpleado, direccionEmpleado,
						telefonoContacto, gradoCocinero, codigoTipoEmpleado);
		end $$
Delimiter ;

call sp_AgregarEmpleado (48, '3', 'Hernandez Flores', 'Estuardo Raúl', '23 calle 12-45 zona 7', '34567654', 'Grado 2', 12);
call sp_AgregarEmpleado (23, '2', 'Pérez López', 'Gabriel José', '14 calle 2-23 zona 8', '34546554', 'Grado 1', 12);

-- --------------- LISTAR ---------------
Delimiter $$
	Create procedure sp_ListarEmpleados()
		begin
			Select 
				E.codigoEmpleado, 
                E.numeroEmpleado,
                E.apellidosEmpleado, 
                E.nombresEmpleado, 
                E.direccionEmpleado,
				E.telefonoContacto, 
                E.gradoCocinero, 
                E.codigoTipoEmpleado
                from Empleados E;
		end $$
Delimiter ;

call sp_ListarEmpleados();

-- --------------- BUSCAR ---------------
Delimiter $$
	Create procedure sp_BuscarEmpleado (in codCat int)
		begin 
			select
				E.codigoEmpleado, 
                E.numeroEmpleado,
                E.apellidosEmpleado, 
                E.nombresEmpleado, 
                E.direccionEmpleado,
				E.telefonoContacto, 
                E.gradoCocinero, 
                E.codigoTipoEmpleado
                from Empleados E where codigoEmpleado = codCat;
		End$$
Delimiter ;

call sp_BuscarEmpleado(48);

-- --------------- EDITAR ---------------
Delimiter $$
	create procedure sp_EditarEmpleado (in codCat int, in numeroE int)
		Begin
			update Empleados 
				set numeroEmpleado = numeroE
				where codigoEmpleado = codCat;
		End$$
Delimiter 

call sp_EditarEmpleados(23,4);
call sp_ListarEmpleados();

-- --------------- ELIMINAR ---------------
Delimiter $$
		Create procedure sp_EliminarEmpleado (in codCat int)
			begin
				delete from Empleados
					where codigoEmpleado = codCat;
			end$$
Delimiter ;
call sp_EliminarEmpleado(23);
call sp_ListarEmpleados();




-- -------------------- PRESUPUESTO  --------------------
-- --------------- AGREGAR ---------------
Delimiter $$
	Create procedure sp_AgregarPresupuesto (in codigoPresupuesto int, in fechaSolicitud date, in cantidadPresupuesto decimal(10,2),
											in codigoEmpresa int)
		begin
			Insert into Presupuesto (codigoPresupuesto, fechaSolicitud, cantidadPresupuesto, codigoEmpresa)
				values  (codigoPresupuesto, fechaSolicitud, cantidadPresupuesto, codigoEmpresa);
		end $$
Delimiter ;

call sp_AgregarPresupuesto (34, 09/23/2021,105.40, 453);
call sp_AgregarPresupuesto (23, 12/23/2022,200.42, 453);

-- --------------- LISTAR ---------------
Delimiter $$
	Create procedure sp_ListarPresupuesto()
		begin
			Select 
				PR.codigoPresupuesto, 
                PR.fechaSolicitud, 
                PR.cantidadPresupuesto, 
                PR.codigoEmpresa
                from Presupuesto Pr;
		end $$
Delimiter ;

call sp_ListarPresupuesto();

-- --------------- BUSCAR ---------------
Delimiter $$
	Create procedure sp_BuscarPresupuesto (in codCat int)
		begin 
			select
				PR.codigoPresupuesto, 
                PR.fechaSolicitud, 
                PR.cantidadPresupuesto, 
                PR.codigoEmpresa
                from Presupuesto PR where codigoPresupuesto = codCat;
		End$$
Delimiter ;

call sp_BuscarPresupuesto(34);

-- --------------- EDITAR ---------------
Delimiter $$
	create procedure sp_EditarPresupuesto (in codCat int, in cantidadP int)
		Begin
			update Presupuesto 
				set cantidadPresupuesto = cantidadP
				where codigoPresupuesto = codCat;
		End$$
Delimiter 

call sp_EditarPresupuesto(23,300.50);
call sp_ListarPresupuesto();

-- --------------- ELIMINAR ---------------
Delimiter $$
		Create procedure sp_EliminarPresupuesto (in codCat int)
			begin
				delete from Presupuesto
					where codigoPresupuesto = codCat;
			end$$
Delimiter ;
call sp_EliminarPresupuesto(23);
call sp_ListarPresupuesto();




-- -------------------- SERVICIOS  --------------------
-- --------------- AGREGAR ---------------
Delimiter $$
	Create procedure sp_AgregarServicio (in codigoServicio int ,in fechaServicio date,in tipoServicio varchar (100),in horaServicio time,
										 in lugarServicio varchar(100), in telefonoContacto varchar (10), in codigoEmpresa int)
		begin
			Insert into Servicios (codigoServicio,fechaServicio,tipoServicio,horaServicio,
								lugarServicio,telefonoContacto,codigoEmpresa)
				values  (codigoServicio,fechaServicio,tipoServicio,horaServicio,
								lugarServicio,telefonoContacto,codigoEmpresa);
		end $$
Delimiter ;

call sp_AgregarServicio (20, 09/24/2021,'Convivio','08:00:00','Ciudad de Guatemala','26453423',453);
call sp_AgregarServicio (44, 02/10/2022,'Evento de Boda','10:30:00','Ciudad de Guatemala','98673433',453);

-- --------------- LISTAR ---------------
Delimiter $$
	Create procedure sp_ListarServicio()
		begin
			Select 
				S.codigoServicio,
                S.fechaServicio,
                S.tipoServicio,
                S.horaServicio,
				S.lugarServicio,
                S.telefonoContacto,
                S.codigoEmpresa
                from Servicios S;
		end $$
Delimiter ;

call sp_ListarServicio();

-- --------------- BUSCAR ---------------
Delimiter $$
	Create procedure sp_BuscarServicio (in codCat int)
		begin 
			select
				S.codigoServicio,
                S.fechaServicio,
                S.tipoServicio,
                S.horaServicio,
				S.lugarServicio,
                S.telefonoContacto,
                S.codigoEmpresa
                from Servicios S where codigoServicio = codCat;
		End$$
Delimiter ;

call sp_BuscarServicio(20);

-- --------------- EDITAR ---------------
Delimiter $$
	create procedure sp_EditarServicio (in codCat int, in tipoS int)
		Begin
			update Servicios 
				set tipoServicio = tipoS
				where codigoPresupuesto = codCat;
		End$$
Delimiter 

call sp_EditarServicio(44,'Comida Casual');
call sp_ListarServicio();

-- --------------- ELIMINAR ---------------
Delimiter $$
		Create procedure sp_EliminarServicio (in codCat int)
			begin
				delete from Servicios
					where codigoServicio = codCat;
			end$$
Delimiter ;
call sp_EliminarServicio(44);
call sp_ListarServicio();




-- -------------------- PLATOS  --------------------
-- --------------- AGREGAR ---------------
Delimiter $$
	Create procedure sp_AgregarPlato (codigoPlato int,in cantidad int,in nombrePlato varchar (50),in descripcionPlato varchar (150),in precioPlato decimal (10,2),
    in codigoTipoPlato int)
		begin
			Insert into Platos (codigoPlato,cantidad,nombrePlato,descripcionPlato,precioPlato,codigoTipoPlato)
				values  (codigoPlato,cantidad,nombrePlato,descripcionPlato,precioPlato,codigoTipoPlato);
		end $$
Delimiter ;

call sp_AgregarPlato (1, 20,'Alitas','Unas ricas alitas bañadas en salsa dulce',24.60,23);
call sp_AgregarPlato (2, 36,'Papas fritas','Papas fritas acompañada de salsa dulce',20.30,23);

-- --------------- LISTAR ---------------
Delimiter $$
	Create procedure sp_ListarPlato()
		begin
			Select 
				PL.codigoPlato,
                PL.cantidad,
                PL.nombrePlato,
                PL.descripcionPlato,
                PL.precioPlato,
                PL.codigoTipoPlato
                from Platos PL;
		end $$
Delimiter ;

call sp_ListarPlato();

-- --------------- BUSCAR ---------------
Delimiter $$
	Create procedure sp_BuscarPlato (in codCat int)
		begin 
			select
				PL.codigoPlato,
                PL.cantidad,
                PL.nombrePlato,
                PL.descripcionPlato,
                PL.precioPlato,
                PL.codigoTipoPlato
                from Platos PL where codigoPlato = codCat;
		End$$
Delimiter ;

call sp_BuscarPlato(1);

-- --------------- EDITAR ---------------
Delimiter $$
	create procedure sp_EditarPlato (in codCat int, in descrip int)
		Begin
			update Platos 
				set tipoPlato = descrip
				where codigoPlato = codCat;
		End$$
Delimiter 

call sp_EditarPlato(2,'Papas fritas bañadas en salsa Jack Daniels');
call sp_ListarPlato();

-- --------------- ELIMINAR ---------------
Delimiter $$
		Create procedure sp_EliminarPlato (in codCat int)
			begin
				delete from Platos
					where codigoPlato = codCat;
			end$$
Delimiter ;
call sp_EliminarPlato(2);
call sp_ListarPlato();




-- -------------------- EVENTOS  --------------------
-- --------------- AGREGAR ---------------
Delimiter $$
	Create procedure sp_AgregarEvento (in Servicios_codigoServicio int,in Empleados_codigoEmpleado int,in codigoEmpleado int,in codigoServicio int,
									in fechaEvento date,in horaEvento time,in lugarEvento varchar (150))
		begin
			Insert into Servicios_has_Empleados (Servicios_codigoServicio, Empleados_codigoEmpleado, codigoEmpleado, codigoServicio, 
								fechaEvento,horaEvento,lugarEvento)
				values  (Servicios_codigoServicio, Empleados_codigoEmpleado, codigoEmpleado, codigoServicio, 
						fechaEvento,horaEvento,lugarEvento);
		end $$
Delimiter ;

call sp_AgregarEvento (3, 4,48,20,07/03/2021,'06:40:30', 'Ciudad de Guatemala');
call sp_AgregarEvento (5, 6,48,20,10/14/2022,'11:20:00', 'Ciudad de Guatemala');

-- --------------- LISTAR ---------------
Delimiter $$
	Create procedure sp_ListarEvento()
		begin
			Select 
				EV.Servicios_codigoServicio, 
                EV.Empleados_codigoEmpleado, 
                EV.codigoEmpleado, 
                EV.codigoServicio, 
				EV.fechaEvento,
                EV.horaEvento,
                EV.lugarEvento
                from Servicios_has_Empleados EV;
		end $$
Delimiter ;

call sp_ListarEvento();

-- --------------- BUSCAR ---------------
Delimiter $$
	Create procedure sp_BuscarEvento (in codCat int)
		begin 
			select
				EV.Servicios_codigoServicio, 
                EV.Empleados_codigoEmpleado, 
                EV.codigoEmpleado, 
                EV.codigoServicio, 
				EV.fechaEvento,
                EV.horaEvento,
                EV.lugarEvento
                from Servicios_has_Empleados EV where Servicios_codigoServicio = codCat;
		End$$
Delimiter ;

call sp_BuscarEvento(3);

-- --------------- EDITAR ---------------
Delimiter $$
	create procedure sp_EditarEvento (in codCat int, in lugarE int)
		Begin
			update Servicios_has_Empleados 
				set lugarEvento = lugarE
				where Servicios_codigoServicio = codCat;
		End$$
Delimiter 

call sp_EditarEvento(5,'Santa Rosa');
call sp_ListarEvento();

-- --------------- ELIMINAR ---------------
Delimiter $$
		Create procedure sp_EliminarEvento (in codCat int)
			begin
				delete from Servicios_has_Empleados
					where Servicios_codigoServicio = codCat;
			end$$
Delimiter ;
call sp_EliminarEvento(5);
call sp_ListarEvento();