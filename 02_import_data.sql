LOAD DATA LOCAL INFILE '/path/to/Dirty_Fitness___Nutrition_Dataset.csv'
INTO TABLE fitness_dirty
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;