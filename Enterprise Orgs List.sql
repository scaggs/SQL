SELECT DISTINCT
rs.org_name AS 'Organization Name',
t1.user_id AS 'User ID',
t1.username AS 'Username',
t1.user_type AS 'User Type',
t1.account_name AS 'Managed Account Name',
t1.real_requests AS 'Real Requests',
t1.display_name AS 'Display Name',
LOWER (t1.email) AS 'Email',
LOWER (RIGHT (t1.email, LEN(t1.email) - CHARINDEX('@', t1.email))) AS 'Email Domain',
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
t1.software_vendor AS 'EHR Reported By User'

FROM t_reporting_user t1
RIGHT JOIN Sandbox.dbo.t_provider_enterprise_orgs rs ON LOWER (RIGHT (t1.email, LEN(t1.email) - CHARINDEX('@', t1.email)+1))=rs.email_domain

WHERE t1.deleted_on IS NULL
ORDER BY t1.account_name ASC;
