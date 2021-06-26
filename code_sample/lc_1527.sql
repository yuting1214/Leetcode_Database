# Solution 1(self, correct)
SELECT patient_id, patient_name, conditions
FROM Patient
WHERE conditions LIKE '%DIAB1%'
