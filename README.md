# AnalyticsEng-Interview-Technical-Task

This is a benchmark test to ensure that the candidate can show a good understanding of the fundamentals of reading, coding and delivering to a timeframe.

## Rules
 A link to a public Git repository with your final solution must be provided within 48 hours of receipt of the test. 

## Instructions
1. Please Read the MD file completely!
2. To help understand how you approach the problem, we will assess your use of source control and how you build to the final solution, checking what is   committed along each step (hint: frequent push)
3. The whole test might take 60-90 minutes to complete
4. Fork this repo to your profile for committing code to review.
5. ERD and description of data set is provided below.
6. The repo includes a template folder structure.


## Description of the data set

 ![ERD](https://user-images.githubusercontent.com/85954874/179325665-e6fee79e-309f-442c-a963-7c0004655d00.jpeg)


The database has several tables:

***employees*** table stores employees data such as employee id, last name, first name, etc. It also has a self referential field named ReportsTo to specify who reports to whom.

***customers*** table stores customers data.

***invoices & invoice_items*** tables: these two tables store invoice data. The invoices table stores invoice header data and the invoice_items table stores the invoice line-items data. To get the total cost associated with a line-item multiply UnitPrice by Quantity.

***artists*** table stores artists data. It is a simple table that contains only the artist id and name.

***albums*** table stores data about a list of tracks. Each album belongs to one artist. However, one artist may have multiple albums.

***media_types*** table stores media types such as MPEG audio and AAC audio file.

***genres*** table stores music types such as rock, jazz, metal, etc.

***tracks*** table store the data of songs. Each track belongs to one album.

***playlists & playlist_track*** tables: playlists table store data about playlists. Each playlist contains a list of tracks. Each track may belong to multiple playlists. The relationship between the playlists table and playlists_track table is many-to-many. The playlist_track table is used to reflect this relationship.

*Sample data records are in the sample_data.csv file*
#

## Requirements
1. Model must output data that contains for every track, aggregated by calendar month: the id of the track, the name of the track, the number of times it has been bought, and the total costs associated with the purchases.
2. Although the parent DAG runs everyday, configure the model to be as cost efficient as possible on the basis that there is a very large volume of data to process. Assume that there are no late arriving records.
3. Ensure the model is idempotent
4. Given the underlying DB is Snowflake, configure the model appropriately to take advantage of Snowflake’s clustering and micro-partitioning performance features
5. Declare tests in model’s “properties file” to assert there are no duplicate records
6. Push your changes to your repo then merge to master
7. Email the URL of your repo to the NOTHS people team. Please ensure it is publicly accessible


## Assessment
Your code will be reviewed and assessed according to the following:
1. Adherence to the requirements
2. Code quality – readability, structure of the code, performance
3. Unit test coverage and relevance of the tests
4. Syntax or execution errors


## Helpful Tips
- If you struggle completing the test or have concerns over certain aspects that is okay – just highlight it to us when you submit your test. 
- Explain what you couldn't get working and steps you took to solve the problem. Whilst we want to see completed tests it is just as important for us to see how you approached an issue and attempted to find a solution. 
- Do not overthink your solution. Keep it simple and use what you know. Write tests only for your code. 
- Don't forget the ReadMe Avoid creating additional requirements.

