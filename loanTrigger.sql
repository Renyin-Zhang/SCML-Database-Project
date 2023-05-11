CREATE TRIGGER loanTrigger 
AFTER UPDATE OF dateBack
ON loan
FOR EACH ROW
BEGIN
UPDATE BookCopy SET
daysLoaned = daysLoaned + CAST(julianday(NEW.dateBack) - julianday(OLD.dateOut) AS int) + 1
WHERE OLD.ISBN = BookCopy.ISBN
AND OLD.copyNumber = BookCopy.copyNumber
AND daysLoaned IS NOT NULL;
UPDATE BookCopy SET
daysLoaned = CAST(julianday(NEW.dateBack) - julianday(OLD.dateOut) AS int) + 1
WHERE OLD.ISBN = BookCopy.ISBN
AND OLD.copyNumber = BookCopy.copyNumber
AND daysLoaned IS NULL;
END;