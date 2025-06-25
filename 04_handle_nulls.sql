UPDATE fitness_dirty
SET bmi = (SELECT AVG(bmi) FROM fitness_dirty)
WHERE bmi IS NULL;