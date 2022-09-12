create
    definer = root@localhost function get_Avg_edad(edadEST int) returns int
begin
            DECLARE edadEST integer default 0;
               SELECT Avg(est.edad) INTO edadEST
                   FROM estudiantes AS est
               WHERE  est.edad = edadEST;
             RETURN edadEST
                ;
        end;

