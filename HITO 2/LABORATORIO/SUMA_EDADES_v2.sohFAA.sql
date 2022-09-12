create
    definer = root@localhost function SUMA_EDADES_v2(SEXOEST varchar(30)) returns int
BEGIN
       DECLARE SEXOEST INT DEFAULT 0;

            SELECT SUM(ESS.edad) INTO SEXOEST
             FROM estudiantes AS ESS
             WHERE ESS.sexo= SEXOEST;
             RETURN SEXOEST;

     END;

