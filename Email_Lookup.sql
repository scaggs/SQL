SELECT *
  FROM [CMM_Repl].[dbo].[T_Emails]
  WHERE [CMM_Repl].[dbo].[T_Emails].[to] LIKE '%@seattlechildrens.org'
  ORDER BY sent_at DESC