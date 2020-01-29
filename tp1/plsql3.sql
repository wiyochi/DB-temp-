DECLARE
	Cursor c IS SELECT sal, empno, ename FROM emp ORDER BY sal DESC;
	salaire emp.sal%TYPE;
	numero emp.empno%TYPE;
	nom emp.ename%TYPE;
BEGIN
	OPEN c;
	FOR i IN 1..5 LOOP
		FETCH c INTO salaire, numero, nom;
		INSERT INTO temp VALUES (salaire, numero, nom);
	END LOOP;
END;
/
