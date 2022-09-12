create
    definer = root@localhost function getEDADgestion(par1 int, par2 int) returns varchar(50)
BEGIN
    DECLARE concatenado  VARCHAR(50) DEFAULT 'edad y gestion';

     SET concatenado  = CONCAT('EDAD:', par1, ' - ','GESTION:', par2);

    RETURN concatenado;

END;

