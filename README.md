Database setup instructions:

In psql
CREATE DATABASE hair_salon;
\c hair_salon;
CREATE TABLE stylist (id serial PRIMARY KEY, name varchar)
CREATE TABLE client (id serial PRIMARY KEY, name varchar, stylist_id integer)
