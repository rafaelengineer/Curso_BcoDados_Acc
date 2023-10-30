-- a) Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD = 
-- código da disciplinas).
use db_atividade4_p2;
SELECT MAT
FROM Historico
WHERE COD_DISC = 'BD' AND ANO = 2015 AND nota > 5;

-- b) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO 
-- em 2015.
SELECT MAT, AVG(nota) AS media_notas
FROM Historico
WHERE COD_DISC = 'POO' AND ANO = 2015
GROUP BY MAT;

-- c) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO 
-- em 2015 e que esta média seja superior a 6.
SELECT MAT, AVG(nota) AS media_notas
FROM Historico
WHERE COD_DISC = 'POO' AND ANO = 2015
GROUP BY MAT
HAVING AVG(nota) > 6;

-- d) Encontre quantos alunos não são de Natal
SELECT COUNT(DISTINCT MAT) AS total_alunos_nao_de_natal
FROM Alunos
WHERE cidade <> 'Natal';
