SELECT DISTINCT
tru.username,
tru.display_name,
tru.organization_name,
tru.address1,
tru.city,
tru.state,
tru.zip,
tru.email,
tru.phone,
tru.fax,
tru.account_name,
tru.user_category,
tru.NCPDP,
tru.last_touch,
tru.requests,
tru.real_requests,
tru.software_vendor,
tru.brand_name,
NCPDP.name,
geo.cbsa_nm_tx,
geo.msa_nm_tx

FROM CMM_DataMart.dbo.t_reporting_user tru
INNER JOIN NCPDP.dbo.T_NCPDP NCPDP ON NCPDP.NCPDP=tru.NCPDP
LEFT JOIN CMM_DataMart.dbo.cmm_dim_geo geo ON tru.zip=geo.zip_cd

WHERE (NCPDP.state='WI'
OR NCPDP.state='MN')