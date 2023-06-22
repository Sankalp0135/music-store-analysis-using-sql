 Q1: Who is the senior most employee based on job title? 

SELECT title, last_name, first_name FROM employee
ORDER BY levels DESC
LIMIT 1


 Q2: Which countries have the most Invoices? 

SELECT COUNT(*) AS c, billing_country 
FROM invoice
GROUP BY billing_country
ORDER BY c DESC


 Q3: What are top 3 values of total invoice? 

SELECT total 
FROM invoice
ORDER BY total DESC

Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals

select sum(total) as s , billing_city  from invoice
group by billing_city
order by s Desc

Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.

select  customer.customer_id, customer.first_name , customer.last_name , sum(invoice.total) as san
from customer join invoice
on invoice.customer_id = customer.customer_id
group by customer.customer_id
order by san Desc
limit 1

Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A.

SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email

Q7: Let invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS num_songs
FROM track join album on track.album_id = album.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
GROUP BY artist.artist_id
ORDER BY num_songs DESC
LIMIT 10

Q8: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

select name,milliseconds FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) FROM track )
ORDER BY milliseconds DESC