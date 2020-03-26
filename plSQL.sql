/*
- visualizacion por pantalla
- variables
*/
SET SERVEROUTPUT ON

DECLARE
    name       VARCHAR2(100);
    lastname   VARCHAR2(100);
BEGIN
    name := 'ANDRES';
    lastname := 'CONNORS';
    dbms_output.put_line(name);
    dbms_output.put_line(lastname);
    dbms_output.put_line(name
                         || ' '
                         || lastname);
END;


/*
- costantes - NULL
*/

SET SERVEROUTPUT ON

DECLARE
    x           CONSTANT NUMBER := 10;
    z           NUMBER NOT NULL := 20;
    resultado   NUMBER;
BEGIN
    z := 30;
    resultado := x + z;
    dbms_output.put_line(x);
    dbms_output.put_line(z);
    dbms_output.put_line(resultado);
END;


/*
- variables bool
*/

SET SERVEROUTPUT ON

DECLARE
    b1 BOOLEAN;
BEGIN
    b1 := true;
    b1 := false;
    b1 := NULL;
END;



/*
- variables %TYPE
*/

SET SERVEROUTPUT ON

DECLARE
    x       NUMBER;
    z       x%TYPE;
    emple   employees.salary%TYPE;
BEGIN
    emple := 100;
END;


/*
Operadores mas habituales

+ suma
- resta
/ division
* multiplicacion
** exponente
|| concatenar


*/

SET SERVEROUTPUT ON

DECLARE
    x   NUMBER := 10;
    z   NUMBER := 10;
    a   VARCHAR2(100) := 'EXAMPLE';
    d   DATE := '10-01-1990';
BEGIN
    dbms_output.put_line(x * z);
    dbms_output.put_line(a
                         || ' '
                         || d);
END;


/*
bloque anidados
*/

SET SERVEROUTPUT ON

BEGIN
    dbms_output.put_line('En el primer bloque');
    DECLARE
        x NUMBER := 10;
    BEGIN
        dbms_output.put_line(x);
    END;
END;


/*
bloque anidados ambitos de las variables
*/

SET SERVEROUTPUT ON

DECLARE
    x   NUMBER := 20; -- variable global
    z   NUMBER := 30;
BEGIN
    dbms_output.put_line('X:=' || x);
    DECLARE
        x NUMBER := 10; -- variable local al bloque
    BEGIN
        dbms_output.put_line('x:=' || x);
        dbms_output.put_line('z:=' || z);
    END;

END;

/*
funciones plSQL
nota:  funciones de agrupamento no estan permitidas AVG - COUTN - decode

*/

SET SERVEROUTPUT ON

DECLARE
    x       VARCHAR2(50);
    mayus   VARCHAR2(50);
    fecha   DATE;
    z       NUMBER := 109.80;
BEGIN
    x := 'Ejemplo';
    mayus := upper(x);
    fecha := sysdate;
    dbms_output.put_line(substr(x, 1, 3));
    dbms_output.put_line(mayus);
    dbms_output.put_line(fecha);
    dbms_output.put_line(floor(z));
END;


/*
estructuras de control
if
*/

SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 20;
BEGIN
    IF x = 10 THEN
        dbms_output.put_line('X:=10');
    ELSE
        dbms_output.put_line('X:=otro valor');
    END IF;
END;


/*
estructuras de control
else if
*/

SET SERVEROUTPUT ON

DECLARE
    sales   NUMBER := 51000;
    bonus   NUMBER := 0;
BEGIN
    IF sales > 50000 THEN
        bonus := 1500;
    ELSIF sales > 35000 THEN
        bonus := 500;
    ELSE
        bonus := 100;
    END IF;

    dbms_output.put_line('Sales = '
                         || sales
                         || ', bonus = '
                         || bonus
                         || '.');

END;



/*
estructura de control 
case
string y char
*/

SET SERVEROUTPUT ON

DECLARE
    v1 CHAR(1);
BEGIN
    v1 := 'B';
    CASE v1
        WHEN 'A' THEN
            dbms_output.put_line('Excelente');
        WHEN 'B' THEN
            dbms_output.put_line('Very Good');
        WHEN 'C' THEN
            dbms_output.put_line('Good');
        WHEN 'D' THEN
            dbms_output.put_line('Fair');
        WHEN 'F' THEN
            dbms_output.put_line('Poor');
        ELSE
            dbms_output.put_line('El valor no se reconoce');
    END CASE;

END;


/*
estructura de control 
searCHED case

*/

SET SERVEROUTPUT ON

DECLARE
    bonus NUMBER;
