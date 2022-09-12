create
    definer = root@localhost function getEDADgestion(par1 varchar(25), par2 varchar(25)) returns varchar(50)
BEGIN
    DECLARE concatenado  VARCHAR(50) DEFAULT 'edad y gestion';

     SET concatenado  = CONCAT('EDAD:', par1, ' - ','GESTION:', par2);

    RETURN concatenado;

END;

