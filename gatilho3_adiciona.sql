.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS maximo_de_arbitros
BEFORE INSERT ON jogoarbitro


WHEN (Select count(id_arbitro) as numero
    From    jogoarbitro 
    Where id_jogo=new.id_jogo
    group by  id_jogo) >2
    BEGIN
        SELECT RAISE (ABORT, "Jogo tem 3 arbitros associados");
    END;

        

    




 


    
