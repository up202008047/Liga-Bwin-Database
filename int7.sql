--Queries
.mode        columns
.headers    on
.nullvalue  NULL   
 
select  clube.nome, SUM(jogador.golos) as golos ,SUM(jogador.assistencias) as assistencias from jogador join clube on jogador.id_clube=clube.nome where (jogador.posicao="extremo"
or jogador.posicao="ponta lanca") and clube.nome="sporting" or clube.nome="porto" group by clube.nome order by golos;

.print 'somas de todos os golos e assitencias marcadas pelos jogadores atacantes(extremo e ponta lanca) de sporting e porto;'
