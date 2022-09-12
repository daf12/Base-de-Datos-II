create
    definer = root@localhost function get_Avg(sexoest varchar(20)) returns int
begin
            DECLARE EDADES INTEGER DEFAULT 0;


                    SELECT Avg(est.edad) INTO EDADES
                   FROM estudiantes AS est
                   WHERE  est.sexo = sexoest;
            return EDADES;

        end;

