--Queries
.mode        columns
.headers    on
.nullvalue  NULL   
 
select jogo.id_jogo, Max(bilhete.preco) as MaxPrecoTicket,MIN(bilhete.preco) as MinPriceTicket,AVG(bilhete.preco) as AVGTicketfrom from bilhete join jogo on jogo.id_jogo=bilhete.id_jogo
group by jogo.id_jogo;

.print 'nMedia, min, max do preco dos bilhetes por cada jogo'
