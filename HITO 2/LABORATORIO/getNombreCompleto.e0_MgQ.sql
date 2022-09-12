create
    definer = root@localhost function getNombreCompleto(par1 varchar(25), par2 varchar(25)) returns varchar(50)
BEGIN
    DECLARE concatenado VARCHAR(50) DEFAULT '';

    SET concatenado  = CONCAT('nombres:', par1, ' - ','apellidos:', par2);

    RETURN concatenado;

END;

