create database avanzadasa;
use avanzadasa;



CREATE TABLE departamento (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
gastos DOUBLE UNSIGNED NOT NULL
); 


CREATE TABLE empleado (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
id_departamento INT UNSIGNED,
FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);


##############################################
####### Consultas  sobre una tabla ###########
##############################################


-- 1. Lista el primer apellido de todos los empleados. 
delimiter //

 create procedure primer_apellido()
 begin
	  select apellido1
      from empleado;
 end //
 delimiter ;

call primer_apellido();

-- 2 Lista el primer apellido de los empleados eliminando los apellidos que estén
-- repetidos.
delimiter //

create procedure primer_apellido_eliminado()
 begin
     select distinct apellido1
	 from empleado;
 end //
 delimiter ;
 
 call primer_apellido_eliminado();

-- 3 Lista todas las columnas de la tabla empleado.
delimiter //
create procedure columnas_empleados()
begin 
	select * from empleado;
end //

delimiter ;

call columnas_empleados();


-- 4 Lista el nombre y los apellidos de todos los empleados.
delimiter //
create procedure list_nom_ape ()
begin
	select nombre , apellido1, apellido2
	from empleado;
end //
delimiter ;
call list_nom_ape ();

-- 5 Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado.
delimiter //
create procedure lis_id_departamento_emp ()
begin
select id_departamento
from empleado;
end //
delimiter ;
call lis_id_departamento_emp ();

-- 6 Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado, eliminando los identificadores que aparecen repetidos.
delimiter //
create procedure list_id_departamento_elim()
begin
	select  distinct  id_departamento
	from empleado;
end //
delimiter ;
call list_id_departamento_elim();
-- 7 Lista el nombre y apellidos de los empleados en una única columna.
delimiter //
create procedure lis_nom_ape()
begin 
	select concat(nombre, '' ,apellido1)
	from empleado;
end //
delimiter ;
call lis_nom_ape(); 

-- 8 Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en mayúscula.
delimiter //
create procedure list_nom_ape_mys()
begin
select upper(concat(nombre, '' ,apellido1, '' ,apellido2))
from empleado;
end //
delimiter ;
 call  list_nom_ape_mys();

-- 9 Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en minúscula.
delimiter //
create procedure list_nom_ape_minu()
begin
	select lower(concat(nombre, '' ,apellido1, '' ,apellido2))
	from empleado;
end //
delimiter ;
call list_nom_ape_minu();

-- 10. Lista el identificador de los empleados junto al nif, pero el nif deberá
-- aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la
-- otra la letra.
delimiter //
create procedure list_id_emple_nif()
begin
select id,
left (nif, length(nif)-1) as nif_digitos,
right (nif,1 ) as nif_letra
from empleado;
end //
delimiter ;
call list_id_emple_nif();
-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del
-- que dispone. Para calcular este dato tendrá que restar al valor del
-- presupuesto inicial (columna presupuesto) los gastos que se han generado
-- (columna gastos). Tenga en cuenta que en algunos casos pueden existir
-- valores negativos. Utilice un alias apropiado para la nueva columna columna
-- que está calculando.
delimiter //
create procedure lis_depa_pres_act()
begin
	select nombre,
	presupuesto - gastos as presupuesto_actual
	from 
	departamento;
end //
delimiter ;
 call lis_depa_pres_act();
 
-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual
-- ordenado de forma ascendente.
delimiter //
create procedure list_nombre_depa_presu()
begin
	select nombre,
	presupuesto - gastos as presupuesto_actual 
	from departamento
	order by  presupuesto_actual  asc;-- creado por: Helen Nataly Parga Murillo C.C. 1.001.301.103
end //
delimiter ;
call list_nombre_depa_presu();

-- 13 Lista el nombre de todos los departamentos ordenados de forma
-- ascendente.

delimiter //
create procedure list_nom_depar_asc()
begin 	
	select  nombre
	from departamento
	order by nombre asc;
end //
delimiter ;
call list_nom_depar_asc();
-- 14 Lista el nombre de todos los departamentos ordenados de forma
-- descendente.
delimiter //
create procedure list_nom_depa_decs()
begin
	select  nombre
	from departamento
	order by nombre desc;
end //
delimiter ;
call list_nom_depa_decs();

