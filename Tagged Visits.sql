SELECT DISTINCT
t.id AS 'Tag ID',
t.name AS 'Tag Name',
user_id 'User ID',
username AS 'Username',
email AS 'Email Address',
LOWER (RIGHT (email, LEN(email) - CHARINDEX('@', email))) AS 'Email Domain'

FROM common.dbo.T_Reporting_User u
JOIN CMM_Repl.dbo.T_Tagging tt on tt.taggable_id = u.user_id
JOIN CMM_Repl.dbo.T_Tag t on t.id = tt.tag_id

WHERE t.name='CentralizedPA'
AND u.deleted_on IS NULL

ORDER BY t.name