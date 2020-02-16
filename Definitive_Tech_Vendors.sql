SELECT DISTINCT
technology_vendor

FROM definitive_health.dbo.TECHNOLOGY



WHERE technology_category='Electronic Health Records'


GROUP BY technology_vendor
ORDER BY technology_vendor ASC