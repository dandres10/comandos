
--instrucciones SELECT
SELECT * FROM employees; -- seleccionar los datos de una tabla
SELECT first_name FROM employees; --seleccionar las columnas que se quieren ver
SELECT first_name,last_name,salary AS salario FROM employees; -- colocarle un alias a la columan (nombrarla de otra manera)
SELECT first_name,last_name,salary AS "salario empleado" FROM employees; -- igual a la consulta anterior, pero el nombre de la columna es en miniscula;
SELECT first_name, salary, salary*12 AS "Salario anual", 20*10 AS "Ejemplo" from employees; -- operaciones en las columnas 
SELECT 'NOMBRE:', first_name FROM employees; -- añadir una columna describiendo la que continua
SELECT 'NOMBRE:' || FIRST_NAME ||' ' ||LAST_NAME AS "NOMBRE EMPLEADO" FROM employees; -- concatenando en una sola columna
SELECT first_name,salary,commission_pct,salary*commission_pct AS "SALARIO TOTAL" from employees; -- devolver un resultado en una nueva columna 
SELECT  first_name,department_id from employees;
SELECT DISTINCT department_id from employees; -- mostrar(seleccionar) sin repeticiones 
SELECT DISTINCT department_id,job_id from employees;
SELECT first_name,salary AS "Bruto", salary*20/100 AS "Impuestos", salary-(salary*20/100) AS "Neto"  from employees;
SELECT first_name as "Nombre", salary as "Salario", salary*14 as "Salario Anual" from employees;

--DUAL
select 4+3 from DUAL; -- tabla dual devuelve una sola fila | tabla predefinida de oracle.
select first_name,salary,commission_pct, salary*commission_pct AS "Salario total" from employees;


--clausulas

select * from employees where department_id = 50;
SELECT first_name,salary from employees WHERE salary>5000;
SELECT first_name from employees WHERE department_id<>50 ;
SELECT first_name from employees WHERE first_name = 'Ellen' ;
SELECT first_name from employees WHERE first_name <> 'Ellen' ;

SELECT * FROM employees WHERE hire_date='21-06-07';
SELECT * FROM employees WHERE hire_date<'21-06-07';

--between
SELECT * FROM  employees where salary BETWEEN 5000 AND 6000;
SELECT * FROM  employees where hire_date BETWEEN '01-02-07' AND '01-02-09';

--in
SELECT * FROM employees WHERE department_id IN (50,60);
SELECT * FROM employees WHERE job_id IN('IT_PROG','ST_MAN');

--like patron
SELECT * FROM employees where first_name LIKE 'J%';
SELECT * FROM employees where first_name LIKE '_e%';
SELECT * FROM employees where first_name LIKE '%te%';

--null
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--and-or-not
SELECT * FROM employees WHERE salary > 5000 OR department_id=50;
SELECT * FROM employees WHERE department_id not IN(50,60);

SELECT first_name,salary,department_id,hire_date 
FROM employees
WHERE salary>5000 AND department_id = 50 AND hire_date>'10-01-05'; 


SELECT first_name,salary,department_id,hire_date 
FROM employees
WHERE salary>5000 AND (department_id = 50 OR hire_date>'10-01-05') and department_id is not null; 

--ordenaciones
SELECT * FROM employees ORDER BY salary;
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY salary ASC;
SELECT first_name,last_name,salary FROM employees WHERE first_name = 'David' ORDER BY first_name,last_name;
SELECT first_name,last_name,salary FROM employees WHERE first_name = 'David' ORDER BY first_name,salary DESC;
SELECT first_name,salary*12 from employees ORDER BY 2;
SELECT first_name,salary*12 AS TOTAL from employees ORDER BY TOTAL DESC;

--limitar el numero de filas 
SELECT first_name,salary FROM employees ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY; -- version mayor a 11g
SELECT first_name,salary FROM employees ORDER BY salary DESC FETCH FIRST 7 ROWS WITH TIES; -- version mayor a 11g
SELECT first_name,salary  FROM employees where ROWNUM < 11 ORDER BY salary DESC; -- en esta version
SELECT first_name,salary FROM hr.employees ORDER BY salary DESC OFFSET 5 ROWS FETCH FIRST 7 ROWS WITH TIES; -- version mayor a 11g
SELECT * FROM hr.employees FETCH FIRST 20 percent ROWS ONLY; -- version mayor a 11g

