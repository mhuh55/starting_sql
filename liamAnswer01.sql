Use the `oscar_nominees` table in Mode to complete the follow 12 questions. 

#Question 1
#What movies were made before 1990?              --beautiful
#Task 1: Order from smallest id to largest.

SELECT *
  FROM tutorial.oscar_nominees
  WHERE year < 1990
  ORDER BY id ASC

#Question 2
#What movies were made from 2000 to today? 
#Task 1: Show the oldest movie in your first row.      --beautiful

SELECT *
  FROM tutorial.oscar_nominees
  WHERE year >= 2000
  ORDER BY year ASC

#Question 3
#Restrict the number of rows in your output to 20 after id: 50.  --great, also you can use `OFFSET 50 LIMIT 20` however, your way is better.
#Task 1: Show movie, year, and id.

#Task 2: Order from oldest movie to youngest.

SELECT year, movie, id
  FROM tutorial.oscar_nominees
  WHERE id > 50
  ORDER BY year ASC
  LIMIT 20

#Question 4
#What actor had a leading role in Hotel Rwanda?                                                 
#Task 1: Pull id, winner, nominee, and movie columns. 

SELECT id, 
      winner, 
      nominee, 
      movie, 
      category
  FROM tutorial.oscar_nominees
  WHERE movie = 'Hotel Rwanda'

--Good but you could have taken it a step further in your where clause "AND category = 'actor in a leading role'"
  
#Question 5
#Which film and year was Marlon Brandos last Oscar win? 
A Dry White Season

#Task 1: Pull only one row.

SELECT *
  FROM tutorial.oscar_nominees
  WHERE nominee = 'Marlon Brando'
  ORDER BY year DESC
  LIMIT 1
  
-- Close, he lost in that movie. We needed to add "AND winner = 'true'"  

#Question 6
#Which nominees, whos name starts with the letter "R" have movies before 1979?   --sexy
#Task 1: Retrieve year, nominee, and movie.

#Task 2: Have row 1 start with the youngest movie.

SELECT year,
      nominee,
      movie
  FROM tutorial.oscar_nominees
  WHERE  year < 1979 AND nominee LIKE 'R%'
  ORDER BY year DESC

#Question 7
#Find all nominees who did not win an Oscar in the category 'actor in a leading role' and 'actress in a leading role' before 1993.
#Task 1: Show only 5 rows.

#Task 2: Don't include William Hurt.

#Task 3: Order from largest id to smallest.

SELECT *
  FROM tutorial.oscar_nominees
  WHERE  year < 1993 AND nominee != 'William Hurt' AND winner = 'false'
  ORDER BY id DESC
LIMIT 5
-- Close, we needed to find actors in the Categories 'actor in a leading role' and 'actress in a leading role'. 
--we could have added.
--category IN (
--    'actor in a leading role'
--    ,'actress in a leading role'
--    )

#Question 8
#Which movie starts with "T" and ends with "c" and whose nominee fills out this criteria 'K_t_ _%' and the movie is between 1960 and 1998?  -- beautiful
Titanic

SELECT *
  FROM tutorial.oscar_nominees
  WHERE  movie LIKE 'T%c' 
          AND nominee LIKE 'K_t___%'  
          AND year BETWEEN 1960 AND 1998
  
#Question 9
#Who were the nominee winners from 2000 to 2005 in the category, 'actor in a leading role' and 'actress in a leading role'?

SELECT *
  FROM tutorial.oscar_nominees
  WHERE winner = 'true' 
      AND year BETWEEN 2000 AND 2005

  --close we forgot the categories this one would use a IN ('actor in a leading role','actress in a leading role')
  

#Question 10
#Who won an oscar between Tom Hanks and Nicolas Cage in the years 1990, 1999, and 1993?
Tom Hanks in Philadelphia

SELECT *
  FROM tutorial.oscar_nominees
  WHERE nominee IN ('Tom Hanks' , 'Nicolas Cage') <-- super sexy
        AND year IN (1990, 1999, 1993)
        AND winner = 'true'


#Question 11
#Which nominees, whose names start with an "S" did not win an Oscar for the 'actress in a leading role' and 'actor in a leading role' between 2000 and 2010.
#Task 1: Do not include years 2003 and 2007.

SELECT *
  FROM tutorial.oscar_nominees
  WHERE nominee LIKE 'S%'
        AND year NOT IN (2003,2007)
        AND winner = 'false'
  
  --needed the categories

#Question 12
#Display year, category, nominee, and movie columns only. Order year from oldest to youngest and nominees from z to a. Only select movies from 1950,1960,1970,1980, and 1990.  --nice u got this one. i remember us talking about it.

SELECT year,
      category,
      nominee,
      movie
  FROM tutorial.oscar_nominees
  WHERE year IN (1950,1960,1970,1980,1990)
  ORDER BY year ASC, 
        nominee DESC
        
        
-- really great job man the logic was perfect
