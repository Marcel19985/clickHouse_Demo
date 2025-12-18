------------------------------------------------------------
-- Trips total
SELECT count(*) FROM taxi_trips;

------------------------------------------------------------
-- Top Vendor / RateCode
SELECT vendorid, ratecodeid, count(*) AS trips
FROM taxi_trips
GROUP BY vendorid, ratecodeid
ORDER BY trips DESC
    LIMIT 10;

-------------------------------------------------------------
-- Trips pro Tag (großer Scan, einfache Aggregation)
SELECT date_trunc('day', tpep_pickup_datetime) AS day,
       count(*) AS trips
FROM taxi_trips
GROUP BY day
ORDER BY day;

-------------------------------------------------------------
-- Umsatz pro Vendor (SUM + AVG)
SELECT vendorid,
       count(*) AS trips,
       sum(total_amount) AS revenue,
       avg(total_amount) AS avg_total
FROM taxi_trips
GROUP BY vendorid
ORDER BY revenue DESC;

-------------------------------------------------------------
-- Percentiles (Analytics Query)
SELECT
    percentile_cont(0.50) WITHIN GROUP (ORDER BY trip_distance) AS p50,
  percentile_cont(0.90) WITHIN GROUP (ORDER BY trip_distance) AS p90,
    percentile_cont(0.99) WITHIN GROUP (ORDER BY trip_distance) AS p99
FROM taxi_trips;
