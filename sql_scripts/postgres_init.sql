DROP TABLE IF EXISTS taxi_trips;

--Hier haben wir von numeric auf double umgestellt damit der Vergleich ein bisschen fairer wird

CREATE TABLE taxi_trips (
                            vendorid int,
                            tpep_pickup_datetime timestamp,
                            tpep_dropoff_datetime timestamp,
                            passenger_count int,
                            trip_distance double precision,
                            pickup_longitude double precision,
                            pickup_latitude double precision,
                            ratecodeid int,
                            store_and_fwd_flag text,
                            dropoff_longitude double precision,
                            dropoff_latitude double precision,
                            payment_type int,
                            fare_amount double precision,
                            extra double precision,
                            mta_tax double precision,
                            tip_amount double precision,
                            tolls_amount double precision,
                            improvement_surcharge double precision,
                            total_amount double precision
);