--funciones 
SELECT LOWER(email) FROM employees;
SELECT UPPER(first_name) FROM employees;
SELECT INITCAP('ESTO ES UNA PRUEBA') FROM DUAL;
SELECT first_name,last_name FROM employees WHERE UPPER(first_name)='DAVID';

SELECT CONCAT(first_name,CONCAT(' ',last_name)) FROM employees;
SELECT first_name FROM employees;
SELECT SUBSTR(first_name,1,2) FROM employees;
SELECT SUBSTR(first_name,3) FROM employees;
SELECT first_name,LENGTH(first_name) AS "Tamaño" FROM employees;
SELECT first_name AS "Tamaño" FROM employees where LENGTH(first_name)=6;

SELECT first_name,INSTR(first_name,'a')  from employees;
SELECT first_name  from employees WHERE INSTR(first_name,'a')<>0;
SELECT first_name  from employees WHERE INSTR(LOWER(first_name),'a')<>0;
SELECT first_name,INSTR(first_name,'a',4)  from employees;
SELECT first_name,INSTR(first_name,'a',4)  from employees WHERE INSTR(LOWER(first_name),'a',4)<>0;

SELECT first_name FROM employees;
SELECT RPAD(first_name,20,'*') first_name FROM employees;
SELECT LPAD(first_name,20,'*') first_name FROM employees; 

SELECT REPLACE(LOWER(first_name),'a','*') FROM employees;
SELECT 'HOLA   '|| 'perez'  FROM DUAL;
SELECT RTRIM('HOLA   ')|| ' perez'   FROM DUAL;
SELECT 'HOLA '|| LTRIM('        perez')   FROM DUAL;
SELECT RTRIM(first_name,'n') FROM employees;


SELECT ROUND(50.95498,4) FROM DUAL;
SELECT TRUNC(50.95498,2) FROM DUAL;
SELECT MOD(10,3) FROM DUAL;
SELECT POWER(3,2) FROM DUAL;

SELECT first_name,hire_date FROM employees;
SELECT SYSDATE FROM DUAL;
--1 enero -4712 AC
SELECT SYSDATE+2 FROM DUAL;
SELECT SYSDATE-2 FROM DUAL;
SELECT hire_date,SYSDATE-hire_date from employees; -- sacar el numero de dias apartir de la fecha actual.
SELECT hire_date,(SYSDATE-hire_date)/7 from employees;

SELECT hire_date,MONTHS_BETWEEN(SYSDATE,hire_date) FROM employees;
SELECT SYSDATE,ADD_MONTHS(SYSDATE,3) from DUAL;
SELECT NEXT_DAY(SYSDATE,'DOM') FROM DUAL;
SELECT SYSDATE,LAST_DAY(SYSDATE) FROM DUAL;
SELECT SYSDATE,ROUND(SYSDATE,'MONTH'),ROUND(SYSDATE,'YEAR') FROM DUAL;
SELECT SYSDATE,TRUNC(SYSDATE,'MONTH'),TRUNC(SYSDATE,'YEAR') FROM DUAL;


--fuciones para converti de un dato a otro
SELECT '10' +10 FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE,'10-10-18')  FROM DUAL;
SELECT 10||'10' FROM DUAL;
SELECT 'HOY ES: '|| SYSDATE FROM DUAL;  


/*
YYYY AÑO 4 NUMEROS
YEAR AÑO (INGLES)
MM   MES 2 DIGITOS
MONTH MES EN TEXO
MON ABREVIATURA DEL MES
DY  ABREVIATURA DEL DIA
DAY DIA EN TEXTO
*/

SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'MONTH') FROM DUAL; 
SELECT SYSDATE,TO_CHAR(SYSDATE,'YEAR') FROM DUAL; 
SELECT SYSDATE,TO_CHAR(SYSDATE,'DAY') FROM DUAL; 
SELECT SYSDATE,TO_CHAR(SYSDATE,'DY') FROM DUAL;

/*
AM PM MERIDIAN
HH FORMATO 12 HORAS
HH24 FORMATO 24 HORAS
MI MINUTOS
SS SEGUNDOS
*/

SELECT SYSDATE, TO_CHAR(SYSDATE,'HH') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'HH24') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'MI') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'HH24:MI') FROM DUAL;

