Drop database if exists DBEjemploFuncionesIN5AV2;
Create database DBEjemploFuncionesIN5AV2;

Use DBEjemploFuncionesIN5AV2;

Create table Datos(
	codigoDato int not null auto_increment,
    num1 int not null,
    num2 int not null,
    suma int,
    resta int,
    multiplicacion int,
    division int,
    primary key PK_codigoDato(codigoDato)
);

-- -------------- Procedimientos Almacenados------

-- -----------------Agregar ------------------
Delimiter $$
	Create procedure sp_AgregarDato(in num1 int,
		in num2 int)
        Begin
			Insert into Datos (num1, num2)
				values(num1, num2);
        End$$        
Delimiter ;

call sp_AgregarDato(3,5);

-- --------------- Listar ------------------------
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

Delimiter $$
	Create function fn_Sumatoria(valor1 int, valor2 int)
		RETURNS int
        READS SQL DATA DETERMINISTIC
        Begin
			declare result int;
            set result = valor1 + valor2;
            return result;
        End$$
Delimiter ;

Select fn_Sumatoria(4,8) as Resultado;

-- --------------- Case ------------------------
Delimiter $$
	Create function fn_Numeros(num int)returns varchar(50)
		Reads sql data deterministic
        Begin
			Case (num div 2)
				when 1 then 
					return 'Uno';
				when 2 then 
					return 'Dos';
				when 3 then
					return 'Tres';
				when 4 then 
					return 'Cuatro';
				when 5 then 
					return 'Cinco';
				else 
					return 'No es un número del rango';
            End Case;
        End$$
Delimiter ;

Select fn_Numeros(50);


-- --------------- Mayor de dos números ------------------------
Delimiter $$
	Create function fn_MayorDeDosNumeros(num1 int, num2 int)returns varchar(50)
		Reads sql data deterministic
        Begin
			Case (num1 > num2)
				when TRUE then 
					return concat('El mayor es: ', num1);
				else
					case (num2 > num1)
						when True then
							return concat('El mayor es: ', num2);
					else
						return 'Los valores son iguales';
				End Case;
            End Case;
        End$$
Delimiter ;

Select fn_MayorDeDosNumeros(22,22);

-- --------------- Caracter ------------------------

Delimiter $$
	Create function fn_Caracter(car varchar(100))returns varchar(50)
		Reads sql data deterministic
        Begin
			Case (car)
				when car then 
					return concat('El caracter es: ', car);
            End Case;
        End$$
Delimiter ;

Select fn_Caracter('M');

-- --------------- Caracter (Más sencillo) ------------------------

Delimiter $$
	Create function fn_Valor(dato varchar(1)) returns varchar (1)
		reads sql data deterministic
        Begin
			return dato;
		End$$
Delimiter ;

-- --------------- Dígito o no dígito ------------------------
Delimiter $$
	Create function fn_Digito(valor varchar(10))returns varchar(50)
		Reads sql data deterministic
        Begin
			Case (valor >=0)
				when 0 then 
					return concat('Es un dígito ', valor);
				when 1 then 
					return concat('Es un dígito ', valor);
				when 2 then 
					return concat('Es un dígito ', valor);
				when 3 then
					return concat('Es un dígito ', valor);
				when 4 then 
					return concat('Es un dígito ', valor);
				when 5 then 
					return concat('Es un dígito ', valor);
				when 6 then 
					return concat('Es un dígito ', valor);
				when 7 then 
					return concat('Es un dígito ', valor);
				when 8 then 
					return concat('Es un dígito ', valor);
				when 9 then 
					return concat('Es un dígito ', valor);
				else 
					return concat('No es un digito ', valor);
            End Case;
        End$$
Delimiter ;

Select fn_Digito(5);


Delimiter $$
	Create function fn_Digitos(valor varchar(1)) returns varchar (50)
		Reads sql data deterministic
		Begin
			if (ord(valor)>= 48) and (ord(valor)<=57) then
				return 'Es un dígito';
			else 
				return 'No es un dígito';
			End if;
		End$$
Delimiter ;

Select fn_Digitos(':');

-- --------------- Segundos ------------------------
Delimiter $$
	Create function fn_HMS(valor int)returns varchar(20)
		Reads sql data deterministic
		Begin
			declare horas int;
			declare minutos int;
			declare seg int;
			set horas = valor div 3600;
			set minutos = (valor % 3600) div 60;
			set seg = (valor % 3600) % 60;
			return concat(horas,' : ', minutos, ' : ', seg);
		End$$
Delimiter ;

Select fn_HMS(3700);

-- --------------- Decimal a Denominaciones de Quetzales y monedas ------------------------
/*Delimiter $$
	Create function fn_BilleMone(valor decimal(10,2)) Returns varchar(20)
		READS SQL DATA DETERMINISTIC
			Begin
				declare billetes int;
                declare monedas int;
                set billetes = (valor div 1000);
                set monedas = (valor % 1000) div 60;
				return concat(billetes,' . ', monedas);
            End$$

Delimiter ;

Select fn_BilleMone(3250.80);
Select truncate (valor,0) as Billetes;
Select truncate(((truncate (valor,2)-truncate(valor,0))*100),0) as Monedas;

*/

-- --------------- Que tipo de triangulo es  ------------------------

Delimiter $$
	Create function fn_Triangulo(valor1 int, valor2 int, valor3 int) returns varchar (50)
		Reads sql data deterministic
		Begin
			if (valor1 = valor2) and (valor2 = valor3) and (valor1 = valor3) then
				return concat('Es un triángulo equilatero ', valor1);
			elseif (valor1 = valor2) and (valor2 = valor3) then 
				return 'No es un dígito';
			End if;
		End$$
Delimiter ;

Select fn_Triangulo(2,2,2);

-- --------------- Ejemplos Ciclo While   ------------------------
Delimiter $$
	Create function fn_EjemploWhile (vueltas int) returns int
		reads sql data deterministic 
        Begin
			declare cont integer default 0;
            while (cont < 10) do 
				set cont = cont + 1;
            end while;
            return cont;
		End $$
Delimiter ;

Select fn_EjemploWhile(20) as Cantidad_de_Vueltas;

-- --------------- Sumatoria de los primeros 10 números  ------------------------
Delimiter $$
	Create function fn_Suma10 (vueltas int) returns int
		reads sql data deterministic 
        Begin
			declare cont int default 0;
            declare suma int default 0;
            while (cont < 10) do 
				set cont = cont + 1;
                set suma = suma + cont;
            end while;
            return suma;
		End $$
Delimiter ;

Select fn_Suma10(10) as Resultado;

-- ---------------Factorial  ------------------------
Drop function fn_factorial
Delimiter $$
	Create function fn_Factorial (valor int) returns int
		reads sql data deterministic 
        Begin
			declare cont int default 0;
            declare fact int default 1;
            while (cont < valor) do 
				set cont = cont + 1;
                set fact = fact * cont;
            end while;
            return fact;
		End $$
Delimiter ;

Select fn_Factorial(5) as Resultado;

-- --------------- Aleatorio  ------------------------
select floor(rand()*10)

Delimiter $$
	Create function fn_Aleatorio(cant int) returns varchar (20)
		reads sql data deterministic
        Begin 
			declare cont int default 0;
            declare num int default 0;
            declare resultado varchar(20);
            set resultado = '';
            repeat
				set cont = cont +1;
                set num = floor(rand()*10);
                set resultado = concat(resultado, num);
            Until (cont = cant)
            end repeat;
            return resultado;
		End $$
Delimiter ;

Select fn_Aleatorio(5) as Resultado;