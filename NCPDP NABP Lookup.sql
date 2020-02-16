SELECT DISTINCT
[NCPDP Provider ID],
[National Provider ID (NPI)],
[Name],
[Physical Location Address 1],
[Physical Location City],
[Physical Location State Code],
[Legal Business Name],
[Physical Location Fax]

FROM ncpdp.dbo.mas
WHERE [Name] LIKE '%emory%'
--WHERE [Physical Location Address 1] LIKE '%tangerine%'
--WHERE [Primary Provider Type Code] ='15'
--WHERE [NCPDP Provider ID] ='0359516'
--AND [Physical Location State Code] ='NC'
--OR [NCPDP Provider ID] = '4234112'
--WHERE [National Provider ID (NPI)] ='1306905203'
ORDER by Name ASC