/*
9 numero
0 visualiza un cero
$ dolar
L moneda actual
. punto decimal
, miles separador
*/

SELECT salary,TO_CHAR(salary,'999999'),to_char(salary,'00009'),to_char(salary,'L00009.99') FROM employees; 

/*

*/

SELECT TO_DATE('10-01-89') FROM DUAL;
SELECT TO_DATE('10-JUL-89') FROM DUAL;
SELECT TO_DATE('12-22-89','mm-dd-yy') FROM DUAL;
SELECT TO_DATE('DIC-22-89','mon-dd-yy') FROM DUAL;

--RR
/*
rando del año
0-49 2000
50-99 1900
*/

SELECT TO_CHAR( TO_DATE('10-01-39'),'DD-MM-YYYY') AS "FECHA" FROM DUAL;


SELECT TO_NUMBER('1000') FROM DUAL;
SELECT TO_NUMBER('1000.89','999999.99') FROM DUAL;
SELECT TO_NUMBER('$5000','L9999') FROM DUAL;

SELECT NVL('HOLA','ADIOS') FROM DUAL;
SELECT NVL(NULL,'ADIOS') FROM DUAL;
SELECT first_name,commission_pct  FROM employees;
SELECT first_name,NVL(commission_pct,0) AS "Comision" FROM employees;
SELECT first_name,NVL2(commission_pct, salary*commission_pct, salary*0.1) AS "Comision" FROM employees;

SELECT country_id,UPPER(SUBSTR(country_name,1,2)), 
NULLIF(country_id,UPPER(SUBSTR(country_name,1,2))),
NVL2( NULLIF(country_id,UPPER(SUBSTR(country_name,1,2))),'Son diferentes','Son iguales')from countries;


SELECT COALESCE(null,'valor 2','valor 3','valor 4')as "valor no null" from dual;
SELECT first_name, COALESCE(to_char(commission_pct), to_char(manager_id),'SIN JEFE NI COMMISION') FROM employees;


--case

select first_name,job_id,
CASE job_id
   WHEN 'SH_CLERK' THEN 'TIPO 1'
   WHEN 'ST_MAN' THEN 'TIPO 2'
   WHEN 'ST_CLERK' THEN 'TIPO 3'
   ELSE 'SIN TIPO'
   END  AS "TIPO"
from employees where department_id = 50;



--case searches

SELECT first_name,salary,
CASE
 WHEN salary BETWEEN 0 AND 3000 THEN 'Ganas poco'
 WHEN salary BETWEEN 3001 AND 5000 THEN 'Ganas como la media'
 WHEN salary > 5001  THEN 'Ganas bastante'
 else 'NO GANAS'
END
FROM employees;


SELECT first_name, department_id ,
DECODE(department_id,50,'INFORMATICA',10,'VENTAS','OTRO TRABAJO')
from employees;


--count 

SELECT COUNT(first_name) from employees;
SELECT COUNT(first_name),COUNT(commission_pct) from employees;
SELECT COUNT(DISTINCT(first_name)) from employees; 
SELECT DISTINCT department_id from employees;


SELECT SUM(salary) from employees;

SELECT department_id,job_id,COUNT(*),SUM(salary) 
FROM employees 
GROUP BY department_id,job_id
ORDER BY department_id;


SELECT department_id,job_id,COUNT(*),SUM(salary) 
FROM employees 
GROUP BY department_id,job_id
HAVING sum(salary)>25000 and COUNT(*)>10
ORDER BY department_id;

--joins

SELECT EMP.salary from employees EMP;

--natural joins
select re.region_name,re.region_name,co.country_id from regions RE NATURAL JOIN countries CO;

--using
select d.department_name,e.first_name 
from employees e JOIN departments d 
USING(department_id)
WHERE e.salary>5000;

--on
select d.department_name,e.first_name,l.city 
from employees e JOIN departments d 
on e.department_id=d.department_id
join locations l
on d.location_id= l.location_id
WHERE e.salary>5000;

select d.department_name,e.first_name,l.city 
from employees e JOIN departments d 
on e.department_id=d.department_id
join locations l
on d.location_id= l.location_id
and e.salary>5000;

--self joins

SELECT trabajador.first_name as "trabajador",jefe.first_name as "jefe" 
from employees trabajador 
join employees jefe
on jefe.employee_id = trabajador.manager_id;

