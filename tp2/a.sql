CREATE OR REPLACE PROCEDURE createdept_zangla(num IN NUMBER, name IN VARCHAR2, loc IN VARCHAR2)
IS
	d NUMBER;
BEGIN
	SELECT deptno INTO d FROM dept WHERE deptno = num;
	RAISE_APPLICATION_ERROR(-20001, 'Numero de departement deja existant');
	EXCEPTION 
		WHEN NO_DATA_FOUND THEN
			INSERT INTO dept VALUES(num, name, loc);
END;
/

/*exec createdept_zangla(12, 'TEst', 'Aubiere');*/

CREATE OR REPLACE FUNCTION salok_zangla(jobselect in VARCHAR2, salaire in NUMBER) RETURN NUMBER 
IS
	j VARCHAR2(9);
	mi NUMBER;
	ma NUMBER;
BEGIN
	SELECT job, lsal, hsal INTO j, mi, ma FROM salintervalle_f2 WHERE mi <= salaire AND ma >= salaire;
	RETURN 1; 
	EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 0;
END;
/

select salok_zangla(job, 2800) FROM salintervalle_f2;
