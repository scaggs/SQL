SELECT * FROM cmm_repl.dbo.T_Emails
WHERE created_at >= '2018-08-20 00:00:00:000'
AND template_id IN 
('268',
'263',
'264',
'265',
'266',
'267')