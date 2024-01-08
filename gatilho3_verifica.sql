.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print "\n Arbitros atribuidios ao jogos realizados :\n"

select  * from jogo join jogoarbitro on jogoarbitro.id_jogo=jogo.id_jogo join arbitro on arbitro.nif=jogoarbitro.id_arbitro order by jogo.id_jogo;

.print "\n Adicionamos um arbitro ao jogo de id=2  -> O gatilho nao dispara quando adicionamos um arbitro a um jogo que ate ao momento so tem um arbitro associado a si mesmo\n"

insert into JogoArbitro values (2, 957003756);

.print "\n Arbitros atribuidios ao jogos realizados :\n"

select  * from jogo join jogoarbitro on jogoarbitro.id_jogo=jogo.id_jogo join arbitro on arbitro.nif=jogoarbitro.id_arbitro order by jogo.id_jogo;

.print "\n Adicionamos 3 novos arbitros ao jogo de id=3 -> O gatilho dispara quando adicionamos 3 arbitros a um jogo que ja tem 1 arbitro associado\n"

insert into JogoArbitro values (3, 957003756);
insert into JogoArbitro values (3, 954778990);
insert into JogoArbitro values (3, 239385347);


.print "\n Gatilho disparou nao adicionado um 4 arbitro ao jogo \n"

select  * from jogo join jogoarbitro on jogoarbitro.id_jogo=jogo.id_jogo join arbitro on arbitro.nif=jogoarbitro.id_arbitro order by jogo.id_jogo;

.print ''