-- EX 1
-- Mostre a quantidade de jogadores por generation. Ordene da geração com mais jogadores para a com menos.
SELECT "generation", COUNT(*) AS "amount"
FROM "players"
GROUP BY "generation"
ORDER BY "amount" DESC;

-- EX 2
-- Calcule a altura média dos jogadores de cada generation. Arredonde o resultado para 2 casas decimais.
SELECT "generation", ROUND(AVG("height"), 2)
FROM "players"
GROUP BY "generation"
ORDER BY "generation" ASC;

-- EX 3
-- Para cada zone, mostre a menor e a maior altura dos jogadores.
SELECT "zone", MIN("height"), MAX("height")
FROM "players"
GROUP BY "zone";

-- EX 4
-- Calcule a média de total_score por zone. Ordene da maior média para a menor.
SELECT "zone", AVG("total_score") AS "mean_total_score"
FROM "players"
GROUP BY "zone"
ORDER BY "mean_total_score" DESC;

-- EX 5
-- Calcule a soma dos total_score de cada generation. Ordene pelo maior valor total.
SELECT "generation", SUM("total_score") AS "sum_total_score"
FROM "players"
GROUP BY "generation"
ORDER BY "sum_total_score" DESC;

-- EX 6
-- Mostre a quantidade de jogadores agrupada por generation e best_foot.
SELECT "generation", "best_foot", COUNT(*)
FROM "players"
GROUP BY "generation", "best_foot"
ORDER BY "generation", "best_foot";

-- EX 7
-- Calcule a média de speed_score, passing_score e shooting_score para cada zone.
SELECT "zone", AVG("speed_score"), AVG("passing_score"), AVG("shooting_score")
FROM "players"
GROUP BY "zone";

-- EX 8
-- Para cada origin_team, mostre o menor e o maior total_score.
SELECT "origin_team", MIN("total_score"), MAX("total_score")
FROM "players"
GROUP BY "origin_team";

-- EX 9
-- Mostre a média de dribbling_score por first_position, ordenando da maior média para a menor.
SELECT "first_position", AVG("dribbling_score") AS "mean_dribbling_score"
FROM "players"
GROUP BY "first_position"
ORDER BY "mean_dribbling_score" DESC;

-- EX 10
-- Para cada birth_place, mostre: quantidade de jogadores; altura média; média de total_score. Ordene pela média de total_score decrescente.
SELECT "birth_place", COUNT(*), AVG("height"), AVG("total_score")
FROM "players"
GROUP BY "birth_place"
ORDER BY AVG("total_score") DESC;

-- EX 11
-- Mostre apenas as zones cuja média de total_score seja maior que 68.
SELECT "zone"
FROM "players"
GROUP BY "zone"
HAVING AVG("total_score") > 68;

-- EX 12
-- Mostre apenas os origin_team que possuem mais de 5 jogadores.
SELECT "origin_team"
FROM "players"
GROUP BY "origin_team"
HAVING COUNT(*) > 5;

-- EX 13
-- Mostre as first_position cuja menor defense_score seja maior ou igual a 7.
SELECT "first_position"
FROM "players"
GROUP BY "first_position"
HAVING MIN("defense_score") >= 7;

-- EX 14
-- Mostre as zones cujo maior shooting_score seja igual a 10.
SELECT "zone"
FROM "players"
GROUP BY "zone"
HAVING MAX("shooting_score") = 10;

-- EX 15
-- Liste os jogadores cuja altura esteja entre 180 e 188 cm, inclusive. Ordene pela altura crescente.
SELECT "name"
FROM "players"
WHERE "height" BETWEEN 180 AND 188
ORDER BY "height" ASC;

-- EX 16
-- Liste os jogadores cujo total_score esteja entre 65 e 72, ordenando do maior para o menor total_score.
SELECT "name"
FROM "players"
WHERE "total_score" BETWEEN 65 AND 72
ORDER BY "total_score" DESC;

-- EX 17
-- Calcule a média de total_score por generation, considerando somente jogadores cuja altura esteja entre 175 e 190 cm.
SELECT "generation", AVG("total_score")
FROM "players"
WHERE "height" BETWEEN 175 AND 190
GROUP BY "generation";

-- EX 18
-- Calcule a média de shooting_score por zone, considerando jogadores com total_score entre 65 e 75. Mostre apenas zonas cuja média de shooting_score seja maior que 8.
SELECT "zone", AVG("shooting_score")
FROM "players"
WHERE "total_score" BETWEEN 65 AND 75
GROUP BY "zone"
HAVING AVG("shooting_score") > 8;

-- EX 19
-- Mostre os origin_team que: possuem pelo menos 5 jogadores; possuem média de total_score maior que 65.
SELECT "origin_team"
FROM "players"
GROUP BY "origin_team"
HAVING COUNT(*) >= 5 AND AVG("total_score") > 65;

