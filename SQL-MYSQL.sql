SQL-MYSQL.
==========

EASY SQL PROBLEMS
==================

--Show first name, last name, and gender of patients whose gender is 'M'

SELECT first_name, last_name,gender FROM patients
where gender='M';

--Show first name and last name of patients who does not have allergies. (null)

SELECT first_name, last_name FROM patients
where allergies is null;

--Show first name of patients that start with the letter 'C'

SELECT first_name FROM patients
where first_name like 'C%';

--Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

SELECT first_name, last_name FROM patients
where weight between 100 and 120;

--Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'

update patients
set allergies='NKA'
where allergies is null;

--Show first name and last name concatinated into one column to show their full name.

select concat(first_name, ' ', last_name) AS FULLNAME from patients;

--Show first name, last name, and the full province name of each patient.
	Example 'Ontario' instead of 'ON'

SELECT first_name,last_name,province_name FROM patients JOIN province_names ON province_names.province_id = patients.province_id;

--Show how many patients have a birth_date with 2010 as the birth year.

SELECT count() FROM patients
where year(birth_date)=2010;




--Show the first_name, last_name, and height of the patient with the greatest height.

select first_name, last_name, height from patients
order by height desc
limit 1;

--Show all columns for patients who have one of the following patient_ids
1,45,534,879,1000

select  from patients
where patient_id in (1,45,534,879,1000);

--Show the total number of admissions

select count() from admissions;

--Show all the columns from admissions where the patient was admitted and discharged on the same day.

select  from admissions
where admission_date = discharge_date;

--Show the patient id and the total number of admissions for patient_id 579.

select patient_id, count() from admissions
where patient_id=579;

--Based on the cities that our patients live in, show unique cities that are in province_id 'NS'

select distinct city from patients
where province_id='NS';

--Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70

select first_name,last_name,birth_date from patients
where height 160 and weight 70;

--Write a query to find list of patients first_name, last_name, and allergies from Hamilton where allergies are not null

select first_name,last_name,allergies from patients
where city='Hamilton' and allergies IS not null;









MEDIUM SQL PROBLEMS
==================

--Show unique birth years from patients and order them by ascending.

SELECT distinct YEAR(birth_date) AS birth_year from patients
order by birth_year ASC;

--Show unique first names from the patients table which only occurs once in the list.
For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.

select first_name from patients
group by first_name
having count(first_name)=1
order by first_name desc

--Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.

select patient_id, first_name from patients
where first_name like 's____%s';

--Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
Primary diagnosis is stored in the admissions table.

select patients.patient_id, patients.first_name, patients.last_name from patients join admissions
on patients.patient_id=admissions.patient_id where diagnosis='Dementia';

--Display every patient's first_name. Order the list by the length of each name and then by alphbetically

select first_name from patients
order by len(first_name),first_name;

--Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.

SELECT SUM(gender = 'M') AS male_count,
       SUM(gender = 'F') AS female_count
FROM patients;

--Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.

SELECT first_name, last_name, allergies FROM patients
where allergies in('Penicillin','Morphine')
order by allergies, first_name, last_name;



--Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.

SELECT patient_id, diagnosis FROM admissions
group by patient_id, diagnosis
having count(diagnosis=diagnosis)1;

--Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending.

SELECT city, count() as num_patients FROM patients
group by city
order by num_patients desc, city asc;

--Show first name, last name and role of every person that is either patient or doctor. The roles are either Patient or Doctor

SELECT first_name, last_name, 'Patient' AS role FROM Patients
UNION ALL
SELECT first_name, last_name, 'Doctor' AS role FROM Doctors;

--Show all allergies ordered by popularity. Remove NULL values from query.

SELECT allergies, count() from patients
where allergies is not null
group by allergies
order by count() desc;

--Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.

SELECT first_name, last_name, birth_date from patients
where year(birth_date) between 1970 and 1979
order by birth_date asc;

--We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX SMITH,jane

SELECT concat(upper(last_name),',' ,lower(first_name)) from patients
order by first_name desc;

--Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.

select province_id,sum(height) as sum_height from patients
group by province_id
having sum(height)=7000;

--Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

SELECT max(weight)-min(weight) as weight_delta FROM patients
where last_name = 'Maroni';

--Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.

SELECT day(admission_date), count() from admissions
group by day(admission_date)
order by count() desc;

--Show all columns for patient_id 542's most recent admission_date.

SELECT  from admissions
where patient_id = 542
group by patient_id
having max(year(admission_date));

--Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria
1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.

select patient_id,attending_doctor_id,diagnosis from admissions
where
(patient_id %2 0 and attending_doctor_id in (1,5,19))
or
(attending_doctor_id like '%2%' and len(patient_id) =3)

--Show first_name, last_name, and the total number of admissions attended for each doctor.
Every admission has been attended by a doctor.

SELECT first_name, last_name, COUNT() AS admission_tatal from doctors join admissions
on doctor_id=attending_doctor_id
group by attending_doctor_id;

--For each doctor, display their id, full name, and the first and last admission date they attended.

SELECT doctor_id,concat(first_name,' ', last_name) as full_name, min(admission_date), max(admission_date)
from doctors join admissions
on doctor_id=attending_doctor_id
group by doctor_id,full_name;







--Display the total amount of patients for each province. Order by descending.

SELECT pro.province_name, count(p.patient_id) as total_number_patients from province_names as pro join patients as p
on pro.province_id =p.province_id
group by pro.province_name
order by total_number_patients desc;

--

