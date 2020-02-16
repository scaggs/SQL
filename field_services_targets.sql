USE [CMM_DataMart]
GO
/****** Object:  StoredProcedure [dbo].[p_dba_domo_ehr_field_service_targets]    Script Date: 06/21/2016 12:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



 --=============================================
 --Author:		choward/dscaglione
 --Create date: 20160106
 --Description:	All EHR Monthly Stats Excluding Epic
 --=============================================
ALTER PROCEDURE [dbo].[p_dba_domo_ehr_field_service_targets]

AS
BEGIN



--DROP TABLE domo..t_field_service_targets
TRUNCATE TABLE domo..t_field_service_targets

INSERT domo..t_field_service_targets
SELECT DISTINCT
t1.user_id AS 'User ID',
t1.username AS 'Username',
repl.prescriber_specialty AS 'Specialty',
t1.user_type AS 'User Type',
t1.user_type_id AS 'User Type ID',
t1.account_name AS 'Managed Account Name',
t1.real_requests AS 'Real Requests',
t1.display_name AS 'Display Name',
LEFT (t1.display_name, CHARINDEX(' ', t1.display_name)) AS 'Email Campaign First Name',
LOWER (t1.email) AS 'Email',
LOWER (RIGHT (t1.email, LEN(t1.email) - CHARINDEX('@', t1.email))) AS 'Email Domain',
t3.cbsa_nm_tx AS 'CBSA',
CONVERT (date, t1.created_on) AS 'Original Signup Date',
CONVERT (date, t1.last_touch) AS 'Last Touch Date',
DATEDIFF (day,t1.last_touch,getdate()) AS 'Days Since Last Use',
case when DATEDIFF (day,t1.last_touch,getdate()) >= 90 OR DATEDIFF (day,t1.last_touch,getdate()) IS NULL then 'Inactive'
when DATEDIFF (day,t1.last_touch,getdate()) BETWEEN 30 and 90 THEN 'Recently Inactive'
when DATEDIFF (day,t1.last_touch,getdate()) BETWEEN 0 and 15 THEN 'Active'
when DATEDIFF (day,t1.last_touch,getdate()) BETWEEN 16 and 29 THEN 'At Risk'
END AS 'User Health Status',
CASE WHEN DATEDIFF (day,t1.created_on,getdate()) <= 15 THEN 'Y' ELSE 'N'
END AS 'New User?',
t1.organization_name AS 'Organization Name',
t1.office_contact AS 'Office Contact',
t1.address1 AS 'Address',
t1.city AS 'City',
t1.state AS 'State',
t1.zip AS 'Zip',
t1.fax AS 'Fax',
t1.phone AS 'Phone',
t1.software_vendor AS 'EHR Reported By User',
case when t1.software_vendor LIKE '%athena%' then 'athenahealth'
when t1.software_vendor LIKE '%aethna%' then 'athenahealth'
when t1.software_vendor LIKE '%aethnanet%' then 'athenahealth'
when t1.software_vendor LIKE '%ahtena%' then 'athenahealth'
when t1.software_vendor LIKE 'ath%' then 'athenahealth'
when t1.software_vendor LIKE '%eclinical%' then 'eClinicalWorks'
when t1.software_vendor LIKE 'eClinicalWorks' then 'eClinicalWorks'
when t1.software_vendor LIKE '%ecw%' then 'eClinicalWorks'
when t1.software_vendor LIKE '%e.c.w%' then 'eClinicalWorks'
when t1.software_vendor LIKE '%e-clin%' then 'eClinicalWorks'
when t1.software_vendor LIKE '%e clin%' then 'eClinicalWorks'
when t1.software_vendor LIKE '%e.clin%' then 'eClinicalWorks'
when t1.software_vendor LIKE '%ecln%' then 'eClinicalWorks'
when t1.software_vendor LIKE '%eclinc%' then 'eClinicalWorks'
when t1.software_vendor LIKE '%care360%' then 'Care360'
when t1.software_vendor LIKE '%chartmaxx%' then 'Care360'
when t1.software_vendor LIKE '%360%' then 'Care360'
when t1.software_vendor LIKE '%quest%' then 'Care360'
when t1.software_vendor LIKE '%kareo%' then 'Care360'
when t1.software_vendor LIKE '%medplus%' then 'Care360'
when t1.software_vendor LIKE '%centricity%' then 'GE Centricity'
when t1.software_vendor LIKE '%cintricity%' then 'GE Centricity'
when t1.software_vendor LIKE '%GE Healthcare%' then 'GE Centricity'
when t1.software_vendor LIKE 'GE' then 'GE Centricity'
when t1.software_vendor LIKE '%general electric%' then 'GE Centricity'
when t1.software_vendor LIKE '%Greenway%' then 'Greenway'
when t1.software_vendor LIKE '%intergy%' then 'Greenway'
when t1.software_vendor LIKE '%primesuite%' then 'Greenway'
when t1.software_vendor LIKE '%prime suite%' then 'Greenway'
when t1.software_vendor LIKE '%success%' then 'Greenway'
when t1.software_vendor LIKE '%vitera%' then 'Greenway'
when t1.software_vendor LIKE '%sage%' then 'Greenway'
when t1.software_vendor LIKE '%McKesson%' then 'McKesson'
when t1.software_vendor LIKE '%Practice Partner%' then 'McKesson'
when t1.software_vendor LIKE '%practicepartner%' then 'McKesson'
when t1.software_vendor LIKE '%medisoft%' then 'McKesson'
when t1.software_vendor LIKE '%lytec%' then 'McKesson'
when t1.software_vendor LIKE '%integreat%' then 'McKesson'
when t1.software_vendor LIKE 'med3000%' then 'McKesson'
when t1.software_vendor LIKE 'med 3000%' then 'McKesson'
when t1.software_vendor LIKE '%NextGen%' then 'NextGen'
when t1.software_vendor LIKE '%next-gen%' then 'NextGen'
when t1.software_vendor LIKE '%next gen%' then 'NextGen'
when t1.software_vendor LIKE 'NexGen' then 'NextGen'
when t1.software_vendor LIKE '%amazing charts%' then 'Amazing Charts'
when t1.software_vendor LIKE '%amazing%' then 'Amazing Charts'
when t1.software_vendor ='practicefusion' then 'Practice Fusion'
when t1.software_vendor ='practice fusion' then 'Practice Fusion'
when t1.software_vendor ='Epic' then 'Epic'
when t1.software_vendor LIKE 'Epic%' then 'Epic'
when t1.software_vendor ='Cerner' then 'Cerner'
when t1.software_vendor LIKE 'Cerner%' then 'Cerner'
when t1.software_vendor LIKE 'Power Chart%' then 'Cerner'
when t1.software_vendor LIKE 'Powerchart%' then 'Cerner'
when t1.software_vendor ='Allscripts' then 'Allscripts'
when t1.software_vendor LIKE 'Allscript%' then 'Allscripts'
when t1.software_vendor LIKE 'Touchwork%' then 'Allscripts'
END AS 'EHR Normalized',
t3.cnty_fips_cd AS 'County FIPS Code',
case when t2.cmm_user_id is not null then 'YES' else 'NO' end AS 'EHR Integration Requested?',
case when rs.email_domain is not null then 'YES' else 'NO' end AS 'Epic Target?',
case when t1.state IN ('WA', 'OR', 'CA', 'NV', 'AZ', 'UT', 'NM', 'WY', 'ID', 'MT', 'ND', 'AK', 'HI') and rs.email_domain IS NOT NULL then 'Amelia Favorite'
when t1.state IN ('SD', 'MN', 'IA', 'WI', 'KY', 'WV', 'VA', 'NC', 'MD') and rs.email_domain IS NOT NULL then 'David Fox'
when t1.state IN ('TX', 'OK', 'KS', 'NE', 'MO', 'IL', 'TN', 'AR', 'LA', 'MS', 'AL', 'GA', 'SC', 'FL') and rs.email_domain IS NOT NULL then 'Gary Novy'
when t1.state IN ('MI', 'IN', 'PA', 'NJ', 'VT', 'NH', 'ME', 'MA', 'RI', 'CT', 'DE') and rs.email_domain IS NOT NULL then 'Megan Clark'
when t1.state IN ('OH', 'NY') and rs.email_domain IS NOT NULL then 'David Fox/Megan Clark'
end as 'Sales Exec',
case when mnum.NPI is not null then 'YES' else 'NO' end AS 'Pharma MVP Target?'

--INTO domo..t_field_service_targets

FROM [t_reporting_user] t1
LEFT JOIN ehr_request_repl.dbo.requests t2 ON t1.user_id=t2.cmm_user_id
LEFT JOIN Marketing.dbo.t_mkt_npi_users_master mnum ON mnum.user_id=t1.user_id
LEFT JOIN Reporting_Staging.dbo.npi_provider_targets npt ON mnum.NPI=npt.NPI
LEFT JOIN CMM_Repl.dbo.T_Users repl ON t1.user_id=repl.id
LEFT JOIN Sandbox.dbo.t_ehr_epic_healthorg_domainlist_adhoc rs ON LOWER (RIGHT (t1.email, LEN(t1.email) - CHARINDEX('@', t1.email)+1))=rs.email_domain
INNER JOIN cmm_dim_geo t3 ON t1.zip=t3.zip_cd

WHERE t1.deleted_on IS NULL
AND (t1.user_type_id !='22'
AND t1.user_type_id !='8'
AND t1.user_type_id !='4'
AND t1.user_type_id !='7'
AND t1.user_type_id !='11'
AND t1.user_type_id !='9'
AND t1.user_type_id !='2')
ORDER BY t1.real_requests DESC;

END
