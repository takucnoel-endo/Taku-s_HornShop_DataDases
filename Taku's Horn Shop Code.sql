--Create a database to work on.
create database TakuHornShop;

--Create product table.
create table product (
		pd_id numeric primary key,
		pd_name varchar(50),
		pd_price numeric,
		prod_time numeric
		);
	
--Insert data into product table.
insert into product (pd_id, pd_name, pd_price, prod_time)
values (1, 'Growling Sax (Alto)', 30000, 4);
insert into product (pd_id, pd_name, pd_price, prod_time)
values (2, 'Growling Sax (Tenor)', 40000, 5);
insert into product (pd_id, pd_name, pd_price, prod_time)
values (3, 'Platinum Sax (Soprano)', 100000, 4);
insert into product (pd_id, pd_name, pd_price, prod_time)
values (4, 'Platinum Sax (Alto)', 150000, 4.5);
insert into product (pd_id, pd_name, pd_price, prod_time)
values (5, 'Happy Kids Sax (Soprano)', 80, 2);
insert into product (pd_id, pd_name, pd_price, prod_time)
values (6, 'Happy Kids Sax (Tenor)', 80, 2.5);

select *
from product;

--create raw material table.
create table raw_material (
		rm_id numeric primary key,
		rm_name varchar(50)
		);
		
--insert data into raw material table.
insert into raw_material (rm_id, rm_name)
values (1, 'Brass');
insert into raw_material (rm_id, rm_name)
values (2, 'Gold');
insert into raw_material (rm_id, rm_name)
values (3, 'Stainless Steel');
insert into raw_material (rm_id, rm_name)
values (4, 'Marble Stone');
insert into raw_material (rm_id, rm_name)
values (5, 'Cork');
insert into raw_material (rm_id, rm_name)
values (6, 'Platinum');
insert into raw_material (rm_id, rm_name)
values (7, 'Plastic');
insert into raw_material (rm_id, rm_name)
values (8, 'Normal Stone');


select *
from raw_material;

--create made of table
create table made_of (
		pd_id numeric references product(pd_id),
		rm_id numeric references raw_material(rm_id), 
		quantity numeric
		);

--insert data into made of table. 
insert into made_of (pd_id, rm_id, quantity)
values (1, 1, 1500);
insert into made_of (pd_id, rm_id, quantity)
values (1, 2, 100);
insert into made_of (pd_id, rm_id, quantity)
values (1, 3, 100);
insert into made_of (pd_id, rm_id, quantity)
values (1, 4, 50);
insert into made_of (pd_id, rm_id, quantity)
values (1, 5, 10);
insert into made_of (pd_id, rm_id, quantity)
values (2, 1, 2000);

select *
from made_of;

--create customer table
create table customer (
		cust_id numeric primary key,
		first_name varchar(50),
		last_name varchar(50),
		cust_email varchar(50),
		cust_adress varchar(100)
		);

--insert data into customer table
insert into customer (cust_id, first_name, last_name, cust_email, cust_adress)
values (1, 'John', 'Coltrane', 'jcoltrane223myjazzrock@gmail.com', '354 Contrane Avenue, New York City, NY, USA'); 
insert into customer (cust_id, first_name, last_name, cust_email, cust_adress)
values (2, 'Kamasi', 'Washington', 'kwashington80listen2myalbum@gmail.com', '2 Green Dolphin Street, Los Angeles, LA, USA');
insert into customer (cust_id, first_name, last_name, cust_email, cust_adress)
values (3, 'Terrace', 'Martin', 'tmartin712funkymelody@gmail.com', '58 ilovejazz, Los Angeles, LA, USA'); 
insert into customer (cust_id, first_name, last_name, cust_email, cust_adress)
values (4, 'Hiroto', 'Uyama', 'Uhiroto9097sofresh@gmail.com', '2-5-11, Onngakudouri, Bunkyo-ku, Tokyo, Japan'); 


select *
from customer;
--create cust_phone# table
create table cust_phone (
		cust_phone varchar(20) primary key,
		cust_id numeric references customer(cust_id)
		);

--insert data into cust_phone# table. 
insert into cust_phone (cust_id, cust_phone)
values (1, '(+1)210-345-2353');
insert into cust_phone (cust_id, cust_phone)
values (1, '(+1)310-463-6245');
insert into cust_phone (cust_id, cust_phone)
values (1, '(+1)932-384-8284');
insert into cust_phone (cust_id, cust_phone)
values (1, '(+81)080-1435-3453');

select * 
from cust_phone;


--create orders table. --Add foreign key-- 
create table orders (
		order_id numeric primary key,
		order_date date,
		order_revenue numeric,
		cust_id numeric references customer(cust_id)
		);
		
--insert data into orders table. 
insert into orders (order_id, order_date, order_revenue, cust_id)
values (1, '2020-07-28', 30000, 2);
insert into orders (order_id, order_date, order_revenue, cust_id)
values (2, '2020-08-01', 480, 3);
insert into orders (order_id, order_date, order_revenue, cust_id)
values (3, '2020-08-10', 150000, 1);
insert into orders (order_id, order_date, order_revenue, cust_id)
values (4, '2020-08-19', 70000, 4);

select *
from orders;
	
--create order_lines table.
create table order_lines (
		pd_id numeric references product(pd_id), 
		order_id numeric references orders(order_id), 
		quantity integer
		);