-- EX 20
-- Mostre cada generation com: quantidade de jogadores; média de total_score; maior total_score; menor total_score. Mostre somente gerações cuja média seja maior que 65 e ordene pela média decrescente.
SELECT "generation", COUNT(*), AVG("total_score"), MAX("total_score"), MIN("total_score")
FROM "players"
GROUP BY "generation"
HAVING AVG("total_score") > 65
ORDER BY AVG("total_score") DESC;

-- EX 21
-- Liste os jogadores cujo total_score seja maior que a média geral de total_score.
SELECT "name"
FROM "players"
WHERE "total_score" > (
	SELECT AVG("total_score")
	FROM "players"
);

-- EX 22
-- Liste os jogadores cujo shooting_score seja maior que a média geral de shooting_score. Mostre name, shooting_score e total_score, ordenando pelo shooting_score decrescente.
SELECT "name", "shooting_score", "total_score"
FROM "players"
WHERE "shooting_score" > (
	SELECT AVG("shooting_score")
	FROM "players"
)
ORDER BY "shooting_score" DESC;

-- EX 23
-- Encontre o(s) jogador(es) que possuem o maior total_score de toda a tabela.
SELECT "name"
FROM "players"
WHERE "total_score" = (
	SELECT MAX("total_score")
	FROM "players"
);

-- EX 24
-- Encontre o(s) jogador(es) que possuem a menor altura da tabela.
SELECT "name"
FROM "players"
WHERE "height" = (
	SELECT MIN("height")
	FROM "players"
);

-- query complexa, como ROLLUP, CUBE, RANK, DENSE_RANK, FIRST_VALUE, ROW_NUMBER, LAG e LEAD
-- JOIN
-- procedure, function e trigger

-- EX 25
-- Liste os jogadores cujo total_score seja maior que a média de total_score da própria geração. Exemplo: um jogador da geração 2 deve ser comparado com a média somente dos jogadores da geração 2.
WITH "generation_means" AS (
	SELECT "generation", AVG("total_score") AS "mean_total_score"
	FROM "players"
	GROUP BY "generation"
)
SELECT "name"
FROM "players" p
JOIN "generation_means" g ON p."generation" = g."generation"
WHERE p."total_score" > g."mean_total_score";

-- EX 26
-- Mostre, para cada zone: quantidade de jogadores; média de total_score, arredondada para 2 casas; maior total_score; menor total_score; soma de total_score. Mostre apenas zonas com pelo menos 5 jogadores e ordene pela média de total_score decrescente.
SELECT "zone", COUNT(*), ROUND(AVG("total_score"), 2), MAX("total_score"), MIN("total_score"), SUM("total_score")
FROM "players"
GROUP BY "zone"
HAVING COUNT(*) >= 5
ORDER BY AVG("total_score") DESC;

-- EX 27
-- Encontre as first_position cuja: média de total_score seja maior que 65; média de passing_score seja maior que 8. Mostre as duas médias arredondadas para 2 casas e ordene pela média de total_score.
SELECT "first_position", ROUND(AVG("total_score"), 2), ROUND(AVG("passing_score"), 2)
FROM "players"
GROUP BY "first_position"
HAVING AVG("total_score") > 65 AND AVG("passing_score") > 8
ORDER BY AVG("total_score") DESC;

-- EX 28
-- Aumente em 1 ponto o speed_score de todos os jogadores que tenham speed_score menor ou igual a 7. Depois, faça um SELECT para conferir os jogadores alterados.
UPDATE "players"
SET "speed_score" = "speed_score" + 1
WHERE "speed_score" <= 7;

SELECT "name", "speed_score"
FROM "players";

-- EX 29
-- Aumente em 2 pontos o physical_score dos jogadores que: tenham physical_score menor que 9; e total_score entre 60 e 68. Depois, liste os jogadores afetados.
UPDATE "players"
SET "physical_score" = "physical_score" + 2
WHERE "physical_score" < 9 AND "total_score" BETWEEN 60 AND 68;

SELECT "name", "physical_score"
FROM "players";

-- EX 30
-- Considere que jogadores com total_score >= 72 devem receber 1 ponto adicional em intelligence_score, mas somente se o intelligence_score atual for menor que 10. Faça o UPDATE e depois crie uma consulta que mostre: name; total_score; intelligence_score; zone; somente dos jogadores que foram afetados, ordenados pelo intelligence_score decrescente.
UPDATE "players"
SET "intelligence_score" = "intelligence_score" + 1
WHERE "total_score" >= 72 AND "intelligence_score" < 10;

SELECT "name", "total_score", "intelligence_score", "zone"
FROM "players"
ORDER BY "intelligence_score" DESC;

-- ROLLUP

