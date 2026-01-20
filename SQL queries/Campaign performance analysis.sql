#Campaign performance analysis
#1.overall Performance Snapshot
SELECT 
COUNT(DISTINCT Campaign_id) AS Total_campaigns,
ROUND(AVG(ROI),2) AS avg_roi,
ROUND(SUM(acquisition_cost),2) As Total_spend,
ROUND(SUM(estimated_conversions),0)AS total_conversions,
ROUND(AVG(cost_per_click),2) AS avg_cpc
FROM marketing_campaign_clean;

#2.Performance by Channel
SELECT
channel_used,
count(DISTINCT Campaign_ID) as campaigns,
Round(AVG(ROI),2) as avg_roi,
ROUND(SUM(acquisition_cost),2) AS total_spend,
ROUND(SUM(estimated_conversions),0)AS conversions,
ROUND(AVG(cost_per_click),2) AS avg_cpc
FROM marketing_campaign_clean
GROUP BY channel_used
ORDER BY avg_roi DESC;

#Performance by Campaign Type
Select
campaign_type,
COUNT(DISTINCT Campaign_ID) AS campaigns,
ROUND(AVG(ROI),2)	AS avg_roi,
ROUND(SUM(acquisition_cost),2) AS total_Spend,
ROUND(SUM(estimated_conversions),0) AS conversions,
ROUND(AVG(cost_per_click),2)AS avg_cpc
FROM marketing_campaign_clean
group by Campaign_Type
order by avg_roi DESC;

#TOP-10 High ROI Campaign
SELECT
Campaign_ID,
Company,
Channel_used,
Campaign_Type,
Round(ROI,2) AS roi,
ROUND(acquisition_cost,2) AS spend,
ROUND(estimated_conversions,0) AS conversions
FROM marketing_campaign_clean
ORDER BY ROI desc
LIMIT 10;

#High Spend but Low ROI
Select 
Campaign_ID,
Company,
Channel_used,
ROUND(acquisition_cost,2)AS Spend,
ROUND(ROI,2) AS ROI
FROM marketing_campaign_clean
WHERE ROI <(select AVG(ROI) From marketing_campaign_clean)
Order by acquisition_cost DESC
LIMIT 10;