-- Q1. Find how much amount spent by each customer on artists? Write a 
-- query to return customer name, artist name and total spent
WITH best_selling_price AS(
SELECT artist.artist_id as artist_id, artist.name as artist_name,
SUM(invoice_line.unit_price * invoice_line.quantity) as total_sales
FROM invoice_line
JOIN track on invoice_line.track_id=track.track_id
JOIN album on track.album_id=album.album_id
JOIN artist on album.artist_id=artist.artist_id
GROUP by 1
ORDER by 3 desc
LIMIT 1
)

SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name,
SUM(il.unit_price*il.quantity) as amount_spent
FROM customer c
join invoice i on i.customer_id=c.customer_id
join invoice_line il on il.invoice_id = i.invoice_id
join track t on t.track_id=il.track_id
join album alb on alb.album_id = t.album_id
join best_selling_price bsa on bsa.artist_id=alb.artist_id
group by 1,2,3,4
order by 5 desc;

SElect * from invoice_line