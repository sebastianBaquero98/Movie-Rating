(SELECT
    name as results
FROM
    MovieRating as a INNER JOIN Users as b USING(user_id)
GROUP BY
    a.user_id
ORDER BY
    COUNT(DISTINCT(movie_id)) DESC, name ASC
LIMIT 1)

UNION ALL
(SELECT
    title as results
FROM
    MovieRating as a INNER JOIN Movies as b USING(movie_id)
WHERE
    a.created_at >= "2020-02-01" AND a.created_at <= "2020-02-29"
GROUP BY
    a.movie_id
ORDER BY
    AVG(rating) DESC, title ASC 
LIMIT 1)
