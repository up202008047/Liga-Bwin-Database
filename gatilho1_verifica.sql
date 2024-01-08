.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print "\n Clubes existentes neste momento e respetivas claques :\n"

select * from clube join claque on claque.nome_clube=clube.nome;

.print "\nApos criacao de um novo clube -> dispara gatilho que adiciona as respetivas claques a um clube apos a sua criacao\n"

insert into Clube values ("Pacos de Ferreira", "14/01/1967" ,"Pedro Passos de Aveiro", "Pacos de ferreira", 3 );

.print "\nClubes existentes neste momento e respetivas claques apos ser adicionado um novo clube \n"

select * from clube join claque on claque.nome_clube=clube.nome;

.print ''