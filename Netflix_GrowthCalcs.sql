--input data, rename tables, rename Area columns to region
CREATE TABLE 'DataNetflixRevenue2020_V2' ('Area' TEXT,'Years' TEXT,'Revenue' INTEGER);
INSERT INTO 'DataNetflixRevenue2020_V2' ('Area','Years','Revenue') VALUES 
 ('United States and Canada','Q1 - 2018','1976157000'), 
 ('Europe,  Middle East and Africa','Q1 - 2018','886649000'), 
 ('Latin America','Q1 - 2018','540182000'), 
 ('Asia-Pacific','Q1 - 2018','199117000'), 
 ('United States and Canada','Q2 - 2018','2049546000'), 
 ('Europe,  Middle East and Africa','Q2 - 2018','975497000'), 
 ('Latin America','Q2 - 2018','568071000'), 
 ('Asia-Pacific','Q2 - 2018','221252000'), 
 ('United States and Canada','Q3 - 2018','2094850000'), 
 ('Europe,  Middle East and Africa','Q3 - 2018','1004749000'), 
 ('Latin America','Q3 - 2018','562307000'), 
 ('Asia-Pacific','Q3 - 2018','248691000'), 
 ('United States and Canada','Q4 - 2018','2160979000'), 
 ('Europe,  Middle East and Africa','Q4 - 2018','1096812000'), 
 ('Latin America','Q4 - 2018','567137000'), 
 ('Asia-Pacific','Q4 - 2018','276756000'), 
 ('United States and Canada','Q1 - 2019','2256851000'), 
 ('Europe,  Middle East and Africa','Q1 - 2019','1233379000'), 
 ('Latin America','Q1 - 2019','630472000'), 
 ('Asia-Pacific','Q1 - 2019','319602000'), 
 ('United States and Canada','Q2 - 2019','2501199000'), 
 ('Europe,  Middle East and Africa','Q2 - 2019','1319087000'), 
 ('Latin America','Q2 - 2019','677136000'), 
 ('Asia-Pacific','Q2 - 2019','349494000'), 
 ('United States and Canada','Q3 - 2019','2621250000'), 
 ('Europe,  Middle East and Africa','Q3 - 2019','1428040000'), 
 ('Latin America','Q3 - 2019','741434000'), 
 ('Asia-Pacific','Q3 - 2019','382304000'), 
 ('United States and Canada','Q4 - 2019','2671908000'), 
 ('Europe,  Middle East and Africa','Q4 - 2019','1562561000'), 
 ('Latin America','Q4 - 2019','746392000'), 
 ('Asia-Pacific','Q4 - 2019','418121000'), 
 ('United States and Canada','Q1 - 2020','2702776000'), 
 ('Europe,  Middle East and Africa','Q1 - 2020','1723474000'), 
 ('Latin America','Q1 - 2020','793453000'), 
 ('Asia-Pacific','Q1 - 2020','483660000'), 
 ('United States and Canada','Q2 - 2020','2839670000'), 
 ('Europe,  Middle East and Africa','Q2 - 2020','1892537000'), 
 ('Latin America','Q2 - 2020','785368000'), 
 ('Asia-Pacific','Q2 - 2020','569140000');
 ALTER TABLE DataNetflixRevenue2020_V2 RENAME TO revenue_long;
 alter table revenue_long rename Area to region;
 
 -- Same for the subscriber data
CREATE TABLE 'DataNetflixSubscriber2020_V2' ('Area' TEXT,'Years' TEXT,'Subscribers' INTEGER);
INSERT INTO 'DataNetflixSubscriber2020_V2' ('Area','Years','Subscribers') VALUES 
 ('United States and Canada','Q1 - 2018','60909000'), 
 ('Europe,  Middle East and Africa','Q1 - 2018','29339000'), 
 ('Latin America','Q1 - 2018','21260000'), 
 ('Asia-Pacific','Q1 - 2018','7394000'), 
 ('United States and Canada','Q2 - 2018','61870000'), 
 ('Europe,  Middle East and Africa','Q2 - 2018','31317000'), 
 ('Latin America','Q2 - 2018','22795000'), 
 ('Asia-Pacific','Q2 - 2018','8372000'), 
 ('United States and Canada','Q3 - 2018','63010000'), 
 ('Europe,  Middle East and Africa','Q3 - 2018','33836000'), 
 ('Latin America','Q3 - 2018','24115000'), 
 ('Asia-Pacific','Q3 - 2018','9461000'), 
 ('United States and Canada','Q4 - 2018','64757000'), 
 ('Europe,  Middle East and Africa','Q4 - 2018','37818000'), 
 ('Latin America','Q4 - 2018','26077000'), 
 ('Asia-Pacific','Q4 - 2018','10607000'), 
 ('United States and Canada','Q1 - 2019','66633000'), 
 ('Europe,  Middle East and Africa','Q1 - 2019','42542000'), 
 ('Latin America','Q1 - 2019','27547000'), 
 ('Asia-Pacific','Q1 - 2019','12141000'), 
 ('United States and Canada','Q2 - 2019','66501000'), 
 ('Europe,  Middle East and Africa','Q2 - 2019','44229000'), 
 ('Latin America','Q2 - 2019','27890000'), 
 ('Asia-Pacific','Q2 - 2019','12942000'), 
 ('United States and Canada','Q3 - 2019','67114000'), 
 ('Europe,  Middle East and Africa','Q3 - 2019','47355000'), 
 ('Latin America','Q3 - 2019','29380000'), 
 ('Asia-Pacific','Q3 - 2019','14485000'), 
 ('United States and Canada','Q4 - 2019','67662000'), 
 ('Europe,  Middle East and Africa','Q4 - 2019','51778000'), 
 ('Latin America','Q4 - 2019','31417000'), 
 ('Asia-Pacific','Q4 - 2019','16233000'), 
 ('United States and Canada','Q1 - 2020','69969000'), 
 ('Europe,  Middle East and Africa','Q1 - 2020','58734000'), 
 ('Latin America','Q1 - 2020','34318000'), 
 ('Asia-Pacific','Q1 - 2020','19835000'), 
 ('United States and Canada','Q2 - 2020','72904000'), 
 ('Europe,  Middle East and Africa','Q2 - 2020','61483000'), 
 ('Latin America','Q2 - 2020','36068000'), 
 ('Asia-Pacific','Q2 - 2020','22492000');
 ALTER TABLE DataNetflixSubscriber2020_V2 RENAME TO subscribers;
 alter table subscribers rename Area to region;
 
 
 --Create table with actual date values for the quarters
