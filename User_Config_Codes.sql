/****** Script for SelectTopNRows command from SSMS  ******/
SELECT user_config_option,
user_config_option_id
  FROM [CMM_Repl].[dbo].[vw_UserConfig]
  GROUP BY user_config_option, user_config_option_id
  ORDER BY user_config_option ASC