BEGIN
    bonus := 100;
    CASE
        WHEN bonus > 500 THEN
            dbms_output.put_line('Excelente');
        WHEN bonus <= 500 AND bonus > 250 THEN
            dbms_output.put_line('Very Good');
        WHEN bonus <= 250 AND bonus > 100 THEN
            dbms_output.put_line('Good');
        ELSE
            dbms_output.put_line('PORR!!');
    END CASE;

END;

/*
estructura de control 
loop

*/

SET SERVEROUTPUT ON

DECLARE
    x     NUMBER := 1;
    aux   NUMBER;
BEGIN
    LOOP
        dbms_output.put_line(x);
        x := x + 1;
        /*IF x = 11 THEN
            EXIT;
        END IF;*/
        EXIT WHEN x = 11;
    END LOOP;
END;


/*
estructura de control 
loop anidados

*/

SET SERVEROUTPUT ON

DECLARE
    s   PLS_INTEGER := 0;
    i   PLS_INTEGER := 0;
    j   PLS_INTEGER;
BEGIN
    << parent >> LOOP
        i := i + 1;
        j := 10;
        dbms_output.put_line('Parent:' || i);
        << child >> LOOP
            EXIT parent WHEN ( i > 3 );
            dbms_output.put_line('Child:' || j);
            j := j + 1;
            EXIT child WHEN ( j > 50 );
        END LOOP child;

    END LOOP parent;
END;


/*
estructura de control 
continue

*/

SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 0;
BEGIN
    LOOP --cada vez que se llega a un continue salta a esta linea
        dbms_output.put_line('LOOP: x = ' || to_char(x));
        x := x + 1;
        /*IF x < 3 THEN
            CONTINUE;
        END IF;*/
        CONTINUE WHEN x < 3;
        dbms_output.put_line('Despues del continue: x = ' || to_char(x));
        EXIT WHEN x = 5;
    END LOOP;
END;





/*
estructura de control 
for

*/

SET SERVEROUTPUT ON

BEGIN
    FOR i IN 1..10 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;

SET SERVEROUTPUT ON

BEGIN
    FOR i IN REVERSE 1..10 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;

SET SERVEROUTPUT ON

BEGIN
    FOR i IN REVERSE 5..15 LOOP
        dbms_output.put_line(i);
        EXIT WHEN i = 10;
    END LOOP;
END;


/*
estructura de control 
while

*/

SET SERVEROUTPUT ON

DECLARE
    done   BOOLEAN := false;
    x      NUMBER := 0;
BEGIN
    WHILE x < 10 LOOP
        dbms_output.put_line(x);
        x := x + 1;
        EXIT WHEN x = 5;
    END LOOP;

    WHILE done LOOP
        dbms_output.put_line('No imprimas esto.');
        done := true;
    END LOOP;
    WHILE NOT done LOOP     -- !done == not done
        dbms_output.put_line('He pasado por aqui.');
        done := true;
    END LOOP;

END;


/*
estructura de control 
GOTO

*/

SET SERVEROUTPUT ON

DECLARE
    p   VARCHAR2(30);
    n   PLS_INTEGER := 5;
BEGIN
    FOR j IN 2..round(sqrt(n)) LOOP IF n MOD j = 0 THEN
        p := ' no es un numero primo';
        GOTO salto;
    END IF;
    END LOOP;

    p := 'Es un numero primo';
    << salto >> dbms_output.put_line(to_char(n)
                                     || ' '
                                     || p);

END;



/*
Usar SQL en PL/SQL
*/

SET SERVEROUTPUT ON

DECLARE
    salario   NUMBER;
    nombre    employees.first_name%TYPE;
BEGIN
    SELECT -- solo puede devolver una fila 
        salary,
        first_name
    INTO
        salario,
        nombre
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(salario
                         || ' '
                         || nombre);
END;

/*
Usar SQL en PL/SQL
ROWTYPE
*/

SET SERVEROUTPUT ON

DECLARE
    empleado employees%rowtype;
BEGIN
    SELECT -- solo puede devolver una fila 
        *
    INTO empleado
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(empleado.salary
                         || ' '
                         || empleado.first_name);
END;


/*
Usar SQL en PL/SQL
insert
*/

SET SERVEROUTPUT ON

DECLARE
    col1 test.c1%TYPE;
BEGIN
    col1 := 10;
    INSERT INTO test (
        c1,
        c2
    ) VALUES (
        col1,
        'AAAAAAAAAA'
    );

    COMMIT;
END;


/*
Usar SQL en PL/SQL
update
*/

SET SERVEROUTPUT ON

DECLARE
    t test.c1%TYPE;
BEGIN
    t := 10;
    UPDATE test
    SET
        c2 = 'andres'
    WHERE
        c1 = t;

    COMMIT;
