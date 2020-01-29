DECLARE
	nom emp.ename%TYPE;
BEGIN
	SELECT ename INTO nom FROM emp where ename='MILLER';
END;

/
