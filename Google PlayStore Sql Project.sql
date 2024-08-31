CREATE DATABASE googleplaystore;
USE googleplaystore;

SELECT *
FROM googleplaystore_user_reviews_data;

SELECT *
FROM googleplaystore_data;



--top rated free apps--
SELECT
App,
Rating
FROM googleplaystore_data
WHERE Type ='Free' AND Rating <> 'Nan'
ORDER BY Rating DESC; 



--most reviewed app--
SELECT 
App,
Reviews,
Category
from googleplaystore_data
ORDER BY Reviews DESC;

--averege rating by category--
SELECT
Category,
AVG(Rating) AS average_rating
FROM googleplaystore_data
GROUP BY Category;

--average sentiment polarity by app category--
SELECT 
Category,
AVG(TRY_CAST (Sentiment_Polarity AS FLOAT)) AS avg_sentiment_polarity
FROM googleplaystore_data
JOIN googleplaystore_user_reviews_data
ON googleplaystore_data.App = googleplaystore_user_reviews_data.App
GROUP BY Category
ORDER BY avg_sentiment_polarity DESC;


--sentiment reviews by app category --
SELECT TOP 10
Category,
Sentiment,
COUNT(*) AS total_sentiment
FROM googleplaystore_data
JOIN googleplaystore_user_reviews_data
ON googleplaystore_data.App = googleplaystore_user_reviews_data.App
WHERE Sentiment <> 'nan'
GROUP BY Category, Sentiment
ORDER BY total_sentiment DESC;