END;


/*
Usar SQL en PL/SQL
delete
*/

SET SERVEROUTPUT ON

DECLARE
    t test.c1%TYPE;
BEGIN
    t := 10;
    DELETE test
    WHERE
        c1 = t;

    COMMIT;
END;


/*
Excepciones
-- Excepciones de oracle
-- Excepciones de usuario(yo puedo crear excepciones) 
*/

SET SERVEROUTPUT ON

DECLARE
    empleado employees%rowtype;
BEGIN
    SELECT -- solo puede devolver una fila 
        *
    INTO empleado
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(empleado.first_name);
EXCEPTION
-- NO_DATA_FOUND  ORA-01403
-- TOO_MANY_ROWS
--ZERO_DIVIDE
--DUP_VAL_ON_INDEX
    WHEN no_data_found THEN
        dbms_output.put_line('ERROR,EMPLEADO INEXISTENTE ');
    WHEN too_many_rows THEN
        dbms_output.put_line('ERROR,DEMASIADOS EMPLEADOS ');
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR,INDEFINIDO ');
END;



/*
Excepciones
crear mi propia excepcion
*/

SET SERVEROUTPUT ON

DECLARE
    mi_excep EXCEPTION;
    PRAGMA exception_init ( mi_excep, -937 );
    v1   NUMBER;
    v2   NUMBER;
BEGIN
    SELECT
        employee_id,
        SUM(salary)
    INTO
        v1,
        v2
    FROM
        employees;

    dbms_output.put_line(v1);
EXCEPTION
    WHEN mi_excep THEN
        dbms_output.put_line('ERROR,FUNCION DE GRUPO INCORRECTA ');
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR,INDEFINIDO ');
END;



/*
EXCEPTION
sqlcode - sqlerrm

*/

SET SERVEROUTPUT ON

DECLARE
    empl      employees%rowtype;
    code      NUMBER;
    message   VARCHAR2(100);
BEGIN
    SELECT
        *
    INTO empl
    FROM
        employees;

    dbms_output.put_line(empl.salary);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
        code := sqlcode;
        message := sqlerrm;
        INSERT INTO errors VALUES (
            code,
            message
        );

        COMMIT;
END;



/*
EXCEPTION


*/

SET SERVEROUTPUT ON

DECLARE
    reg           regions%rowtype;
    reg_control   regions.region_id%TYPE;
BEGIN
    reg.region_id := 102;
    reg.region_name := 'AFRICA1';
    SELECT
        region_id
    INTO reg_control
    FROM
        regions
    WHERE
        region_id = reg.region_id;

    dbms_output.put_line('La region ya existe');
EXCEPTION
    WHEN no_data_found THEN
        INSERT INTO regions VALUES (
            reg.region_id,
            reg.region_name
        );

        COMMIT;
END;



/*
EXCEPTION
- personalizadas por el desarrollador 

*/

SET SERVEROUTPUT ON

DECLARE
    reg_max EXCEPTION;
    regn   NUMBER;
    regt   VARCHAR2(200);
BEGIN
    regn := 99;
    regt := 'ASIA';
    IF regn > 100 THEN
        RAISE reg_max;
    ELSE
        INSERT INTO regions VALUES (
            regn,
            regt
        );

        COMMIT;
    END IF;

EXCEPTION
    WHEN reg_max THEN
        dbms_output.put_line('La region no puede ser mayor a 100');
    WHEN OTHERS THEN
        dbms_output.put_line('Error indefinido');
END;



/*
EXCEPTION
- ambitos de las EXCEPTION 

*/

SET SERVEROUTPUT ON

DECLARE
    regn   NUMBER;
    regt   VARCHAR2(200);
BEGIN
    regn := 101;
    regt := 'ASIA';
    DECLARE
        reg_max EXCEPTION;
    BEGIN
        IF regn > 100 THEN
            RAISE reg_max;
        ELSE
            INSERT INTO regions VALUES (
                regn,
                regt
            );

            COMMIT;
        END IF;
    EXCEPTION
        WHEN reg_max THEN
            dbms_output.put_line('La region no puede ser mayor de 100. BLOQUE HIJO');
    END;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error indefinido');
END;

/*
finalizar la aplicacion debido a un error 
*/

SET SERVEROUTPUT ON

DECLARE
    regn   NUMBER;
    regt   VARCHAR2(200);
BEGIN
    regn := 101;
    regt := 'ASIA';
    IF regn > 100 THEN 
 -- el codigo del error debe estar entre -20000 y -2099
        raise_application_error(-20001, 'La ide no puede ser mayor que 100');
    ELSE
        INSERT INTO regions VALUES (
            regn,
            regt
        );

        COMMIT;
    END IF;

