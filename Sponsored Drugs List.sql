SELECT DISTINCT
C.start AS Contract_Start,
C.finish AS Contract_Finish,
CC.value AS DDID,
P.name AS Product_Type,
M.Drug_Name,
TT.name AS  Transaction_Type,
CFT.fee_amount AS Contract_Fee,
M.Mfr,
M.Drug_Full_GPI_Name,
M.Drug_Group,
M.Drug_Class,
M.Drug_Sub_Class
FROM Ledger..Contract C
JOIN Ledger..ContractCriteria CC ON CC.contract_id = C.id
JOIN common..t_Medispan M ON M.DDID = CC.value
JOIN Ledger..Product P ON P.id = C.product_id
JOIN Ledger..TransactionType TT ON TT.id = C.transaction_type_id
JOIN Ledger..ContractFee CF ON CF.contract_id = C.id
JOIN Ledger..ContractFeeThresholds CFT ON CFT.contract_fee_id = CF.id
WHERE 
CC.property_id = '1' AND GETDATE() BETWEEN C.start AND C.finish 
AND M.Item_Status_Flag = 'A' AND M.Repackage_Code <> 'X'
AND CC.deleted_dt IS NULL   
AND C.transaction_type_id = '1' 
AND CFT.fee_amount > '0'