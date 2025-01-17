SELECT DISTINCT
ms.drug_name AS 'Drug Name',
--id,
--consumer_id,
--request_claim_id,
patient_rx_bin AS 'RxBIN',
patient_pcn AS 'RxPCN',
patient_group_id AS 'RxGRP',
patient_gender AS 'Patient Gender',
drug_ndc AS 'Drug NDC',
drug_quantity AS 'Drug Quantity',
--drug_days_supply,
--other_coverage_code,
--scheduled_prescription_id_number,
--pharmacy_service_type,
--daw_code,
--fill_number,
--compound_code,
--num_refills,
--prescription_origin_code,
--place_of_service,
--patient_residence,
--patient_relationship,
prescriber_first_name AS 'Prescriber First Name',
prescriber_last_name AS 'Prescriber Last Name',
prescriber_npi aS 'Prescriber NPI',
--prescriber_state,
created_at AS 'Created On',
updated_at AS 'Updated On',
--pharmacy_npi,
request_id AS 'CMM Key',
--results_id,

[data:drugs:0:additional_information:0:information] AS 'Info 0',
[data:drugs:0:additional_information:0:additional_information_qualifier] AS 'Info 0 Addl',
[data:drugs:0:additional_information:1:information] AS 'Info 1',
[data:drugs:0:additional_information:1:additional_information_qualifier] AS 'Info 1 Addl',
[data:drugs:0:additional_information:2:information] AS 'Info 2',
[data:drugs:0:additional_information:2:additional_information_qualifier] AS 'Info 2 Addl',
[data:drugs:0:additional_information:3:information] AS 'Info 3',
[data:drugs:0:additional_information:3:additional_information_qualifier] AS 'Info 3 Addl',
[data:drugs:0:additional_information:4:information] AS 'Info 4',
[data:drugs:0:additional_information:4:additional_information_qualifier] AS 'Info 4 Addl',
[data:drugs:0:additional_information:5:information] AS 'Info 5',
[data:drugs:0:additional_information:5:additional_information_qualifier] AS 'Info 5 Addl',
[data:drugs:0:additional_information:6:information] AS 'Info 6',
[data:drugs:0:additional_information:6:additional_information_qualifier] AS 'Info 6 Addl',
[data:drugs:0:additional_information:7:information] AS 'Info 7',
[data:drugs:0:additional_information:7:additional_information_qualifier] AS 'Info 7 Addl',
[data:drugs:0:additional_information:8:information] AS 'Info 8',
[data:drugs:0:additional_information:8:additional_information_qualifier] AS 'Info 8 Addl',
[data:drugs:0:additional_information:9:information] AS 'Info 9',
[data:drugs:0:additional_information:9:additional_information_qualifier] AS 'Info 9 Addl',
[data:drugs:0:additional_information:10:information] AS 'Info 10',
[data:drugs:0:additional_information:10:additional_information_qualifier] AS 'Info 10 Addl',
[data:drugs:0:additional_information:11:information] AS 'Info 11',
[data:drugs:0:additional_information:11:additional_information_qualifier] AS 'Info 11 Addl',
[data:drugs:0:additional_information:12:information] AS 'Info 12',
[data:drugs:0:additional_information:12:additional_information_qualifier] AS 'Info 12 Addl',
[data:drugs:0:additional_information:13:information] AS 'Info 13',
[data:drugs:0:additional_information:13:additional_information_qualifier] AS 'Info 13 Addl',
[data:drugs:0:additional_information:14:information] AS 'Info 14',
[data:drugs:0:additional_information:14:additional_information_qualifier] AS 'Info 14 Addl',
[data:drugs:0:additional_information:15:information] AS 'Info 15',
[data:drugs:0:additional_information:15:additional_information_qualifier] AS 'Info 15 Addl',

