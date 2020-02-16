SELECT DISTINCT
ug.group_name AS 'Group Name',
ug.account_id AS 'Autobahn Account ID',
ug.id AS 'Group ID'

FROM common..t_reporting_user u
LEFT JOIN CMM_Repl.dbo.T_UserGroupMembership gm ON gm.user_id = u.user_id
JOIN CMM_Repl.dbo.T_UserGroup ug ON ug.id = gm.group_id

WHERE ug.deleted_on IS NULL
AND u.email LIKE '%@tgh.org'
--AND ug.group_name LIKE '%insurance%'
ORDER BY ug.group_name ASC
