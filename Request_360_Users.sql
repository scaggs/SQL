WITH request_360 AS (
	SELECT 
		id AS user_config_option_id
	FROM CMM_Repl..T_UserConfigOption
	WHERE user_config_option = 'request_360_enabled'
)
SELECT DISTINCT
	users.user_id AS 'User ID',
	geo.cbsa_nm_tx AS ' CBSA',
	users.username AS 'CMM Username',
	users.display_name AS 'Display Name',
	users.office_contact AS 'Office Contact',
	users.organization_name AS 'Org Name',
	users.address1 AS 'Address',
	users.city AS 'City',
	users.state AS 'State',
	users.zip AS 'Zip Code',
	LEFT (users.display_name, CHARINDEX(' ', users.display_name)) AS 'Email Campaign First Name',
	LOWER (users.email) AS 'Email',
    LOWER (RIGHT (users.email, LEN(users.email) - CHARINDEX('@', users.email))) AS 'Email Domain',
	users.phone AS 'Phone',
	CONVERT (DATE,users.created_on) AS 'Account Creation Date',
	users.software_vendor AS 'EHR',
	users.account_name AS 'Autobahn Account Name',
	users.first_touch AS 'First Use Date',
	users.last_touch AS 'Last Touch',
	DATEDIFF (day,users.last_touch,getdate()) AS 'Days Since Last Use',
	users.requests AS 'Total Requests',
	users.real_requests AS 'Real Requests',
	users.real_requests_per_day AS 'Real Requests Per Day'
FROM common..T_Reporting_User AS users
JOIN CMM_Repl..vw_UserConfig AS user_configs
	ON user_configs.user_id = users.user_id
JOIN request_360
	ON request_360.user_config_option_id = user_configs.user_config_option_id
	INNER JOIN common.dbo.cmm_dim_geo geo ON users.zip=geo.zip_cd
	WHERE user_type_id = 1
	AND is_internal = 0
	AND user_category ='Physician'
	AND deleted_on IS NULL
	AND organization_name NOT LIKE '%pharm%'
	AND account_type_id ='2'
	AND NCPDP IS NULL
	AND email NOT LIKE '%@mayo.edu'
	AND email NOT LIKE '%@covermymeds.com'
	ORDER BY real_requests_per_day DESC