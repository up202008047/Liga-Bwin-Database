--Queries
.mode        columns
.headers    on
.nullvalue  NULL    

select clube.nome , count(jogo.id_jogo) as numeroJogos from clube
join resultado on resultado.id_clube=clube.nome
join jogo on jogo.id_jogo=resultado.id_jogo
group by clube.nome;

.print 'quantos jogos fez cada equipa'