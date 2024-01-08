.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS claques_de_novo_clube
After Insert On Clube
Begin

insert into Claque (nome,data_de_criacao,numero_de_adeptos,nome_clube) values ("Coletivo " || new.nome ,new.data_de_criacao,abs(random()) % (1000 - 500) + 500,new.nome);
insert into Claque (nome,data_de_criacao,numero_de_adeptos,nome_clube) values ("Ultras " || new.nome ,new.data_de_criacao,abs(random()) % (500 - 300) + 300,new.nome);
insert into Claque (nome,data_de_criacao,numero_de_adeptos,nome_clube) values ("Super " || new.nome ,new.data_de_criacao,abs(random()) % (300 - 100) + 100,new.nome);

End;