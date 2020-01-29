DECLARE
	Cursor c IS SELECT sal, ename, empno, mgr FROM emp;
	salaire emp.sal%TYPE;
	nom emp.ename%TYPE;
	empno emp.empno%TYPE;
	mgrEmp emp.mgr%TYPE;
	chaineMgr emp.mgr%TYPE;
BEGIN
	OPEN c;
	LOOP
		FETCH c INTO salaire, nom, empno, mgrEmp;
		EXIT WHEN(c%NOTFOUND);
		IF salaire >= 4000 THEN
			DBMS_OUTPUT.PUT_LINE('Salaire: ' || salaire || ' Nom: ' || nom || ' no: ' || empno || ' mgr: ' || mgrEmp);
			SELECT mgr INTO chaineMgr FROM emp WHERE empno=7902;
			LOOP
				EXIT WHEN(chaineMgr IS NULL OR chaineMgr=mgrEmp);
				SELECT mgr INTO chaineMgr FROM emp where empno=chaineMgr;
			END LOOP;
			IF chaineMgr=mgrEmp OR mgrEmp IS NULL THEN
				INSERT INTO temp VALUES (null, salaire, nom);
			END IF;
		END IF;
	END LOOP;
END;
/