-- 15 Lista los apellidos y el nombre de todos los empleados, ordenados de forma
-- alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su
-- nombre.
delimiter //
create procedure list_ape_nom_emp()
begin
	select apellido1, apellido2, nombre
	from empleado
	order by apellido1 asc, apellido2 asc, nombre asc ;
end //
delimiter ;
call list_ape_nom_emp();
-- 16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
-- que tienen mayor presupuesto.
delimiter //
create procedure lis_nom_presu_myo()
begin
	select nombre , presupuesto
	from departamento
	order by presupuesto desc limit 3 ;
end //
delimiter // ;
call  lis_nom_presu_myo();
-- 17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
-- que tienen menor presupuesto.
delimiter //
create procedure lis_nom_presu_mno()
begin 
	select nombre , presupuesto
	from departamento
	order by presupuesto asc limit 3 ;
end //
delimiter ;

call lis_nom_presu_mno(); 

-- 18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
-- tienen mayor gasto.
delimiter //
create procedure list_nom_gastos_myo()
begin
	select nombre , gastos
	from departamento
	order by presupuesto desc limit 2 ;
end //
delimiter ;
call list_nom_gastos_myo();
-- 19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
-- tienen menor gasto. 
delimiter //
create procedure list_nomb_gasto_mnor()
begin
	select nombre , gastos
	from departamento
	order by presupuesto asc limit 2 ;
end //
delimiter ;
call list_nomb_gasto_mnor();

-- 20 Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La
-- ercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las
-- columnas de la tabla empleado.
delimiter //
create procedure list_fil_emp()
begin
select * from empleado 
limit 5 offset 2;
end //
delimiter ;
call list_fil_emp();

-- 21 Devuelve una lista con el nombre de los departamentos y el presupuesto, de
-- aquellos que tienen un presupuesto mayor o igual a 150000 euros.
delimiter //
create procedure list_nom_dep_presupuesto_myo()
begin 
	select nombre, presupuesto 
	from departamento
	where presupuesto >= 150000;
end //
delimiter ;
call list_nom_dep_presupuesto_myo();
-- 22 Devuelve una lista con el nombre de los departamentos y el gasto, de
-- aquellos que tienen menos de 5000 euros de gastos.
delimiter //
create procedure list_nomb_dep_gasto_mon()
begin
	select nombre, gastos 
	from departamento 
	where presupuesto <5000;
end //
delimiter ;
call list_nomb_dep_gasto_mon(); 

-- 23. Devuelve una lista con el nombre de los departamentos y el presupuesto, de
-- aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin
-- utilizar el operador BETWEEN.
delimiter //
create procedure list_nom_dep_pres()
begin
	 select nombre, presupuesto 
	 from departamento
	 where presupuesto >= 100000 and presupuesto <= 200000;
end //
delimiter ; 

call list_nom_dep_pres();
 -- 24 Devuelve una lista con el nombre de los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
delimiter //
create procedure lis_nom_dep_presub() 
begin
	 select nombre, presupuesto 
	 from departamento-- creado por: Helen Nataly Parga Murillo C.C. 1.001.301.103
	 where presupuesto < 100000 or presupuesto > 200000;
end //
delimiter ;

call lis_nom_dep_presub() ;

 
 
 -- 25 Devuelve una lista con el nombre de los departamentos que tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
delimiter //
create procedure lis_nombr_depa_presucb()
begin
	select  nombre , presupuesto
    from departamento 
    where presupuesto between 100000 and 200000;
end //
delimiter ;
call lis_nombr_depa_presucb();
 
 -- 26 Devuelve una lista con el nombre de los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.

delimiter //
create procedure list_nom_departa_nopresu_bt()
begin 
	select nombre , presupuesto
    from departamento
    where presupuesto not between 100000 and 200000;
end //
delimiter ;
call list_nom_departa_nopresu_bt();

-- 27. Devuelve una lista con el nombre de los departamentos, gastos y
-- presupuesto, de aquellos departamentos donde los gastos sean mayores
-- que el presupuesto del que disponen.
 delimiter //
 create procedure lis_nom_dep_gasto_pres_myo()
 begin
	select nombre , gastos , presupuesto 
    from departamento
    where gastos > presupuesto ;
 end //
 delimiter ;
 call lis_nom_dep_gasto_pres_myo();
 
 -- 28 28. Devuelve una lista con el nombre de los departamentos, gastos y
