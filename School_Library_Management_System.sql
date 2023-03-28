CREATE PROCEDURE dbo.LibraryManagementSystemProcedure
	CREATE DATABASE db_LibraryManagementSystemDatabase
	/* ======================= TABLES ========================*/


	CREATE TABLE tbl_publisher (
		publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_PublisherAddress VARCHAR(200) NOT NULL,
		publisher_PublisherPhone VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_book (
		book_BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_Title VARCHAR(100) NOT NULL,
		book_PublisherName VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name1 FOREIGN REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_borrower (
		borrower_StudentID INT PRIMARY KEY NOT NULL,
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL
	);

	SELECT * FROM tbl_borrower

	CREATE TABLE tbl_book_loans (
		book_loans_LoansID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_loans_BookID INT NOT NULL CONSTRAINT fk_book_id1 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_StudentID INT NOT NULL CONSTRAINT fk_studentid FOREIGN KEY REFERENCES tbl_borrower(borrower_StudentID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_DateOut VARCHAR(50) NOT NULL,
		book_loans_DueDate VARCHAR(50) NOT NULL
	);

	SELECT * FROM tbl_book_loans
		/* GETDATE() is used to retrieve the date values for DateOut. DATEADD is used for DueDate*/

	CREATE TABLE tbl_book_copies (
		book_copies_CopiesID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_copies_BookID INT NOT NULL CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_No_Of_Copies INT NOT NULL
	);

	SELECT * FROM tbl_book_copies

	CREATE TABLE tbl_book_authors (
		book_authors_AuthorID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_authors_BookID INT NOT NULL CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_authors_AuthorName VARCHAR(50) NOT NULL
	);

	SELECT * FROM tbl_book_authors

	/*======================== END TABLES ======================*/


	/*==================== POPULATING TABLES ======================*/

	INSERT INTO tbl_publisher
		(publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','The Lodge, Newton Road Sudbury, Suffolk CO10 2RS, United Kingdom','+44-0-1787-373725'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');

	SELECT * FROM tbl_publisher

	INSERT INTO tbl_book
		(book_Title, book_PublisherName)
		VALUES 
		('The Name of the Wind', 'DAW Books'),
		('It', 'Viking'),
		('The Green Mile', 'Signet Books'),
		('Dune', 'Chilton Books'),
		('The Hobbit', 'George Allen & Unwin'),
		('Eragon', 'Alfred A. Knopf'),
		('A Wise Mans Fear', 'DAW Books'),
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('The Giving Tree', 'Harper and Row'),
		('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('Brave New World', 'Chalto & Windus'),
		('The Princess Bride', 'Harcourt Brace Jovanovich'),
		('Fight Club', 'W.W. Norton'),
		('Holes', 'Scholastic'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('The Fellowship of the Ring', 'George Allen & Unwin'),
		('A Game of Thrones', 'Bantam'),
		('The Lost Tribe', 'Picador USA');

	SELECT * FROM tbl_book

	INSERT INTO tbl_borrower
		(borrower_StudentID, borrower_BorrowerName, borrower_BorrowerPhone)
		VALUES
		('2014027','Andrew, Chan Yau Chi','92337601'),
		('2013038','Janice, Yip Man Hei','93254124'),
		('2014107','Rain, Lin Sin Choi','95313257'),
		('2015023','Angela, Choi Yuet Seung','59132127'),
		('2013179','Harry, Yuen Yat Chi','51245522'),
		('2014098','Jeffrey, Chan Kei Shun','63173418'),
		('2013062','Hailey, Lam Hoi Ling','57329935'),
		('2014021','Michael, Ho Chun Yuen','98311513'),
		('2014087','Michelle, Cheung Ching Yuet','57345119'),
		('2014012','Nathan, Cai Zhen Heng','97038513'),
		('2015102','Martin, Wong Tin Wing','52379130'),
		('2013121','Cherry, Ng Suk Ying','27093178'),
		('2013121','Alvin, Cheng Chun Hei','90624733'),
		('2014097','John, Hsieh Tong Sang','51299319'),
		('2013079','Kevin, Pong Ka Hong','91359122'),
		('2013088','Trevor, Tong Yuen Ho','57318372'),
		('2015066','Kelvin, Tsang Kai Shun','90772834'),
		('2014110','Keith, Szeto Chun Long','97356348'),
		('2015106','Edgar, Sze Yat Hei','51374283'),
		('2014105','Scarlett, Chu Lai Ying','91308077');

	SELECT * FROM tbl_borrower

	INSERT INTO tbl_book_loans
		(book_loans_BookID, book_loans_StudentID, book_loans_DateOut, book_loans_DueDate)
		VALUES
		('1','2014107','1/1/18','2/2/18'),
		('12','2013038','1/1/18','2/2/18'),
		('3','2014107','1/1/18','2/2/18'),
		('4','2015023','1/1/18','2/2/18'),
		('15','2014021','1/3/18','2/3/18'),
		('6','2013038','1/3/18','2/3/18'),
		('7','2013179','1/3/18','2/3/18'),
		('18','2013038','1/3/18','2/3/18'),
		('9','2014087','1/3/18','2/3/18'),
		('11','2013179','1/3/18','2/3/18'),
		('12','2014098','12/12/17','1/12/18'),
		('10','2014097','12/12/17','1/12/17'),
		('2','2014087','2/3/18','3/3/18'),
		('8','2013062','1/5/18','2/5/18'),
		('17','2014012','1/5/18','2/5/18'),
		('19','2013062','1/3/18','2/3/18'),
		('11','2014012','1/7/18','2/7/18'),
		('1','2013179','1/7/18','2/7/18'),
		('2','2015023','1/7/18','2/7/18'),
		('3','2013179','1/7/18','2/7/18'),
		('15','2014110','12/12/17','1/12/18'),
		('4','2013062','1/9/18','2/9/18'),
		('18','2014110','1/3/18','2/3/18'),
		('17','2014105','1/3/18','2/3/18'),
		('6','2014105','1/3/18','2/3/18'),
		('15','2014110','1/3/18','2/3/18'),
		('15','2014012','1/3/18','2/3/18'),
		('14','2014105','1/3/18','2/3/18'),
		('3','2014110','1/3/18','2/3/18'),
		('19','2014110','12/12/17','1/12/18'),
		('20','2014027','1/3/18','2/3/18'),
		('12','2014027','1/3/18','2/3/18'),
		('18','2014097','1/3/18','2/3/18'),
		('12','2014098','1/4/18','2/4/18'),
		('11','2013079','1/15/18','2/15/18'),
		('9','2014105','1/15/18','2/15/18'),
		('7','2013079','1/1/18','2/2/18'),
		('3','2013079','1/13/18','2/13/18'),
		('18','2014107','1/13/18','2/13/18');


	SELECT * FROM tbl_book_loans

	INSERT INTO tbl_book_copies
		(book_copies_BookID, book_copies_No_Of_Copies)
		VALUES
		('1','12'),
		('2','10'),
		('3','8'),
		('4','9'),
		('5','11'),
		('6','13'),
		('7','12'),
		('8','10'),
		('9','14'),
		('10','15'),
		('11','7'),
		('12','9'),
		('13','12'),
		('14','15'),
		('15','13'),
		('16','11'),
		('17','10'),
		('18','9'),
		('19','8'),
		('20','11');

	SELECT * FROM tbl_book_copies


	INSERT INTO tbl_book_authors
		(book_authors_BookID,book_authors_AuthorName)
		VALUES
		('1','Patrick Rothfuss'),
		('2','Stephen King'),
		('3','Stephen King'),
		('4','Frank Herbert'),
		('5','J.R.R. Tolkien'),
		('6','Christopher Paolini'),
		('6','Patrick Rothfuss'),
		('8','J.K. Rowling'),
		('9','Haruki Murakami'),
		('10','Shel Silverstein'),
		('11','Douglas Adams'),
		('12','Aldous Huxley'),
		('13','William Goldman'),
		('14','Chuck Palahniuk'),
		('15','Louis Sachar'),
		('16','J.K. Rowling'),
		('17','J.K. Rowling'),
		('18','J.R.R. Tolkien'),
		('19','George R.R. Martin'),
		('20','Mark Lee');

	SELECT * FROM tbl_book_authors
END
	/*============================== END POPULATING TABLES ==============================*/

/* =================== EXAMPLES OF PROCEDURE QUERY QUESTIONS =================================== */

/* #1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

CREATE PROCEDURE dbo.bookCopiesAtAllSharpstown 
(@bookTitle varchar(70) = 'The Lost Tribe', @branchName varchar(70) = 'Sharpstown')
AS
SELECT copies.book_copies_BranchID AS [Branch ID], branch.library_branch_BranchName AS [Branch Name],
	   copies.book_copies_No_Of_Copies AS [Number of Copies],
	   book.book_Title AS [Book Title]
	   FROM tbl_book_copies AS copies
			INNER JOIN tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
			INNER JOIN tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID
	   WHERE book.book_Title = @bookTitle AND branch.library_branch_BranchName = @branchName
GO
EXEC dbo.bookCopiesAtAllSharpstown 


/* #2- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */

CREATE PROCEDURE dbo.bookCopiesAtAllBranches 
(@bookTitle varchar(70) = 'The Lost Tribe')
AS
SELECT copies.book_copies_BranchID AS [Branch ID], branch.library_branch_BranchName AS [Branch Name],
	   copies.book_copies_No_Of_Copies AS [Number of Copies],
	   book.book_Title AS [Book Title]
	   FROM tbl_book_copies AS copies
			INNER JOIN tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
			INNER JOIN tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID
	   WHERE book.book_Title = @bookTitle 
GO
EXEC dbo.bookCopiesAtAllBranches


/* #3- Retrieve the names of all borrowers who do not have any books checked out. */

CREATE PROCEDURE dbo.NoLoans
AS
SELECT borrower_BorrowerName FROM tbl_borrower
	WHERE NOT EXISTS
		(SELECT * FROM tbl_book_loans
		WHERE book_loans_CardNo = borrower_CardNo)
GO
EXEC dbo.NoLoans

/* #4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.  */

CREATE PROCEDURE dbo.LoanersInfo 
(@DueDate date = NULL, @LibraryBranchName varchar(50) = 'Sharpstown')
AS
SET @DueDate = GETDATE()
SELECT Branch.library_branch_BranchName AS [Branch Name],  Book.book_Title [Book Name],
	   Borrower.borrower_BorrowerName AS [Borrower Name], Borrower.borrower_BorrowerAddress AS [Borrower Address],
	   Loans.book_loans_DateOut AS [Date Out], Loans.book_loans_DueDate [Due Date]
	   FROM tbl_book_loans AS Loans
			INNER JOIN tbl_book AS Book ON Loans.book_loans_BookID = Book.book_BookID
			INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
			INNER JOIN tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
		WHERE Loans.book_loans_DueDate = @DueDate AND Branch.library_branch_BranchName = @LibraryBranchName
GO
EXEC dbo.LoanersInfo 

/* #5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */

CREATE PROCEDURE dbo.TotalLoansPerBranch
AS
SELECT  Branch.library_branch_BranchName AS [Branch Name], COUNT (Loans.book_loans_BranchID) AS [Total Loans]
		FROM tbl_book_loans AS Loans
			INNER JOIN tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
			GROUP BY library_branch_BranchName
GO
EXEC dbo.TotalLoansPerBranch

/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */

CREATE PROCEDURE dbo.BooksLoanedOut
(@BooksCheckedOut INT = 5)
AS
	SELECT Borrower.borrower_BorrowerName AS [Borrower Name], Borrower.borrower_BorrowerAddress AS [Borrower Address],
		   COUNT(Borrower.borrower_BorrowerName) AS [Books Checked Out]
		   FROM tbl_book_loans AS Loans
		   			INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
					GROUP BY Borrower.borrower_BorrowerName, Borrower.borrower_BorrowerAddress
		   HAVING COUNT(Borrower.borrower_BorrowerName) >= @BooksCheckedOut
GO
EXEC dbo.BooksLoanedOut



/* #7- For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/

CREATE PROCEDURE dbo.BookbyAuthorandBranch
	(@BranchName varchar(50) = 'Central', @AuthorName varchar(50) = 'Stephen King')
AS
	SELECT Branch.library_branch_BranchName AS [Branch Name], Book.book_Title AS [Title], Copies.book_copies_No_Of_Copies AS [Number of Copies]
		   FROM tbl_book_authors AS Authors
				INNER JOIN tbl_book AS Book ON Authors.book_authors_BookID = Book.book_BookID
				INNER JOIN tbl_book_copies AS Copies ON Authors.book_authors_BookID = Copies.book_copies_BookID
				INNER JOIN tbl_library_branch AS Branch ON Copies.book_copies_BranchID = Branch.library_branch_BranchID
			WHERE Branch.library_branch_BranchName = @BranchName AND Authors.book_authors_AuthorName = @AuthorName
GO	
EXEC dbo.BookbyAuthorandBranch

/* ==================================== EXAMPLES OF PROCEDURE QUERY QUESTIONS =================================== */