--outer join
SELECT d.department_name,e.first_name 
FROM departments D 
join employees E
on d.department_id = e.department_id;

--left outer
SELECT d.department_name,e.first_name 
FROM departments D LEFT OUTER JOIN employees E
on d.department_id = e.department_id;
--right outer
SELECT d.department_name,e.first_name 
FROM departments D 
RIGHT OUTER JOIN employees E
on d.department_id = e.department_id;
--full outer
SELECT d.department_name,e.first_name 
FROM departments D 
FULL OUTER JOIN employees E
on d.department_id = e.department_id;


--tabla temporal "como"
WITH SUMA_SALARIOS AS 
 (SELECT employees.department_id,SUM(employees.salary) AS SALARIO
  FROM employees
  GROUP BY employees.department_id)
  SELECT department_id,department_name,SALARIO 
  FROM SUMA_SALARIOS  NATURAL JOIN departments  WHERE SALARIO> 20000;
  
  
WITH 
   SUMA_SALARIOS AS (SELECT department_id,SUM(SALARY) AS SALARIOS from employees GROUP BY department_id),
   NUM_EMPLEADOS AS (select department_id,COUNT(*) AS EMPLEADOS from employees GROUP BY department_id)
SELECT
  department_name,SALARIOS,EMPLEADOS
FROM
   departments,
   SUMA_SALARIOS,
   NUM_EMPLEADOS
where 
   departments.department_id = suma_salarios.department_id and 
   departments.department_id = num_empleados.department_id and
    EMPLEADOS<10;
    
    
--subconsultas 
select first_name,salary 
from employees
WHERE salary=(SELECT MAX(salary) FROM employees);

SELECT first_name,department_id 
FROM employees
WHERE department_id=
(SELECT department_id 
FROM employees 
WHERE UPPER(first_name)= UPPER('Douglas') and
UPPER(last_name) = UPPER('grant'));

--where 
SELECT first_name,last_name,salary 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees) and
department_id = 50;


--having
SELECT department_id,ROUND(AVG(salary)) 
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees); 



--multiple rows
-- any in all 

--in
SELECT first_name,salary,department_id 
FROM employees
WHERE (department_id,salary) IN (SELECT department_id,MAX(salary) 
from employees
GROUP BY department_id);

SELECT first_name,department_id 
FROM employees
WHERE (department_id) 
IN(select d.department_id
from departments d join locations l 
on (d.location_id= l.location_id) and l.city='Seattle');

--any
-- < > = <>

select first_name,last_name,job_id,salary 
from employees
where salary > any (select salary FROM employees WHERE job_id ='IT_PROG' )
and
job_id<>'IT_PROG';

select first_name,last_name,job_id,salary 
from employees
where salary < any (select salary FROM employees WHERE job_id ='IT_PROG' )
and
job_id<>'IT_PROG';

select first_name,last_name,job_id,salary 
from employees
where salary > ALL (select salary FROM employees WHERE job_id ='IT_PROG' )
and
job_id<>'IT_PROG';


--consultas sincronizadas

select department_id,first_name,salary  
FROM employees
WHERE (department_id,salary) 
IN (SELECT department_id,MAX(salary)
    FROM employees
    GROUP BY department_id);
    
select department_id,first_name,salary  
FROM employees EMP
WHERE salary = (SELECT MAX(salary) 
                FROM employees
                WHERE department_id = emp.department_id);
                
-- exists -- no exists
SELECT department_name 
FROM departments DEPT
WHERE NOT EXISTS (SELECT * 
                  FROM employees 
                  WHERE department_id = dept.department_id);
                  
                  
SELECT department_name 
FROM departments DEPT
WHERE  EXISTS (SELECT * 
                  FROM employees 
                  WHERE department_id = dept.department_id);
                  

--opetadores de conjunto


CREATE TABLE REGIONS1
(
 REGION_ID NUMBER,
 REGION_NAME VARCHAR2(25)
 );
 
 INSERT INTO REGIONS1 VALUES (1,'Europe');
 INSERT INTO REGIONS1 VALUES (3,'Asia');
 INSERT INTO REGIONS1 VALUES (6,'Australia');
 INSERT INTO REGIONS1 VALUES (8,'Antartica');
 
 commit;
 
