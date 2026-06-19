
/*
Regional Theft Distribution:
Analyzed the number and percentage share of vehicle thefts across New Zealand regions
to identify areas contributing most to overall theft activity.
This analysis highlights regional crime concentration and supports geographic risk assessment.
*/


/* Database Setup:
Created and initialized the Motor_Vehicle_Thefts database to store and manage vehicle theft records, 
vehicle make information, and regional characteristics. This forms the foundation for performing descriptive and 
exploratory crime analysis across New Zealand.*/

CREATE DATABASE Motor_Vehicle_Thefts;
USE Motor_Vehicle_Thefts;


/* Total Stolen Vehicles:
Calculated the total number of recorded stolen vehicles in the dataset to establish a baseline measure of 
vehicle theft incidents for further analysis.*/
SELECT COUNT(*) AS [Total Stolen Vehicles]
FROM stolen_vehicles;


/* Vehicle Type Analysis:
Analyzed the frequency of vehicle thefts by vehicle type to identify which categories of 
vehicles are most and least targeted. This helps reveal theft patterns across different vehicle segments.*/

SELECT
    vehicle_type AS [Vehicle Type],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles
GROUP BY vehicle_type
ORDER BY [Theft Count] DESC;


/*Vehicle Color Analysis:
Analyzed the distribution of stolen vehicles by color to identify which colors are most frequently targeted. 
This helps reveal potential patterns in visibility-based or preference-based vehicle theft trends.*/

SELECT
    color AS [Color],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles
GROUP BY color
ORDER BY [Theft Count] DESC;



/*Average Vehicle Age at Time of Theft:
Calculated the average age of stolen vehicles by comparing the model year with the year of theft. 
This provides insight into whether older or newer vehicles are more commonly targeted by thieves.*/

SELECT
    ROUND(
        AVG(YEAR(date_stolen) - model_year),
        2
    ) AS [Average Vehicle Age]
FROM stolen_vehicles;



/* Monthly Theft Trend Analysis:
Analyzed vehicle theft patterns across months to identify seasonal trends and peak periods of vehicle theft activity. 
This helps understand how theft incidents vary throughout the year.*/

SELECT
    DATENAME(MONTH, date_stolen) AS [Month],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles
GROUP BY DATENAME(MONTH, date_stolen), MONTH(date_stolen)
ORDER BY MONTH(date_stolen);

/* Monthly Theft Trend Analysis:
Examined vehicle theft trends by month name to identify seasonal patterns and peak periods of theft activity. 
This helps reveal how vehicle theft incidents vary across different months of the year.*/

SELECT
    DATENAME(MONTH, date_stolen) AS [Month Name],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles
GROUP BY
    DATENAME(MONTH, date_stolen),
    MONTH(date_stolen)
ORDER BY
    MONTH(date_stolen);



/* Day of Week Theft Analysis:
Analyzed vehicle theft occurrences by day of the week to identify which days experience the highest and 
lowest theft activity. This helps reveal weekly patterns in vehicle theft behavior.*/

SELECT
    DATENAME(WEEKDAY, date_stolen) AS [Day of Week],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles
GROUP BY DATENAME(WEEKDAY, date_stolen)
ORDER BY [Theft Count] DESC;


/* Weekend vs Weekday Theft Analysis:
Categorized vehicle theft incidents into weekday and weekend groups to determine whether theft activity is higher 
during weekends or weekdays. This helps identify behavioral patterns in theft timing.*/

SELECT
    CASE
        WHEN DATENAME(WEEKDAY, date_stolen) IN ('Saturday', 'Sunday')
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS [Day Category],
    COUNT(*) AS [Total Thefts]
FROM stolen_vehicles
GROUP BY
    CASE
        WHEN DATENAME(WEEKDAY, date_stolen) IN ('Saturday', 'Sunday')
            THEN 'Weekend'
        ELSE 'Weekday'
    END;



/* Vehicle Type vs Average Age at Theft:
Analyzed the average age of stolen vehicles across different vehicle types to determine whether certain vehicle categories 
tend to be older or newer at the time of theft. This helps identify targeting patterns based on vehicle age.*/

