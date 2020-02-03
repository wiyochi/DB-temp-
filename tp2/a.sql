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
	mi NUMBER;
	ma NUMBER;
BEGIN
	SELECT lsal, hsal INTO mi, ma FROM salintervalle_f2 WHERE job = jobselect;
	IF salaire >= mi AND salaire <= ma THEN RETURN 1; 
	ELSE RETURN 0;
	END IF;
	EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 0;
END;
/


CREATE OR REPLACE PROCEDURE raisesalary_zangla(emp_id IN NUMBER, amount IN NUMBER)
IS
	e NUMBER;
	j VARCHAR(9);
	s NUMBER;
	possible NUMBER;
BEGIN
	SELECT empno, job, sal INTO e, j, s FROM emp WHERE empno = emp_id;
	possible := salok_zangla(j, s + amount);
	IF possible = 1 THEN 
		UPDATE emp SET sal = s + amount WHERE empno = e;
	ELSE
		RAISE_APPLICATION_ERROR(-20002, 'Maximum deja atteint');
	END IF;
END;
/