END;


/*
colecciones y tipos compuestos 
-variable que  pueden alvergar multiples valores
plrecords
*/

SET SERVEROUTPUT ON

DECLARE
    TYPE empleado IS RECORD (
        nombre    VARCHAR2(100),
        salario   NUMBER,
        fecha     employees.hire_date%TYPE,
        datos     employees%rowtype
    );
    emple1   empleado;
    emple2   empleado;
BEGIN
    SELECT
        *
    INTO emple1.datos
    FROM
        employees
    WHERE
        employee_id = 100;

    emple1.nombre := emple1.datos.first_name
                     || ' '
                     || emple1.datos.last_name;

    emple1.salario := emple1.datos.salary * 0.80;
    emple1.fecha := emple1.datos.hire_date;
    dbms_output.put_line(emple1.nombre);
    dbms_output.put_line(emple1.salario);
    dbms_output.put_line(emple1.fecha);
    dbms_output.put_line(emple1.datos.first_name);
    emple2 := emple1;
    dbms_output.put_line(emple2.nombre
                         || ' '
                         || 'emple2');
END;



/*
colecciones y tipos compuestos 
insert y update records
*/

CREATE TABLE regiones
    AS
        SELECT
            *
        FROM
            regions
        WHERE
            region_id = 0;

SET SERVEROUTPUT ON

DECLARE
    reg1 regions%rowtype;
BEGIN
    SELECT
        *
    INTO reg1
    FROM
        regions
    WHERE
        region_id = 1;

    INSERT INTO regiones VALUES reg1;

END;

SET SERVEROUTPUT ON

DECLARE
    reg1 regions%rowtype;
BEGIN
    reg1.region_id := 1;
    reg1.region_name := 'Australia';
    UPDATE regiones
    SET
        row = reg1
    WHERE
        region_id = 1;

    INSERT INTO regiones VALUES reg1;

END;



/*
colecciones y tipos compuestos 
colecciones almacenan objetos del mismo tipo 
(CLAVE , VALOR)
*/

SET SERVEROUTPUT ON

DECLARE
    TYPE departamentos IS
        TABLE OF departments.department_name%TYPE INDEX BY PLS_INTEGER;
    TYPE empleados IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    depts    departamentos;
    emples   empleados;
BEGIN
    depts(1) := 'INFORMATICA';
    depts(2) := 'RRHH';
    dbms_output.put_line(depts(1));
    dbms_output.put_line(depts(2));
    dbms_output.put_line(depts.last);
    dbms_output.put_line(depts.first);
    IF depts.EXISTS(3) THEN
        dbms_output.put_line(depts(3));
    ELSE
        dbms_output.put_line('ESE VALOR NO EXISTE');
    END IF;

--tipo compuesto

    SELECT
        *
    INTO
        emples
    (1)
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(emples(1).first_name);
END;


/*
colecciones y tipos compuestos 
select multiples
*/

SET SERVEROUTPUT ON

DECLARE
    TYPE departamentos IS
        TABLE OF departments%rowtype INDEX BY PLS_INTEGER;
    depts departamentos;
BEGIN
    FOR i IN 1..10 LOOP SELECT
                            *
                        INTO
                            depts
                        (i)
                        FROM
                            departments
                        WHERE
                            department_id = i * 10;

    END LOOP;

    FOR i IN depts.first..depts.last LOOP dbms_output.put_line(depts(i).department_name);
    END LOOP;

END;



/*
cursores 
--almacenar filas de base de datos
-- cursores inplicitos y explicitos
atributos para los cursores
SQL%ISOPEN
SQL%FOUND
SQL%NOTFOUND
SQL%ROWCOUNT
*/

--INSERT INTO TEST values(1,'hola');

SET SERVEROUTPUT ON

BEGIN
    UPDATE test
    SET
        c2 = 'PPPPP'
    WHERE
        c1 = 100;

    dbms_output.put_line(SQL%rowcount);
    IF SQL%found THEN
        dbms_output.put_line('Encontrado');
    END IF;
    IF SQL%notfound THEN
        dbms_output.put_line('No encontrado');
    END IF;
END;

/*
cursores 

-- cursores inplicitos y explicitos
CURSOR

*/

SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        regions;

    v1 regions%rowtype;
BEGIN
    OPEN c1;
    FETCH c1 INTO v1;
    dbms_output.put_line(v1.region_name);
    FETCH c1 INTO v1;
    dbms_output.put_line(v1.region_name);
    CLOSE c1;
END;


/*
cursores 

-- cursores inplicitos y explicitos
CURSOR - recorriendo un cursor con un loop

*/

SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        regions;

    v1 regions%rowtype;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO v1;
        EXIT WHEN c1%notfound;
        dbms_output.put_line(v1.region_name);
    END LOOP;

    CLOSE c1;
END;


/*
cursores 

-- cursores inplicitos y explicitos
CURSOR - recorriendo un cursor con un for

*/

SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        regions;

    v1 regions%rowtype;
BEGIN
    ----------------
    FOR i IN c1 LOOP
        dbms_output.put_line(i.region_name);
    END LOOP;
END;


/*
cursores 

-- cursores inplicitos y explicitos
CURSOR - recorriendo un cursor con un for y una subconsulta 

*/

SET SERVEROUTPUT ON

BEGIN
    ----------------
    FOR i IN (
        SELECT
            *
        FROM
            regions
    ) LOOP
        dbms_output.put_line(i.region_name);
    END LOOP;
END;


/*
cursores 

-- cursores inplicitos y explicitos
CURSOR - con parametros

*/

SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 (
        sal NUMBER
    ) IS
    SELECT
        *
    FROM
        employees
    WHERE
        salary > sal;

    empl employees%rowtype;
BEGIN
    OPEN c1(8000);
    LOOP
        FETCH c1 INTO empl;
        EXIT WHEN c1%notfound;
        dbms_output.put_line(empl.first_name
                             || ' '
                             || empl.salary);
    END LOOP;

    dbms_output.put_line('He encontrado '
                         || c1%rowcount
                         || ' empleados');
    CLOSE c1;
END;

/*
cursor update y deletes
*/

SET SERVEROUTPUT ON

DECLARE
    empl employees%rowtype;
    CURSOR cur IS
    SELECT
        *
    FROM
        employees
    FOR UPDATE;

BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO empl;
        EXIT WHEN cur%notfound;
        IF empl.commission_pct IS NOT NULL THEN
            UPDATE employees
            SET
                salary = salary * 1.10
            WHERE
                CURRENT OF cur;

        ELSE
            UPDATE employees
            SET
                salary = salary * 1.15
            WHERE
                CURRENT OF cur;

        END IF;

    END LOOP;

    CLOSE cur;
END;


/*
bloques anonimos / prodedimientos y funciones
--procedures
--functions
--packages
--triggers

*/

CREATE PROCEDURE P1
IS
x NUMBER:=10;
BEGIN
DBMS_OUTPUT.PUT_LINE(x);
  
END;


SET SERVEROUTPUT ON
BEGIN
p1;
END;


EXECUTE p1;


/*
buscar nuestros objetos de la base de datos
--picardia
*/

select * from USER_OBjects
where object_type='PROCEDURE';

select object_TYpe,count(*) FROm USER_OBjects
group by  object_type;

SELECT * FROM USER_SOURCE
WHERE NAME='P1';

SELECT TEXT FROM USER_SOURCE
WHERE NAME='P1';


/*
parametros
*/

create or replace procedure CALC_TAX(empl in employees.EMPLOYEE_ID%type,t1 in number)
is
tax NUMBER:=0;
sal NUMBER:=0;
BEGIN
IF t1 >0 OR t1 < 60 THEN
   RAISE_application_error(-20000,'El porcentaje debe estar entre 0 y 60');
   end if;
select salary INTO sal FROM employees where EMPLOYEE_ID=empl;
tax:= sal*t1/100;
DBMS_OUTPUT.PUT_LINE('Salary:'||sal);
DBMS_OUTPUT.PUT_LINE('Tax:'||tax);
EXCEPTION
WHEN no_data_found then
DBMS_OUTPUT.PUT_LINE('No existe el empleado');
END;


EXECUTE CALC_TAX(1000,20);


set SERVEROUTPUT ON
DECLARE
a NUMBER;
b NUMBER;
begin

a:=100;
b:=500;
calc_tax(a,b);
end;


/*
parametros de salida
*/

create or replace procedure CALC_TAX_OUT(empl in employees.EMPLOYEE_ID%type,t1 in number,r1 OUT NUMBER)
is

sal NUMBER:=0;
BEGIN
IF t1 < 0 OR t1 > 60 THEN
   RAISE_application_error(-20000,'El porcentaje debe estar entre 0 y 60');
   end if;
select salary INTO sal FROM employees where EMPLOYEE_ID=empl;
r1:= sal*t1/100;
DBMS_OUTPUT.PUT_LINE('Salary:'||sal);

EXCEPTION
WHEN no_data_found then
DBMS_OUTPUT.PUT_LINE('No existe el empleado');
END;

set SERVEROUTPUT ON
DECLARE
a NUMBER;
b NUMBER;
r NUMBER;
begin