SELECT
    vehicle_type AS [Vehicle Type],
    ROUND(
        AVG(YEAR(date_stolen) - model_year),
        2
    ) AS [Average Age]
FROM stolen_vehicles
GROUP BY vehicle_type
ORDER BY [Average Age] DESC;

/*Vehicle Age Group Analysis:
Categorized stolen vehicles into age brackets to understand which age ranges are most frequently targeted. 
This helps reveal whether older or newer vehicles are more vulnerable to theft.*/

SELECT
    CASE
        WHEN YEAR(date_stolen) - model_year <= 5 THEN '0-5 years'
        WHEN YEAR(date_stolen) - model_year <= 10 THEN '6-10 years'
        WHEN YEAR(date_stolen) - model_year <= 20 THEN '11-20 years'
        ELSE '20+ years'
    END AS [Age Group],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles
GROUP BY
    CASE
        WHEN YEAR(date_stolen) - model_year <= 5 THEN '0-5 years'
        WHEN YEAR(date_stolen) - model_year <= 10 THEN '6-10 years'
        WHEN YEAR(date_stolen) - model_year <= 20 THEN '11-20 years'
        ELSE '20+ years'
    END
ORDER BY [Theft Count] DESC;


WITH ranked_colors AS
(
    SELECT
        vehicle_type,
        color,
        COUNT(*) AS theft_count,
        ROW_NUMBER() OVER (
            PARTITION BY vehicle_type
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM stolen_vehicles
    GROUP BY
        vehicle_type,
        color
)

SELECT
    vehicle_type AS [Vehicle Type],
    color AS [Most Common Color],
    theft_count AS [Number of Thefts]
FROM ranked_colors
WHERE rn = 1
ORDER BY [Number of Thefts] DESC;


/* Make Type Theft Distribution:
Analyzed the distribution of vehicle thefts across make types (Standard vs Luxury) to understand which 
category of vehicles is more frequently targeted. This helps identify whether high-value luxury vehicles or 
standard vehicles are more vulnerable to theft incidents. */

SELECT
    md.make_type AS [Make Type],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles sv
JOIN make_details md
    ON sv.make_id = md.make_id
GROUP BY md.make_type;


/* Luxury Vehicle Theft Analysis:
Filtered and analyzed luxury vehicle makes to identify which premium brands are most frequently targeted for theft. 
This helps highlight high-value vehicle risk patterns within the luxury segment.*/

SELECT
    md.make_name AS [Make Name],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles sv
JOIN make_details md
    ON sv.make_id = md.make_id
WHERE md.make_type = 'Luxury'
GROUP BY md.make_name
ORDER BY [Theft Count] DESC;


/* Vehicle Make Type vs Average Age at Theft:
Analyzed the average age of stolen vehicles across Standard and Luxury make categories to determine whether 
different vehicle classes tend to be targeted at different stages of their lifecycle. This helps compare vulnerability 
patterns between vehicle segments.*/

SELECT
    md.make_type AS [Make Type],
    ROUND(
        AVG(YEAR(date_stolen) - model_year),
        2
    ) AS [Average Age]
FROM stolen_vehicles sv
JOIN make_details md
    ON sv.make_id = md.make_id
GROUP BY md.make_type;


/* Regional Theft Distribution:
Analyzed the number of vehicle thefts across different regions to identify geographic hotspots with the highest 
concentration of stolen vehicles. This helps highlight high-risk areas for targeted crime prevention strategies.*/

SELECT
    l.region AS [Region],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles sv
JOIN locations l
    ON sv.location_id = l.location_id
GROUP BY l.region
ORDER BY [Theft Count] DESC;



/* Regional Theft Rate (Per 100,000 Population):
Calculated the vehicle theft rate per 100,000 people across New Zealand regions to standardize comparisons between 
regions of different population sizes. This helps identify true high-risk areas beyond raw theft counts.*/

SELECT
    l.region AS [Region],
    COUNT(*) AS [Theft Count],
    ROUND(
        COUNT(*) * 100000.0 / l.population,
        2
    ) AS [Theft Rate per 100k]
FROM stolen_vehicles sv
JOIN locations l
    ON sv.location_id = l.location_id
GROUP BY
    l.region,
    l.population
ORDER BY [Theft Rate per 100k] DESC;



/*Regional Theft vs Population Density Analysis:
Analyzed the relationship between vehicle theft counts and population density across New Zealand regions to explore 
whether more densely populated regions experience higher theft activity. This helps assess whether urbanization 
correlates with vehicle theft frequency.*/

SELECT
    l.region AS [Region],
    ROUND(l.density, 2) AS [Density],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles sv
JOIN locations l
    ON sv.location_id = l.location_id
GROUP BY
    l.region,
    l.density
ORDER BY [Theft Count] DESC;



/*Regional Theft vs Population Density Analysis:
Examined the relationship between vehicle theft counts and population density across New Zealand regions to 
determine whether more densely populated areas experience higher levels of vehicle theft. This helps identify urban 
crime concentration patterns.*/

SELECT
    l.region AS [Region],
    ROUND(l.density, 2) AS [Density],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles sv
JOIN locations l
    ON sv.location_id = l.location_id
GROUP BY
    l.region,
    l.density
ORDER BY [Theft Count] DESC;




/* Top Vehicle Type by Region:
Identified the most frequently stolen vehicle type within each region using a ranking window function. This analysis 
highlights regional preferences in vehicle theft patterns and reveals which vehicle categories are most targeted in 
specific geographic areas.*/

WITH ranked_types AS
(
    SELECT
        l.region,
        sv.vehicle_type,
        COUNT(*) AS theft_count,
        ROW_NUMBER() OVER(
            PARTITION BY l.region
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM stolen_vehicles sv
    JOIN locations l
        ON sv.location_id = l.location_id
    GROUP BY
        l.region,
        sv.vehicle_type
)

SELECT
    region AS [Region],
    vehicle_type AS [Most Stolen Vehicle Type],
    theft_count AS [Theft Count]
FROM ranked_types
WHERE rn = 1
ORDER BY [Theft Count] DESC;


/* Top Stolen Brand by Region:
Identified the most frequently stolen vehicle make in each region using a ranking window function. This analysis 
highlights geographic brand targeting patterns and shows which manufacturers are most affected in different areas.*/

WITH ranked_brands AS
(
    SELECT
        l.region,
        md.make_name,
        COUNT(*) AS theft_count,
        ROW_NUMBER() OVER(
            PARTITION BY l.region
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM stolen_vehicles sv
    JOIN make_details md
        ON sv.make_id = md.make_id
    JOIN locations l
        ON sv.location_id = l.location_id
    GROUP BY
        l.region,
        md.make_name
)

SELECT
    region AS [Region],
    make_name AS [Most Stolen Brand],
    theft_count AS [Theft Count]
FROM ranked_brands
WHERE rn = 1
ORDER BY [Theft Count] DESC;


/* Top 5 Most Stolen Brands by Make Type:
Ranked vehicle makes within Standard and Luxury categories to identify the most frequently stolen brands in each 
segment. This helps compare theft vulnerability across different vehicle classes.*/

WITH brand_rank AS
(
    SELECT
        md.make_type AS [Make Type],
        md.make_name AS [Make Name],
        COUNT(*) AS theft_count,
        DENSE_RANK() OVER(
            PARTITION BY md.make_type
            ORDER BY COUNT(*) DESC
        ) AS ranking
    FROM stolen_vehicles sv
    JOIN make_details md
        ON sv.make_id = md.make_id
    GROUP BY
        md.make_type,
        md.make_name
)

SELECT
    [Make Type],
    [Make Name],
    theft_count AS [Theft Count],
    ranking
FROM brand_rank
WHERE ranking <= 5
ORDER BY [Make Type], ranking;



/* Regional Theft vs Population Density:
Analyzed vehicle theft distribution across regions alongside population density to explore whether more densely 
populated areas experience higher theft activity. This helps assess the relationship between urbanization and vehicle 
crime levels.*/

SELECT
    l.region AS [Region],
    ROUND(l.density, 2) AS [Density],
    COUNT(*) AS [Theft Count]
FROM stolen_vehicles sv
JOIN locations l
    ON sv.location_id = l.location_id
GROUP BY
    l.region,
    l.density
ORDER BY [Theft Count] DESC;