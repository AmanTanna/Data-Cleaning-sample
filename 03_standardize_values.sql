UPDATE fitness_dirty
SET gender = INITCAP(TRIM(gender)),
    physical_activity_level = INITCAP(TRIM(physical_activity_level)),
    diet_type = REPLACE(LOWER(TRIM(diet_type)), '_', ' ');
