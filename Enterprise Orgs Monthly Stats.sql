DECLARE @date datetime
SET @date = dateadd(mm,datediff(m,0,convert(date, getdate()))-3,0) /* This changes how many months you look back */

SELECT
CONVERT(date, trr.request_date_month) AS 'Month',
orgs.org_name AS 'Managed Account',
COUNT(DISTINCT case when trr.real=1 then trr.request_id END) AS 'Real Requests',
COUNT(DISTINCT trr.request_id) AS 'Total Requests',
COUNT(distinct trr.NPI) AS 'Unique NPIs',
COUNT(distinct trr.creator_user_id) AS 'Active Users',
SUM (trev.Gross_Pharma_Revenue) AS 'Pharma Revenue',
SUM (case when trev.gross_pharma_revenue > 0 then 1 else 0 end) as 'Sponsored Volume',
SUM (trev.Gross_Plan_Revenue) AS 'Plan Revenue',
SUM (trev.Gross_Pharma_Revenue+trev.Gross_Plan_Revenue) AS 'Total Revenue'

FROM [vw_t_reporting_request_phi] trr
LEFT JOIN t_reporting_user tru ON trr.creator_user_id=tru.user_id /* This joins the request to the proper account id */
LEFT JOIN Finance.dbo.RequestRevenue trev ON trev.Request_ID=trr.request_id /* This gives us the Pharma and Plan Revenue columns */
INNER JOIN Sandbox.dbo.t_provider_enterprise_orgs orgs ON LOWER (RIGHT (tru.email, LEN(tru.email) - CHARINDEX('@', tru.email)+1))=orgs.email_domain

WHERE tru.deleted_on IS NULL
AND trr.request_date_month > @date
GROUP BY CONVERT(date, trr.request_date_month), orgs.org_name
ORDER BY CONVERT(date, trr.request_date_month) DESC;
