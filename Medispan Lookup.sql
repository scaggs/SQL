SELECT DISTINCT
drug_name AS 'Drug Name',
WAC AS 'Wholesale Acquisition Cost',
AWP AS 'Avg Wholesale Price',
ndc AS 'NDC'
FROM common.dbo.t_medispan
WHERE drug_name LIKE '%freestyle libre%'
--AND Item_Status_Flag ='A'
--WHERE DDID LIKE '%097052%'
--WHERE ndc ='00193731310'
--WHERE drug_group ='HEMATOPOIETIC AGENTS'
--WHERE drug_sub_class ='Growth Hormones'
--WHERE drug_class ='Antiretrovirals'
--AND MultiSource IN ('M', 'N')
ORDER BY drug_name ASC