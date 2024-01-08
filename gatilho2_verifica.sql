.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print "\n Clubes existentes neste momento e respetivos estádios :\n"

select * from clube join estadio on estadio.clube_id=clube.nome;

.print "\nApos criacao de um um clube -> dispara gatilho que adiciona o respetivo estádio a este clube com parâmetros em função das caracteristicas do clube\n"

insert into Clube values ("Uniao da Madeira", "21/11/1987" ,"Miguel Madeira", "Madeira", 2 );
insert into Clube values ("chaves", "14/01/1967" ,"Pedro Passos de Aveiro", "Pacos de ferreira", 3 );

.print "\nClubes existentes neste momento e respetivas estádios após ser adicionado um novo clube \n"

select * from clube join estadio on estadio.clube_id=clube.nome;

.print ''