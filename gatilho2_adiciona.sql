.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS estadio_de_novo_Clube
After Insert On Clube
Begin
    
    INSERT INTO Estadio(nome,
                    data_,
                    capacidade, 
                    clube_id)
    SELECT CASE WHEN New.rating< 6
                THEN "estadio do " || new.nome END,             
            CASE WHEN New.rating < 30 
                THEN NULL END,
            CASE WHEN New.rating == 5 
                THEN 40000
                WHEN New.rating == 4 
                THEN 30000
                WHEN New.rating == 3 
                THEN 20000
                ELSE 15000 END,    
                new.nome;
End;