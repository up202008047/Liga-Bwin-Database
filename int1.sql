--Queries
.mode        columns
.headers    on
.nullvalue  NULL    

select clube.nome, count(jogador.nome) from clube
join jogador on jogador.id_clube=clube.nome
group by clube.nome;

.print ' numero de jogadores que cada clube tem'