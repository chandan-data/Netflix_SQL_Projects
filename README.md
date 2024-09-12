# Netflix Movies And Tv Shows Data Analysis using SQL

![Netflix Image](https://github.com/chandan-data/Netflix_SQL_Projects/blob/main/Netflix_image.jpg)

## Project Description
This project analyzes Netflix's dataset using SQL to gain insights into the platform's content. It includes extracting data on movies and TV shows, exploring their durations, genres, release years, and much more. This analysis aims to provide a better understanding of Netflix's catalog and content trends.

## Tech Stack
1. SQL (PostgreSQL)
2. Git for version control


## Dataset
The analysis is based on a dataset that contains detailed information about Netflix's movie and TV show content. The table structure includes the following columns:

+ title: The name of the movie or TV show.
+ type: Specifies whether the content is a "Movie" or "TV Show".
+ director: The director(s) of the movie or TV show. Some entries may have this field as null.
+ casts: The main cast of the movie or TV show, listed as a string of names.
+ country: The country or countries where the content was produced.
+ date_added: The date when the content was added to Netflix.
+ release_year: The year when the movie or TV show was originally released.
+ rating: The rating assigned to the movie or TV show (e.g., PG, R, TV-14).
+ duration: The duration of the content (e.g., "90 min" for movies or "3 Seasons" for TV shows).
+ listed_in: The genre or categories the content falls under, such as "Documentaries", "Comedies", "Action & Adventure".
+ description: A brief summary or description of the content.



## SQL Queries Overview
The following are the key SQL queries included in this project:

1. Count the number of Movies vs TV Shows
  + Query that counts and compares the number of movies and TV shows on Netflix.

3. Find the most common rating for Movies and TV Shows
  + Identifies the most frequent rating for each type of content.

3. List Movies released in a specific year (e.g., 2020)
  + Retrieves all movies released in a given year (e.g., 2020).

4. Top 5 countries with the most content on Netflix
  + Finds the top 5 countries with the largest number of content items on Netflix.

5. Identify the longest Movies
  + Fetches the longest movie on Netflix based on duration.

6. Content added in the last 5 years
  + Lists content that was added to Netflix in the last 5 years.

7. Movies and TV shows by director 'Rajiv Chilaka'
  + Lists all movies and TV shows directed by Rajiv Chilaka.

8. TV shows with more than 5 seasons
  + Retrieves all TV shows that have more than 5 seasons.

9. Count content in each genre
  + Counts the number of content items in each genre.

10. Top 5 years for content released by India
  + Calculates the top 5 years with the highest average content releases from India.

11. List of Documentaries
  + Lists all movies that are categorized as documentaries.

12. Content without a director
  + Fetches all content where the director information is missing.

13. Movies featuring actor 'Salman Khan' in the last 10 years
  + Lists all movies featuring Salman Khan that were released in the last 10 years.

14. Top 10 actors in Indian Movies
  + Identifies the top 10 actors who appeared in the most Indian movies on Netflix.

15. Categorizing content by keywords 'Kill' and 'Violence'
  + Labels content as 'BadContent' if it contains the keywords 'kill' or 'violence'; otherwise, it is labeled as 'GoodContent'.
