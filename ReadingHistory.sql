CREATE VIEW ReadingHistory AS
SELECT loan.clientId,
        CAST(substr(loan.dateOut,1,4) AS int) AS yr,
        BookEdition.genre,
        COUNT(*) AS numLoans
    FROM loan JOIN BookEdition USING(ISBN)
    GROUP BY loan.clientId, yr, BookEdition.genre;