-- presupuesto, de aquellos departamentos donde los gastos sean menores
-- que el presupuesto del que disponen.

delimiter //
create procedure lis_nom_dep_gas_mno()
begin
	select nombre , gastos , presupuesto
    from departamento
    where gastos < presupuesto;
end //
delimiter ;

call lis_nom_dep_gas_mno();
-- 29. Devuelve una lista con el nombre de los departamentos, gastos y
-- presupuesto, de aquellos departamentos donde los gastos sean iguales al
-- presupuesto del que disponen.

delimiter //
create procedure lis_nom_dep_gast_pres_igu()
begin
	select nombre , gastos , presupuesto
    from departamento
    where gastos = presupuesto;
end //
delimiter ;
call lis_nom_dep_gast_pres_igu();

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.

delimiter //
create procedure list_tbl_emple_apenull()
begin
	select * from empleado
    where apellido2 is null;
end //
delimiter ;
call list_tbl_emple_apenull();

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.

delimiter //
create procedure lis_datos_empl_null()
begin
	select * from empleado 
    where apellido2 is not null;
end //
delimiter ;

call lis_datos_empl_null();

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López
delimiter //
create procedure lis_datos_emp_lopez()
begin 
	select * from empleado 
	where apellido2 =  'López';
end // 
delimiter ;
call lis_datos_emp_lopez();

-- 33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
delimiter //
create procedure lis_datos_emp_diaz_sin_in()
begin 
	select * from empleado 
	where apellido2 =  'Díaz' OR apellido2 = 'Moreno';
end // 
delimiter ;
call lis_datos_emp_diaz_sin_in();
 -- 34. Lista todos los datos de los empleados cuyo segundo apellido
-- sea Díaz o Moreno. Utilizando el operador IN.
delimiter //
create procedure lis_datos_emp_DoM_con_in()
begin 
	select * from empleado 
	where (apellido2 =  'Díaz') IN (apellido2 = 'Moreno');
end // 
delimiter ;
call lis_datos_emp_diaz_sin_in();
-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el
-- departamento 3.
delimiter //
create procedure lis_datos_emp_DoM_con_in()
begin 
	select * from empleado 
	where (apellido2 =  'Díaz') IN (apellido2 = 'Moreno');
end // 
delimiter ;
call lis_datos_emp_diaz_sin_in();

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los
-- departamentos 2, 4 o 5.
delimiter //
create procedure lis_nomb_apell_nif_245()
begin 
	select nombre , apellido1 , apellido2 , nif, id_departamento
    from empleado
	where id_departamento in (2, 4 ,5);
end // 
delimiter ;
call  lis_nomb_apell_nif_245();
drop procedure lis_nomb_apell_nif_245;

##############################################################
####### Consultas multitabla (Composición interna) ###########
############################################################## 
-- 1. Devuelve un listado con los empleados y los datos de los departamentos
-- donde trabaja cada uno.
delimiter //
create procedure list_emp_departa()
begin
	SELECT * from empleado e  
	inner JOIN departamento d ON d.id = e.id_departamento;
end //
delimiter ;
call list_emp_departa();

-- 2. Devuelve un listado con los empleados y los datos de los departamentos
-- donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre
-- del departamento (en orden alfabético) y en segundo lugar por los apellidos
-- y el nombre de los empleados.
DELIMITER //

CREATE PROCEDURE list_emp_departa_ord()
BEGIN
    SELECT *
    FROM empleado e
    INNER JOIN departamento d ON d.id = e.id_departamento
    ORDER BY d.nombre , e.apellido1 , e.apellido2 , e.apellido1 ASC;
END //

DELIMITER ;

call list_emp_departa_ord();

drop PROCEDURE list_emp_departa_ord;

-- 3. Devuelve un listado con el identificador y el nombre del departamento,
--    solamente de aquellos departamentos que tienen empleados.

delimiter //
create procedure list_id_nom_dep_emp()
begin 
	SELECT distinct d.id, d.nombre
	FROM departamento d
	INNER JOIN empleado e ON d.id = e.id_departamento
    where e.id_departamento is not null;
end //
delimiter ;
call list_id_nom_dep_emp();

drop  procedure list_id_nom_dep_emp

-- creado por: Helen Nataly Parga Murillo C.C. 1.001.301.103
