create database librarymanagement;
use librarymanagement;
CREATE TABLE Books(book_id INT AUTO_INCREMENT PRIMARY KEY,title VARCHAR(255) NOT NULL,author VARCHAR(255) NOT NULL,genre VARCHAR(100),published_year YEAR,is_available BOOLEAN DEFAULT TRUE);
CREATE TABLE Members(member_id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(255) NOT NULL,email VARCHAR(255),phone_number VARCHAR(15),join_date DATE DEFAULT (CURRENT_DATE));
CREATE TABLE Librarians (librarian_id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(255) NOT NULL,email VARCHAR(255),phone_number VARCHAR(15),hire_date DATE DEFAULT (CURRENT_DATE));
CREATE TABLE Borrowing(loan_id INT AUTO_INCREMENT PRIMARY KEY,book_id INT,member_id INT,borrow_date DATE DEFAULT (CURRENT_DATE),return_date DATE,librarian_id INT,FOREIGN KEY (book_id) REFERENCES Books(book_id),FOREIGN KEY (member_id) REFERENCES Members(member_id),FOREIGN KEY (librarian_id) REFERENCES Librarians(librarian_id));
INSERT INTO Books (title, author, genre, published_year) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
('1984', 'George Orwell', 'Dystopian', 1949),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960);
INSERT INTO Members (name, email, phone_number) VALUES
('Alen King', 'alenking@example.com', '1234567890'),
('Alece Hofman', 'alecehofman@example.com', '9876543210');
INSERT INTO Librarians(name, email, phone_number) VALUES
('Nail Horn', 'nail@example.com', '4567891230'),
('Garden McGraw', 'garden@example.com', '7894561230');
INSERT INTO Borrowing (book_id, member_id, librarian_id)
VALUES (1, 1, 1);
UPDATE Books SET is_available =FALSE WHERE book_id = 1;
UPDATE Borrowing set return_date= CURRENT_DATE WHERE loan_id = 1; #Return a Book
UPDATE Books SET is_available = TRUE WHERE book_id = 1;
SELECT * from Books where is_available=True;
SELECT m.name,b.title,br.borrow_date,br.return_date from Borrowing br join Members m on br.member_id=m.member_id join Books b on br.book_id=b.book_id where m.member_id=1; #Member Loan History
SELECT m.name,b.title,br.borrow_date from Borrowing br join Members m on br.member_id=m.member_id join Books b on br.book_id=b.book_id where br.return_date is null and br.borrow_date< current_date-interval 14 day; #Overdue books (>14 days)
SELECT title,genre,published_year from Books where author='George Orwell';
SELECT title,author,published_year from Books where published_year>2000;
SELECT count(*) as total_books from Books;
SELECT m.name,br.borrow_date,br.return_date from Borrowing br join Members m on br.member_id=m.member_id join Books b on br.book_id=b.book_id where b.title="1984"; #Members who borrowed '1984'
SELECT b.title,br.borrow_date,br.return_date from Borrowing br join Books b on br.book_id=b.book_id where br.member_id='1'; #Borrowing history for member 1
SELECT title,author,published_year from Books where genre="fiction" and is_available="True";
Select m.name,count(br.loan_id) as total_books_borrowed from Borrowing br join Members m on  br.member_id=m.member_id group by m.name;#Total books borrowed per member
select m.name,b.title,br.borrow_date from Borrowing br join Members m on br.member_id=m.member_id join Books b on br.book_id=b.book_id where  br.return_date is null and br.borrow_date>current_date-interval 30 day; #Overdue books not returned (>30 days)
select l.name,count(br.loan_id) as total_borrowings from Borrowing br join librarians l on br.librarian_id=l.librarian_id group by l.name order by total_borrowings desc; #Top librarians by borrowings
select m.name,b.title,br.borrow_date from Borrowing br join Members m on br.member_id=m.member_id join Books b on br.book_id=b.book_id where br.return_date is null; #Currently borrowed books








