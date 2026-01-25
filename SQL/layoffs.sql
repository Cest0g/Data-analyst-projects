from layoffs.layoffs;

-- Create new table
create table layoffs_clean
like layoffs.layoffs;

insert layoffs_clean
select *
from layoffs;

select *
from layoffs_clean;

-- remove doubles
select *, row_number() 
over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_clean;


with duplicate_cte as
(
select *,
row_number() 
over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) row_num
from layoffs_clean
)
select *
from duplicate_cte
where row_num > 1;

select *
from layoffs_clean
where company = 'casper';



-- trimming company/country
CREATE TABLE `layoffs_clean2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- SQL generated ^

insert into layoffs_clean2
select *,
row_number() 
over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) row_num
from layoffs_clean;

select *
from layoffs_clean2;

update layoffs_clean2
set company = trim(company);

SELECT *
FROM layoffs_clean2
WHERE country LIKE '%.';

update layoffs_clean2
set country = trim(trailing '.' from country);

select distinct country
from layoffs_clean2
order by 1;

-- Trim industry
select distinct industry
from layoffs_clean2
order by 1;

select distinct industry
from layoffs_clean2
where lower(industry) like '%crypto%';

update layoffs_clean2
set industry = 'Crypto'
where LOWER(TRIM(industry)) in ('crypto', 'cryptocurrency', 'crypto currency');

select distinct industry
from layoffs_clean2
order by 1;

-- String to date format 

select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoffs_clean2;

update layoffs_clean2
set `date` = str_to_date(`date`, '%m/%d/%Y');

select `date`
from layoffs_clean2;

alter table layoffs_clean2
modify column `date` DATE; 

-- industry: null or blank > Filled

select *
from layoffs_clean2
where industry is null;

update layoffs_clean2
set industry = 'other'
where industry like null;

-- 
update layoffs_clean2
set industry = 'Consumer'
where company = 'Juul';

select * 
from layoffs_clean2
where company = 'Airbnb';



-- Remove double null
select *
from layoffs_clean2
where total_laid_off is null and percentage_laid_off is null;

delete 
from layoffs_clean2
where total_laid_off is null and percentage_laid_off is null;

select *
from layoffs_clean2;

alter table layoffs_clean2
drop column row_num;

alter table layoffs_clean2
add column done varchar(1); 

update layoffs_clean2
set done = 'x';


