--Queries
.mode        columns
.headers    on
.nullvalue  NULL   
 
select jogo.id_jogo, clube.nome,count(jogador.nome) as numeroJogadoresPorClube,count( DISTINCT treinador.nif) as NumeroTreinadores from resultado
join jogo on resultado.id_jogo=jogo.id_jogo join clube on clube.nome=resultado.id_clube join jogador on jogador.id_clube=clube.nome join treinador on treinador.id_clube=clube.nome
group by  jogo.id_jogo,clube.nome;


.print 'quantos jogadores estiveram presentes em cada equipa de cada equipa e treinadores envoldivos nesse mesmo jogo'