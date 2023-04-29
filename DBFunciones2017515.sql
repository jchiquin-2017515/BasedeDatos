Drop database if exists DBFunciones2017515;
Create database DBFunciones2017515;

Use DBFunciones2017515;

Create table Datos (
	codigoDato int not null auto_increment,
    num1 int not null,
    num2 int not null,
    suma int,
    resta int,
    multiplicacion int,
    division int,
    primary key PK_codigoDato (codigoDato)
);

-- ----------------- PROCEDIMIENTOS ALMACENADOS -----------------

Delimiter $$
	Create procedure sp_AgregarDatos (in num1 int, in num2 int)
		Begin 
			Insert into Datos (num1, num2) values (num1, num2);
		End$$
Delimiter ;

call sp_AgregarDatos (3,5);

Delimiter $$
	Create procedure sp_ListarDatos()
		Begin 
			Select
				D.codigoDato,
				D.num1, 
				D.num2,
				D.suma, 
				D.resta, 
				D.multiplicacion, 
				D.division
			From Datos D;
        End$$
Delimiter ;

call sp_ListarDatos();

-- ----------------- FUNCIONES -----------------
-- ----------------- SUMA -----------------
Delimiter $$
	Create function fn_Suma (num1 int, num2 int) Returns int
		READS SQL DATA DETERMINISTIC
			Begin
				declare result int;
                set result = num1+num2;
				return result;
            End$$

Delimiter ;

Select fn_Suma(num1,num2) from Datos as Sumatoria;

-- ----------------- RESTA -----------------
Delimiter $$
	Create function fn_Resta (num1 int, num2 int) Returns int
		READS SQL DATA DETERMINISTIC
			Begin
				declare result int;
                set result = num1-num2;
				return result;
            End$$

Delimiter ;

Select fn_Resta(num1,num2) from Datos as Resta;

-- ----------------- MULTIPLICACIÓN -----------------
Delimiter $$
	Create function fn_Multiplicacion (num1 int, num2 int) Returns int
		READS SQL DATA DETERMINISTIC
			Begin
				declare result int;
                set result = num1*num2;
				return result;
            End$$

Delimiter ;

Select fn_Multiplicacion(num1,num2) from Datos as Multiplicacion;

-- ----------------- DIVISION -----------------
Delimiter $$
	Create function fn_Division (num1 int, num2 int) Returns int
		READS SQL DATA DETERMINISTIC
			Begin
				declare result int;
                set result = num1 div num2;
				return result;
            End$$

Delimiter ;

Select fn_Division (num1,num2) from Datos as Division;

-- ----------------- EDITAR DATOS -----------------
Delimiter $$
Create procedure sp_EditarDato (in codCat int)
	Begin
		Update Datos D
			Set suma = fn_Sumatoria (D.num1, D.num2),
				resta = fn_Resta (D.num1, D.num2),
                multiplicacion = fn_Multi (D.num1, D.num2),
                division = fn_Division (D.num1, D.num2)
					where codigoDato = codCat;
	End$$
Delimiter ;

-- ----------------- UPDATE -----------------
Alter table Datos 
	Add column num3 int not null;
    
Update Datos set num3 = 2 where codigoDato = 1;

call sp_ListarDatos();

-- ----------------- ECUACION -----------------
Delimiter $$
	Create function fn_Raiz1 (a int, b int, c int) returns decimal (10,10)
		READS SQL DATA DETERMINISTIC
			Begin
				return (-b+sqrt((b*b)-(4*a*c)))/(2*a);
            End$$
Delimiter ;

Select fn_Raiz1(3,5,2) as Raiz1;

Delimiter $$
	Create function fn_Raiz2(a int, b int, c int) returns decimal
		READS SQL DATA DETERMINISTIC
			Begin
				return (-b-sqrt((b*b)-(4*a*c)))/(2*a);
            End$$
Delimiter ;

Select fn_Raiz2(3,5,2) as Raiz2;

-- ----------------- MAYOR DE DOS NUMEROS -----------------
Delimiter $$
	Create function fn_MayorDeDos(valor1 int, valor2 int) returns varchar(50)
		reads sql data deterministic
			Begin
				if (valor1 > valor2) then
					return 'El valor 1 es mayor';
						elseif (valor2 > valor1) then
							return 'El valor 2 es mayor';
								else
									return 'Los valores son iguales';
				end if;
			End$$
Delimiter ;

Select fn_MayorDeDos (5,5) as Mayor;

-- ----------------- NUMERO POSITIVO O NEGATIVO -----------------
Delimiter $$
	Create function fn_PositivoNegativo(valor1 int) returns varchar(50)
		reads sql data deterministic
			Begin
				if (valor1>0) then
					return 'El valor es positivo';
						else 
							return 'El valor es negativo';
				end if;
			End$$
Delimiter ;

Select fn_PositivoNegativo(-4) as NumeroPositivoNgeativo;

-- ----------------- COCIENTE Y RESIDUO -----------------

Delimiter $$
	Create function fn_CociRes(valor1 int, valor2 int) returns varchar(100)
		reads sql data deterministic
			Begin
				if (valor2 = 0) then
					return 'Error';
							else
								return concat('El cociente es ', valor1 div valor2 , ' y el residuo es ', valor1 % valor2);
				end if;
			End$$
Delimiter ;

Select fn_CociRes(8,0) as CocienteResiduo;