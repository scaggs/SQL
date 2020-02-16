SELECT DISTINCT
contract.start AS 'Contract Start Date',
contract.finish AS 'Contract End Date',
CC.value AS 'DDID',
fees.fee_amount AS 'Fee Amount',
M.Mfr AS 'Manufacturer',
M.Drug_Name AS 'Drug Name',
M.Drug_Full_GPI_Name AS 'Full GPI Name',
M.Drug_Group AS 'Drug Group',
M.Drug_Class AS 'Drug Class',
M.Drug_Sub_Class AS 'Drug Sub Class',
P.name AS 'Product_Type'

FROM Ledger.dbo.Contract contract
JOIN Ledger.dbo.ContractCriteria CC ON CC.contract_id = contract.id
JOIN common.dbo.t_Medispan M ON M.DDID=CC.value
JOIN Ledger.dbo.ContractFee CF ON CF.contract_id = contract.id
JOIN Ledger.dbo.ContractFeeThresholds fees ON fees.contract_fee_id = CF.id
JOIN Ledger.dbo.Product P ON P.id = contract.product_id 
 
WHERE
CC.property_id = '1' AND GETDATE() BETWEEN contract.start AND contract.finish
AND M.Item_Status_Flag = 'A' AND M.Repackage_Code <> 'X'
AND fees.fee_amount > '0'
AND P.id IN ('1','6','2')
ORDER BY M.Drug_Name ASC