--union
 select region_id,region_name from regions
 UNION
 SELECT region_id,region_name FROM regions1;
 
--union all
SELECT region_id,region_name from regions
UNION ALL
SELECT region_id,region_name FROM regions1;

--intersect
SELECT region_id,region_name from regions
INTERSECT
SELECT region_id,region_name FROM regions1;

--minus
SELECT region_id,region_name from regions
MINUS
SELECT region_id,region_name FROM regions1;

SELECT region_id,region_name from regions1
MINUS
SELECT region_id,region_name FROM regions;

--DML data manupulation language
--insert update delete
-- commit rollback savepoint

--insert 
insert into regions(region_id,region_name) values (5,'prueba1');
insert into regions values(6,'prueba2');
insert into regions(region_id) values(7);
insert into regions values(8,null);


create table DEPT2(
CODIGO NUMBER,
NOMBRE VARCHAR2(100),
JEFE NUMBER

);
 
INSERT INTO dept2  VALUES (1,UPPER('Iformatica'),100);

INSERT INTO dept2(codigo,nombre,jefe) 
SELECT department_id,department_name,manager_id 
from departments where location_id =1700; 


--update 
update dept2
set jefe=100
where codigo=120;

update dept2
set jefe=100
where jefe is null;

update dept2
set jefe= (select manager_id from departments WHERE department_id=30)
where codigo=100;

--delete
delete dept2 where codigo=1;

delete regions WHERE region_id IN(7,8);

DELETE regions1 
WHERE region_id 
IN(SELECT region_id from regions where region_id IN(1,3));

TRUNCATE table regions1;


--transaccion


insert into regions1 values (100,'AUSTRALIA');
insert into regions1 values (200,'EUROPA');

commit;

insert into regions1 values (300,'ASIA');
insert into regions1 values (400,'PEPITO');


ROLLBACK;


--savepoint TO x

insert into regions1 values (100,'AMERICA');
insert into regions1 values (200,'ASIA');

SAVEPOINT A;
insert into regions1 values (1,'antartida');
insert into regions1 values (2,'africa');

ROLLBACK TO SAVEPOINT A;


--bloqueos
select * from regions1;

update regions1 set region_name='andres' where region_id = 100;
commit;


--DDL data definition laguage


/*
tablas --> DATOS
INDICES --> RENDIMIENTO
VISTAS --> SELECT GUARDADA
SINONIMOS --> ALIAS DE LAS TABLAS
*/


--creando una tabla
 CREATE TABLE  TEST_TABLE_INCREMENTAL(
 "ID" NUMBER(10,0) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 
   MAXVALUE 9999999999999999999999999999
   INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   "NAME" VARCHAR2(15)
 )


CREATE TABLE PRUEBA (
CODIGO NUMBER,
NOMBRE VARCHAR2(100)

);


CREATE TABLE PRUEBA1 (
CODIGO NUMBER DEFAULT 0,
NOMBRE VARCHAR2(100) DEFAULT 'ANDRES',
FECHA_ENTRADA DATE DEFAULT SYSDATE

);

DESC prueba1;

insert into prueba1 (codigo) VALUES (10);

--constraints
/*
not null
unique
primary key
foreign key
check
*/


CREATE TABLE PRUEBA3(
 CODIGO NUMBER PRIMARY KEY,
 NOMBRE VARCHAR2(100) NOT NULL
 
);

CREATE TABLE PRUEBA4(
 CODIGO1 NUMBER,
 CODIGO2 NUMBER,
 NOMBRE VARCHAR2(100),
 PRIMARY KEY (CODIGO1,CODIGO2)
 
);

CREATE TABLE PRUEBA5(
 CODIGO NUMBER,
 NOMBRE VARCHAR2(100) UNIQUE
);

CREATE TABLE PRUEBA6(
 CODIGO NUMBER PRIMARY KEY,
 NOMBRE VARCHAR2(100),
 CONSTRAINT nombre_I UNIQUE(NOMBRE)
);

--foreign key
CREATE TABLE CURSOS(
 CODIGO NUMBER PRIMARY KEY,
 NOMBRE VARCHAR2(100) NOT NULL

);

CREATE TABLE ALUMNOS(
 CODIGO_ALUMNOS NUMBER PRIMARY KEY,
 NOMBRE VARCHAR2(100) NOT NULL,
 APELLIDOS VARCHAR2(100),
COD_CURSO NUMBER REFERENCES CURSOS(CODIGO)
);

