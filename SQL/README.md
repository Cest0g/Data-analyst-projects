# SQL Projects

## SQL Data Cleaning Project – Layoffs Dataset

For this project, I worked on cleaning and preparing a layoffs dataset using SQL. The dataset contained duplicate records, inconsistent formatting, missing values, and date formatting issues that needed to be fixed before analysis.

The main goal of this project was to practice real-world data cleaning techniques that are commonly used.
---

## What I Did

### 1. Created a Backup Table

To make sure the original dataset stayed unchanged, I first created a backup table.

#### Steps:

- Created a new table called `layoffs_clean`
- Copied all data from the original `layoffs` table into the new table

---

## Data Cleaning Process

### 2. Removed Duplicate Rows

I used the `ROW_NUMBER()` window function to identify duplicate rows based on multiple columns, including:

- `company`
- `location`
- `industry`
- `total_laid_off`
- `percentage_laid_off`
- `date`
- `stage`
- `country`
- `funds_raised_millions`

After identifying duplicates, I created another table called `layoffs_clean2` that only contained unique records.

---

### 3. Cleaned and Standardized Text Data

#### Company Names

Removed unnecessary spaces using the `TRIM()` function.

#### Country Names

Some country names ended with a period (`.`), so those were cleaned up for consistency.

##### Example:

`United States.` → `United States`

#### Industry Names

Some industries had different spellings but referred to the same category.

##### Example:

- `crypto`
- `cryptocurrency`
- `crypto currency`

All of these were standardized to:

`Crypto`

---

### 4. Converted the Date Format

The original `date` column was stored as text.

I converted it into a proper SQL `DATE` format using:

```sql STR_TO_DATE(date, '%m/%d/%Y') ```

After that, I modified the column type to `DATE` to make querying and analysis easier.

---

### 5. Handled Missing Values

During the cleaning process, I checked for missing or incomplete data.

#### Tasks completed:

- Identified rows where `industry` was `NULL` or blank
- Updated missing industry values whenever possible
- Removed rows where both:

    * `total_laid_off`
    * `percentage_laid_off`

were missing, since those rows did not provide useful information about layoffs.

---

### 6. Final Cleanup

As a final step, I:

- Removed the temporary `row_num` column
- Added a `done` column to mark cleaned records

---

## Skills Used

- SQL
- Data Cleaning
- Window Functions
- Common Table Expressions (CTEs)
- Data Standardization
- Date Formatting
- Handling NULL Values

---

## Tools Used

- MySQL

---

## Purpose of This Project

I created this project to improve my SQL and data cleaning skills by working with a real-world dataset.

This project helped me practice:

- Cleaning messy datasets
- Preparing data for analysis
- Removing duplicate records
- Standardizing inconsistent values
- Working with missing data
