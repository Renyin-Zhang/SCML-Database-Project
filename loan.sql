CREATE TABLE loan (clientId INTEGER,
    ISBN TEXT,
    copyNumber INTEGER,
    dateOut TEXT NOT NULL,
    dateBack TEXT,
    FOREIGN KEY (clientId) REFERENCES Client(clientId) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (ISBN, copyNumber) REFERENCES BookCopy(ISBN, copyNumber));