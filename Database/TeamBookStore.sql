/* Team Book Store tables */

CREATE TABLE Publisher (
	ID INTEGER PRIMARY KEY,
	NAME TEXT NOT NULL,
	ADDRESS TEXT,
	WEBSITE TEXT
);

CREATE TABLE Book (
	ISBN integer PRIMARY KEY,
	TITLE TEXT,
	PUBLISHER_ID INTEGER NOT NULL,
	PRICE REAL NOT NULL,
	AVAILABLE BIT DEFAULT 1,
	COUNT INTEGER NOT NULL,
	FOREIGN KEY (PUBLISHER_ID) REFERENCES Publisher(ID)
);


CREATE TABLE Author (
	ID INTEGER PRIMARY KEY,
	FIRST_NAME TEXT,
	LAST_NAME TEXT
);

CREATE TABLE BookAuthor (
	BOOK_ISBN INTEGER NOT NULL,
	AUTHOR_ID INTEGER NOT NULL,
	PRIMARY KEY (BOOK_ISBN, AUTHOR_ID),
	FOREIGN KEY (BOOK_ISBN) REFERENCES Book(ISBN),
	FOREIGN KEY (AUTHOR_ID) REFERENCES Author(ID)
);


CREATE TABLE BookReview (
	ID INTEGER PRIMARY KEY,
	REVIEW TEXT NOT NULL,
	RATING INTEGER NOT NULL,
	BOOK_ISBN INTEGER NOT NULL,
	USER_ID INTEGER NOT NULL,
	FOREIGN KEY (BOOK_ISBN) REFERENCES Book(ID),
	FOREIGN KEY (USER_ID) REFERENCES User(ID)
);

CREATE TABLE BookOrder (
	ID INTEGER PRIMARY KEY,
	ORDER_DATETIME DATETIME DEFAULT CURRENT_TIMESTAMP,
	STATUS_ID INTEGER NOT NULL,
	SUBTOTAL REAL NOT NULL,
	USER_ID INTEGER NOT NULL,
	FOREIGN KEY (USER_ID) REFERENCES User(ID),
	FOREIGN KEY (STATUS_ID) REFERENCES OrderStatus(ID)
);

CREATE TABLE OrderStatus (
	ID INTEGER PRIMARY KEY,
	STATUS TEXT NOT NULL
);

CREATE TABLE OrderItem (
	ORDER_ID INTEGER NOT NULL,
	BOOK_ISBN INTEGER NOT NULL,
	PRIMARY KEY (ORDER_ID, BOOK_ISBN),
	FOREIGN KEY (BOOK_ISBN) REFERENCES Book(ISBN),
	FOREIGN KEY (ORDER_ID) REFERENCES BookOrder(ID)
);

CREATE TABLE SectionBook (
	SECTION_ID INTEGER NOT NULL,
	BOOK_ISBN INTEGER NOT NULL,
	FOREIGN KEY (SECTION_ID) REFERENCES Section(ID),
	FOREIGN KEY (BOOK_ISBN) REFERENCES Book(ISBN)
);
