create database hito3_lenguaje_procedural;

use hito3_lenguaje_procedural;

set @admin = 'ADMIN';

SELECT @admin;

create function usando_variable_global()
    returns varchar (20)
    begin
        declare respuesta varchar (20) default ''; #respuesta = '';
        if @admin = 'ADMIN'
            then
            set respuesta = 'Usuario ADMIN';
            else
            set respuesta = 'Usuario Invitado';
        end if;
        return respuesta;
    end;

select usando_variable_global();

create function usando_variable_global_v2()
    returns varchar (20)
    begin
        declare respuesta varchar (20) default '';
        case
            when @admin = 'ADMIN' then set respuesta = 'Usuario ADMIN';
             when @admin = 'GUEST' then set respuesta = 'Usuario Invitado';
             else set respuesta = 'Usuario Nuevo';
        end case;
        return respuesta;
    end;

set @admin = 'GUEST';
select usando_variable_global_v2();

set @precio=80;
CREATE FUNCTION ejercicio()
returns varchar(50)
begin
    declare respuesta varchar (50) default '';
    case
        when @precio > 10 and @precio <= 20 then set respuesta = 'basico';
        when @precio >20 and @precio <=30 then set respuesta = 'intermedio';
        when @precio > 50 and @precio <=50 then set respuesta ='superior';
         when @precio > 50 then set respuesta ='carisimo';
         else set respuesta ='error';

        end case;
    return respuesta;
        end;
select ejercicio();

set @credit_number=50000;
CREATE OR REPLACE FUNCTION ejercicio2()
returns varchar(50)
begin
    declare respuesta varchar (50) default '';
    case
        when @credit_number > 50000 then set respuesta = 'PLATINIUM';
        when @credit_number >=10000 and @credit_number <=50000  then set respuesta = 'GOLD';
        when @credit_number <10000 then set respuesta ='SILVER';

         else set respuesta ='NO PERTENECE';

        end case;
    return respuesta;
        end;
select ejercicio2();


CREATE OR REPLACE FUNCTION ejercicio3(LIMITWHILE INTEGER)
RETURNS text
BEGIN
    DECLARE  X  VARCHAR(50)DEFAULT 1;
    declare  str text default ' ';
    WHILE X <= LIMITWHILE DO
        SET str = concat (str , x,',');
        set x = x +1 ;
        end while;
    return str ;
end;

select ejercicio3(10);