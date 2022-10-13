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
  "length" int,
  "start_station" varchar,
  "end_station" varchar
);

CREATE TABLE "lie_in" (
  "city" varchar,
  "station" varchar UNIQUE
);

CREATE TABLE "relation" (
  "train" int,
  "station" varchar,
  "start_time" date,
  "end_time" date
);

ALTER TABLE "train" ADD FOREIGN KEY ("start_station") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("end_station") REFERENCES "station" ("name");

ALTER TABLE "lie_in" ADD FOREIGN KEY ("city") REFERENCES "city" ("name");

ALTER TABLE "station" ADD FOREIGN KEY ("name") REFERENCES "lie_in" ("station");

ALTER TABLE "relation" ADD FOREIGN KEY ("train") REFERENCES "train" ("number");

ALTER TABLE "relation" ADD FOREIGN KEY ("station") REFERENCES "station" ("name");
