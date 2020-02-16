IF OBJECT_ID ('tempdb..#temp1') IS NOT NULL DROP TABLE #temp1
--If table exists drop table #temp1
SELECT
    tr.id,
    f.description,
    tr.drug_DDID_text,
    tr.created,
    tr.sent,
    tr.deleted,
    tr.display_name,
    tr.prescriber_city,
    tr.prescriber_state,
    tr.office_contact,
    tr.npi,
    tr.form_search_text
	into #temp1
    FROM cmm_repl.dbo.T_Requests tr
    inner join cmm_repl.dbo.T_Form f on f.formname + '_' + convert(varchar,f.id) = tr.form_name
    inner join cmm_repl.dbo.T_WorkflowCategory wc on wc.id = tr.workflowcategory_id
    where f.[is_enrollment] = 1 OR
        f.[RequestType] = 'SPE'
        and [workflowcategory_id] = 4
    
    --where tr.form_search_text LIKE '%accredo%'
    --AND tr.created > 2018-01-10
    /*AND tr.drug_DDID IN (137637,
137638,
137639,
000408,
185384,
149015,
187771,


select
	t.*,
	trr.creator_email
from
	#temp1 t
	inner join sp_ex.dbo.t_reporting_request trr
		--on t.created = trr.created
		on t.id = trr.request_id
		and t.npi = trr.npi