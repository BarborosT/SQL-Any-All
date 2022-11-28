1.Film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
Select COUNT(*) from film
where length > 
(
		Select avg(length) from film
);

2. film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
Select COUNT(*) From film
where rental_rate=
(
		select max(rental_rate) from film
);

3.film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.

Select * from film
where rental_rate =
(
		Select MIN(rental_rate) from film
)
and replacement_cost = ANY
(
		Select MIN(replacement_cost) from film
)

4.payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
Select C.first_name, C.last_name from payment P
INNER JOIN customer C 
ON P.customer_id = C.customer_id 
where P.amount =
(
	SELECT MAX(Amount) from payment
);