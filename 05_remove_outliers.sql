ALTER TABLE fitness_dirty ADD COLUMN bmi_flag VARCHAR(10);

UPDATE fitness_dirty
SET bmi_flag = CASE 
  WHEN bmi < 12 OR bmi > 50 THEN 'Outlier'
  ELSE 'Normal'
END;