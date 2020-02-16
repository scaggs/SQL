SELECT *
FROM dbo.T_Form
WHERE RequestType = 'SPE'
AND deleted='0'
AND status='1'