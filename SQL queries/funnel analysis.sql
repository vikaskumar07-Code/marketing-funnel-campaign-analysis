-- #Funnel Analysis
-- #overall funnel metrics
USE marketing_analysis;
SELECT 
SUM(Impressions) AS total_impressions,
SUM(Clicks) AS total_clicks,
Sum(estimated_conversions) AS total_conversions,
ROUND(SUM(Clicks) / SUM(Impressions), 4) AS overall_ctr,
    ROUND(SUM(estimated_conversions) / SUM(Clicks), 4) AS overall_conversion_rate
FROM marketing_Campaign_clean;

-- #funnel DROP-off Analysis(%)
SELECT
Round((1-(SUM(Clicks)/SUM(Impressions)))*100,2 ) AS Impression_TO_Click_Drop_pct,
Round((1-(SUm(estimated_conversions)/SUM(clicks)))*100,2)AS click_to_conversion_drop_pct
From marketing_campaign_clean;

#Funnel by Channel
SELECT
Channel_used,
SUM(Impressions) as impressions,
Sum(Clicks) As Clicks,
Sum(estimated_conversions)AS Conversions,
ROUND(SUM(CLICKS)/SUM(Impressions),4)AS CTR,
ROUND(SUM(estimated_conversions)/SUM(clicks),4)AS conversion_rate
FROM marketing_campaign_clean
group by Channel_Used
order by conversion_rate DESC;

#Funnel by Campaign type
SELECT
Campaign_Type,
SUM(Impressions) AS impressions,
Sum(Clicks) AS Clicks,
SUM(estimated_conversions) AS conversions,
ROUND(SUM(Clicks)/SUM(Impressions),4)AS CTR,
ROUND(SUM(estimated_conversions)/SUM(Clicks),4) AS  conversion_rate
FROM marketing_campaign_clean
group by Campaign_Type
order by ctr DESC;