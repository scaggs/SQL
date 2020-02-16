SELECT DISTINCT
contact.cntct_cmm_user_id AS 'cntct_key', /* Used for Exact Target email campaigns */
CASE WHEN geo.cbsa_nm_tx IS NULL THEN 'None'
ELSE geo.cbsa_nm_tx END AS 'area',
CASE WHEN tru.display_name is null then 
	case when CHARINDEX(' ', tru.office_contact) =0 THEN  tru.office_contact
	ELSE LEFT (tru.office_contact, CHARINDEX(' ', tru.office_contact)) 
	end
else case when CHARINDEX(' ', tru.display_name) =0 THEN  tru.display_name
	ELSE LEFT (tru.display_name, CHARINDEX(' ', tru.display_name))  
END end AS 'first_name',

tru.display_name AS 'Display Name',
tru.office_contact AS 'Office Contact',
LOWER (tru.email) AS 'email',
LOWER (RIGHT (tru.email, LEN(tru.email) - CHARINDEX('@', tru.email))) AS 'Email Domain',
CASE WHEN engage.segment_category IS NULL THEN 'None'
ELSE engage.segment_category END AS 'Segmentation Category',
tru.username AS 'Username',
CASE WHEN repl.prescriber_specialty IS NULL THEN 'N/A'
ELSE repl.prescriber_specialty END AS 'Specialty',
tru.user_type AS 'User Type',
tru.user_category AS 'User Category',
tru.user_bucket AS 'User Bucket',
CASE WHEN tru.account_name IS NULL THEN 'N/A'
ELSE tru.account_name END AS 'Autobahn Account Name',
tru.real_requests AS 'Real Requests',
CONVERT (date, tru.created_on) AS 'Original Signup Date',
CONVERT (date, tru.last_touch) AS 'Last Touch Date',
DATEDIFF (day,tru.last_touch,getdate()) AS 'Days Since Last Use',
tru.organization_name AS 'Organization Name',
UPPER (tru.address1) AS 'Address',
UPPER (tru.city) AS 'City',
UPPER (tru.state) AS 'State',
LEFT (tru.zip, 5) AS 'Zip Code',
tru.phone AS 'Phone',
CASE WHEN tru.software_vendor IS NULL THEN 'None'
ELSE tru.software_vendor END AS 'EHR Reported By User',
CASE WHEN tru.software_vendor LIKE '%athena%' THEN 'athenahealth'
WHEN tru.software_vendor LIKE '%aethna%' THEN 'athenahealth'
WHEN tru.software_vendor LIKE '%aethnanet%' THEN 'athenahealth'
WHEN tru.software_vendor LIKE '%ahtena%' THEN 'athenahealth'
WHEN tru.software_vendor LIKE 'ath%' THEN 'athenahealth'
WHEN tru.software_vendor ='athenahealth' THEN 'athenahealth'
WHEN tru.software_vendor LIKE '%eclinical%' THEN 'eClinicalWorks'
WHEN tru.software_vendor LIKE 'eClinicalWorks' THEN 'eClinicalWorks'
WHEN tru.software_vendor LIKE '%ecw%' THEN 'eClinicalWorks'
WHEN tru.software_vendor LIKE '%e.c.w%' THEN 'eClinicalWorks'
WHEN tru.software_vendor LIKE '%e-clin%' THEN 'eClinicalWorks'
WHEN tru.software_vendor LIKE '%e clin%' THEN 'eClinicalWorks'
WHEN tru.software_vendor LIKE '%e.clin%' THEN 'eClinicalWorks'
WHEN tru.software_vendor LIKE '%ecln%' THEN 'eClinicalWorks'
WHEN tru.software_vendor LIKE '%eclinc%' THEN 'eClinicalWorks'
WHEN tru.software_vendor ='eClinicalWorks' THEN 'eClinicalWorks'
WHEN tru.software_vendor LIKE '%care360%' THEN 'Care360'
WHEN tru.software_vendor LIKE '%chartmaxx%' THEN 'Care360'
WHEN tru.software_vendor LIKE '%360%' THEN 'Care360'
WHEN tru.software_vendor LIKE '%quest%' THEN 'Care360'
WHEN tru.software_vendor LIKE '%kareo%' THEN 'Care360'
WHEN tru.software_vendor LIKE '%medplus%' THEN 'Care360'
WHEN tru.software_vendor ='Care360' THEN 'Care360'
WHEN tru.software_vendor LIKE '%centricity%' THEN 'GE Centricity'
WHEN tru.software_vendor LIKE '%cintricity%' THEN 'GE Centricity'
WHEN tru.software_vendor LIKE '%GE Healthcare%' THEN 'GE Centricity'
WHEN tru.software_vendor LIKE 'GE' THEN 'GE Centricity'
WHEN tru.software_vendor ='GE Centricity' THEN 'GE Centricity'
WHEN tru.software_vendor LIKE '%general electric%' THEN 'GE Centricity'
WHEN tru.software_vendor LIKE '%Greenway%' THEN 'Greenway'
WHEN tru.software_vendor LIKE '%intergy%' THEN 'Greenway'
WHEN tru.software_vendor LIKE '%primesuite%' THEN 'Greenway'
WHEN tru.software_vendor LIKE '%prime suite%' THEN 'Greenway'
WHEN tru.software_vendor LIKE '%success%' THEN 'Greenway'
WHEN tru.software_vendor LIKE '%vitera%' THEN 'Greenway'
WHEN tru.software_vendor LIKE '%sage%' THEN 'Greenway'
WHEN tru.software_vendor ='Greenway' THEN 'Greenway'
WHEN tru.software_vendor LIKE '%McKesson%' THEN 'McKesson'
WHEN tru.software_vendor LIKE '%Practice Partner%' THEN 'McKesson'
WHEN tru.software_vendor LIKE '%practicepartner%' THEN 'McKesson'
WHEN tru.software_vendor LIKE '%medisoft%' THEN 'McKesson'
WHEN tru.software_vendor LIKE '%lytec%' THEN 'McKesson'
WHEN tru.software_vendor LIKE '%integreat%' THEN 'McKesson'
WHEN tru.software_vendor LIKE 'med3000%' THEN 'McKesson'
WHEN tru.software_vendor LIKE 'med 3000%' THEN 'McKesson'
WHEN tru.software_vendor LIKE '%NextGen%' THEN 'NextGen'
WHEN tru.software_vendor LIKE '%next-gen%' THEN 'NextGen'
WHEN tru.software_vendor LIKE '%next gen%' THEN 'NextGen'
WHEN tru.software_vendor LIKE '%NexGen%' THEN 'NextGen'
WHEN tru.software_vendor ='NextGen' THEN 'NextGen'
WHEN tru.software_vendor LIKE '%amazing charts%' THEN 'Amazing Charts'
WHEN tru.software_vendor LIKE '%amazing%' THEN 'Amazing Charts'
WHEN tru.software_vendor ='practicefusion' THEN 'Practice Fusion'
WHEN tru.software_vendor ='practice fusion' THEN 'Practice Fusion'
WHEN tru.software_vendor ='Epic' THEN 'Epic'
WHEN tru.software_vendor LIKE 'Epic%' THEN 'Epic'
WHEN tru.software_vendor ='Cerner' THEN 'Cerner'
WHEN tru.software_vendor LIKE 'Cerner%' THEN 'Cerner'
WHEN tru.software_vendor LIKE 'Power Chart%' THEN 'Cerner'
WHEN tru.software_vendor LIKE 'Powerchart%' THEN 'Cerner'
WHEN tru.software_vendor ='Allscripts' THEN 'Allscripts'
WHEN tru.software_vendor LIKE 'Allscript%' THEN 'Allscripts'
WHEN tru.software_vendor LIKE '%Touchwork%' THEN 'Allscripts'
WHEN tru.software_vendor IS NULL THEN 'None'
END AS 'EHR Normalized', /* This cleans up the messy EHR names that people put into their accounts */
CASE WHEN geo.cnty_fips_cd IS NULL THEN '0'
ELSE geo.cnty_fips_cd END AS 'County FIPS Code', /* FIPS codes are for Domo mapping */
CASE WHEN epic.email_domain is not null THEN 'YES' ELSE 'NO' end AS 'Epic Target?',
CASE WHEN epic.sales_exec IS NULL THEN 'N/A'
ELSE epic.sales_exec END AS 'Sales Exec'


