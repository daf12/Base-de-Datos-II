create
    definer = root@localhost function suma_edades_masculino() returns int
BEGIN
    RETURN (
        SELECT SUM(est.edad)
        FROM estudiantes as est
        where est.sexo='masculino'
        );
end;

