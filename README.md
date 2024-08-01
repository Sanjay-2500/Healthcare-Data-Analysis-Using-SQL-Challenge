# SQL_Easy_Medium
Below image explains the SQL Schema
<img width="506" alt="SQL_Schema" src="https://github.com/Sanjay-2500/SQL_Easy_Medium/assets/107415978/992b7e3f-4f7f-4cef-806d-42a2be80c73f">


The provided SQL file contains a series of SQL queries and operations aimed at managing and querying a medical database. Below is a summary of the key operations:

Selecting Patient Information:

Retrieve first name, last name, and gender of male patients.
Retrieve first and last names of patients without allergies.
Retrieve first names of patients starting with the letter 'C'.
Retrieve first and last names of patients with weights between 100 and 120 (inclusive).
Updating Records:

Update the allergies column in the patients table to 'NKA' where it is currently null.
Concatenating and Joining Data:

Show full names of patients by concatenating first and last names.
Show first name, last name, and full province name by joining the patients table with the province_names table.
Aggregations and Counts:

Count the number of patients born in the year 2010.
Show the first name, last name, and height of the tallest patient.
Count the total number of admissions.
Specific Patient Queries:

Retrieve all columns for specific patients by patient_id.
Retrieve all columns from admissions where the patient was admitted and discharged on the same day.
Show patient IDs and their total number of admissions.

The file includes basic SQL operations such as SELECT, UPDATE, JOIN, COUNT, and uses conditions like WHERE, LIKE, BETWEEN, and IN to filter and manipulate the data.
