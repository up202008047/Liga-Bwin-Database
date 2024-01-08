--Queries
.mode        columns
.headers    on
.nullvalue  NULL   

select count(DISTINCT estadio.nome) as numero_estadios_utilizados from jogo join estadio on estadio.nome=jogo.nome_estadio;

.print 'quantos estadios diferentes foram  usados ate ao momento para realizacao dos jogos da liga'
