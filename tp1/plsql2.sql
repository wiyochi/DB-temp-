DECLARE
	num1 temp.num_col1%TYPE;
	num2 temp.num_col2%TYPE;
	char temp.char_col%TYPE;
BEGIN
	FOR i IN 1..10 LOOP
		IF MOD(i, 2) = 0 THEN
			INSERT INTO temp VALUES (i, i * 100, CONCAT(TO_CHAR(i), ' est pair'));
		ELSE
			INSERT INTO temp VALUES (i, i * 100, CONCAT(TO_CHAR(i), ' est impair'));
		END IF;
	END LOOP;
	COMMIT;
END;
/
