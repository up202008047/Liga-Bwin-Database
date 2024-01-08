--Queries
.mode        columns
.headers    on
.nullvalue  NULL   

SELECT *
  FROM clube
 WHERE nome IN (
           SELECT id_clube
             FROM treinador
             where numero_de_jogos_realizados>350 and numero_de_trofeus_conquistados>6
       );

.print 'Seleciona os clubes que tem treinador mais experientes(mais de 450 jogos realizados) e reputados(mais de 6 trofeus);'
