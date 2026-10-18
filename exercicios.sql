-- EX 1
-- Mostre a quantidade de jogadores por generation. Ordene da geração com mais jogadores para a com menos.
SELECT "generation", COUNT(*) AS "amount"
FROM "players"
GROUP BY "generation"
ORDER BY "amount" DESC;

-- EX 2
-- Calcule a altura média dos jogadores de cada generation. Arredonde o resultado para 2 casas decimais.

-- EX 3
-- Para cada zone, mostre a menor e a maior altura dos jogadores.

-- EX 4
-- Calcule a média de total_score por zone. Ordene da maior média para a menor.

-- EX 5
-- Calcule a soma dos total_score de cada generation. Ordene pelo maior valor total.

-- EX 6
-- Mostre a quantidade de jogadores agrupada por generation e best_foot.

-- EX 7
-- Calcule a média de speed_score, passing_score e shooting_score para cada zone.

-- EX 8
-- Para cada origin_team, mostre o menor e o maior total_score.

-- EX 9
-- Mostre a média de dribbling_score por first_position, ordenando da maior média para a menor.

-- EX 10
-- Para cada birth_place, mostre: quantidade de jogadores; altura média; média de total_score. Ordene pela média de total_score decrescente.

-- EX 11
-- Mostre apenas as zones cuja média de total_score seja maior que 68.

-- EX 12
-- Mostre apenas os origin_team que possuem mais de 5 jogadores.

-- EX 13
-- Mostre as first_position cuja menor defense_score seja maior ou igual a 7.

-- EX 14
-- Mostre as zones cujo maior shooting_score seja igual a 10.

-- EX 15
-- Liste os jogadores cuja altura esteja entre 180 e 188 cm, inclusive. Ordene pela altura crescente.

-- EX 16
-- Liste os jogadores cujo total_score esteja entre 65 e 72, ordenando do maior para o menor total_score.

-- EX 17
-- Calcule a média de total_score por generation, considerando somente jogadores cuja altura esteja entre 175 e 190 cm.

-- EX 18
-- Calcule a média de shooting_score por zone, considerando jogadores com total_score entre 65 e 75. Mostre apenas zonas cuja média de shooting_score seja maior que 8.

-- EX 19
-- Mostre os origin_team que: possuem pelo menos 5 jogadores; possuem média de total_score maior que 65.

-- EX 20
-- Mostre cada generation com: quantidade de jogadores; média de total_score; maior total_score; menor total_score. Mostre somente gerações cuja média seja maior que 65 e ordene pela média decrescente.

-- EX 21 (Não vou fazer porque é query complex, como ROLLUP, CUBE, RANK, DENSE_RANK, FIRST_VALUE, ROW_NUMBER, LAG e LEAD)
-- Liste os jogadores cujo total_score seja maior que a média geral de total_score.

-- EX 22 (Não vou fazer porque é query complex, como ROLLUP, CUBE, RANK, DENSE_RANK, FIRST_VALUE, ROW_NUMBER, LAG e LEAD)
-- Liste os jogadores cujo shooting_score seja maior que a média geral de shooting_score. Mostre name, shooting_score e total_score, ordenando pelo shooting_score decrescente.

-- EX 23
-- Encontre o(s) jogador(es) que possuem o maior total_score de toda a tabela.

-- EX 24 (Não vou fazer porque é query complexa, como ROLLUP, CUBE, RANK, DENSE_RANK, FIRST_VALUE, ROW_NUMBER, LAG e LEAD)
-- Encontre o(s) jogador(es) que possuem a menor altura da tabela.

-- query complexa, como ROLLUP, CUBE, RANK, DENSE_RANK, FIRST_VALUE, ROW_NUMBER, LAG e LEAD
-- JOIN
-- procedure, function e trigger

-- EX 25
-- Liste os jogadores cujo total_score seja maior que a média de total_score da própria geração. Exemplo: um jogador da geração 2 deve ser comparado com a média somente dos jogadores da geração 2.

-- EX 26
-- Mostre, para cada zone: quantidade de jogadores; média de total_score, arredondada para 2 casas; maior total_score; menor total_score; soma de total_score. Mostre apenas zonas com pelo menos 5 jogadores e ordene pela média de total_score decrescente.

-- EX 27
-- Encontre as first_position cuja: média de total_score seja maior que 65; média de passing_score seja maior que 8. Mostre as duas médias arredondadas para 2 casas e ordene pela média de total_score.

-- EX 28
-- Aumente em 1 ponto o speed_score de todos os jogadores que tenham speed_score menor ou igual a 7. Depois, faça um SELECT para conferir os jogadores alterados.

-- EX 29
-- Aumente em 2 pontos o physical_score dos jogadores que: tenham physical_score menor que 9; e total_score entre 60 e 68. Depois, liste os jogadores afetados.

