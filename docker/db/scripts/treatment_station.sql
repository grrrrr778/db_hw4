CREATE DATABASE treatment_station;
GRANT ALL PRIVILEGES ON DATABASE treatment_station TO SHUTOVA_204;
\connect treatment_station

CREATE TABLE "station" (
  "number" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "room" (
  "number" int PRIMARY KEY,
  "station" int,
  "number_of_beds" int
);

CREATE TABLE "patient" (
  "number" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "doctor" int
);

CREATE TABLE "personell" (
  "number" int PRIMARY KEY,
  "name" varchar,
  "station" int
);

CREATE TABLE "caregiver" (
  "pers_number" int PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "doctor" (
  "pers_number" int PRIMARY KEY,
  "rank" varchar,
  "area" varchar
);

CREATE TABLE "admission" (
  "room_number" int,
  "patient" int,
  "from" date,
  "to" date
);

ALTER TABLE "room" ADD FOREIGN KEY ("station") REFERENCES "station" ("number");

ALTER TABLE "patient" ADD FOREIGN KEY ("doctor") REFERENCES "doctor" ("pers_number");

ALTER TABLE "personell" ADD FOREIGN KEY ("station") REFERENCES "station" ("number");

ALTER TABLE "caregiver" ADD FOREIGN KEY ("pers_number") REFERENCES "personell" ("number");

ALTER TABLE "doctor" ADD FOREIGN KEY ("pers_number") REFERENCES "personell" ("number");

ALTER TABLE "admission" ADD FOREIGN KEY ("room_number") REFERENCES "room" ("number");

ALTER TABLE "admission" ADD FOREIGN KEY ("patient") REFERENCES "patient" ("number");
