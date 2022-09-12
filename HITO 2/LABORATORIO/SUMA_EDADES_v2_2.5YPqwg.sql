create
    definer = root@localhost function SUMA_EDADES_v2_2(SEXOEST varchar(30)) returns int
BEGIN
        # sirve para declarar una variable en una funcion
       DECLARE SEXOEST INTEGER DEFAULT 0;

            SELECT SUM(ESS.edad) INTO SEXOEST
             FROM estudiantes AS ESS
             WHERE ESS.sexo= SEXOEST;
             RETURN SEXOEST;

     END;

