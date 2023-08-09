--  PARA ESTE EJERCICIO APRENDI BASICO SQL, JOINS AGGREGATIONS Y ALGO DE SUBQUERIES, 
-- EL CONOCIMIENTO ADQUIRIDO ME PERMITIO REALIZAR CORRECTAMENTE EL EJERCICIO 

-- selecciono los dos columnas q deseo
SELECT s.hacker_id, h.name
-- tomo la tabla mas importante a mi parecer y las uno a todas para poder juntar informaciones
FROM Submissions AS s
JOIN hackers AS h
 ON s.hacker_id = h.hacker_id
JOIN Challenges AS c
 ON s.challenge_id = c.challenge_id
JOIN Difficulty AS d
 ON c.difficulty_level = d.difficulty_level
-- Pongo la condicion que los score en submissions sean iguales a su max score propuesto en dificultad
-- como estan unidas las tablas, cada desafio esta unido a su nivel y por lo tanto su max-score
WHERE s.score = d.score
-- Agrego el GROUP BY Porque necesito usar un COUNT aggregation function
GROUP BY s.hacker_id, h.name
-- Cuento los score que ya tiene la condicion WHERE y cuando sean dos o mas se agreguen  
 HAVING COUNT(s.score)>1  
--  Ordeno por cantidad de scores de forma desc y luego si son igual por el id del hacker
ORDER BY COUNT(s.score) DESC, s.hacker_id;