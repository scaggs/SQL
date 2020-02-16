SELECT DISTINCT
form_search_text

FROM dbo.T_Requests

WHERE created > 2018-01-10
AND form_search_text LIKE '%accredo%'