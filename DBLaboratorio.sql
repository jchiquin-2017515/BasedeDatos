Drop database if exists DBLaboratorio;
Create database DBLaboratorio;

Use DBLaboratorio;

Create table Lab(
	codigoLab int not null default 0,
    num1 int not null,
    num2 int not null,
    num3 int not null,
    num4 int not null,
    multiplicacion int,
    division int,
    raiz int,
    serie decimal (10,2),
    primary key PK_codigoLab (codigoLab)
);

-- ------------ INSERTAR --------------------
Insert into Lab(num1, num2, num3, num4)
	values (4,2,8,9);


-- ------------ LISTAR --------------------
Delimiter $$
	Create procedure sp_ListarLab()
		begin
			Select 
				L.num1,
                L.num2,
                L.num3,
                L.num4
                from Lab L;
		end $$
Delimiter ;

call sp_ListarLab();


-- ------------ MULTIPLICACIÓN --------------------
Delimiter $$
	Create function fn_Multi(num1 int, num2 int)returns int
		Reads sql data deterministic
        Begin
			declare cont int default 0;
			declare result int default 0;
            Repeat 
				set cont = cont +1;
                set result = result + num1;
			Until num2 <= cont
            End repeat;
            return result;
        End$$
Delimiter ;

Select fn_Multi(lab.num1,lab.num2) as Multiplicacion from Lab;


-- ------------ DIVISIÓN --------------------
Delimiter $$
    Create function fn_Division(num3 int, num1 int) returns int
        reads sql data deterministic
         begin
            declare num3 int default 0;
            declare num1 int default 0;
            declare division int;
			set num3 = num3 + 1;
            set num1 = num3;
			set division = num3 + num1;
            return division;
         end$$
Delimiter ;

select fn_Division(L.num3,L.num1) as Division From Lab L;


-- ------------ RAÍZ --------------------
Delimiter $$
    Create function fn_Raiz(num4 int) returns int
        reads sql data deterministic
         begin
            declare cont int default 0;
            declare multi int default 0;
            Repeat
                set cont = cont + 1;
                set multi = cont * cont;
		    Until(multi = num4)
            End repeat;
            return cont;
         end$$
Delimiter ;
select fn_Raiz(L.num4) as Raiz from Lab L;

-- ------------ SERIE --------------------
Delimiter $$
	Create function fn_Factorial(num1 int)returns int
		Reads sql data deterministic
        Begin
			declare cont int default 0;
            declare result int default 1;
            while (cont < num1) do 
				set cont = cont + 1;
                set result = result * cont;
			end while;
            return result;
        End$$
Delimiter ;

Delimiter $$
	Create function fn_Serie(limite int)returns decimal
		Reads sql data deterministic
        Begin
			declare resp decimal default 0;
            declare cont int default 1;
            while (cont < limite) do 
				set cont = cont + 1;
                set resp = resp + (1/fn_Factorial(cont));
			end while;
            return resp;
        End$$
Delimiter ;

Select fn_Factorial(L.num3) as Serie From Lab L;


-- ------------ EDITAR DATOS --------------------
Delimiter $$
    Create procedure sp_EditarLab(in codLab int)
         begin
            update Lab L
                set L.multiplicacion = fn_Multiplicacion(L.num1,L.num2),
                    L.division = fn_Division(L.num3,L.num1),
                    L.raiz = fn_Raiz(L.num4),
                    L.serie = fn_Serie(L.num3)
				where codigoLab = codLab;
         end$$
Delimiter ;