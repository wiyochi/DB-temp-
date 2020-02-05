DECLARE
	Cursor c IS SELECT table_name FROM user_tables WHERE table_name NOT LIKE '%_OLD';
	Cursor cold IS SELECT table_name FROM user_tables WHERE table_name LIKE '%_OLD';
	t_name user_tables.table_name%TYPE;
BEGIN
	OPEN cold;
	LOOP
		FETCH cold INTO t_name;
		EXIT WHEN (cold%NOTFOUND);
		EXECUTE IMMEDIATE 'DROP TABLE ' || t_name;
	END LOOP;
	OPEN c;
	LOOP
		FETCH c INTO t_name;
		EXIT WHEN(c%NOTFOUND); 
		EXECUTE IMMEDIATE 'CREATE TABLE ' || t_name || '_old AS (SELECT * FROM ' || t_name || ')';
		DBMS_OUTPUT.PUT_LINE(t_name);
	END LOOP;
END;
/