[data:drugs:0:amount_of_coinsurance:amount] AS 'Coinsurance Amount',
[data:drugs:0:amount_of_coinsurance:display] AS 'Coinsurance Display',
[data:drugs:0:amount_of_copay:amount] AS 'Copay Amount',
[data:drugs:0:amount_of_copay:display] AS 'Copay Display',
[data:drugs:0:history:0:additional_text] AS 'Drug History - Additional Text 0',
[data:drugs:0:history:0:free_text] AS 'Drug History - Free Text 0',
[data:drugs:0:history:0:previous_date_of_fill] AS 'Drug History - Previous Date of Fill 0',
[data:drugs:0:history:0:quantity_of_previous_fill] AS 'Drug History - Quantity of Previous Fill 0',
[data:drugs:0:history:1:additional_text] AS 'Drug History - Additional Text 1',
[data:drugs:0:history:1:free_text] AS 'Drug History - Free Text 1',
[data:drugs:0:history:1:previous_date_of_fill] AS 'Drug History - Previous Date of Fill 1',
[data:drugs:0:history:1:quantity_of_previous_fill] AS 'Drug History - Quantity of Previous Fill 1',
[data:drugs:0:history:2:additional_text] AS 'Drug History - Additional Text 2',
[data:drugs:0:history:2:free_text] AS 'Drug History - Free Text 2',
[data:drugs:0:history:2:previous_date_of_fill] AS 'Drug History - Previous Date of Fill 2',
[data:drugs:0:history:2:quantity_of_previous_fill] AS 'Drug History - Quantity of Previous Fill 2',
[data:drugs:0:history:3:additional_text] AS 'Drug History - Additional Text 3',
[data:drugs:0:history:3:free_text] AS 'Drug History - Free Text 3',
[data:drugs:0:history:3:previous_date_of_fill] AS ' Drug History - Previous Date of Fill 3',
[data:drugs:0:history:3:quantity_of_previous_fill] AS 'Drug History - Quantity of Previous Fill 3',
[data:drugs:0:history:4:additional_text] AS 'Drug History - Additional Text 4',
[data:drugs:0:history:4:free_text] AS 'Drug History - Free Text 4',
[data:drugs:0:history:4:previous_date_of_fill] AS 'Drug History - Previous Date of Fill 4',
[data:drugs:0:history:4:quantity_of_previous_fill] AS 'Drug History - Quantity of Previous Fill 4',
[data:drugs:0:history:5:additional_text] AS 'Drug History - Additional Text 5',
[data:drugs:0:history:5:free_text] AS 'Drug History - Free Text 5',
[data:drugs:0:history:5:previous_date_of_fill] AS 'Drug History - Previous Date of Fill 5',
[data:drugs:0:history:5:quantity_of_previous_fill] AS 'Drug History - Quantity of Previous Fill 5',
[data:drugs:0:history:6:additional_text] AS 'Drug History - Additional Text 6',
[data:drugs:0:history:6:free_text] AS 'Drug History - Free Text 6',
[data:drugs:0:history:6:previous_date_of_fill] AS 'Drug History - Previous Date of Fill 6',
[data:drugs:0:history:6:quantity_of_previous_fill] AS 'Drug History - Quantity of Previous Fill 6',
[data:drugs:0:history:7:free_text] AS 'Drug History - Free Text 7',
[data:drugs:0:history:7:previous_date_of_fill] AS 'Drug History - Previous Date of Fill 7',
[data:drugs:0:history:7:quantity_of_previous_fill] AS 'Drug History - Quantity of Previous Fill 7',
[data:drugs:0:history:8:free_text] AS 'Drug History - Free Text 8',
[data:drugs:0:history:8:previous_date_of_fill] AS 'Drug History - Previous Date of Fill 8',
[data:drugs:0:history:8:quantity_of_previous_fill] AS 'Drug History - Quantity of Previous Fill 8',
[data:drugs:0:ndc] AS 'Drug NDC',
[data:drugs:0:patient_pay_amount:amount] AS 'Patient Pay Amount',
[data:drugs:0:prescription_service_reference_number] AS 'Rx Service Ref Number',
[data:drugs:0:quantity_dispensed] AS 'Quantity Dispensed',
[data:drugs:0:rejections:0] AS 'Rejection Message 0',
[data:drugs:0:rejections:1] AS 'Rejection Message 1',
[data:drugs:0:rejections:2] AS 'Rejection Message 2',
[data:drugs:0:rejections:3] AS 'Rejection Message 3',
[data:drugs:0:rejections:4] AS 'Rejection Message 4',
[data:drugs:0:rejections:5] AS 'Rejection Message 5',
[data:drugs:0:rejections:6] AS 'Rejection Message 6',
[data:errors:communication] AS 'Communication Errors',
[data:errors:validation] AS 'Validation Errors',
[data:errors:validation:drugs:0:ndc:0] AS 'Validation Errors - NDC',
[data:errors:validation:drugs:0:quantity_dispensed:0] AS 'Validation Errors - Qty Dispensed 0',
[data:errors:validation:drugs:quantity_dispensed:0] AS 'Validation Errors - Qty Dispensed 1',
[data:errors:validation:header:processor_control_number:0] AS 'RxPCN Validation Errors',
[data:errors:validation:insurance:bin_number:0] AS 'RxBIN Validation Errors',
[data:errors:validation:insurance:cardholder_id:0] AS 'Member ID Validation Errors',
[data:errors:validation:insurance:group_id:0] AS 'RxGRP Validation Errors',
[data:errors:validation:insurance:pcn:0] AS 'RxPCN Validation Errors',
[data:errors:validation:member:address:zipcode:0] AS 'Member Zipcode Validation Errors',
[data:errors:validation:member:last_name:0] AS 'Member Last Name Validation Errors',
[data:errors:validation:prescriber:last_name:0] AS 'Prescriber Last Name Validation Errors',
[data:errors:validation:prescriber:npi:0] AS 'Prescriber NPI Validation Errors',
error AS 'Error Message',
[meta:activity_id] AS 'PokitDok Activity ID'

FROM incubation_studio.dbo.eligibility_pokitdok_pharmacy_analysis pd
INNER JOIN common.dbo.t_medispan ms ON pd.drug_ndc=ms.NDC
--WHERE [data:drugs:0:additional_information:0:information] LIKE '%accredo%'