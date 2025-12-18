CREATE DATABASE IF NOT EXISTS demo;

DROP TABLE IF EXISTS demo.taxi_trips;

CREATE TABLE demo.taxi_trips
(
    VendorID UInt8,
    tpep_pickup_datetime DateTime,
    tpep_dropoff_datetime DateTime,
    passenger_count UInt8,
    trip_distance Float32,
    pickup_longitude Float64,
    pickup_latitude Float64,
    RateCodeID UInt8,
    store_and_fwd_flag LowCardinality(String),
    dropoff_longitude Float64,
    dropoff_latitude Float64,
    payment_type UInt8,
    fare_amount Float32,
    extra Float32,
    mta_tax Float32,
    tip_amount Float32,
    tolls_amount Float32,
    improvement_surcharge Float32,
    total_amount Float32
)
ENGINE = MergeTree
ORDER BY (tpep_pickup_datetime, VendorID);