-- EX 30
-- Considere que jogadores com total_score >= 72 devem receber 1 ponto adicional em intelligence_score, mas somente se o intelligence_score atual for menor que 10. Faça o UPDATE e depois crie uma consulta que mostre: name; total_score; intelligence_score; zone; somente dos jogadores que foram afetados, ordenados pelo intelligence_score decrescente.

-- ROLLUP

-- EX 31
-- Mostre a soma de total_score agrupada por generation e zone, incluindo os subtotais de cada geração e o total geral.

-- EX 32
-- Mostre a quantidade de jogadores por origin_team e generation, incluindo os subtotais por equipe e o total geral.

-- EX 33
-- Calcule a média de shooting_score agrupada por generation e best_foot. Inclua os subtotais por geração e a média geral. Arredonde as médias para 2 casas decimais.

-- CUBE

-- EX 34
-- Mostre a soma de total_score por generation e zone, incluindo todas as combinações de subtotais possíveis e o total geral.

-- EX 35
-- Calcule a quantidade de jogadores por origin_team e best_foot, incluindo subtotais por equipe, subtotais por pé dominante e total geral.

-- EX 36
-- Calcule a média de speed_score por generation e first_position, incluindo todas as combinações de subtotais. Ordene os resultados por geração e posição.

-- RANK

-- EX 37
-- Crie um ranking dos jogadores por total_score, do maior para o menor. Exiba name, total_score e a posição no ranking. Jogadores empatados devem receber a mesma posição, com possíveis saltos nas posições seguintes.

-- EX 38
-- Crie um ranking dos jogadores dentro de cada generation, ordenado por shooting_score decrescente. Exiba o nome, a geração, a pontuação de chute e a posição no ranking.

-- EX 39
-- Calcule a média de total_score de cada origin_team e crie um ranking das equipes, da maior média para a menor. Arredonde a média para 2 casas decimais, mas faça o ranking com base na média não arredondada.

-- DENSE_RANK

-- EX 40
-- Crie um ranking geral por total_score, do maior para o menor, usando DENSE_RANK. Exiba o nome, a pontuação e a posição.

-- EX 41
-- Crie um ranking de speed_score dentro de cada zone, do maior para o menor, sem saltos nas posições. Exiba apenas os jogadores classificados nas três primeiras posições de cada zona, incluindo empates.

-- EX 42
-- Crie um ranking dos jogadores dentro de cada best_foot, considerando dribbling_score em ordem decrescente. Exiba nome, pé dominante, pontuação e posição no ranking.

-- FIRST_VALUE

-- EX 43
-- Para cada jogador, exiba seu nome, geração, total_score e a maior pontuação de sua geração. Utilize FIRST_VALUE com uma janela particionada por geração.

-- EX 44
-- Exiba todos os jogadores junto com o maior shooting_score de sua zona e o nome do jogador que possui essa pontuação. Utilize FIRST_VALUE para obter o nome, ordenando a janela pela pontuação de chute decrescente. Em caso de empate, você pode usar name como critério secundário.

-- EX 45
-- Para cada jogador, mostre sua altura e a maior altura registrada na respectiva geração, utilizando FIRST_VALUE. Ordene a janela pela altura decrescente.

-- ROW_NUMBER

-- EX 46
-- Numere todos os jogadores com ROW_NUMBER, ordenando por total_score decrescente e, em caso de empate, por name crescente.

-- EX 47
-- Exiba os três primeiros jogadores de cada geração, considerando total_score decrescente. Utilize ROW_NUMBER particionado por generation.

-- EX 48
-- Numere os jogadores separadamente dentro de cada origin_team, ordenando por height decrescente. Exiba nome, equipe, altura e número atribuído.

-- LAG

-- EX 49
-- Ordene os jogadores por total_score crescente e mostre, para cada jogador, sua pontuação e a pontuação do jogador anterior nessa ordenação. Utilize LAG.

-- EX 50
-- Ordene os jogadores por total_score decrescente dentro de cada generation. Exiba a pontuação atual, a pontuação do jogador anterior e a diferença entre as duas.

-- EX 51
-- Dentro de cada origin_team, ordene os jogadores por altura crescente. Mostre a altura atual, a altura anterior e a diferença entre elas utilizando LAG.

-- LEAD

-- EX 52
-- Ordene todos os jogadores por total_score decrescente e mostre, para cada um, sua pontuação e a pontuação do próximo jogador na ordenação. Utilize LEAD.

-- EX 53
-- Dentro de cada generation, ordene os jogadores por shooting_score decrescente. Exiba a pontuação atual, a pontuação do próximo jogador e a diferença entre elas.

-- EX 54
-- Dentro de cada origin_team, ordene os jogadores por number crescente. Mostre o nome e o número do jogador atual, além do nome e do número do próximo jogador, utilizando LEAD.
