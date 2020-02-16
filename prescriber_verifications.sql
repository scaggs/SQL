select 
	distinct assoc.prescriber_id as npi, 
	nppes.provider_last_name_legal_name as prescriber_name,
	assoc.user_id,
	CAST(date_initiated as DATE) as date_initiated,
	cast(date_completed as DATE) as date_completed,
	--method.short_desc,
	ref.classification,
	nppes.entity_type_code,
	contact_number as fax_number
	
from cmm_repl.dbo.t_PrescriberAssociation assoc
join cmm_repl.dbo.T_PrescriberVerification verif on verif.prescriber_association_id = assoc.id
join cmm_repl.dbo.T_ContactPathVerification contact on contact.id = verif.contact_path_verification_id
join cmm_repl.dbo.T_ContactPathMethodType method on method.id = contact.contact_method_type_id
join nppes.dbo.NPPESProvider nppes on nppes.npi_varchar = assoc.prescriber_id
INNER JOIN nppes.dbo.NPPESProviderTaxonomy tax ON tax.nppes_provider_npi=nppes.npi
INNER JOIN nppes.dbo.NPPESProviderTaxonomyCodeReference ref ON ref.taxonomy_code=tax.taxonomy_code

where assoc.association_type_id in (1) /*This means that the user completed the verification process or it is pending for a provider identifier*/
and assoc.user_id is not null
and assoc.deleted = 0
and tax.primary_taxonomy_switch = 'Y'
and method.short_desc = 'queue'
and date_initiated >= dateadd(dd,-7,getdate())
and contact_number != '5555555555'