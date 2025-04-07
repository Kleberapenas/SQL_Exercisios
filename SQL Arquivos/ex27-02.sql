use diversas_tabelas;

-- ex1
delimiter $
create procedure contadorex1(limite tinyint unsigned)
begin
declare x int default 0;
declare y int default 0;
	while x<limite do
    select y as soma;
    set x = x+1;
    set y = y+x;
    end while;
end $
delimiter ;

call contadorex1(6);

-- ex2
delimiter $
create procedure contadorex2(limite int)
begin
	declare x int default 0;
	declare y int default 0;
    repeat
		set x=x+1;
        set y=y+x;
        until x>=limite
	end repeat;
    select y as soma;
end $
delimiter ;

call contadorex2(9);