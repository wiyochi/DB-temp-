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
