CREATE OR REPLACE TRIGGER raise_zangla
	BEFORE UPDATE ON emp
	FOR EACH ROW
	WHEN (new.sal < old.sal)
	BEGIN
		RAISE_APPLICATION_ERROR(-20003, 'Impossible de diminuer le salaire !');
END;
/


