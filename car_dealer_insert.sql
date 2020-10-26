INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	phone_number,
	email
)VALUES(
	1,
	'Shai',
	'LeBouf',
	'312-555-1234',
	'beebumble@hotmail.com'
);
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	phone_number,
	email
)VALUES(
	2,
	'Terrell',
	'McKinney',
	'312-555-234',
	'terrell@gmail.com'
);


INSERT INTO salesperson(
	salesperson_id,
	first_name,
	last_name,
	phone_number
)VALUES(
	1,
	'Chris',
	'Gardner',
	'312-555-1235'
);

INSERT INTO salesperson(
	salesperson_id,
	first_name,
	last_name,
	phone_number
)VALUES(
	2,
	'Josh',
	'McGowan',
	'312-555-1236'
);


CREATE OR REPLACE PROCEDURE carCreate(
	car_id INTEGER,
	car_color VARCHAR(50),
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year INTEGER,
	car_price NUMERIC(8,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car
	VALUES(car_id, car_color, car_make,car_model, car_year, car_price);
COMMIT;
END;
$$


CREATE OR REPLACE PROCEDURE service_historyCreate(
	car_id INTEGER,
	service_history_id INTEGER,
	date_fixed VARCHAR(50),
	
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car
	VALUES(car_id, car_color, car_make,car_model, car_year, car_price);
COMMIT;
END;
$$
 

CALL carCreate(
	'1',
	'rust',
	'Oldsmobile',
	'Cutlass Supreme',
	'1989',
	'600.00'
)

CALL carCreate(
	'2',
	'lemonade yellow',
	'Lamborghini',
	'Aventador',
	'2020',
	'500000.00'
)

--CREATING PROCEDURE FOR PARTS TABLE
CREATE OR REPLACE PROCEDURE infoForPart(
	part_id INTEGER,
	part_name VARCHAR(100),
	part_cost NUMERIC(5,2)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO part
	VALUES(part_id, part_name,part_cost);
	COMMIT;
END;
$$

CALL infoForPart(1,'Serpentine Belt',23.95);
CALL infoForPart(2,'floormats',350.97);

SELECT * 
FROM parts
--^^end of parts table^^
--CREATING PROCEDURE FOR PARTS_USED TABLE
CREATE OR REPLACE PROCEDURE infoForPart_used(
	parts_used_id INTEGER,
	part_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO part_used
	VALUES(part_used_id, part_id);
	COMMIT;
END;
$$

CALL infoForPart_used(1,1);
CALL infoForPart_used(2,2);

SELECT *
FROM part_used
--^^end of parts table^^
--CREATING PROCEDURE FOR SERVICES TABLE
CREATE OR REPLACE PROCEDURE updateService(
	service_id INTEGER,
	service_name VARCHAR(100),
	hourly_rate VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service
	VALUES(service_id,service_name,hourly_rate);
	COMMIT;
END;
$$

CALL updateService(1,'Replace filter','$19/hr');
CALL updateService(2,'Replace sparkplugs','$20/hr');

SELECT * 
FROM service
--^^end of service table^^
--CREATING PROCEDURE FOR MECHANIC TABLE
CREATE OR REPLACE PROCEDURE updateMechanic(
	mechanic_id INTEGER,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(15)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO mechanic
	VALUES(mechanic_id,first_name,last_name,phone_number);
	COMMIT;
END;
$$

CALL updateMechanic(1,'Joe','Stooge','312-123-2455');
CALL updateMechanic(2,'Larry','Stooge','312-123-2245');

SELECT *
FROM mechanic
--^^end of mechanic table^^
--CREATING PROCEDURE FOR SERVICE_TO_MECHANIC TABLE
CREATE OR REPLACE PROCEDURE insertService_to_Mechanic(
	service_to_mechanic_id INTEGER,
	service_id INTEGER,
	mechanic_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_to_mechanic
	VALUES(service_to_mechanic_id,service_id,mechanic_id);
	COMMIT;
END;
$$

CALL insertService_to_Mechanic(1,1,2)
CALL insertService_to_Mechanic(2,2,1)

select *
from service_to_mechanic
--^^end of service to mechanic table^^
--CREATING PROCEDURE FOR SERVICE TICKET TABLE
CREATE OR REPLACE PROCEDURE insertService_Ticket(
	ticket_id INTEGER,
	expected_return_date DATE,
	issue_with_car VARCHAR(150),
	customer_id INTEGER,
	car_id INTEGER,
	service_to_mechanic_id INTEGER,
	parts_used_to INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_ticket
	VALUES(ticket_id,expected_return_date,issue_with_car,customer_id,car_id,service_to_mechanic_id,parts_used_to);
	COMMIT;
END;
$$

CALL insertService_Ticket(1,'2020-07-11','Needs new filter',1,1,1,1)
CALL insertService_Ticket(2,'2020-07-12','Needs new sparkplugs',2,2,2,2)

SELECT * 
FROM service_ticket
--^^end of service to mechanic table^^
--CREATING DATA FOR INVOICE TABLE
INSERT INTO invoice(
	invoice_id,
	salesperson_id,
	car_id,
	customer_id
)
VALUES(
	1,
	1,
	1,
	1
);

INSERT INTO invoice(
	invoice_id,
	salesperson_id,
	car_id,
	customer_id
)
VALUES(
	2,
	2,
	2,
	2
);
--^^end of invoice table^^
--CREATING PROCEDURE FOR SERVICE_HISTORY TABLE
CREATE OR REPLACE PROCEDURE insertService_history(
	service_history_id INTEGER,
	date_fixed VARCHAR(10),
	car_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_history
	VALUES(service_history_id,date_fixed,car_id);
	COMMIT;
END;
$$

CALL insertService_history(1,'10/22/2020',1)
CALL insertService_history(2,'10/25/2020',2)

SELECT * 
FROM service_history