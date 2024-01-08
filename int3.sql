--Queries
.mode        columns
.headers    on
.nullvalue  NULL    

select jogo.id_jogo, jogo.nome_estadio, capacidade-count(jogo.id_jogo) as lugaresDisponiveis  from jogo
join bilhete on jogo.id_jogo=bilhete.id_jogo 
join estadio on estadio.nome=jogo.nome_estadio
group by jogo.nome_estadio
order by jogo.id_jogo;


.print 'lugares livres ha para cada jogo'