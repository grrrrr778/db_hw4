CREATE DATABASE library;
GRANT ALL PRIVILEGES ON DATABASE library TO SHUTOVA_204;
\connect library

CREATE TABLE "book" (
  "ISBN" int PRIMARY KEY,
  "year" int,
  "name" varchar,
  "author" varchar,
  "number_of_pages" int,
  "publisher" int,
  "category" varchar
);

CREATE TABLE "copy_of_book" (
  "ISBN" int,
  "unique_number" int PRIMARY KEY,
  "position" number
);

CREATE TABLE "publisher" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "address" varchar
);

CREATE TABLE "reader" (
  "unique_number" int PRIMARY KEY,
  "surname" varchar,
  "name" varchar,
  "address" varchar,
  "birthday" date
);

CREATE TABLE "reservation" (
  "reader" int,
  "number_of_copy" int,
  "return_date" date
);

ALTER TABLE "book" ADD FOREIGN KEY ("publisher") REFERENCES "publisher" ("id");

ALTER TABLE "copy_of_book" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "reservation" ADD FOREIGN KEY ("reader") REFERENCES "reader" ("unique_number");

ALTER TABLE "reservation" ADD FOREIGN KEY ("number_of_copy") REFERENCES "copy_of_book" ("unique_number");
