create
    definer = root@localhost function getnombrecompleto1(par1 varchar(25), par2 varchar(25)) returns varchar(50)
begin
    declare  concatenado varchar (50)default '';

     set concatenado=concat((par1,'-',par2));
    return concatenado;
    end;

