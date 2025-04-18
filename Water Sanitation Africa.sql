--Create Database
CREATE DATABASE Water_Supply_Sanitation_Africa

1 --Calculate the average water availability (liters per capita per day) for each country

SELECT Country, ROUND (AVG (Water_Availability_liters_per_capita_per_day),2) AS Average_Water_Availability
FROM [Water_Supply_Sanitation_Africa].[dbo].[Water_Supply_Sanitation_Africa]
GROUP BY Country
ORDER BY Average_Water_Availability DESC;

2  --Retrieve details of communities where at least one water point is non-functional.

SELECT Community_Name AS Communities, Country, Region, Population
FROM Water_Supply_Sanitation_Africa
WHERE Number_of_Non_Functional_Water_Points >0;


3 --Top five communities with the highest annual sanitation maintenance costs.

SELECT TOP 5 Community_Name, Country, Annual_Maintenance_Cost_USD
FROM Water_Supply_Sanitation_Africa
ORDER BY Annual_Maintenance_Cost_USD DESC;

4 --Total number of functional and non-functional water points per country

SELECT Country, SUM (Number_of_Functional_Water_Points) AS Total_Functional_Water_Points, 
SUM (Number_of_Non_Functional_Water_Points) AS Total_Non_Functional_Water_Points
FROM  Water_Supply_Sanitation_Africa
GROUP BY Country;

5 --Identify communities with a high incidence of waterborne diseases (>20%)

SELECT Community_Name, Country
FROM Water_Supply_Sanitation_Africa
WHERE Waterborne_Diseases_Incidence_Rate >20;

6 --Find the average distance to the water source per region
SELECT Region, ROUND (AVG (Average_Distance_to_Water_Source_km),2) AS Average_Distance_To_Water_Source
FROM Water_Supply_Sanitation_Africa
GROUP BY Region
ORDER BY Average_Distance_To_Water_Source;

7 --List the communities that receive both government and NGO support

SELECT Community_Name, Country, Region
FROM Water_Supply_Sanitation_Africa
WHERE Government_Support = '1' AND NGO_Support = '1';

8  --Identify the community with the highest population per country

SELECT Community_Name,Country, Population
FROM Water_Supply_Sanitation_Africa AS TABLE1
WHERE Population = (SELECT MAX (Population)
FROM Water_Supply_Sanitation_Africa AS TABLE2
WHERE TABLE2.Country = TABLE1.Country)
ORDER BY Population DESC;

