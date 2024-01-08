--Queries
.mode        columns
.headers    on
.nullvalue  NULL    


CREATE VIEW ajuda AS
select adepto.nif, count(clube.nome) as numeroClubesGrandes from bilhete join jogo on jogo.id_jogo=bilhete.id_jogo
join adepto on adepto.nif=bilhete.id_adepto join resultado on resultado.id_jogo=jogo.id_jogo join clube 
on clube.nome=resultado.id_clube where clube.nome="benfica" or clube.nome="sporting" or clube.nome="porto" group by  adepto.nif;

select * from ajuda where numeroClubesGrandes>1;

.print 'adeptos que ja viram jogos de pelo menos 2 equipas denominadass os "tres grandes"'