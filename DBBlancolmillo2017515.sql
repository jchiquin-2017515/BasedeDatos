Drop database if exists DBBlancolmillo2017515;
Create database DBBlancolmillo2017515;

Use DBBlancolmillo2017515;

Create table Pacientes(
	codigoPaciente int not null,
    nombresPaciente varchar(50) not null,
    apellidosPaciente varchar(50) not null,
    sexo char not null,
    fechaNacimiento date not null,
    direccionPaciente varchar(100) not null,
    telefonoPersonal varchar(8) not null,
    fechaPrimeraVisita date,
    primary key PK_codigoPaciente (codigoPaciente)
);

Create table Especialidades(
	codigoEspecialidad int not null auto_increment,
    descripcion varchar(100) not null,
    primary key PK_codigoEspecialidad (codigoEspecialidad)
);

Create table Medicamentos(
	codigoMedicamento int not null auto_increment,
    nombreMedicamento varchar(100) not null,
    primary key PK_codigoMedicamento (codigoMedicamento)
);

Create table Doctores(
	numeroColegiado int not null,
    nombresDoctor varchar(50) not null,
    apellidosDoctor varchar(50) not null,
    telefonoContacto varchar(8) not null,
    codigoEspecialidad int not null,
    primary key PK_numeroColegiado (numeroColegiado),
    constraint FK_Doctores_Especialidades foreign key (codigoEspecialidad)
		references Especialidades (codigoEspecialidad)
);

Create table Recetas(
	codigoReceta int not null auto_increment,
    fechaReceta date not null,
    numeroColegiado int not null,
    primary key PK_codigoReceta (codigoReceta),
    constraint FK_Recetas_Doctores foreign key (numeroColegiado)
		references Doctores (numeroColegiado)
);

Create table Citas(
	codigoCita int not null auto_increment,
    fechaCita date not null,
    horaCita time not null,
    tratamiento varchar(150),
    descripCondActual varchar(255) not null,
    codigoPaciente int not null,
    numeroColegiado int not null,
    primary key PK_codigoCita (codigoCita),
    constraint FK_Citas_Pacientes foreign key (codigoPaciente)
		references Pacientes (codigoPaciente),
	constraint FK_Citas_Doctores foreign key (numeroColegiado)
		references Doctores (numeroColegiado)
);

Create table DetalleReceta(
	codigoDetalleReceta int not null auto_increment,
    dosis varchar(100) not null,
    codigoReceta int not null,
    codigoMedicamento int not null,
    primary key PK_codigoDetalleReceta (codigoDetalleReceta),
    constraint FK_DetalleReceta_Recetas foreign key (codigoReceta)
		references Recetas (codigoReceta),
	constraint FK_DetalleReceta_Medicamentos foreign key (codigoMedicamento)
		references Medicamentos (codigoMedicamento)
);

-- --------------------------------------------------------------------------------------------------
-- -------------------------------- PROCEDIMIENTOS ALMACENADOS --------------------------------------

-- -------------------------------- PACIENTES --------------------------------------
-- -------------------------------- Agregar Paciente --------------------------------------
Delimiter $$
	Create procedure sp_AgregarPaciente (in codigoPaciente int, in nombresPaciente varchar (50), in apellidosPaciente varchar(50), in sexo 
		char, in fechaNacimiento date, in direccionPaciente varchar(100), telefonoPersonal varchar(8), in fechaPrimeraVisita date) 
        Begin
			Insert into Pacientes (codigoPaciente, nombresPaciente, apellidosPaciente, sexo,
			fechaNacimiento ,direccionPaciente, telefonoPersonal, fechaPrimeraVisita)
			values (codigoPaciente, nombresPaciente, apellidosPaciente, upper(sexo),
			fechaNacimiento ,direccionPaciente, telefonoPersonal, fechaPrimeraVisita);
        End$$
Delimiter ;

Call sp_AgregarPaciente(1001, 'Jose Daniel', 'Chiquin Montenegro', 'm', '2004-05-28', 'San Jose Pinula', '51693605', now());
-- -------------------------------- Listar Paciente --------------------------------------
Delimiter $$
	Create procedure sp_ListarPacientes()
		Begin 
			Select
				P.codigoPaciente,
				P.nombresPaciente,
				P.apellidosPaciente,
				P.sexo,
				P.fechaNacimiento,
				P.direccionPaciente,
				P.telefonoPersonal,
				P.fechaPrimeraVisita
            From Pacientes P;
		End$$
Delimiter ;

Call sp_ListarPacientes();
-- -------------------------------- Buscar Paciente --------------------------------------
Delimiter $$
	Create procedure sp_BuscarPaciente(in codPaciente int)
		Begin
			Select 
				P.codigoPaciente,
				P.nombresPaciente,
				P.apellidosPaciente,
				P.sexo,
				P.fechaNacimiento,
				P.direccionPaciente,
				P.telefonoPersonal,
				P.fechaPrimeraVisita
            from Pacientes P
				where codigoPaciente = codPaciente;
		End$$
Delimiter ;

Call sp_BuscarPaciente(1001);
-- -------------------------------- Eliminar Paciente --------------------------------------
Delimiter $$
	Create procedure sp_EliminarPaciente (in codPaciente int)
		Begin
			delete from Pacientes 
				where codigoPaciente = codPaciente;
		End$$
Delimiter ;

call sp_EliminarPaciente(1001);
call sp_ListarPacientes();
-- -------------------------------- Editar Paciente --------------------------------------
Delimiter $$
	Create procedure EditarPaciente(in codPaciente int, in nombPaciente varchar(50), in apPaciente varchar(50),
		in sx char, in fechaNac date, in dirPaciente varchar(100),in telPersonal varchar(8),in fechaPV date)
        Begin 
			Update Pacientes P
				set
				P.nombresPaciente = nombPaciente,
				P.apellidosPaciente = apPaciente,
				P.sexo = sx,
				P.fechaNacimiento = fechaNac,
				P.direccionPaciente = dirPaciente,
				P.telefonoPersonal = telPersonal,
				P.fechaPrimeraVisita = fechaPV
                where codigoPaciente = codPaciente;
		End$$
Delimiter ;