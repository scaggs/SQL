SELECT
df.data:drugs:0:additional_information:0:additional_information_qualifier,
r.patient_rx_bin

FROM datascience.dbo.tmp_ken_test_df df
INNER JOIN adjudications_repl.dbo.results r ON r.claim_id = df.results_id