--insert date into order_lines table. 
insert into order_lines (pd_id, order_id, quantity)
values (1, 1, 3);
insert into order_lines (pd_id, order_id, quantity)
values (5, 2, 2);
insert into order_lines (pd_id, order_id, quantity)
values (6, 2, 5);
insert into order_lines (pd_id, order_id, quantity)
values (6, 2, 1);
insert into order_lines (pd_id, order_id, quantity)
values (6, 2, 30);
insert into order_lines (pd_id, order_id, quantity)
values (4, 3, 12);
insert into order_lines (pd_id, order_id, quantity)
values (1, 4, 1);
insert into order_lines (pd_id, order_id, quantity)
values (2, 4, 2);

select *
from order_lines;

--create machine table. 
create table machine (
		machine_id numeric primary key, 
		machine_name varchar(50), 
		maint_cycl_time numeric, 
		pd_id numeric references product(pd_id)
		);
	
--insert data into machine table. 
insert into machine (machine_id, machine_name, maint_cycl_time, pd_id)
values (1, 'Alto Grawl Maker', 4, 1);
insert into machine (machine_id, machine_name, maint_cycl_time, pd_id)
values (2, 'Tenor Grawl Maker', 4, 2);
insert into machine (machine_id, machine_name, maint_cycl_time, pd_id)
values (3, 'Soprano Platinum Maker', 3.5, 3);
insert into machine (machine_id, machine_name, maint_cycl_time, pd_id)
values (4, 'Alto Platinum Maker', 3.5, 4);
insert into machine (machine_id, machine_name, maint_cycl_time, pd_id)
values (5, 'Soprano Happy Maker', 10, 5);
insert into machine (machine_id, machine_name, maint_cycl_time, pd_id)
values (6, 'Tenor Happy Maker', 10, 6);
	
select * 
from machine;
	

--create vendor table.
create table vendor (
		vendor_id numeric primary key, 
		vendor_name varchar(50), 
		rm_id numeric references raw_material(rm_id)
		);

	
--insert data into vendor table.
insert into vendor (vendor_id, vendor_name, rm_id)
values (1, 'Real Brassy Corporation', 1);
insert into vendor (vendor_id, vendor_name, rm_id)
values (2, 'WeGetGolden', 2);
insert into vendor (vendor_id, vendor_name, rm_id)
values (3, 'Trusty Steel Company', 3);
insert into vendor (vendor_id, vendor_name, rm_id)
values (4, 'Marble Sprinkle', 4);
insert into vendor (vendor_id, vendor_name, rm_id)
values (5, 'TheCorkFactory', 5);
insert into vendor (vendor_id, vendor_name, rm_id)
values (6, 'PlatiNation', 6);
insert into vendor (vendor_id, vendor_name, rm_id)
values (7, 'Plastica', 7);
insert into vendor (vendor_id, vendor_name, rm_id)
values (8, 'MineStone', 8);


select *
from vendor;

--create vendor_phone# table. 
create table vendor_phone (
		vendor_phone varchar(20) primary key,
		vendor_id numeric references vendor(vendor_id)
		);
	
--insert data into vendor_phone table. 
insert into vendor_phone (vendor_id, vendor_phone)
values (1, '(+1) 210-234-3452');
insert into vendor_phone (vendor_id, vendor_phone)
values (2, '(+1) 234-242-1234');
insert into vendor_phone (vendor_id, vendor_phone)
values (2, '(+1) 234-873-8234');
insert into vendor_phone (vendor_id, vendor_phone)
values (3, '(+1) 452-254-2434');
insert into vendor_phone (vendor_id, vendor_phone)
values (4, '(+1) 984-738-8374');
insert into vendor_phone (vendor_id, vendor_phone)
values (5, '(+1) 648-674-8490');
insert into vendor_phone (vendor_id, vendor_phone)
values (6, '(+1) 284-240-0082');
insert into vendor_phone (vendor_id, vendor_phone)
values (6, '(+1) 284-848-7482');
insert into vendor_phone (vendor_id, vendor_phone)
values (7, '(+1) 210-008-0073');
insert into vendor_phone (vendor_id, vendor_phone)
values (8, '(+1) 234-849-7400');

select *
from vendor_phone;


--create vendor_address table. 
create table vendor_address (
		vendor_email varchar(100) primary key,
		vendor_id numeric references vendor(vendor_id)
		);
	

--insert data into vendor_adress table.
insert into vendor_address (vendor_id, vendor_email)
values (1, 'customerservice@rbrassy.com');
insert into vendor_address (vendor_id, vendor_email)
values (1, 'customerservice2@rbrassy.com');
insert into vendor_address (vendor_id, vendor_email)
values (2, 'custserve@wegetgolden.com');
insert into vendor_address (vendor_id, vendor_email)
values (3, 'cservice@trustysteel.com');
insert into vendor_address (vendor_id, vendor_email)
values (4, 'customer@marblesprinkle.com');
insert into vendor_address (vendor_id, vendor_email)
values (5, 'customerserviceses@corkfactory.com');
insert into vendor_address (vendor_id, vendor_email)
values (6, 'cust@platination.com');
insert into vendor_address (vendor_id, vendor_email)
values (7, 'customer@plastica.com');
insert into vendor_address (vendor_id, vendor_email)
values (8, 'customerservice@minestone.com');
	
	
select *
from vendor_address;
	
	

	
	
	
	
	