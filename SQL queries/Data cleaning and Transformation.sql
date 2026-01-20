	#DATA CLEANING + TRANSFORMATION	
  --   use marketing_analysis;
-- CREATE TABLE marketing_campaign_clean AS
-- SELECT
--     Campaign_ID,
--     Company,
--     Campaign_Type,
--     Target_Audience,
--     Channel_Used,

--     -- % to decimal
--     CAST(REPLACE(Conversion_Rate,'%','') AS DECIMAL(5,2)) / 100 AS conversion_rate,

--     -- $ and comma removal
--     CAST(REPLACE(REPLACE(Acquisition_Cost,'$',''),',','') AS DECIMAL(10,2)) AS acquisition_cost,

--     ROI,
--     Location,
--     Language,
--     Clicks,
--     Impressions,
--     Engagement_Score,
--     Customer_Segment,

--     -- correct date format
--     STR_TO_DATE(Date,'%d-%m-%Y') AS campaign_date,

--     -- 🔥 DERIVED METRICS (THIS IS IMPORTANT)
--     Clicks / Impressions AS ctr,
--     Clicks * (CAST(REPLACE(Conversion_Rate,'%','') AS DECIMAL(5,2)) / 100) AS estimated_conversions,
--     CAST(REPLACE(REPLACE(Acquisition_Cost,'$',''),',','') AS DECIMAL(10,2)) / Clicks AS cost_per_click

-- FROM marketing_campaign_raw
-- WHERE Impressions > 0 AND Clicks > 0;
DESCRIBE marketing_campaign_clean;


    