FROM common.dbo.t_reporting_user tru
LEFT JOIN Marketing.dbo.t_mkt_npi_users_master mnum ON mnum.user_id=tru.user_id
LEFT JOIN CMM_Repl.dbo.T_Users repl ON tru.user_id=repl.id
LEFT JOIN userengage.dbo.t_PORTAL_persona_provider_segment_ASOFTODAY engage ON tru.user_id=engage.user_id
LEFT JOIN ehr.dbo.t_ehr_epic_healthorg_domainlist_adhoc epic ON LOWER (RIGHT (tru.email, LEN(tru.email) - CHARINDEX('@', tru.email)+1))=epic.email_domain /* Matches up Epic systems with their sales exec */
LEFT JOIN common.dbo.cmm_dim_geo geo ON LEFT(tru.zip, 5)=geo.zip_cd /* Matches the user's zip code and NOT the doc's NPI zip code to ensure proper CBSA attribution */
LEFT JOIN SFMC.dbo.contact contact ON tru.user_id=contact.cntct_cmm_user_id /* Gets us the ExactTarget contact key */
--LEFT JOIN CMM_Repl.dbo.T_UserGroupMembership gm ON gm.user_id = tru.user_id

WHERE tru.deleted_on IS NULL
--AND gm.user_id IS NOT NULL
--AND tru.fax='Unknown'
AND tru.email LIKE '%@tgh.org'
AND tru.is_navinet='0'
--AND tru.account_id='867'
--AND tru.user_bucket='PRESCRIBER'
--AND tru.user_category='Physician'
--AND engage.segment_category='Power'
ORDER BY tru.real_requests DESC;