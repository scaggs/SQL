INSERT INTO Sandbox.dbo.t_ehr_user_adoption_ROI (health_system_name, email_domain, ehr, state)
VALUES ('Northwell Health', '@northwell.edu', 'Allscripts', 'NY');

SELECT *
FROM Sandbox.dbo.t_ehr_user_adoption_ROI
ORDER BY health_system_name ASC

UPDATE Sandbox.dbo.t_ehr_user_adoption_ROI
SET account_id='875'
WHERE health_system_name='Hudson Physicians'

/*DELETE t_ehr_user_adoption_ROI
WHERE health_system_name='Texas Children's Health' */

/*ALTER TABLE Sandbox.dbo.t_ehr_user_adoption_ROI
ADD Country_Code varchar(2)*/