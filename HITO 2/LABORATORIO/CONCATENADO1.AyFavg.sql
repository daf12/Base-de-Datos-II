create
    definer = root@localhost function CONCATENADO1(par1 varchar(25), par2 varchar(25), par3 int, par4 int) returns varchar(100)
BEGIN
    DECLARE concatenado1 VARCHAR(100) DEFAULT '';

    SET concatenado1  = CONCAT('nombres: ', par1, ' - ','apellidos: ', par2,' - ', ' EDAD :', par3, ' - ','GESTION: ', par4);

    RETURN concatenado1;

END;

