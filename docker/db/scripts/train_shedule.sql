CREATE DATABASE train_chedule;
GRANT ALL PRIVILEGES ON DATABASE train_shedule TO SHUTOVA_204;
\connect train_shedule

CREATE TABLE "city" (
  "name" varchar PRIMARY KEY,
  "region" varchar
);

CREATE TABLE "station" (
  "name" varchar PRIMARY KEY,
  "number_of_tracks" int
);

CREATE TABLE "train" (
  "number" int PRIMARY KEY,
  "length" double,
  "start_station" varchar,
  "end_station" varchar
);

CREATE TABLE "lie_in" (
  "city" varchar,
  "station" varchar
);

CREATE TABLE "relation" (
  "train" int,
  "station" varchar,
  "start_time" datetime,
  "end_time" datetime
);

ALTER TABLE "train" ADD FOREIGN KEY ("start_station") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("end_station") REFERENCES "station" ("name");

ALTER TABLE "lie_in" ADD FOREIGN KEY ("city") REFERENCES "city" ("name");

ALTER TABLE "station" ADD FOREIGN KEY ("name") REFERENCES "lie_in" ("station");

ALTER TABLE "relation" ADD FOREIGN KEY ("train") REFERENCES "train" ("number");

ALTER TABLE "relation" ADD FOREIGN KEY ("station") REFERENCES "station" ("name");