a:=100;
b:=5;
CALC_TAX_OUT(a,b,r);
DBMS_OUTPUT.PUT_LINE('R:'||r);
end;


/*
parametros de salida y entrada
*/

create or replace procedure CALC_TAX_OUT_IN(empl in employees.EMPLOYEE_ID%type,t1 in out number)
is

sal NUMBER:=0;
BEGIN
IF t1 < 0 OR t1 > 60 THEN
   RAISE_application_error(-20000,'El porcentaje debe estar entre 0 y 60');
   end if;
select salary INTO sal FROM employees where EMPLOYEE_ID=empl;
DBMS_OUTPUT.PUT_LINE('T1:'||t1);
t1:= sal*t1/100;
DBMS_OUTPUT.PUT_LINE('Salary:'||sal);

EXCEPTION
WHEN no_data_found then
DBMS_OUTPUT.PUT_LINE('No existe el empleado');
END;


set SERVEROUTPUT ON
DECLARE
a NUMBER;
b NUMBER;

begin

a:=100;
b:=5;
CALC_TAX_OUT_IN(a,b);
DBMS_OUTPUT.PUT_LINE('B:'||b);
end;


/*
funcion plsql


*/


create or replace function CALC_TAX_F(empl in employees.EMPLOYEE_ID%type,t1 in out number)
return number
is
tax number:=0;
sal NUMBER:=0;
BEGIN
IF t1 < 0 OR t1 > 60 THEN
   RAISE_application_error(-20000,'El porcentaje debe estar entre 0 y 60');
   end if;
select salary INTO sal FROM employees where EMPLOYEE_ID=empl;
DBMS_OUTPUT.PUT_LINE('T1:'||t1);
tax:=sal*t1/100;
return tax;
DBMS_OUTPUT.PUT_LINE('Salary:'||sal);

EXCEPTION
WHEN no_data_found then
DBMS_OUTPUT.PUT_LINE('No existe el empleado');
END;



set SERVEROUTPUT ON
DECLARE
a NUMBER;
b NUMBER;
r NUMBER;
begin

a:=100;
b:=5;
r:=CALC_TAX_F(a,b);
DBMS_OUTPUT.PUT_LINE('R:'||r);
end;


/*
usar un funcion en una sentencia de sql
solo acepta
--IN

*/

create or replace function CALC_TAX_F_DOS(empl in employees.EMPLOYEE_ID%type,t1 in number)
return number
is
tax number:=0;
sal NUMBER:=0;
BEGIN
IF t1 < 0 OR t1 > 60 THEN
   RAISE_application_error(-20000,'El porcentaje debe estar entre 0 y 60');
   end if;
select salary INTO sal FROM employees where EMPLOYEE_ID=empl;
DBMS_OUTPUT.PUT_LINE('T1:'||t1);
tax:=sal*t1/100;
return tax;
DBMS_OUTPUT.PUT_LINE('Salary:'||sal);

EXCEPTION
WHEN no_data_found then
DBMS_OUTPUT.PUT_LINE('No existe el empleado');
END;


select first_name,salary,CALC_TAX_F_DOS(EMPLOYEE_ID,18) FROM employees;



/*
paquetes
*/



create or replace package PACK1
is
v1 NUMBER;
v2 VARCHAR2(100);
end;

SET SERVEROUTPUT ON
BEGIN
pack1.v1:=100;
DBMS_OUTPUT.put_line(pack1.v1);
END;


/*
crear el cuerpo del paquete

*/
create or replace PACKAGE PACK2
IS

procedure convert (NAME VARCHAR2,CONVERSION_TYPE CHAR);
END;


CREATE OR REPLACE PACKAGE BODY PACK2
IS

FUNCTION UP(NAME VARCHAR2)
RETURN VARCHAR2 
IS
BEGIN
    RETURN UPPER(NAME);
END UP;

FUNCTION DO(NAME VARCHAR2)
RETURN VARCHAR2 
IS
BEGIN
    RETURN LOWER(NAME);
END DO;

PROCEDURE CONVERT (NAME VARCHAR2, CONVERSION_TYPE CHAR)
 IS
 BEGIN
    IF CONVERSION_TYPE='U' THEN
       DBMS_OUTPUT.PUT_LINE(UP(NAME));
    ELSIF CONVERSION_TYPE='L' THEN
       DBMS_OUTPUT.PUT_LINE(DO(NAME));
    ELSE
       DBMS_OUTPUT.PUT_LINE('EL PARAMETRO DEBE SER U o L');
   END IF;
END CONVERT;

END PACK2;



SET SERVEROUTPUT ON
BEGIN
pack2.convert('AAAA','L');
END;

