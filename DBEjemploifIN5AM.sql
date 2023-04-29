Drop database if exists DBEjemploifIN5AM;
Create database DBEjemploifIN5AM;

Use DBEjemploifIN5AM;

Create table Personas(
	codigoPersona int not null auto_increment,
    nombrePersona varchar (100) not null,
    primerApellido varchar (100) not null,
    segundoApellido varchar (100) not null,
    edad int not null,
    primary key PK_codigoPersona (codigoPersona)
);

-- ----------------- AGREGAR PERSONA -----------------
Delimiter $$
	Create procedure sp_AgregarPersona(in nombrePersona varchar(100), in primerApellido varchar (100), in segundoApellido varchar(100), 
		in edad int)
		Begin
			Insert into Personas (nombrePersona,primerApellido,segundoApellido,edad) 
				values (nombrePersona,primerApellido,segundoApellido,edad);
		End$$
Delimiter ;

call sp_AgregarPersona ('Pedro','Armas','Chang',39);
call sp_AgregarPersona ('Luis','Cabrera','Ordoñez',18);
call sp_AgregarPersona ('Jorge','Rodriguez','Vásquez',15);
call sp_AgregarPersona ('Fernando','Martínez','Cruz',13);
call sp_AgregarPersona ('Luisa','Méndez','Ramírez',25);

Select P.nombrePersona, P.primerApellido, P.edad, if(edad >= 18, 'Mayor de edad', 'Menor de edad')
	as Estado From Personas P;