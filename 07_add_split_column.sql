ALTER TABLE fitness_cleaned ADD COLUMN data_split VARCHAR(10);

UPDATE fitness_cleaned
SET data_split = CASE
    WHEN RAND() < 0.8 THEN 'train'
    ELSE 'valid'
END;