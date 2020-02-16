SELECT
npp.npi AS 'NPI',
npp.provider_credential_text AS 'Credentials',
tax.taxonomy_code AS 'Taxonomy Code',
ref.classification AS 'Taxonomy Classification',
COUNT (ref.classification) AS 'Number'

FROM nppes.dbo.NPPESProvider npp
INNER JOIN nppes.dbo.NPPESProviderTaxonomy tax ON tax.nppes_provider_npi=npp.npi
INNER JOIN nppes.dbo.NPPESProviderTaxonomyCodeReference ref ON ref.taxonomy_code=tax.taxonomy_code

WHERE npp.npi_deactivation_date IS NULL
AND tax.taxonomy_code='390200000X'
--AND npp.npi='1447418512'
GROUP BY npp.npi, tax.taxonomy_code, ref.classification, npp.provider_credential_text