--otra forma
CREATE TABLE ALUMNOS(
 CODIGO_ALUMNOS NUMBER PRIMARY KEY,
 NOMBRE VARCHAR2(100) NOT NULL,
 APELLIDOS VARCHAR2(100),
 CONSTRAINT CURSOS_ALUMNO FOREIGN KEY (COD_CURSO) REFERENCES CURSOS(CODIGO)
);



--check

CREATE TABLE EMPLEADO(
 CODIGO NUMBER PRIMARY KEY,
 NOMBRE VARCHAR2(100) NOT NULL,
 SALARIO NUMBER CHECK(SALARIO>1000)
);


--crear tablas apatir de otras tablas

create table EMPLEADOS as select * from employees;

--altet table 
/*
añadir columna
modificar una columna
definir default value
borrar una columna 
read-only
*/

ALTER TABLE cursos add (PROFESOR VARCHAR2(100));
ALTER TABLE cursos MODIFY (PROFESOR VARCHAR2(50));
ALTER TABLE cursos MODIFY (PROFESOR NUMBER);
alter table cursos DROP (PROFESOR);
select * from cursos;

--permisos de escritura 
ALTER TABLE cursos READ ONLY; 
ALTER TABLE cursos READ WRITE;   


--eliminar table
DROP TABLE cursos cascade CONSTRAINTS; 


--crear vistas 
create view EMPLE_VISTA AS SELECT * FROM employees;
select * from EMPLE_VISTA;

create view REGIONS_V AS SELECT * FROM regions;
select * from REGIONS_V;

INSERT INTO REGIONS_V VALUES(7,'yyy');
   select * from regions;
   
   
--index 
create index  INDEX1 ON employees (last_name);

SELECT * from employees where last_name LIKE 'S%';

create index  INDEX2 ON employees (first_name,last_name);


--crear secuencias
create sequence SEQUENCE1 INCREMENT BY 1 MAXVALUE 1000 MINVALUE 20 CACHE 20;

select SEQUENCE1.NEXTVAL FROM DUAL;
select SEQUENCE1.CURRVAL FROM DUAL;

select * FROM regions1;

insert into regions1 VALUES ( SEQUENCE1.NEXTVAL,'aaaa');
   
   
   -- crear sinonimos
   create SYNONYM DEPARTAMENTOS1 FOR DEPARTMENTS;
   
   
   SELECT * FROM DEPARTAMENTOS1 where DEPARTMENT_ID=10;
   
   -- dar permisos a un usario sobre mis tablas
   GRANT SELECT ON DEPARTMENTS TO PRUEBA;

---inserciones en multiples tablas
TRUNCATE TABLE EMPLES_JEFES;
TRUNCATE TABLE EMPLES_MANDOS;
TRUNCATE TABLE EMPLES_NORMALES;
TRUNCATE TABLE FINANCIERO;
CREATE TABLE EMPLES_JEFES (COD_EMPLE NUMBER, NOMBRE VARCHAR2(100), SALARIO NUMBER);
CREATE TABLE EMPLES_MANDOS (COD_EMPLE NUMBER, NOMBRE VARCHAR2(100), SALARIO NUMBER,DEPARTAMENTO NUMBER);
CREATE TABLE EMPLES_NORMALES (COD_EMPLE NUMBER, NOMBRE VARCHAR2(100), SALARIO NUMBER,RESPONSABLE NUMBER);



INSERT ALL
    WHEN DEPARTMENT_ID=100 THEN
        INTO FINANCIERO VALUES(EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY, MANAGER_ID)
    WHEN SALARY > 10000 THEN
        INTO EMPLES_JEFES VALUES(EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY)
     WHEN SALARY BETWEEN  8000 AND 10000 THEN
        INTO EMPLES_MANDOS  VALUES(EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY,DEPARTMENT_ID)    
     WHEN SALARY < 8000 THEN
        INTO EMPLES_NORMALES VALUES(EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY, MANAGER_ID)
    
SELECT * FROM EMPLOYEES;

