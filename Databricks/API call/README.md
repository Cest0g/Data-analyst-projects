# Python Projects

## Pokémon Data Engineering Project

In this project, I leveraged Python and the PokéAPI to extract, transform, and load Pokémon data. My objective was to gain hands-on experience with APIs, JSON processing, and loading structured data into Spark tables.

This is an ETL-focused project.

---

## Project Introduction

I used the PokéAPI to collect data for several thousand Pokémon, including:

- Pokémon statistics
- Species information
- Egg groups
- Pokémon types
- Habitat and generation data

After transforming the raw data, I stored everything in Spark Delta tables for further analysis.

---

## What I Did

### 1. Accessed the PokéAPI

I used Python’s `requests` library to create a session and retrieve data from the API.

session = requests.Session()

My script iterated through Pokémon IDs and accessed data from:

[https://pokeapi.co/api/v2/pokemon/](https://pokeapi.co/api/v2/pokemon/)

---

### 2. Extracted Pokémon Information

For each Pokémon, I extracted core attributes such as:

- Name
- Height
- Weight
- Base experience
- Order ID

I also extracted battle-related statistics, including:

- HP
- Attack
- Defense
- Speed
- Special Attack
- Special Defense

These values were stored dynamically using dictionaries.

---

### 3. Collected Metadata

Using the species endpoint, I gathered additional metadata such as:

- Base happiness
- Capture rate
- Gender differences
- Legendary status
- Mythical status
- Pokémon color
- Habitat
- Shape
- Growth rate
- Generation

This significantly enriched the dataset and made it more suitable for analysis.

---

### 4. Extracting Nested JSON Data

The API returns deeply nested JSON structures, so I used loops and dictionary operations to extract and normalize the data.

Examples:

- Pokémon types were extracted and mapped
- Egg groups were combined into a single string
- Nested values were safely retrieved using `.get()`

This ensured consistency before storing the data.

---

### 5. Creating Spark DataFrames

Once all data was collected, I converted the Python lists into Spark DataFrames.

sp_df = spark.createDataFrame(all_p_data)

Separate DataFrames were created for:

- Pokémon statistics
- Pokémon species information
- Pokémon egg and type data

---

### 6. Storing Data as Delta Tables

Finally, I stored the processed data into Delta tables using Spark.

Table names:

- pokemon_stats
- pokemon_species
- pokemon_eggs

Example:

sp_df.write.format(*delta*).mode(*overwrite*).saveAsTable(*pokemon_stats*)

This makes the data available for querying within a Spark environment.

---

## Skills Applied

- Python
- API Integration
- Data Extraction
- JSON Handling
- ETL Pipelines
- PySpark
- Data Transformation
- Spark DataFrames
- Delta Tables

---

## Tools & Technologies

- Python
- Requests
- Pandas
- PySpark
- Databricks
- PokéAPI

---

## Objective of This Project

I created this project to strengthen my skills in working with APIs and building ETL pipelines using Python and Spark.

Through this project, I learned how to:

- Extract data from APIs
- Handle nested JSON structures
- Transform raw data into structured datasets
- Create Spark DataFrames
- Load data into Delta tables
