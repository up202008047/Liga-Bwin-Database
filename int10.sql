--  preco que cada adepto paga por um bilhete em funcao do desconto na compra desse bilhete e da taxa de pagamento por multibanco
.mode        columns
.headers    on
.nullvalue  NULL   

DROP VIEW IF EXISTS view10;
CREATE VIEW view10 AS
select * from bilhete join adepto on bilhete.id_adepto=adepto.nif;

DROP VIEW IF EXISTS view11;
CREATE VIEW view11 AS
select id_bilhete,metodo_pagamento,preco as preco_normal,((preco-desconto)+5) as preco_com_desconto_taxa,id_jogo,nome,nif from view10 where metodo_pagamento="multibanco";


DROP VIEW IF EXISTS view12;
CREATE VIEW view12 AS
select id_bilhete,metodo_pagamento,preco as preco_normal,((preco-desconto)) as preco_com_desconto_taxa,id_jogo,nome,nif from view10 where metodo_pagamento="dinheiro";



select * from view12 UNION select * from view11;

.print 'sao aplicados os descontos ao preco do bilhete como tambem a respetiva taxa de pagamento por multibanco'