------------------------------------------------
-- Count
SELECT count() FROM demo.taxi_trips;

------------------------------------------------
-- Top Vendor/RateCode
SELECT VendorID, RateCodeID, count() AS trips
FROM demo.taxi_trips
GROUP BY VendorID, RateCodeID
ORDER BY trips DESC
    LIMIT 10;

------------------------------------------------
-- Trips pro Tag
SELECT toDate(tpep_pickup_datetime) AS day,
       count() AS trips
FROM demo.taxi_trips
GROUP BY day
ORDER BY day;

-----------------------------------------------
-- Umsatz pro Vendor
SELECT VendorID,
       count() AS trips,
       sum(total_amount) AS revenue,
       avg(total_amount) AS avg_total
FROM demo.taxi_trips
GROUP BY VendorID
ORDER BY revenue DESC;

-----------------------------------------------
-- Percentiles (Analytics)
SELECT
    quantile(0.50)(trip_distance) AS p50,
    quantile(0.90)(trip_distance) AS p90,
    quantile(0.99)(trip_distance) AS p99
FROM demo.taxi_trips;
