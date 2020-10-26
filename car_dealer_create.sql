 -- Customer Table Creation
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number INTEGER,
	email VARCHAR(50)
 );
 
 --Salesperson Table Creation
CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number INTEGER
);

--Car Table Creation
CREATE TABLE car(
	car_id SERIAL PRIMARY KEY, 
	car_color VARCHAR(50),
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year INTEGER,
	car_price NUMERIC(8,2)
);

-- Service History Table Creation
CREATE TABLE service_history(
	service_history_id SERIAL PRIMARY KEY,
	date_fixed INTEGER,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id)
);

-- Invoice Table Creation
CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE DEFAULT CURRENT_DATE,
	salesperson_id INTEGER,
	car_id INTEGER,
	customer_id INTEGER,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Mechanic Table Creation
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	mechanic_phone INTEGER
);

--Service Table Creation
CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	service_name VARCHAR(100),
	hourly_rate VARCHAR(100)
);

--Service to Mechanic Table Creation
CREATE TABLE service_to_mechanic(
	service_to_mechanic_id SERIAL PRIMARY KEY,
	service_id INTEGER,
	mechanic_id INTEGER,
	FOREIGN KEY(service_id) REFERENCES service(service_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

-- Part Table Creation
CREATE TABLE part(
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(100),
	part_cost NUMERIC(5,2)
);

-- Part Used Table Creation
CREATE TABLE part_used(
	part_used_id SERIAL PRIMARY KEY,
	part_id INTEGER,
	FOREIGN KEY(part_id) REFERENCES part(part_id)
);

-- Service Ticket Table Creation
CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY,
	expected_return_date INTEGER,
	issue_with_car VARCHAR(150),
	customer_id INTEGER,
	car_id INTEGER,
	service_to_mechanic_id 	INTEGER,
	part_used_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(service_to_mechanic_id) REFERENCES service_to_mechanic(service_to_mechanic_id),
	FOREIGN KEY(part_used_id) REFERENCES part_used(part_used_id)
);