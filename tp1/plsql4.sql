DECLARE
	Cursor c IS SELECT UNIQUE sal, NVL(comm, 0), empno, ename FROM emp WHERE sal + NVL(comm, 0) > 2000;
	salaire emp.sal%TYPE;
	numero emp.empno%TYPE;
	nom emp.ename%TYPE;
	comm emp.comm%TYPE;
BEGIN
	OPEN c;
	LOOP
		FETCH c INTO salaire, comm, numero, nom;
		INSERT INTO temp VALUES (salaire + comm, numero, nom);
		EXIT WHEN (c%notfound);
	END LOOP;
END;
/
