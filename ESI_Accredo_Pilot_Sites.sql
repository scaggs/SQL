--- ============================================================================
--- Get the drugs
--- ============================================================================
IF OBJECT_ID ('tempdb..#drugs') IS NOT NULL DROP TABLE #drugs
SELECT DISTINCT m.DDID, m.Drug_Name
INTO #drugs
FROM common..t_medispan m 
WHERE m.DDID IN ('149015',
'175692',
'175693',
'044211',
'189827',
'189826',
'181759',
'182490',
'187771',
'181924',
'160680',
'188942',
'186573',
'197475',
'185870',
'185872',
'185871',
'185873',
'189801',
'189802',
'189829',
'189830',
'189831',
'189806',
'178584',
'178585',
'178586',
'091157',
'193495')

--- ============================================================================
--- Get the the requests
--- ============================================================================
IF OBJECT_ID ('tempdb..#requests') IS NOT NULL DROP TABLE #requests
SELECT p.request_id, p.faxed_plan_time, p.ePA_PA_Req, p.form_id, p.submitting_user_id, p.request_state, p.parent_plan_name, p.epa_type, p.month, p.submitted_date
INTO #requests
FROM plan_pbm..t_payer_reporting p
INNER JOIN #drugs d on p.ddid = d.DDID
WHERE p.month >= '20160501' 
DELETE FROM #requests WHERE request_id IN (SELECT [key] FROM central_repl..requests WHERE from_central = 1) --- get rid of Central requests, no user info
--- ============================================================================
--- Output
--- ============================================================================

SELECT 
contact.cntct_key AS 'cntct_key',
submitting_user_id AS user_id,
CASE WHEN tru.display_name is null then 
	case when CHARINDEX(' ', tru.office_contact) =0 THEN  tru.office_contact
	ELSE LEFT (tru.office_contact, CHARINDEX(' ', tru.office_contact)) 
	end
else case when CHARINDEX(' ', tru.display_name) =0 THEN  tru.display_name
	ELSE LEFT (tru.display_name, CHARINDEX(' ', tru.display_name))  
END end AS 'first_name',
tru.organization_name AS 'Org Name',
tru.display_name AS 'Display Name',
tru.office_contact AS 'Office Contact',
CASE WHEN geo.cbsa_nm_tx IS NULL THEN 'None'
ELSE geo.cbsa_nm_tx END AS 'CBSA',
tru.email AS 'Email',
LOWER (RIGHT (tru.email, LEN(tru.email) - CHARINDEX('@', tru.email))) AS 'Email Domain',
tru.user_type AS 'User Type',
tru.city AS 'City',
tru.state AS 'State',
tru.phone AS 'Phone',
tru.software_vendor AS 'EHR Vendor',
sg.segment_category AS 'User Segmentation',
tru.requests AS 'Total Lifetime Requests',
tru.real_requests AS 'Total Lifetime Real Requests',
COUNT(DISTINCT request_id) AS 'Total MS Requests',
COUNT(DISTINCT CASE WHEN parent_plan_name = 'Express Scripts' THEN request_id END) AS 'ESI MS Requests',
COUNT(DISTINCT CASE WHEN parent_plan_name = 'Express Scripts' THEN request_id END)/CAST(COUNT(DISTINCT request_id) AS FLOAT) AS 'ESI Percentage',
MAX(CASE WHEN parent_plan_name = 'Express Scripts' THEN submitted_date END) AS 'Last ESI Submission'

FROM #requests r
INNER JOIN common..t_reporting_user tru on r.submitting_user_id = tru.user_id
INNER JOIN userengage.dbo.t_PORTAL_persona_provider_segment_ASOFTODAY sg ON r.submitting_user_id = sg.user_id -- limiting to only "cleaned prescribers" per Megan
LEFT JOIN common.dbo.cmm_dim_geo geo ON LEFT(tru.zip, 5)=geo.zip_cd
LEFT JOIN SFMC.dbo.contact contact ON tru.user_id=contact.cntct_cmm_user_id

WHERE tru.email NOT LIKE '%@emdserono.com'

GROUP BY contact.cntct_key, submitting_user_id, tru.username, tru.organization_name, tru.office_contact, tru.display_name, geo.cbsa_nm_tx, tru.email, tru.phone, tru.user_type, tru.city, tru.state, tru.software_vendor, sg.segment_category, tru.requests, tru.real_requests
HAVING COUNT(DISTINCT CASE WHEN parent_plan_name = 'Express Scripts' THEN request_id end) >= 1
AND MAX(CASE WHEN parent_plan_name = 'Express Scripts' THEN submitted_date END) > '20160501'
ORDER BY COUNT(DISTINCT CASE WHEN parent_plan_name = 'Express Scripts' THEN request_id END) DESC