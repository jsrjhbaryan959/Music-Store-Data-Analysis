-- Q1. Write a query to return the email, first_name, last name, & Genre of all Rock Music listeners.
-- Return the list ordered alphabetically by email starting with A
select distinct email, first_name, last_name
from customer
join invoice on invoice.customer_id=customer.customer_id
join invoice_line on invoice_line.invoice_id=invoice.invoice_id
where track_id in(
select track_id from track
join genre on track.genre_id=genre.genre_id
where genre.name='Rock')
order by email;

-- or

-- select distinct email, first_name, last_name
-- from customer
-- join invoice on invoice.customer_id=customer.customer_id
-- join invoice_line on invoice_line.invoice_id=invoice.invoice_id
-- join track on track.track_id = invoice_line.track_id
-- join genre on track.genre_id=genre.genre_id
-- where genre.name='Rock'
-- order by email;

-- select * from invoice

-- select distinct email, first_name, last_name from customer
-- join invoice on customer.customer_id = invoice.customer_id
-- join invoice_line on invoice_line.invoice_id=invoice.invoice_id
-- where track_id in(
-- select track_id from track
-- join genre on genre.genre_id=track.genre_id
-- where genre.name = 'Rock')
-- order by email;


-- Q2. Let's invite the artists who have written the most rock music in 
-- our dataset. Write a query that returns the Artist name and total
-- track count of the top 10 rock bands.
select distinct artist.name, COUNT(track.track_id) AS total
from artist
join album on artist.artist_id=album.artist_id
join track on album.album_id=track.album_id
where track_id in(
select track_id from track
join genre on track.genre_id=genre.genre_id
where genre.name = 'Rock'
)
group by artist.name
order by total desc
limit 10

-- Or

-- select artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
-- FROM track
-- JOIN album ON album.album_id=track.album_id
-- JOIN artist ON artist.artist_id=album.artist_id
-- JOIN genre ON genre.genre_id=track.genre_id
-- WHERE genre.name='Rock'
-- GROUP BY artist.artist_id
-- ORDER BY number_of_songs DESC
-- limit 10

-- COUNT(track.track_id) AS total FROM track
-- WHERE genre.name = 'Rock';

-- Q3. Return all the track names that have a song length longer than the average song
-- length. Return the Name and Milliseconds for each track. Order by the song length 
-- with the longest songs listed first.


select name, milliseconds from track
where milliseconds > (select avg(milliseconds) as average from track) 
ORDER by milliseconds DESC

SELECT AVG(track.milliseconds) as averag from track
select name from track