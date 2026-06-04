WITH src_rides AS (
    SELECT *
    FROM {{ source('public', 'rides') }}
)

SELECT
    rideid AS ride_id,
    custid AS customer_id,
    ridedate AS ride_date,
    TRIM(pickuplocation) AS pickup_location,
    TRIM(droplocation) AS drop_location,
    fare,
    INITCAP(ridestatus) AS ride_status
FROM src_rides
WHERE custid IS NOT NULL
  AND ridedate IS NOT NULL
  AND fare IS NOT NULL
  AND fare > 0
