# Query funtion in Google sheet 

We start with basic query 

  **Query(Dateset,"query function")**
  
`=QUERY(IMDB,"select * where F like 'A__m%'")`

`=QUERY(IMDB,"select * where D is null")`

`=QUERY(IMDB,"select AVG(E), MIN(E) , MAX(E), SUM(E), COUNT(E)")`

`=QUERY(IMDB,"select D , AVG(E) where D is NOT null Group by D ")`

`=QUERY(IMDB, "select A , B , C  limit 10 label A 'Id', B 'Name' ,C 'Y'") `

`=QUERY(IMDB, "select D , AVG(E)  where D is NOT null Group by D label AVG(E) 'Average value'")`

`=QUERY(IMDB, "select B , C, D order by C,E desc")`

in function like SQL wow it so wonder

We go to 