/*
crear funciones en un paquete

*/

create or replace PACKAGE PACK3
IS

function convert (NAME VARCHAR2,CONVERSION_TYPE CHAR) return VARCHAR2;
END;


CREATE OR REPLACE PACKAGE BODY PACK3
IS

FUNCTION UP(NAME VARCHAR2)
RETURN VARCHAR2 
IS
BEGIN
    RETURN UPPER(NAME);
END UP;

FUNCTION DO(NAME VARCHAR2)
RETURN VARCHAR2 
IS
BEGIN
    RETURN LOWER(NAME);
END DO;

function CONVERT (NAME VARCHAR2, CONVERSION_TYPE CHAR) RETURN VARCHAR2
 IS
 BEGIN
    IF CONVERSION_TYPE='U' THEN
       RETURN(UP(NAME));
    ELSIF CONVERSION_TYPE='L' THEN
       RETURN(DO(NAME));
    ELSE
       DBMS_OUTPUT.PUT_LINE('EL PARAMETRO DEBE SER U o L');
   END IF;
END CONVERT;

END PACK3;


SET SERVEROUTPUT ON
DECLARE
v1 VARCHAR2(100);
BEGIN
v1:= pack3.convert('AAAA','L');
DBMS_OUTPUT.put_line(v1);
END;


select first_name,pack3.convert(first_name,'U') from employees;


/*
sobrecarga de procedimientos


*/


CREATE OR REPLACE 
PACKAGE PACK4 AS 

 FUNCTION COUNT_EMPLOYEES(ID NUMber) return number;
 FUNCTION COUNT_EMPLOYEES(ID VARCHAR2) return number;

END PACK4;

CREATE OR REPLACE
PACKAGE BODY PACK4 AS

  FUNCTION COUNT_EMPLOYEES(ID NUMber) return number AS
  x NUMBER;
  BEGIN
    SELECT COUNT(*)INTO x FROM employees where department_id=ID;
    RETURN x;
  END COUNT_EMPLOYEES;

  FUNCTION COUNT_EMPLOYEES(ID VARCHAR2) return number AS
  x number;
  BEGIN
    SELECT COUNT(*)INTO x FROM employees a,departments b where b.department_name=ID
    AND a.department_id=b.department_id;
    RETURN x;
  END COUNT_EMPLOYEES;

END PACK4;


BEGIN
DBMS_OUTPUT.PUT_LINE(pack4.count_employees(50));
END;

/*cargar archivos desde un txt u otra fuente desde y hacia la base de datos*/
GRANT CREATE ANY DIRECTORY TO HR;
create or replace directory EXERCISES as 'D:\EXERCISES';
desc utl_file;


GRANT EXECUTE ON SYS.UTL_FILE TO HR;


SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE read_file IS

string VARCHAR2(32767);
Vfile UTL_FILE.FILE_TYPE;
BEGIN
-- Open FILE
Vfile:= UTL_FILE.FOPEN('EXERCISES','f1.txt','R');
loop
BEGIN
UTL_FILE.GET_LINE(Vfile,string);
DBMS_OUTPUT.put_line(string);
EXCEPTION WHEN NO_DATA_FOUND THEN EXIT;
end;
end loop;

UTL_FILE.FCLOSE(Vfile);

END;

/*
trigges DML -> insert, delete , update / DDl -> create, drop /

*/

CREATE OR REPLACE TRIGGER INS_EMPL
AFTER INSERT ON REGIONS
BEGIN
INSERT INTO LOG_TABLE VALUES('INSERCION EN LA TABLA REGIONS',USER);
END;


insert into REGIONS values (11,'Bogota');

/*
trigges de tipo before 


*/

CREATE OR REPLACE TRIGGER TR1_REGION 
BEFORE INSERT ON REGIONS 
BEGIN
  IF USER <>'HR' THEN
  RAISE_APPLICATION_ERROR(-20000, 'SOLO HR PUEDE INSERTAR EN REGIONS');
  end if;
END;


/*
trigges de tipo AFTER 
*/
create or replace TRIGGER INS_EMPL
AFTER INSERT ON REGIONS
BEGIN
INSERT INTO LOG_TABLE VALUES('INSERCION EN LA TABLA REGIONS',USER);
END;

insert into REGIONS values (12,'Bogota D.C');


/*
eventos triggers

*/


create or replace TRIGGER TR1_REGION 
BEFORE INSERT OR UPDATE OF REGION_NAME OR DELETE ON REGIONS 
BEGIN
  IF USER <>'HR' THEN
  RAISE_APPLICATION_ERROR(-20000, 'SOLO HR PUEDE TRABAJAR EN REGIONS');
  end if;
