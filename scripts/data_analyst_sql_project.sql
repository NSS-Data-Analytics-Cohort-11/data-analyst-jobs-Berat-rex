
--1. How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs;
--ANSWER: 1793 rows.



--2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT company
FROM data_analyst_jobs
LIMIT 10;
--ANSWER: ExxonMobil.



--3a. How many postings are in Tennessee?
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN';
--ANSWER: There are 21 postings in TN.

--3b. How many are there in either Tennessee or Kentucky?
SELECT COUNT(location)
FROM data_analyst_jobs
--WHERE location in ('TN', 'KY') -->NOTE: this code can also be used to find the answer.
WHERE location = 'TN' OR location =  'KY';
--ANSWER: There are 27 postings total in KY(6) and TN(21).



--4. How many postings in Tennessee have a star rating above 4?
SELECT star_rating, location
FROM data_analyst_jobs
where star_rating > 4 and location = 'TN';
--ANSWER: 3 postings.



--5. How many postings in the dataset have a review count between 500 and 1000?
SELECT count(review_count) as review_count
FROM data_analyst_jobs
WHERE review_count between 500 and 1000;
--ANSWER: There are 151 postings with review count bwtween 500 and 1000.



--6a. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating.
SELECT company, location as state, avg(star_rating) as avg_rating
from data_analyst_jobs
GROUP BY company, location;

--6b. Which state shows the highest average rating?
SELECT company, location as state, avg(star_rating) as avg_rating
from data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY company, location
ORDER BY avg_rating DESC;
--ANSWER: The state with the highest average rating is CA(California).



--7. Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT count(distinct title) as unique_job_titles
FROM data_analyst_jobs;
--ANSWER: There are 881 unique job titles.



--8. How many unique job titles are there for California companies?
SELECT count(distinct title) as unique_job_titles
FROM data_analyst_jobs
WHERE location = 'CA';
--ANSWER: There are 230 unique job titles for California companies.



--9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT company, location, review_count, avg(star_rating) as avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company, review_count, location;
--ANSWER: There are 83 companies with more than 5000 reviews across all locations.



--10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, location, review_count, avg(star_rating) as avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company, review_count, location
ORDER BY avg_star_rating DESC
--ANSWER. General Motors from Michigan(MI) has the highest number of rating with an average of 4.1999998090000000.



--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT COUNT(distinct title) as unique_job_titles
FROM data_analyst_jobs
WHERE title iLIKE '%Analyst%'; -->NOTE: I used iLIKE instead of LIKE so it can match case insensitive.
--ANSWER: there are 774 unique job titles that contain the word analyst.



--12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT distinct title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%'
--ANSWER: There are only 4 positions showing. The word that they have in common is Tableau.
	