-- EX 31
-- Mostre a soma de total_score agrupada por generation e zone, incluindo os subtotais de cada geração e o total geral.
SELECT "generation", "zone", SUM("total_score")
FROM "players"
GROUP BY ROLLUP ("generation", "zone");

-- EX 32
-- Mostre a quantidade de jogadores por origin_team e generation, incluindo os subtotais por equipe e o total geral.
SELECT "origin_team", "generation", COUNT(*)
FROM "players"
GROUP BY ROLLUP ("origin_team", "generation");

-- EX 33
-- Calcule a média de shooting_score agrupada por generation e best_foot. Inclua os subtotais por geração e a média geral. Arredonde as médias para 2 casas decimais.
SELECT "generation", "best_foot", ROUND(AVG("shooting_score"), 2)
FROM "players"
GROUP BY ROLLUP ("generation", "best_foot");

-- CUBE

-- EX 34
-- Mostre a soma de total_score por generation e zone, incluindo todas as combinações de subtotais possíveis e o total geral.
SELECT "generation", "zone", SUM("total_score")
FROM "players"
GROUP BY CUBE ("generation", "zone");

-- EX 35
-- Calcule a quantidade de jogadores por origin_team e best_foot, incluindo subtotais por equipe, subtotais por pé dominante e total geral.
SELECT "origin_team", "best_foot", COUNT(*)
FROM "players"
GROUP BY CUBE ("origin_team", "best_foot");

-- EX 36
-- Calcule a média de speed_score por generation e first_position, incluindo todas as combinações de subtotais. Ordene os resultados por geração e posição.
SELECT "generation", "first_position", AVG("speed_score")
FROM "players"
GROUP BY CUBE ("generation", "first_position")
ORDER BY ("generation", "first_position");

-- RANK

-- EX 37
-- Crie um ranking dos jogadores por total_score, do maior para o menor. Exiba name, total_score e a posição no ranking. Jogadores empatados devem receber a mesma posição, com possíveis saltos nas posições seguintes.
SELECT "name", "total_score", RANK() OVER (ORDER BY "total_score" DESC)
FROM "players";

-- EX 38
-- Crie um ranking dos jogadores dentro de cada generation, ordenado por shooting_score decrescente. Exiba o nome, a geração, a pontuação de chute e a posição no ranking.
SELECT "name", "generation", "shooting_score", RANK() OVER (ORDER BY "shooting_score" DESC)
FROM "players";

-- EX 39
-- Calcule a média de total_score de cada origin_team e crie um ranking das equipes, da maior média para a menor. Arredonde a média para 2 casas decimais, mas faça o ranking com base na média não arredondada.
SELECT "origin_team", ROUND(AVG("total_score"), 2), RANK() OVER (ORDER BY AVG("total_score") DESC) AS "ranking"
FROM "players"
GROUP BY "origin_team";

-- DENSE_RANK

-- EX 40
-- Crie um ranking geral por total_score, do maior para o menor, usando DENSE_RANK. Exiba o nome, a pontuação e a posição.
SELECT "name", "total_score", "first_position", DENSE_RANK() OVER (ORDER BY "total_score" DESC)
FROM "players";

-- EX 41
-- Crie um ranking de speed_score dentro de cada zone, do maior para o menor, sem saltos nas posições. Exiba apenas os jogadores classificados nas três primeiras posições de cada zona, incluindo empates.
WITH "best" AS (
	SELECT
		"name",
		"speed_score",
		"zone",
		DENSE_RANK() OVER (PARTITION BY "zone" ORDER BY "speed_score" DESC) AS "position"
	FROM "players"
)
SELECT "name", "speed_score", "zone", "position"
FROM "best"
WHERE "position" <= 3;

-- EX 42
-- Crie um ranking dos jogadores dentro de cada best_foot, considerando dribbling_score em ordem decrescente. Exiba nome, pé dominante, pontuação e posição no ranking.
SELECT "name", "best_foot", "dribbling_score", DENSE_RANK() OVER (PARTITION BY "best_foot" ORDER BY "dribbling_score" DESC) AS "position"
FROM "players";

-- FIRST_VALUE

-- EX 43
-- Para cada jogador, exiba seu nome, geração, total_score e a maior pontuação de sua geração. Utilize FIRST_VALUE com uma janela particionada por geração.
SELECT
	"name",
	"generation",
	"total_score",
	FIRST_VALUE("total_score") OVER (
        PARTITION BY "generation"
        ORDER BY "total_score" DESC
    )
FROM "players";

