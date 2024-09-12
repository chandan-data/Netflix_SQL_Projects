-- 1. Count the number of Movies vs TV Shows
SELECT 
	type,
	COUNT(*) AS number_of_content
FROM netflix
GROUP BY type;


-- 2. Find the most common rating for movies and TV shows
SELECT 
	type,
	rating
FROM
(SELECT 
	type,
	rating,
	count(*),
	RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
FROM netflix
GROUP BY 1,2)
WHERE rank_rating = 1;


-- 3. List all the Movies released in a specific year (e.g. 2020)
SELECT 
	title
FROM netflix
WHERE release_year = 2020
	  AND
	  type = 'Movie';


-- 4. Find the top 5 countries with the most content on Netflix
SELECT 
	UNNEST(STRING_TO_ARRAY(country,',')),
	COUNT(*)
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- 5. Identify the longest Movies
SELECT 
	title,
	(SELECT SUBSTRING(duration FROM '^[0-9]+'):: INT AS duration_min) AS duration_in_minutes
FROM netflix
WHERE type = 'Movie'
	  AND
	  duration IS NOT NULL
ORDER BY 2 DESC
LIMIT 1;



-- 6. find the content added in the last 5 years
SELECT 
	title,
	date_added
FROM netflix
WHERE 
	TO_DATE(date_added,'Month DD, YYYY') >= (SELECT CURRENT_DATE - INTERVAL '5 years');


-- 7. Find all the movies and tv shows by director 'Rajiv Chilaka'
SELECT 
	type,
	title,
	director
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%';


-- 8. List all TV shows with more than 5 season
SELECT
	title,
	duration
FROM netflix
WHERE 
	type = 'TV Show'
	AND
	SPLIT_PART(duration,' ',1)::INT > 5;


-- 9. Count the number of content items in each genre
SELECT
	UNNEST(STRING_TO_ARRAY(listed_in,',')) AS genre,
	COUNT(show_id) as number_of_content
FROM netflix
GROUP BY 1;


-- 10. Find each year and the average numbers of content release by India on netflix. Return top 5 year with highest avg content release
SELECT 
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
	COUNT(*) AS yearly_number_of_content,
	ROUND(COUNT(*)::NUMERIC/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::NUMERIC * 100,2) AS average_content_per_year
FROM netflix
WHERE 
	country = 'India'
GROUP BY 1
ORDER BY average_content_per_year DESC;


-- 11. List all the Movies that are documentaries
SELECT 
	title
FROM netflix
WHERE 
	type = 'Movie'
	AND
	listed_in ILIKE '%Documentaries%';

-- 12. Find all content without a director
SELECT 
	type,
	title
FROM netflix
WHERE 
	director IS NULL;


-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years
SELECT 
	title,
	release_year
FROM netflix
WHERE 
	casts ILIKE '%Salman Khan%'
	AND 
	release_year >= EXTRACT(YEAR FROM (SELECT CURRENT_DATE - INTERVAL '10 years'));



-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actors,
	COUNT(*) AS appeared_in_highest_movies
FROM netflix
WHERE type = 'Movie'
	  AND
	  country ILIKE '%India%'
GROUP BY actors
ORDER BY 2 DESC
LIMIT 10;



-- 15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description
-- field. Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many items 
-- fall into each category.
WITH 
	new_table
AS
(SELECT 
*,
	CASE
	WHEN description ILIKE '%Kill%'
		 OR
		 description ILIKE '%Violence%'
	THEN 'BadContent'
	ELSE 'GoodContent'
	END AS Content_Type
FROM netflix)

SELECT 
	Content_Type,
	COUNT(*) AS number_of_content
FROM new_table
GROUP BY 1;