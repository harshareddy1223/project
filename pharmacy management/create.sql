create table CUSTOMER ( 
cust_id varchar2(11) constraint cust_id_pkey PRIMARY KEY constraint starts_with_C CHECK(cust_id LIKE 'C%'), 
fname varchar2(90), 
lname varchar2(90), 
gender char(1) constraint gender_const CHECK(gender in ('M', 'F')), 
age number(3) constraint check_age CHECK(age>0), 
contact_add Number(10), 
cust_email varchar2(90) constraint check_email CHECK(cust_email like '%@%.%') NOT NULL, 
cust_pass varchar2(90) unique NOT NULL 
);

create table pharmacist ( 
phar_id varchar2(11) constraint phar_id_pkey PRIMARY KEY, constraint starts_with_p CHECK (phar_id LIKE 'P%'), 
phfname varchar2(90), 
phlname varchar2(90), 
phgender char(1) constraint phgender_const CHECK(phgender IN ('M' , 'F')), 
phage number(3) constraint phcheck_age CHECK(phage>0), 
phcontact_add number(10) UNIQUE, 
admin_email varchar2(90) constraint phcheck_email CHECK(admin_email LIKE '%@%.%') NOT NULL, 
admin_pass varchar2(90) UNIQUE NOT NULL 
);


create table medicines ( 
med_id varchar2(11) constraint med_id_pkey PRIMARY KEY, constraint starts_with_M CHECK(med_id LIKE 'M%'), 
med_category varchar2(90) NOT NULL, 
description varchar2(90), 
price number(10,2) constraint check_price check(price>0) 
);


create table purchasing (  
purchase_id varchar2(11) constraint purchase_id_pkey primary key,  
cust_id varchar2(11) constraint fk_cust_id references customer,  
med_id varchar2(11) constraint fk_med_id references medicines,  
amount number(10,2) constraint check_amount check(amount > 0),  
purchase_date date 
);


CREATE TABLE sales(  
sales_id varchar2(11) constraint sales_id_pkey primary key,  
phar_id varchar2(11) constraint fk_phar_id references pharmacist,  
cust_id varchar2(11) constraint fk_cust references customer,  
med_id varchar2(11) constraint fk_med references medicines,  
sales_count number(10),  
purchase_id varchar2(11) constraint fk_purchase_id references purchasing,  
sale_date Date,  
total_amount number(10,2) 
);


CREATE TABLE reports(  
reports_id varchar2(11) constraint reports_pk primary key,  
purchase_id varchar2(11) constraint fk_purchase_idr references purchasing,  
sales_id varchar2(11) constraint fk_sales_idr references sales,  
cust_id varchar2(11) constraint fk_cust_idr references customer,  
report_date date 
);