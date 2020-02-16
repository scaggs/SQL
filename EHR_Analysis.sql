SELECT
software_vendor,
COUNT (software_vendor) AS 'Number'
FROM CMM_DataMart.dbo.t_reporting_user
WHERE deleted_on IS NULL
GROUP BY software_vendor
ORDER BY software_vendor ASC