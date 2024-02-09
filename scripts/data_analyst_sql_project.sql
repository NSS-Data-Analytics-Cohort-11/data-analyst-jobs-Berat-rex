
-- --1. How many rows are in the data_analyst_jobs table?
-- SELECT COUNT(*)
-- FROM data_analyst_jobs;
-- --ANSWER: 1793 rows



-- --2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- SELECT *
-- FROM data_analyst_jobs
-- LIMIT 10;
-- --ANSWER: ExxonMobil



-- --3a. How many postings are in Tennessee?
-- SELECT COUNT(location)
-- FROM data_analyst_jobs
-- WHERE location = 'TN';
-- --ANSWER: There are 21 postings in TN.
--
-- --3b. How many are there in either Tennessee or Kentucky?
-- SELECT COUNT(location)
-- FROM data_analyst_jobs
-- --HERE location in ('TN', 'KY') -->NOTE: this code can also be used to find the answer
-- WHERE location = 'TN' OR location =  'KY';
-- --ANSWER: There are 27 postings total in KY(6) and TN(21).



-- --4. How many postings in Tennessee have a star rating above 4?
-- SELECT star_rating, location
-- FROM data_analyst_jobs
-- where star_rating >4 and location = 'TN';
-- --ANSWER: 3 postings.



-- --5. How many postings in the dataset have a review count between 500 and 1000?
-- SELECT count(review_count)
-- FROM data_analyst_jobs
-- WHERE review_count between 500 and 1000;
-- --ANSWER: There are 151 postings with review count bwtween 500 and 1000.



-- --6a. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating.
-- SELECT company, location as state, avg(star_rating) as avg_rating
-- from data_analyst_jobs
-- GROUP BY company, location;
--
-- --6b. Which state shows the highest average rating?
-- SELECT company, location as state, avg(star_rating) as avg_rating
-- from data_analyst_jobs
-- WHERE star_rating IS NOT NULL
-- GROUP BY company, location
-- ORDER BY avg_rating DESC;
-- --ANSWER: The state with the highest average rating is CA(California).



-- --7. Select unique job titles from the data_analyst_jobs table. How many are there?
-- SELECT count(distinct title) as unique_job_titles
-- FROM data_analyst_jobs;
-- --ANSWER: There are 881 unique job titles.



-- --8. How many unique job titles are there for California companies?
-- SELECT count(distinct title) as unique_job_titles
-- FROM data_analyst_jobs
-- WHERE location = 'CA';
-- --ANSWER: There are 230 unique job titles for California companies.



-- --9a. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations.
-- SELECT company, review_count, location, avg(star_rating) as avg_star_rating
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- GROUP BY company, review_count, location

--9b. How many companies are there with more that 5000 reviews across all locations?
SELECT company, count(review_count), location, avg(star_rating) as avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company, review_count, location