CREATE TEMP TABLE temp_table AS
SELECT
    region,
    CONCAT(
        SUBSTRING(Years, 6, 4), -- Extract year part (e.g., "2020" from "Q1 - 2020")
        CASE
            WHEN SUBSTRING(Years, 1, 2) = 'Q1' THEN '-01-01' -- Q1 starts on January 1st
            WHEN SUBSTRING(Years, 1, 2) = 'Q2' THEN '-04-01' -- Q2 starts on April 1st
            WHEN SUBSTRING(Years, 1, 2) = 'Q3' THEN '-07-01' -- Q3 starts on July 1st
            WHEN SUBSTRING(Years, 1, 2) = 'Q4' THEN '-10-01' -- Q4 starts on October 1st
        END
    ) AS quarter_start_date, revenue
FROM
    Revenue_long
ORDER BY
    region;
    
    
-- create "prev_revenue" column with detailed debugging
CREATE TEMP TABLE quarters AS
SELECT
    region,
    quarter_start_date AS quarter,
    revenue * 1.0 AS revenue,
    (LAG(revenue) OVER(PARTITION BY region ORDER BY quarter_start_date)) * 1.0 AS prev_revenue
FROM
    temp_table;

-- create the Revenue_Growth_Table
CREATE TABLE Revenue_Growth_Table (
    region TEXT,
    Current_Quarter DATE,
    Current_Revenue REAL,
    prev_quarter DATE,
    prev_revenue REAL,
    Revenue_Growth REAL,
    Revenue_Difference REAL
);

-- insert data into the Revenue_Growth_Table
INSERT INTO Revenue_Growth_Table (
    region,
    Current_Quarter,
    Current_Revenue,
    prev_quarter,
    prev_revenue,
    Revenue_Growth,
    Revenue_Difference
)

SELECT
    region,
    quarter AS Current_Quarter,
    revenue AS Current_Revenue,
    LAG(quarter) OVER(PARTITION BY region ORDER BY quarter) AS prev_quarter,
    prev_revenue,
    CASE
        WHEN prev_revenue IS NULL THEN NULL -- Handle first quarter where no previous data exists
        WHEN prev_revenue = 0 THEN NULL -- Handle division by zero
        ELSE (revenue - prev_revenue) / prev_revenue
    END AS Revenue_Growth,
    (revenue - prev_revenue) AS Revenue_Difference
FROM
    quarters
ORDER BY
    region, quarter;
    
  
-- Do the same with the subs data

--Create table with actual date values for the quarters
CREATE TEMP TABLE subs_temp_table AS
SELECT
    region,
    CONCAT(
        SUBSTRING(Years, 6, 4), -- Extract year part (e.g., "2020" from "Q1 - 2020")
        CASE
            WHEN SUBSTRING(Years, 1, 2) = 'Q1' THEN '-01-01' -- Q1 starts on January 1st
            WHEN SUBSTRING(Years, 1, 2) = 'Q2' THEN '-04-01' -- Q2 starts on April 1st
            WHEN SUBSTRING(Years, 1, 2) = 'Q3' THEN '-07-01' -- Q3 starts on July 1st
            WHEN SUBSTRING(Years, 1, 2) = 'Q4' THEN '-10-01' -- Q4 starts on October 1st
        END
    ) AS quarter_start_date, subscribers
FROM
    subscribers
ORDER BY
    region;

-- create "prev_subs" column
CREATE TEMP TABLE quarters_subs AS
SELECT
    region,
    quarter_start_date AS quarter,
    subscribers * 1.0 AS subs,
    (LAG(subscribers) OVER(PARTITION BY region ORDER BY quarter_start_date)) * 1.0 AS prev_subs
FROM
    subs_temp_table;

-- create the Subscriber_Growth_Table
CREATE TABLE Subscriber_Growth_Table (
    region TEXT,
    Current_Quarter DATE,
    Current_Subs REAL,
    Prev_Quarter DATE,
    Prev_Subs REAL,
    Sub_Growth REAL,
    Sub_Difference REAL
);


-- insert data into the Revenue_Growth_Table
INSERT INTO Subscriber_Growth_Table (
    region,
    Current_Quarter,
    Current_Subs,
    Prev_Quarter,
    Prev_Subs,
    Sub_Growth,
    Sub_Difference
)


SELECT
    region,
    quarter AS Current_Quarter,
    subs AS Current_Subs,
    LAG(quarter) OVER(PARTITION BY region ORDER BY quarter) AS Prev_Quarter,
    Prev_Subs,
    CASE
        WHEN Prev_Subs IS NULL THEN NULL -- Handle first quarter where no previous data exists
        WHEN Prev_Subs = 0 THEN NULL -- Handle division by zero
        ELSE (subs - Prev_Subs) / Prev_Subs
    END AS Sub_Growth,
    (subs - Prev_Subs) AS Sub_Difference
FROM
    quarters_subs
ORDER BY
    region, quarter;