END;

create or replace TRIGGER TR1_REGION 
BEFORE INSERT OR UPDATE OR DELETE ON REGIONS 
BEGIN
  IF INSERTING THEN
    INSERT INTO LOG_TABLE VALUES ('INSERCION',USER);
  END IF;
  IF UPDATING THEN
    INSERT INTO LOG_TABLE VALUES ('UPDATE',USER);
  END IF;
  IF DELETING THEN
    INSERT INTO LOG_TABLE VALUES ('DELETE',USER);
  END IF;
END;


/*
evento por fila
*/

create or replace TRIGGER TR1_REGION 
BEFORE INSERT OR UPDATE OR DELETE ON REGIONS 
BEGIN
  IF INSERTING THEN
    INSERT INTO LOG_TABLE VALUES ('INSERCION',USER);
  END IF;
  IF UPDATING ('REGION_NAME') THEN
    INSERT INTO LOG_TABLE VALUES ('UPDATE REGION_NAME',USER);
  END IF;
  IF UPDATING ('REGION_ID') THEN
    INSERT INTO LOG_TABLE VALUES ('UPDATE REGION_ID',USER);
  END IF;
  IF DELETING THEN
    INSERT INTO LOG_TABLE VALUES ('DELETE',USER);
  END IF;
END;




DROP TRIGGER INS_EMPL;


/*
trigges de tipo row
*/

create or replace TRIGGER TR1_REGION 
BEFORE INSERT OR UPDATE OR DELETE ON REGIONS 
FOR Each ROw
BEGIN
  IF INSERTING THEN
    INSERT INTO LOG_TABLE VALUES ('INSERCION',USER);
  END IF;
  IF UPDATING ('REGION_NAME') THEN
    INSERT INTO LOG_TABLE VALUES ('UPDATE REGION_NAME',USER);
  END IF;
  IF UPDATING ('REGION_ID') THEN
    INSERT INTO LOG_TABLE VALUES ('UPDATE REGION_ID',USER);
  END IF;
  IF DELETING THEN
    INSERT INTO LOG_TABLE VALUES ('DELETE',USER);
  END IF;
END;


/*

trigger new  */


create or replace TRIGGER TR1_REGION 
BEFORE INSERT OR UPDATE OR DELETE ON REGIONS 
FOR Each ROw
WHEN (NEW.REGION_ID>1000)
BEGIN
  IF INSERTING THEN
   :NEW.REGION_NAME:= UPPER(:NEW.REGION_NAME);
    INSERT INTO LOG_TABLE VALUES ('INSERCION',USER);
  END IF;
  IF UPDATING ('REGION_NAME') THEN
   :NEW.REGION_NAME:= UPPER(:NEW.REGION_NAME);
    INSERT INTO LOG_TABLE VALUES ('UPDATE REGION_NAME',USER);
  END IF;
  IF UPDATING ('REGION_ID') THEN
    INSERT INTO LOG_TABLE VALUES ('UPDATE REGION_ID',USER);
  END IF;
  IF DELETING THEN
    INSERT INTO LOG_TABLE VALUES ('DELETE',USER);
  END IF;
END;
commit;


/*
configuracion de los triggers
*/

desc SYS.user_triggers;

select TRIGGER_NAME,TRIGGER_TYPE,TRIGGERING_EVENT,ACTION_TYPE,TRIGGER_BODY from SYS.user_triggers;
select OBJECT_NAME,OBJECT_TYPE,STATUS from user_OBJECTS where OBJECT_TYPE='TRIGGER';


alter trigger TR1_REGION COMPILE;
alter trigger TR1_REGION DISABLE;
alter trigger TR1_REGION ENABLE;

select * from SYS.user_errors;

/*
trigger compuesto

*/

CREATE OR REPLACE TRIGGER trigger1 
FOR DELETE OR INSERT OR UPDATE ON regions
COMPOUND TRIGGER
    BEFORE STATEMENT IS BEGIN
        INSERT INTO LOG_TABLE VALUES('BEFORE STATEMENT',USER);
    END BEFORE STATEMENT;
    
    AFTER STATEMENT IS BEGIN
        INSERT INTO LOG_TABLE VALUES('AFTER STATEMENT',USER);
    END AFTER STATEMENT;
    
    BEFORE EACH ROW IS BEGIN
        INSERT INTO LOG_TABLE VALUES('BEFORE EACH ROW',USER);
    END BEFORE EACH ROW;
   
   AFTER EACH ROW IS BEGIN
        INSERT INTO LOG_TABLE VALUES('AFTER EACH ROW',USER);
    END AFTER EACH ROW;
END trigger1;


/*
trigger de tipo ddl

*/











