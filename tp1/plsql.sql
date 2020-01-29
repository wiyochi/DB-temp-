DECLARE
	nom emp.ename%TYPE;
	salaire emp.sal%TYPE;
	commission emp.comm%TYPE;
	departement dept.dname%TYPE;
BEGIN 
	SELECT ename,sal,comm,dname INTO nom,salaire,commission,departement FROM Emp NATURAL JOIN Dept
	WHERE ename='MILLER';
DBMS_OUTPUT.PUT_LINE('Nom : ' || nom || ' Salaire : ' || salaire || ' Commission : ' || commission || 'Departement : ' || departement);
END;
/
