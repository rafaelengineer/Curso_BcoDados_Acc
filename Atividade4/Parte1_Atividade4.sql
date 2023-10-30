-- a) Pesquise os itens que foram vendidos sem desconto. As colunas presentes no 
-- resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.
SELECT ID_NF, ID_ITEM, COD_PRO, VALOR_UNIT 
FROM db_atividade4.produtos
WHERE desconto IS NULL OR 0;

-- b) Pesquise os itens que foram vendidos com desconto. As colunas presentes no 
-- resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR 
-- VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).
SELECT ID_NF, ID_ITEM, COD_PRO, VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) as valor_venal
FROM db_atividade4.produtos
WHERE desconto>0;

-- c) Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.
SELECT * FROM produtos
WHERE desconto IS NULL;
SET SQL_SAFE_UPDATES = 0;
UPDATE produtos
SET desconto = 0
WHERE desconto IS NULL;
SELECT * FROM produtos
WHERE desconto = 0;
SET SQL_SAFE_UPDATES = 1;

-- d) Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta 
-- são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO, 
-- VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE * 
-- VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT -
-- (VALOR_UNIT*(DESCONTO/100)).
use db_atividade4;
SELECT ID_NF, ID_ITEM, COD_PRO, VALOR_UNIT, QUANTIDADE *  VALOR_UNIT as VALOR_TOTAL, 
 DESCONTO, VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) as valor_venal
 FROM produtos;

-- e) Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As 
-- colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: O 
-- VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o 
-- resultado da consulta por ID_NF.
SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS valor_Total
FROM produtos
GROUP BY ID_NF;

-- f) Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As 
-- colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O 
-- VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O 
-- VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe 
-- o resultado da consulta por ID_NF.
SELECT ID_NF, SUM(VALOR_UNIT - VALOR_UNIT*(DESCONTO/100)) AS valor_Venal
FROM produtos
GROUP BY ID_NF
ORDER BY valor_Venal;

-- g) Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da 
-- consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por 
-- COD_PROD.
SELECT COD_PRO, SUM(QUANTIDADE) AS total_quantidade
FROM produtos
GROUP BY COD_PRO
ORDER BY total_quantidade DESC;

-- h) Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto. 
-- As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE.
-- Agrupe o resultado da consulta por ID_NF, COD_PROD.
SELECT ID_NF, COD_PRO, SUM(QUANTIDADE) AS total_quantidade
FROM produtos
GROUP BY ID_NF, COD_PRO
HAVING total_quantidade > 10;


-- i) Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o 
-- resultado do maior valor para o menor. As colunas presentes no resultado da consulta 
-- são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE 
-- * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.
SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS valor_Total
FROM produtos
GROUP BY ID_NF
HAVING SUM(QUANTIDADE * VALOR_UNIT) > 500
ORDER BY valor_Total DESC;


-- j) Qual o valor médio dos descontos dados por produto. As colunas presentes no 
-- resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por 
-- COD_PROD.
SELECT COD_PRO, AVG(DESCONTO) AS media
FROM produtos
GROUP BY COD_PRO;


-- k) Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas 
-- presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe 
-- o resultado da consulta por COD_PROD.
SELECT COD_PRO,
       MIN(DESCONTO) AS minimo,
       MAX(DESCONTO) AS maximo,
       ROUND(AVG(DESCONTO), 2) AS media
FROM produtos
GROUP BY COD_PRO;


-- l) Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado 
-- da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE 
-- VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o 
-- resultado da consulta por ID_NF.
SELECT ID_NF, COUNT(*) AS QTD_ITENS
FROM produtos
GROUP BY ID_NF
HAVING COUNT(*) > 3;
