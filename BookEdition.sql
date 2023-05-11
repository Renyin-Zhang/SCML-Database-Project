CREATE TABLE BookEdition(
   ISBN TEXT CHAR(5) PRIMARY KEY
   check(CAST(ISBN AS int)%10 = (3 * (CAST(ISBN AS int)/10000 + CAST(ISBN AS int)/100%10) + 7 * (CAST(ISBN AS int)/1000%10 + CAST(ISBN AS int)/10%10))%10),
   title TEXT,
   author TEXT,
   publicationDate INTEGER,
   genre TEXT);