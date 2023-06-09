-- 4.1 aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.

INSERT INTO public.customer
(store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES(0, '', '', '', 0, true, 'now'::text::date, now(), 0);

UPDATE public.customer
SET store_id=0, first_name='', last_name='', email='', address_id=0, activebool=true, create_date='now'::text::date, last_update=now(), active=0
WHERE customer_id=nextval('customer_customer_id_seq'::regclass);

DELETE FROM public.customer
WHERE customer_id=nextval('customer_customer_id_seq'::regclass);

INSERT INTO public.staff
(first_name, last_name, address_id, email, store_id, active, username, "password", last_update, picture)
VALUES('', '', 0, '', 0, true, '', '', now(), ?);

UPDATE public.staff
SET first_name='', last_name='', address_id=0, email='', store_id=0, active=true, username='', "password"='', last_update=now(), picture=?
WHERE staff_id=nextval('staff_staff_id_seq'::regclass);

DELETE FROM public.staff
WHERE staff_id=nextval('staff_staff_id_seq'::regclass);

INSERT INTO public.actor
(first_name, last_name, last_update)
VALUES('', '', now());

UPDATE public.actor
SET first_name='', last_name='', last_update=now()
WHERE actor_id=nextval('actor_actor_id_seq'::regclass);

DELETE FROM public.actor
WHERE actor_id=nextval('actor_actor_id_seq'::regclass);


-- 4.2 listar todas las "rental" con los datos del "customer" dado un año y mes.

SELECT rental.*, customer.*
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT (YEAR FROM  rental.rental_date) = '' AND EXTRACT (MONTH FROM rental.rental_date) = '';


-- 4.3 listar Número, Fecha(payment_date) y Total(amount) de todas las "payment"

SELECT payment_id AS Número,
       payment_date AS Fecha, 
       amount AS Total
FROM Payment
GROUP BY payment_id, payment_date
order by payment_date;

-- 4.4 listar todas las "film" del año 2006 que contengan un (rental_rate) mayor a 4.0

SELECT  * 
FROM  film f 
WHERE release_year = 2006 AND rental_rate > 4


-- 5 realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y si su tipo de dato correpondiene

SELECT table_name, column_name, is_nullable, data_type
FROM information_schema.COLUMNS
WHERE table_schema = 'public';
