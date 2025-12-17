# clickHouse_Demo
Small demonstration of ClickHuse for a Big Data Presentation

# setup

Docker Desktop starten
docker compose up -d

Datenbank Query Tool der Wahl verwenden (z.B. IntelliJ Database Tool), um DB's und Tables anzulegen
Ersten Teile von Scripts vom Verzeichnis sql_scripts ausführen

Datensatz downloaden:
https://www.kaggle.com/datasets/elemento/nyc-yellow-taxi-trip-data?resource=download&select=yellow_tripdata_2015-01.csv
z.B. yellow_tripdate_2015-01.csv

Daten in Postgres container kopieren + csv Daten einlesen:
docker cp .\data\yellow_tripdata_2015-01.csv postgres-demo:/tmp/taxi.csv
docker exec -it postgres-demo psql -U demo -d demo -c "\copy taxi_trips FROM '/tmp/taxi.csv' WITH (FORMAT csv, HEADER true)"
So kannst du testen, ob es eingelesen wurde (sollten über 1 Mio. Zeilen sein):
SELECT count(*) FROM taxi_trips;

Daten in clickHouse container kopieren + csv Daten einlesen:
docker cp .\data\yellow_tripdata_2015-01.csv clickhouse-demo:/tmp/taxi.csv
cmd /c "docker exec -i clickhouse-demo clickhouse-client -u demo --password demo --query ""INSERT INTO demo.taxi_trips FORMAT CSVWithNames"" < data\yellow_tripdata_2015-01.csv
So kannst du testen, ob es eingelesen wurde (sollten über 1 Mio. Zeilen sein):
SELECT count() FROM demo.taxi_trips;

In den sql_scripts sind unten Datenbankabfragen (mit Aggragation) -> beim Vergleich fällt auf, dass clickHouse deutlich schneller ist