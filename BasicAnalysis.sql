
SELECT p.P_Gender as Gender, round(avg(p.P_Age)) as AverageAge
FROM Patients p
INNER JOIN Patient_Visits pv ON p.P_Id = pv.P_Id
GROUP BY p.P_Gender
HAVING count(pv.AppointmentID) >= 2;

SELECT p.P_Gender as Gender, ROUND(avg(DATEDIFF(t.End_Date, t.Start_Date))) AS AvgLengthInDays
FROM TreatmentPlan t
INNER JOIN TreatmentPlan_Patient tp ON t.Tp_Id = tp.Tp_Id
INNER JOIN Patients p ON tp.P_Id = p.P_Id
GROUP BY p.P_Gender;

SELECT DISTINCT p.P_Id, p.P_Name, p.P_Email, p.P_Age, p.P_Gender, 
	d.D_Id, d.D_Name, d.D_Age, d.D_Email
FROM Patients p 
INNER JOIN Patient_Visits pv on p.P_Id = pv.P_Id
INNER JOIN Doctor d on d.D_Id = pv.D_Id
INNER JOIN Appointment a on a.A_Id = pv.AppointmentID
WHERE a.A_Status = 'Cancelled';	

SELECT  
m.MedName AS MedicationName,  
CONCAT(m.Dosage, " mg") as Dosage,
COUNT(tp.Tp_Id) AS PrescriptionCount 
FROM Treatmentplan tp 
INNER JOIN Medication m ON tp.M_ID = m.M_ID 
GROUP BY  
m.MedName,m.Dosage 
ORDER BY COUNT(tp.Tp_Id) DESC;


SELECT tp.Tp_Id AS TreatmentPlanID, 
m.MedName AS MedicationName, 
SUM(CAST(REPLACE(REPLACE(tp.Rate,"$",""),",","") AS UNSIGNED INTEGER)) as Revenue
FROM TreatmentPlan tp
INNER JOIN Medication m ON tp.M_ID = m.M_ID
GROUP BY tp.Tp_Id, m.MedName
ORDER BY Revenue DESC;

 