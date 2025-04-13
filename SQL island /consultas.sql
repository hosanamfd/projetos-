-- ==========================
-- 🏝️ SQL Island - Gameplay
-- Objetivo: escapar da ilha!
-- ==========================

-- Ver todos os habitantes da ilha
SELECT * 
FROM habitante;

-- Ver apenas os habitantes amigáveis
SELECT * 
FROM habitante
WHERE status = 'amigável';

-- Procurar um ferreiro amigável (especificamente de armamento)
SELECT * 
FROM habitante
WHERE status = 'amigável'
  AND trabalho = 'armamento-ferreiro';

-- Procurar qualquer tipo de ferreiro amigável
SELECT * 
FROM habitante
WHERE status = 'amigável'
  AND trabalho LIKE '%ferreiro';

-- Verificar qual é o meu ID (nome: Estranho)
SELECT idpessoa 
FROM habitante 
WHERE nome = 'Estranho';  -- Resultado: 20

-- Verificar quanto de ouro eu possuo
SELECT ouro
FROM habitante 
WHERE nome = 'Estranho';

-- Verificar quais itens não possuem dono
SELECT *
FROM item 
WHERE proprietário IS NULL;

-- Pegar todos os itens sem dono para mim (id = 20)
UPDATE item 
SET proprietário = 20 
WHERE proprietário IS NULL;

-- Ver todos os itens que possuo
SELECT *
FROM item 
WHERE proprietário = 20;

-- Ver habitantes amigáveis que são negociantes ou mercadores
SELECT * 
FROM habitante 
WHERE status = 'amigável' 
  AND (trabalho = 'negociante' OR trabalho = 'mercador');

-- Vender o bule e o anel para a vendedora (id = 15)
UPDATE item 
SET proprietário = 15
WHERE item = 'bule' 
   OR item = 'anel';

-- Trocar meu nome verdadeiro no jogo
UPDATE habitante 
SET nome = 'Hosana' 
WHERE idpessoa = 20;

-- Descobrir o padeiro mais rico (ordem decrescente de ouro)
SELECT * 
FROM habitante 
WHERE trabalho = 'padeiro' 
ORDER BY ouro DESC;

-- Descobrir se existe algum piloto (para escapar da ilha!)
SELECT * 
FROM habitante 
WHERE trabalho = 'piloto';

-- Descobrir o líder da Cidade Cebola
SELECT habitante.nome 
FROM aldeia
JOIN habitante ON aldeia.chefe = habitante.idpessoa
WHERE aldeia.nome = 'Cidade Cebola';

-- Contar quantas mulheres existem na Cidade Cebola (idaldeia = 3)
SELECT COUNT(*)
FROM habitante 
WHERE idaldeia = 3 
  AND gênero = 'f';

-- Listar o nome da única mulher da Cidade Cebola
SELECT nome
FROM habitante 
WHERE idaldeia = 3 
  AND gênero = 'f';

-- Calcular a soma total de ouro dos padeiros, negociantes e mercadores
SELECT SUM(ouro) 
FROM habitante 
WHERE trabalho IN ('padeiro', 'negociante', 'mercador');

-- Ver a média de ouro por status dos habitantes
SELECT status, AVG(ouro) AS media_ouro
FROM habitante 
GROUP BY status 
ORDER BY media_ouro;

-- Matar Diane Suja (DELETAR habitante)
DELETE FROM habitante 
WHERE nome = 'Diane Suja';

-- Libertar o piloto sequestrado (tornar amigável)
UPDATE habitante 
SET status = 'amigável' 
WHERE status = 'sequestrado';
