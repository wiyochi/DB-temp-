CREATE OR REPLACE PACKAGE zangla AS
	TYPE emp_cursor IS RECORD (emp_id NUMBER, nom VARCHAR2(10));
	CURSOR emp_par_dep_zangla(dep IN NUMBER) RETURN emp_cursor;
	PROCEDURE raise_salary_zangla(emp_id IN NUMBER, amount IN NUMBER);
	PROCEDURE afficher_emp_zangla(deptno IN NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY zangla AS
	CURSOR emp_par_dep_zangla(dep IN NUMBER) RETURN emp_cursor IS 
		SELECT empno, ename FROM emp WHERE deptno = dep;
	PROCEDURE raise_salary_zangla(emp_id IN NUMBER, amount IN NUMBER) IS
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
	PROCEDURE afficher_emp_zangla(deptno IN NUMBER) IS
		emp_id NUMBER;
		nom VARCHAR2(9);
	BEGIN
		OPEN emp_par_dep_zangla(deptno);
		LOOP
			FETCH emp_par_dep_zangla INTO emp_id, nom;
			EXIT WHEN(emp_par_dep_zangla%NOTFOUND);
			DBMS_OUTPUT.PUT_LINE(emp_id || ' : ' || nom);
		END LOOP;
		CLOSE emp_par_dep_zangla;
	END;
END;
/