INSERT FIRST
    WHEN DEPARTMENT_ID=100 THEN
        INTO FINANCIERO VALUES(EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY, MANAGER_ID)
    WHEN SALARY > 10000 THEN
        INTO EMPLES_JEFES VALUES(EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY)
     WHEN SALARY BETWEEN  8000 AND 10000 THEN
        INTO EMPLES_MANDOS  VALUES(EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY,DEPARTMENT_ID)    
     WHEN SALARY < 8000 THEN
        INTO EMPLES_NORMALES VALUES(EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY, MANAGER_ID)
    
SELECT * FROM EMPLOYEES;

SELECT COUNT(*) FROM EMPLES_JEFES;
SELECT COUNT(*) FROM EMPLES_MANDOS;
SELECT COUNT(*) FROM EMPLES_NORMALES;

CREATE TABLE FINANCIERO (COD_EMPLE NUMBER, NOMBRE VARCHAR2(100), SALARIO NUMBER,RESPONSABLE NUMBER);
SELECT COUNT(*) FROM FINANCIERO;


--CLAUSULA WITH
--SUBQUERY FACTORING CLAUSE
SELECT E.FIRST_NAME AS NOMBRE, DC.NUM_EMPLE AS NUMERO_EMPLEADOS,E.DEPARTMENT_ID
FROM EMPLOYEES E,
    (SELECT DEPARTMENT_ID, COUNT(*) AS NUM_EMPLE FROM EMPLOYEES GROUP BY DEPARTMENT_ID) DC
WHERE E.DEPARTMENT_ID = DC.DEPARTMENT_ID;
          
SELECT DEPARTMENT_ID, COUNT(*) AS NUM_EMPLE FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

WITH VISTA_NUM_EMPLE AS
    ( SELECT DEPARTMENT_ID, COUNT(*) AS NUM_EMPLE FROM EMPLOYEES GROUP BY DEPARTMENT_ID)
SELECT E.FIRST_NAME AS NOMBRE, DC.NUM_EMPLE AS NUMERO_EMPLEADOS,E.DEPARTMENT_ID
FROM EMPLOYEES E, VISTA_NUM_EMPLE DC
WHERE E.DEPARTMENT_ID = DC.DEPARTMENT_ID;  
---
WITH SUM_SALARIO AS (SELECT DEPARTMENT_ID,SUM(SALARY) AS SALARIO_DEPARTAMENTO FROM EMPLOYEES GROUP BY DEPARTMENT_ID),
     NUM_EMPLE AS (SELECT DEPARTMENT_ID,COUNT(*) AS NUM_EMPLEADOS FROM EMPLOYEES GROUP BY DEPARTMENT_ID),
     NUM_EMPLE_TOTAL AS (SELECT COUNT(*) AS TOTAL_EMPLEADOS FROM EMPLOYEES)
SELECT DEPARTMENT_NAME, SALARIO_DEPARTAMENTO,NUM_EMPLEADOS,TOTAL_EMPLEADOS
FROM
DEPARTMENTS NATURAL JOIN SUM_SALARIO NATURAL JOIN NUM_EMPLE,NUM_EMPLE_TOTAL;


--Rollup
SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY ROLLUP(DEPARTMENT_ID)
;

SELECT DEPARTMENT_ID,JOB_ID,SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(DEPARTMENT_ID,JOB_ID)
order by department_id,job_id;


--CUBE

SELECT CITY,DEPARTMENT_NAME,COUNT(*)
FROM LOCATIONS NATURAL JOIN DEPARTMENTS  JOIN EMPLOYEES USING (DEPARTMENT_ID)
GROUP BY CITY,DEPARTMENT_NAME
ORDER BY CITY,DEPARTMENT_NAME;

SELECT CITY,DEPARTMENT_NAME,COUNT(*) AS EMPLEADOS
FROM LOCATIONS NATURAL JOIN DEPARTMENTS  JOIN EMPLOYEES USING (DEPARTMENT_ID)
GROUP BY CUBE(CITY,DEPARTMENT_NAME)
ORDER BY CITY,DEPARTMENT_NAME;

SELECT CITY,DEPARTMENT_NAME,JOB_ID,COUNT(*) AS EMPLEADOS
FROM LOCATIONS NATURAL JOIN DEPARTMENTS  JOIN EMPLOYEES USING (DEPARTMENT_ID)
GROUP BY CUBE(CITY,DEPARTMENT_NAME,JOB_ID)
ORDER BY CITY,DEPARTMENT_NAME,JOB_ID;