-- EX 44
-- Exiba todos os jogadores junto com o maior shooting_score de sua zona e o nome do jogador que possui essa pontuação. Utilize FIRST_VALUE para obter o nome, ordenando a janela pela pontuação de chute decrescente. Em caso de empate, você pode usar name como critério secundário.
SELECT
	"name",
	"zone",
	"shooting_score",
	FIRST_VALUE("shooting_score") OVER (
        PARTITION BY "zone"
        ORDER BY ("shooting_score", "name") DESC
    ) AS "number_max_shooting",
	FIRST_VALUE("name") OVER (
        PARTITION BY "zone"
        ORDER BY ("shooting_score", "name") DESC
    ) AS "name_max_shooting"
FROM "players";

-- EX 45
-- Para cada jogador, mostre sua altura e a maior altura registrada na respectiva geração, utilizando FIRST_VALUE. Ordene a janela pela altura decrescente.
SELECT
	"name",
	"height",
	FIRST_VALUE("height") OVER (
        PARTITION BY "generation"
        ORDER BY "height" DESC
    )
FROM "players";

-- ROW_NUMBER

-- EX 46
-- Numere todos os jogadores com ROW_NUMBER, ordenando por total_score decrescente e, em caso de empate, por name crescente.
SELECT "name", "total_score", ROW_NUMBER() OVER (ORDER BY "total_score" DESC, "name" ASC)
FROM "players";

-- EX 47
-- Exiba os três primeiros jogadores de cada geração, considerando total_score decrescente. Utilize ROW_NUMBER particionado por generation.
WITH "top" AS (
	SELECT "name", "generation", ROW_NUMBER() OVER (PARTITION BY "generation" ORDER BY "total_score" DESC) AS "position"
	FROM "players"
)
SELECT "name", "generation", "position"
FROM "top"
WHERE "position" <= 3;

-- EX 48
-- Numere os jogadores separadamente dentro de cada origin_team, ordenando por height decrescente. Exiba nome, equipe, altura e número atribuído.
SELECT "name", "origin_team", "height", ROW_NUMBER() OVER (PARTITION BY "origin_team" ORDER BY "height" DESC)
FROM "players";

-- LAG

-- EX 49
-- Ordene os jogadores por total_score crescente e mostre, para cada jogador, sua pontuação e a pontuação do jogador anterior nessa ordenação. Utilize LAG.
SELECT
	"name",
	"total_score",
	LAG("total_score", 1, 0) OVER (ORDER BY "total_score" ASC) AS "previous_total_score"
FROM "players";

-- EX 50
-- Ordene os jogadores por total_score decrescente dentro de cada generation. Exiba a pontuação atual, a pontuação do jogador anterior e a diferença entre as duas.
WITH "players_with_lag" AS (
    SELECT
        "name",
        "generation",
        "total_score",
        LAG("total_score", 1, 0) OVER (
            PARTITION BY "generation" 
            ORDER BY "total_score" DESC
        ) AS "previous_total_score"
    FROM "players"
)
SELECT
    "name",
    "generation",
    "total_score",
    "previous_total_score",
    ("total_score" - "previous_total_score")
FROM "players_with_lag";

-- EX 51
-- Dentro de cada origin_team, ordene os jogadores por altura crescente. Mostre a altura atual, a altura anterior e a diferença entre elas utilizando LAG.
WITH "players_with_lag" AS (
    SELECT
        "name",
        "origin_team",
        "height",
        LAG("height", 1, 0) OVER (
            PARTITION BY "origin_team" 
            ORDER BY "height" DESC
        ) AS "previous_height"
    FROM "players"
)
SELECT
    "name",
    "origin_team",
    "height",
    "previous_height",
    ("height" - "previous_height")
FROM "players_with_lag";

-- LEAD

-- EX 52
-- Ordene todos os jogadores por total_score decrescente e mostre, para cada um, sua pontuação e a pontuação do próximo jogador na ordenação. Utilize LEAD.
SELECT
	"name",
	"total_score",
	LEAD("total_score", 1, 0) OVER (ORDER BY "total_score" DESC) AS "next_total_score"
FROM "players";

-- EX 53
-- Dentro de cada generation, ordene os jogadores por shooting_score decrescente. Exiba a pontuação atual, a pontuação do próximo jogador e a diferença entre elas.
WITH "construction" AS (
SELECT
	"name",
	"shooting_score",
	LEAD("shooting_score", 1, 0) OVER (PARTITION BY "generation" ORDER BY "shooting_score" DESC) AS "next_shooting_score"
FROM "players"
)
SELECT 
	"name",
	"shooting_score",
	"next_shooting_score",
	("shooting_score"-"next_shooting_score")
FROM "construction";

-- EX 54
-- Dentro de cada origin_team, ordene os jogadores por number crescente. Mostre o nome e o número do jogador atual, além do nome e do número do próximo jogador, utilizando LEAD.
SELECT
	"name",
	"number",
	LEAD("number", 1, 0) OVER (PARTITION BY "origin_team" ORDER BY "number" ASC) AS "next_number"
FROM "players";
