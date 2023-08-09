-- uso el hacker de la subquerie q ya esta filtrado por max score en su desafios
SELECT sub.hacker_id, h.name, SUM(sub.max_score) AS total_score
-- En la subquerie consigo el maximo por desafio por hacker que uso como sub.
FROM (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM submissions
    WHERE score > 0
    GROUP BY hacker_id, challenge_id
) sub
-- Hago la union con la tabla de hackers para adquirir los nombres
JOIN Hackers h 
 ON sub.hacker_id = h.hacker_id
GROUP BY sub.hacker_id, h.name
ORDER BY total_score DESC, sub.hacker_id;