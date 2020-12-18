CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255)); --Create a new authors table

INSERT INTO authors(name) SELECT DISTINCT author FROM books; --Copy unique author names from books table to authors table

ALTER TABLE books ADD COLUMN author_id INT; --Create an author_id column in books table and connect each book to a specific author

UPDATE books SET author_id=author.id FROM (SELECT*FROM authors) AS author WHERE books.author = author.name; --Prepare a connect between the two tables

ALTER TABLE books DROP COLUMN author; --Removes the column numed author from the books table

ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id); --Modify the data type of the author_id column in books table to a foreign key that references the primary key in the authors table