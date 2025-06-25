import os
import sqlite3
import pandas as pd


# Load the CSV into a DataFrame
df = pd.read_csv("Dirty_Fitness___Nutrition_Dataset.csv")

# Connect to SQLite
conn = sqlite3.connect("fitness_data.db")

# Write data into the `fitness_dirty` table
df.to_sql("fitness_dirty", conn, if_exists="append", index=False)

print("CSV data loaded into SQLite.")
conn = sqlite3.connect("fitness_data.db")
cursor = conn.cursor()

# List your SQL script filenames in order
scripts = [
    "01_create_table.sql",
    "02_import_data.sql",      # You can skip this if you're using pandas to insert data
    "03_standardize_values.sql",
    "04_handle_nulls.sql",
    "05_remove_outliers.sql",
    "06_remove_duplicates.sql",
    "07_add_split_column.sql"
]

for script in scripts:
    with open(script, 'r') as f:
        sql = f.read()
        cursor.executescript(sql)
        print(f"Executed {script}")

conn.commit()
conn.close()