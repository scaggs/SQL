SELECT DISTINCT
rr.request_id,
rr.created,
rr.ddid,
rr.drug_name,
rr.revenue_source_category,
rr.revenue_source,
m.drug_group,
m.drug_class,
m.drug_sub_class
FROM common..vw_t_reporting_request_phi rr
JOIN common..t_medispan m ON m.ddid = rr.ddid
JOIN common..t_reporting_user u ON u.user_id = rr.creator_user_id
WHERE
rr.created_month BETWEEN '20170101' AND '20171220'
AND (m.Drug_Group = 'ANTINEOPLASTICS AND ADJUNCTIVE THERAPIES' OR m.Drug_Class = 'Immunomodulators') AND m.Route_of_Administration = 'OR' AND m.MultiSource IN ('N','M') -- single-source oral oncology drugs
AND u.is_internal <> '1' -- no internally created PAS
